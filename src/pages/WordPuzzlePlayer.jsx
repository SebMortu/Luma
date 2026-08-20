import { useEffect, useState, useRef } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import { buildCellMap, numberWords } from '../lib/wordPuzzle.js'
import { playCorrect } from '../lib/sounds.js'

function formatTime(seconds) {
  const m = Math.floor(seconds / 60)
  const s = seconds % 60
  return `${m}:${s.toString().padStart(2, '0')}`
}

function WordPuzzlePlayer() {
  const { puzzleId } = useParams()
  const { user } = useAuth()
  const navigate = useNavigate()
  const [puzzle, setPuzzle] = useState(null)
  const [numberedWords, setNumberedWords] = useState([])
  const [cellMap, setCellMap] = useState({})
  const [inputs, setInputs] = useState({})
  const [elapsed, setElapsed] = useState(0)
  const [solved, setSolved] = useState(false)
  const [leaderboard, setLeaderboard] = useState([])
  const [loading, setLoading] = useState(true)
  const startTimeRef = useRef(Date.now())
  const solvedRef = useRef(false)
  const inputRefs = useRef({})
  const directionRef = useRef('across') // direction active pour la navigation auto

  useEffect(() => {
    async function load() {
      setLoading(true)
      // Réinitialisation complète : sans ça, les lettres tapées sur une grille
      // précédente restaient affichées sur la nouvelle (mauvaises cases).
      setInputs({})
      setSolved(false)
      solvedRef.current = false
      setElapsed(0)
      startTimeRef.current = Date.now()
      inputRefs.current = {}
      directionRef.current = 'across'

      const { data } = await supabase.from('word_puzzles').select('*').eq('id', puzzleId).single()
      setPuzzle(data)
      setNumberedWords(numberWords(data.words))
      setCellMap(buildCellMap(data.words))
      await loadLeaderboard()
      setLoading(false)
    }
    load()
  }, [puzzleId])

  const loadLeaderboard = async () => {
    const { data } = await supabase.from('word_puzzle_scores').select('*')
      .eq('puzzle_id', puzzleId).order('time_seconds', { ascending: true }).limit(10)
    setLeaderboard(data || [])
  }

  useEffect(() => {
    const interval = setInterval(() => {
      if (!solvedRef.current) setElapsed(Math.round((Date.now() - startTimeRef.current) / 1000))
    }, 1000)
    return () => clearInterval(interval)
  }, [])

  const saveScore = async (timeSeconds) => {
    await supabase.from('word_puzzle_scores').insert({
      puzzle_id: puzzleId,
      user_id: user.id,
      display_name: user.email.split('@')[0],
      time_seconds: timeSeconds,
    })
    await loadLeaderboard()
  }

  // Pour une case donnée, indique si elle appartient à un mot horizontal,
  // vertical, ou les deux (case d'intersection) — sert à savoir dans quel
  // sens avancer automatiquement après la saisie d'une lettre.
  const directionsForCell = (key) => {
    const [r, c] = key.split(',').map(Number)
    const dirs = new Set()
    ;(puzzle?.words || []).forEach((w) => {
      for (let i = 0; i < w.answer.length; i++) {
        const wr = w.direction === 'down' ? w.row + i : w.row
        const wc = w.direction === 'across' ? w.col + i : w.col
        if (wr === r && wc === c) dirs.add(w.direction)
      }
    })
    return dirs
  }

  const focusCell = (key) => {
    const el = inputRefs.current[key]
    if (el) el.focus()
  }

  const handleCellFocus = (key) => {
    const dirs = directionsForCell(key)
    // Si la case n'appartient qu'à une seule direction, on s'y cale.
    // Si elle appartient aux deux (intersection), on garde la direction en cours.
    if (dirs.size === 1) directionRef.current = [...dirs][0]
  }

  const handleInput = (key, value) => {
    const letter = value.slice(-1).toUpperCase()
    const next = { ...inputs, [key]: letter }
    setInputs(next)

    const allCorrect = Object.keys(cellMap).every((k) => next[k] === cellMap[k])
    if (allCorrect && !solvedRef.current) {
      solvedRef.current = true
      setSolved(true)
      playCorrect()
      const finalTime = Math.round((Date.now() - startTimeRef.current) / 1000)
      setElapsed(finalTime)
      saveScore(finalTime)
      return
    }

    // Case suivante automatique, uniquement si une lettre a bien été saisie
    if (!letter) return
    const [r, c] = key.split(',').map(Number)
    const nextKey = directionRef.current === 'across' ? `${r},${c + 1}` : `${r + 1},${c}`
    if (nextKey in cellMap) {
      focusCell(nextKey)
    }
  }

  if (loading || !puzzle) return <div className="page"><p>Chargement...</p></div>

  const grid = []
  for (let r = 0; r < puzzle.rows; r++) {
    const row = []
    for (let c = 0; c < puzzle.cols; c++) row.push(`${r},${c}`)
    grid.push(row)
  }

  const numberByCell = {}
  numberedWords.forEach((w) => { numberByCell[`${w.row},${w.col}`] = w.number })

  const acrossWords = numberedWords.filter((w) => w.direction === 'across')
  const downWords = numberedWords.filter((w) => w.direction === 'down')

  return (
    <div className="page">
      <button className="lesson-back" onClick={() => navigate('/word-games')}>← Retour aux grilles</button>
      <h1>{puzzle.title}</h1>
      {puzzle.type === 'fleche' && (
        <p className="setting-note">Version simplifiée : définitions listées ci-dessous (le style avec flèches intégrées à la grille arrivera plus tard).</p>
      )}

      <div className="toeic-header">
        <span>{solved ? '✅ Terminé' : 'En cours...'}</span>
        <span className="toeic-timer">⏱ {formatTime(elapsed)}</span>
      </div>

      <div className="crossword-grid" style={{ gridTemplateColumns: `repeat(${puzzle.cols}, 1fr)` }}>
        {grid.flat().map((key) => {
          const isOpen = key in cellMap
          const number = numberByCell[key]
          if (!isOpen) return <div key={key} className="crossword-cell blocked" />
          return (
            <div key={key} className="crossword-cell">
              {number && <span className="crossword-cell-number">{number}</span>}
              <input
                type="text"
                maxLength={1}
                value={inputs[key] || ''}
                disabled={solved}
                ref={(el) => { inputRefs.current[key] = el }}
                onFocus={() => handleCellFocus(key)}
                onChange={(e) => handleInput(key, e.target.value)}
                className={`crossword-cell-input ${solved ? 'solved' : ''}`}
              />
            </div>
          )
        })}
      </div>

      <p className="dashboard-section-title" style={{ marginTop: '1.5rem' }}>Définitions</p>
      {acrossWords.length > 0 && (
        <>
          <p className="grammar-section-heading">Horizontal</p>
          {acrossWords.map((w) => <p key={`a${w.number}`} className="grammar-section-text">{w.number}. {w.clue}</p>)}
        </>
      )}
      {downWords.length > 0 && (
        <>
          <p className="grammar-section-heading" style={{ marginTop: '10px' }}>Vertical</p>
          {downWords.map((w) => <p key={`d${w.number}`} className="grammar-section-text">{w.number}. {w.clue}</p>)}
        </>
      )}

      {solved && (
        <div className="lesson-summary" style={{ marginTop: '1.5rem' }}>
          <p className="verb-result">🎉 Résolu en {formatTime(elapsed)} !</p>
        </div>
      )}

      <p className="dashboard-section-title" style={{ marginTop: '1.5rem' }}>🏆 Classement</p>
      <div className="unit-list">
        {leaderboard.map((s, i) => (
          <div key={s.id} className="unit-card">
            <div className="unit-icon">{i === 0 ? '🥇' : i === 1 ? '🥈' : i === 2 ? '🥉' : `${i + 1}.`}</div>
            <div>
              <p className="unit-title">{s.display_name}</p>
              <p className="unit-status">{formatTime(s.time_seconds)}</p>
            </div>
          </div>
        ))}
        {leaderboard.length === 0 && <p>Sois le premier à résoudre cette grille !</p>}
      </div>
    </div>
  )
}

export default WordPuzzlePlayer

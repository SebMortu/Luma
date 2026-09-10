import { useEffect, useState, useRef } from 'react'
import { useParams, useNavigate, Link } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import { buildCellMap, numberWords, formatTime } from '../lib/wordPuzzle.js'
import { playCorrect } from '../lib/sounds.js'

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
  const [activeCell, setActiveCell] = useState(null)
  const startTimeRef = useRef(Date.now())
  const solvedRef = useRef(false)
  const inputRefs = useRef({})
  const directionRef = useRef('across')

  useEffect(() => {
    async function load() {
      setLoading(true)
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

  // Le mot (avec sa définition) auquel appartient la case active, dans la
  // direction en cours — affiché juste au-dessus de la liste des définitions.
  const activeClue = (() => {
    if (!activeCell) return null
    const [r, c] = activeCell.split(',').map(Number)
    return numberedWords.find((w) => {
      if (w.direction !== directionRef.current) return false
      for (let i = 0; i < w.answer.length; i++) {
        const wr = w.direction === 'down' ? w.row + i : w.row
        const wc = w.direction === 'across' ? w.col + i : w.col
        if (wr === r && wc === c) return true
      }
      return false
    })
  })()

  const focusCell = (key) => {
    const el = inputRefs.current[key]
    if (el) el.focus()
  }

  const handleCellFocus = (key) => {
    const dirs = directionsForCell(key)
    if (dirs.size === 1) directionRef.current = [...dirs][0]
    setActiveCell(key)
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

    if (!letter) return
    const [r, c] = key.split(',').map(Number)
    const nextKey = directionRef.current === 'across' ? `${r},${c + 1}` : `${r + 1},${c}`
    if (nextKey in cellMap) focusCell(nextKey)
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

  const wordsRemaining = numberedWords.filter((w) => {
    for (let i = 0; i < w.answer.length; i++) {
      const wr = w.direction === 'down' ? w.row + i : w.row
      const wc = w.direction === 'across' ? w.col + i : w.col
      if (inputs[`${wr},${wc}`] !== cellMap[`${wr},${wc}`]) return true
    }
    return false
  }).length

  const progressPct = Math.round(((numberedWords.length - wordsRemaining) / numberedWords.length) * 100)

  return (
    <div className="page wp2-page">
      <div className="wp2-header">
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
          <span className="sc2-back" onClick={() => navigate('/word-games')}>✕ Quitter</span>
          <div style={{ display: 'flex', gap: '9px' }}>
            <span className="wp2-level-chip">{puzzle.cecr_level} · {puzzle.rows}×{puzzle.cols}</span>
            <span className="wp2-timer-chip">⏱ {formatTime(elapsed)}</span>
          </div>
        </div>
        <p className="wp2-title">{puzzle.title}</p>
        {puzzle.type === 'fleche' && <p className="setting-note">Version simplifiée : définitions listées ci-dessous.</p>}
        <div className="wp2-progress-row">
          <div className="d2-stat-track" style={{ flex: 1, background: '#EDF1F7' }}>
            <div style={{ height: '100%', width: `${progressPct}%`, background: 'linear-gradient(90deg,#A3E635,#3B82F6)', borderRadius: '5px' }} />
          </div>
          <span className="wp2-progress-label">{wordsRemaining} mot{wordsRemaining > 1 ? 's' : ''} restant{wordsRemaining > 1 ? 's' : ''}</span>
        </div>
      </div>

      <div className="wp2-grid-wrap">
        <div className="wp2-grid" style={{ gridTemplateColumns: `repeat(${puzzle.cols}, 1fr)` }}>
          {grid.flat().map((key) => {
            const isOpen = key in cellMap
            const number = numberByCell[key]
            if (!isOpen) return <div key={key} className="wp2-cell wp2-cell-blocked" />
            const isActive = key === activeCell
            return (
              <div key={key} className={`wp2-cell ${isActive ? 'active' : ''} ${solved ? 'solved' : ''}`}>
                {number && <span className="wp2-cell-number">{number}</span>}
                <input
                  type="text"
                  maxLength={1}
                  value={inputs[key] || ''}
                  disabled={solved}
                  ref={(el) => { inputRefs.current[key] = el }}
                  onFocus={() => handleCellFocus(key)}
                  onChange={(e) => handleInput(key, e.target.value)}
                  className="wp2-cell-input"
                />
              </div>
            )
          })}
        </div>
      </div>

      {activeClue && !solved && (
        <div className="wp2-active-clue">
          <span className="wp2-active-clue-num">{activeClue.number}</span>
          <span>{activeClue.clue}</span>
        </div>
      )}

      {solved && (
        <div className="wp2-solved-card">
          <p className="verb-result">🎉 Résolu en {formatTime(elapsed)} !</p>
        </div>
      )}

      <div className="wp2-clues-card">
        <div className="wp2-clues-eyebrow">Définitions</div>
        {numberedWords.map((w) => (
          <div key={`${w.direction}${w.number}`} className={`wp2-clue-row ${activeClue?.number === w.number && activeClue?.direction === w.direction ? 'active' : ''}`}>
            <span className="wp2-clue-num">{w.number}</span>
            <div style={{ flex: 1, minWidth: 0 }}>
              <div className="wp2-clue-dir">{w.direction === 'across' ? 'Horizontal' : 'Vertical'}</div>
              <div className="wp2-clue-text">{w.clue}</div>
            </div>
          </div>
        ))}
      </div>

      <div className="wp2-leaderboard-card">
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
          <span className="wp2-clues-eyebrow" style={{ color: 'var(--text-primary)' }}>🏆 Classement de la grille</span>
        </div>
        {leaderboard.map((s, i) => (
          <div key={s.id} className="wp2-lb-row">
            <span className="wp2-lb-rank">{i === 0 ? '🥇' : i === 1 ? '🥈' : i === 2 ? '🥉' : i + 1}</span>
            <span style={{ flex: 1, fontWeight: 700, fontSize: '12.5px', color: 'var(--text-primary)', overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }}>{s.display_name}</span>
            <span style={{ fontWeight: 800, fontSize: '12.5px', color: 'var(--accent,#2563EB)' }}>{formatTime(s.time_seconds)}</span>
          </div>
        ))}
        {leaderboard.length === 0 && <p className="progress-card-sub">Sois le premier à résoudre cette grille !</p>}
      </div>
    </div>
  )
}

export default WordPuzzlePlayer

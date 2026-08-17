import { useEffect, useState, useRef } from 'react'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import AppLayout from '../components/AppLayout.jsx'
import { playCorrect, playIncorrect } from '../lib/sounds.js'

function shuffle(array) {
  const copy = [...array]
  for (let i = copy.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1))
    ;[copy[i], copy[j]] = [copy[j], copy[i]]
  }
  return copy
}

function ListMode({ verbs }) {
  return (
    <div className="verb-list-table">
      <div className="verb-list-row verb-list-header">
        <span>Base</span>
        <span>Passé</span>
        <span>Participe</span>
        <span>Traduction</span>
      </div>
      {verbs.map((v) => (
        <div key={v.id} className="verb-list-row">
          <span className="verb-list-base">{v.base_form}</span>
          <span className="verb-list-past">{v.past_form}</span>
          <span className="verb-list-participle">{v.participle_form}</span>
          <span className="verb-list-fr">{v.translation}</span>
        </div>
      ))}
    </div>
  )
}

function FlashcardMode({ verbs }) {
  const [deck, setDeck] = useState(() => shuffle(verbs))
  const [index, setIndex] = useState(0)
  const [revealed, setRevealed] = useState(false)
  const [known, setKnown] = useState(0)
  const [toReview, setToReview] = useState(0)

  const current = deck[index]
  const finished = index >= deck.length

  const next = (wasKnown) => {
    if (wasKnown) setKnown((k) => k + 1)
    else setToReview((k) => k + 1)
    setRevealed(false)
    setIndex((i) => i + 1)
  }

  const restart = () => {
    setDeck(shuffle(verbs))
    setIndex(0)
    setRevealed(false)
    setKnown(0)
    setToReview(0)
  }

  if (finished) {
    return (
      <div className="verb-card">
        <p className="verb-result">Terminé ! ✅ {known} connus · 🔁 {toReview} à revoir</p>
        <button className="btn-primary" onClick={restart}>Recommencer</button>
      </div>
    )
  }

  return (
    <div>
      <p className="verb-progress">{index + 1} / {deck.length}</p>
      <div className="verb-card" onClick={() => setRevealed(true)}>
        <p className="verb-base">{current.base_form}</p>
        {revealed && (
          <div className="verb-answer">
            <p><strong>{current.past_form}</strong> — {current.participle_form}</p>
            <p className="verb-translation">{current.translation}</p>
          </div>
        )}
        {!revealed && <p className="verb-hint">Touche pour révéler</p>}
      </div>
      {revealed && (
        <div className="verb-buttons">
          <button className="verb-btn-no" onClick={() => next(false)}>Je ne savais pas</button>
          <button className="verb-btn-yes" onClick={() => next(true)}>Je savais</button>
        </div>
      )}
    </div>
  )
}

function QuizSetup({ onStart }) {
  const [difficulty, setDifficulty] = useState('medium')
  return (
    <div>
      <p className="dashboard-section-title">Niveau de difficulté</p>
      <div className="onboarding-options" style={{ marginBottom: '1.5rem' }}>
        {Object.entries(DIFFICULTY_LABELS).map(([key, v]) => (
          <button key={key} className={`onboarding-option ${difficulty === key ? 'selected' : ''}`} onClick={() => setDifficulty(key)}>
            <span className="onboarding-option-title">{v.label}</span>
            <span className="onboarding-option-desc">{v.desc}</span>
          </button>
        ))}
      </div>
      <button className="btn-primary" onClick={() => onStart(difficulty)}>Commencer le quiz</button>
    </div>
  )
}

function QuizMode({ verbs }) {
  const [difficulty, setDifficulty] = useState(null)
  if (!difficulty) return <QuizSetup onStart={setDifficulty} />
  return <QuizRun verbs={verbs} difficulty={difficulty} />
}

function QuizRun({ verbs, difficulty }) {
  const pool = difficulty === 'easy' ? verbs.filter((v) => v.is_priority) : verbs
  const usablePool = pool.length >= 4 ? pool : verbs

  const [deck] = useState(() => shuffle(usablePool).slice(0, 10))
  const [index, setIndex] = useState(0)
  const [options, setOptions] = useState([])
  const [selected, setSelected] = useState(null)
  const [score, setScore] = useState(0)

  const current = deck[index]
  const finished = index >= deck.length

  useEffect(() => {
    if (!current) return
    setOptions(buildOptions(current, usablePool, difficulty))
    setSelected(null)
  }, [index])

  if (finished) {
    return (
      <div className="verb-card">
        <p className="verb-result">Score : {score} / {deck.length}</p>
        <button className="btn-primary" onClick={() => window.location.reload()}>Recommencer</button>
      </div>
    )
  }
  if (!current) return null

  const handleSelect = (opt) => {
    if (selected) return
    setSelected(opt)
    if (opt === current.past_form) setScore((s) => s + 1)
    setTimeout(() => setIndex((i) => i + 1), 900)
  }

  return (
    <div>
      <p className="verb-progress">{index + 1} / {deck.length} · {DIFFICULTY_LABELS[difficulty].label}</p>
      <div className="exercise">
        <p className="exercise-question">Quel est le passé de "{current.base_form}" ?</p>
        <div className="exercise-options">
          {options.map((opt) => {
            let cls = 'exercise-option'
            if (selected) {
              if (opt === current.past_form) cls += ' correct'
              else if (opt === selected) cls += ' incorrect'
            }
            return <button key={opt} className={cls} onClick={() => handleSelect(opt)} disabled={!!selected}>{opt}</button>
          })}
        </div>
      </div>
    </div>
  )
}

function UsageSheet() {
  const [open, setOpen] = useState(false)
  return (
    <div className="usage-sheet">
      <button className="usage-sheet-toggle" onClick={() => setOpen(!open)}>
        ℹ️ {open ? 'Masquer' : 'Voir'} la fiche : comment utiliser ces 3 formes
      </button>
      {open && (
        <div className="usage-sheet-content">
          <p><strong>Base</strong> — utilisée au present simple (I/you/we/they) et après les modaux (can, must...).</p>
          <p className="verb-translation">Ex : I <strong>go</strong> to work. / She can <strong>go</strong>.</p>
          <p><strong>Passé (past form)</strong> — utilisée seule au past simple, pour une action terminée à un moment précisé.</p>
          <p className="verb-translation">Ex : I <strong>went</strong> to Paris last year.</p>
          <p><strong>Participe passé</strong> — utilisé avec have/has (present perfect) ou avec to be (voix passive).</p>
          <p className="verb-translation">Ex : I have <strong>gone</strong> there before. / The letter was <strong>written</strong> yesterday.</p>
        </div>
      )}
    </div>
  )
}

// Génère la forme "régularisée" incorrecte qu'un apprenant produirait naturellement
// (ex: goed au lieu de went) — excellent leurre pédagogique
function regularize(base) {
  if (base.endsWith('e')) return base + 'd'
  if (/[^aeiou]y$/.test(base)) return base.slice(0, -1) + 'ied'
  return base + 'ed'
}

// Légère altération orthographique du mot correct (permutation de deux lettres)
function mutateSpelling(word) {
  if (word.length < 4) return word + 'e'
  const i = 1 + Math.floor(Math.random() * (word.length - 3))
  return word.slice(0, i) + word[i + 1] + word[i] + word.slice(i + 2)
}

function buildOptions(verb, pool, difficulty) {
  const distractors = new Set()
  if (difficulty !== 'easy' && verb.participle_form !== verb.past_form) {
    distractors.add(verb.participle_form) // même verbe, autre temps — piège classique
  }
  if (difficulty !== 'easy') {
    distractors.add(regularize(verb.base_form)) // forme "régularisée" fautive
  }
  if (difficulty === 'hard') {
    distractors.add(mutateSpelling(verb.past_form)) // faute d'orthographe plausible
  }
  while (distractors.size < 3) {
    const other = pool[Math.floor(Math.random() * pool.length)]
    if (other.past_form !== verb.past_form) distractors.add(other.past_form)
  }
  return shuffle([verb.past_form, ...Array.from(distractors).slice(0, 3)])
}

const DIFFICULTY_LABELS = {
  easy: { label: 'A1-A2 · Facile', desc: 'Réponses assez distinctes' },
  medium: { label: 'B1-B2 · Intermédiaire', desc: 'Pièges sur les temps et l\'orthographe' },
  hard: { label: 'C1 · Avancé', desc: 'Fautes d\'orthographe plausibles incluses' },
}

function SprintSetup({ onStart }) {
  const [difficulty, setDifficulty] = useState('medium')
  const [writeMode, setWriteMode] = useState(false)

  return (
    <div>
      <p className="dashboard-section-title">Niveau de difficulté</p>
      <div className="onboarding-options" style={{ marginBottom: '1.5rem' }}>
        {Object.entries(DIFFICULTY_LABELS).map(([key, v]) => (
          <button key={key} className={`onboarding-option ${difficulty === key ? 'selected' : ''}`} onClick={() => setDifficulty(key)}>
            <span className="onboarding-option-title">{v.label}</span>
            <span className="onboarding-option-desc">{v.desc}</span>
          </button>
        ))}
      </div>

      <p className="dashboard-section-title">Format</p>
      <div className="onboarding-options" style={{ marginBottom: '1.5rem' }}>
        <button className={`onboarding-option row ${!writeMode ? 'selected' : ''}`} onClick={() => setWriteMode(false)}>
          <span className="onboarding-option-title">🔘 QCM</span>
        </button>
        <button className={`onboarding-option row ${writeMode ? 'selected' : ''}`} onClick={() => setWriteMode(true)}>
          <span className="onboarding-option-title">⌨️ Écriture</span>
        </button>
      </div>

      <button className="btn-primary" onClick={() => onStart({ difficulty, writeMode })}>Commencer le défi</button>
    </div>
  )
}

function SprintMode({ verbs, user }) {
  const [config, setConfig] = useState(null)

  if (!config) return <SprintSetup onStart={setConfig} />
  return <SprintChallenge verbs={verbs} user={user} difficulty={config.difficulty} writeMode={config.writeMode} />
}

function SprintChallenge({ verbs, user, difficulty, writeMode }) {
  const pool = difficulty === 'easy' ? verbs.filter((v) => v.is_priority) : verbs
  const usablePool = pool.length >= 4 ? pool : verbs

  const [current, setCurrent] = useState(null)
  const [options, setOptions] = useState([])
  const [inputValue, setInputValue] = useState('')
  const [score, setScore] = useState(0)
  const [secondsLeft, setSecondsLeft] = useState(60)
  const [finished, setFinished] = useState(false)
  const [bestScore, setBestScore] = useState(0)
  const [isNewRecord, setIsNewRecord] = useState(false)
  const scoreRef = useRef(0)
  const finishedRef = useRef(false)
  const startTimeRef = useRef(Date.now())
  const DURATION_MS = 60000

  const pickQuestion = () => {
    const verb = usablePool[Math.floor(Math.random() * usablePool.length)]
    setCurrent(verb)
    setInputValue('')
    if (!writeMode) setOptions(buildOptions(verb, usablePool, difficulty))
  }

  useEffect(() => {
    async function loadBest() {
      const { data } = await supabase.from('user_settings').select('best_verb_sprint_score').eq('user_id', user.id).single()
      setBestScore(data?.best_verb_sprint_score || 0)
    }
    loadBest()
    pickQuestion()
  }, [])

  // Chrono basé sur l'heure réelle (pas un simple compteur) : reste correct même
  // si le téléphone se met en veille pendant le défi.
  useEffect(() => {
    const tick = () => {
      if (finishedRef.current) return
      const elapsed = Date.now() - startTimeRef.current
      const remaining = Math.max(0, Math.ceil((DURATION_MS - elapsed) / 1000))
      setSecondsLeft(remaining)
      if (remaining <= 0) finish()
    }
    tick()
    const interval = setInterval(tick, 1000)
    const onVisible = () => { if (document.visibilityState === 'visible') tick() }
    document.addEventListener('visibilitychange', onVisible)
    return () => {
      clearInterval(interval)
      document.removeEventListener('visibilitychange', onVisible)
    }
  }, [])

  const finish = async () => {
    if (finishedRef.current) return
    finishedRef.current = true
    setFinished(true)
    if (scoreRef.current > bestScore) {
      setIsNewRecord(true)
      await supabase.from('user_settings').update({ best_verb_sprint_score: scoreRef.current }).eq('user_id', user.id)
    }
  }

  const registerAnswer = (isCorrect) => {
    isCorrect ? playCorrect() : playIncorrect()
    if (isCorrect) {
      scoreRef.current += 1
      setScore(scoreRef.current)
    }
    pickQuestion()
  }

  const answerQCM = (opt) => {
    if (finished) return
    registerAnswer(opt === current.past_form)
  }

  const submitWritten = () => {
    if (finished || !inputValue.trim()) return
    registerAnswer(inputValue.trim().toLowerCase() === current.past_form.toLowerCase())
  }

  if (finished) {
    return (
      <div className="verb-card">
        <p className="verb-result">⚡ Score : {score}</p>
        {isNewRecord ? (
          <p className="feedback correct">🏆 Nouveau record !</p>
        ) : (
          <p className="verb-translation">Record actuel : {bestScore}</p>
        )}
        <button className="btn-primary" onClick={() => window.location.reload()}>Rejouer</button>
      </div>
    )
  }

  return (
    <div>
      <div className="toeic-header">
        <span>Score : {score}</span>
        <span className={secondsLeft < 10 ? 'toeic-timer warning' : 'toeic-timer'}>⏱ {secondsLeft}s</span>
      </div>
      {current && (
        <div className="exercise">
          <p className="exercise-question">Passé de "{current.base_form}" ?</p>
          {writeMode ? (
            <>
              <input
                type="text"
                autoFocus
                value={inputValue}
                onChange={(e) => setInputValue(e.target.value)}
                onKeyDown={(e) => e.key === 'Enter' && submitWritten()}
                className="exercise-input"
                style={{ width: '100%', marginBottom: '8px' }}
              />
              <button className="exercise-submit" onClick={submitWritten}>Valider</button>
            </>
          ) : (
            <div className="exercise-options">
              {options.map((opt) => (
                <button key={opt} className="exercise-option" onClick={() => answerQCM(opt)}>{opt}</button>
              ))}
            </div>
          )}
        </div>
      )}
    </div>
  )
}

function Verbs() {
  const { user } = useAuth()
  const [verbs, setVerbs] = useState([])
  const [mode, setMode] = useState(null) // 'flashcards' | 'quiz' | null
  const [familyFilter, setFamilyFilter] = useState('priority')
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      const { data: settings } = await supabase.from('user_settings').select('active_language_id').eq('user_id', user.id).single()
      const { data } = await supabase.from('irregular_verbs').select('*').eq('language_id', settings.active_language_id)
      setVerbs(data || [])
      setLoading(false)
    }
    load()
  }, [user.id])

  const families = [...new Set(verbs.map((v) => v.family))]
  const filtered = familyFilter === 'priority'
    ? verbs.filter((v) => v.is_priority)
    : familyFilter === 'all'
      ? verbs
      : verbs.filter((v) => v.family === familyFilter)

  if (loading) return <AppLayout><div className="page"><p>Chargement...</p></div></AppLayout>

  const content = (
    <div className="page">
      <h1>🔤 Verbes irréguliers</h1>
      <UsageSheet />

      {!mode && (
        <>
          <p className="dashboard-section-title">Choisis un groupe</p>
          <div className="verb-family-select">
            <button className={`onboarding-option ${familyFilter === 'priority' ? 'selected' : ''}`} onClick={() => setFamilyFilter('priority')}>
              <span className="onboarding-option-title">⭐ Top 30 prioritaires</span>
            </button>
            <button className={`onboarding-option ${familyFilter === 'all' ? 'selected' : ''}`} onClick={() => setFamilyFilter('all')}>
              <span className="onboarding-option-title">Tous les verbes ({verbs.length})</span>
            </button>
            {families.map((f) => (
              <button key={f} className={`onboarding-option ${familyFilter === f ? 'selected' : ''}`} onClick={() => setFamilyFilter(f)}>
                <span className="onboarding-option-title">Famille : {f}</span>
              </button>
            ))}
          </div>

          <p className="dashboard-section-title">Mode d'entraînement ({filtered.length} verbes)</p>
          <button className="btn-primary" onClick={() => setMode('list')} style={{ background: 'var(--bg-surface-alt)', color: 'var(--text-primary)', border: '1.5px solid var(--border)' }}>📋 Réviser la liste</button>
          <button className="btn-primary" onClick={() => setMode('flashcards')}>🃏 Flashcards</button>
          <button className="btn-primary" onClick={() => setMode('quiz')} style={{ background: 'var(--accent-blue)' }}>❓ Quiz (10 questions)</button>
          <button className="btn-primary" onClick={() => setMode('sprint')} style={{ background: 'var(--accent-warm)' }}>⚡ Défi 60 secondes</button>
        </>
      )}

      {mode && (
        <>
          <button className="lesson-back" onClick={() => setMode(null)}>← Changer de mode</button>
          {mode === 'list' && <ListMode verbs={filtered} />}
          {mode === 'flashcards' && <FlashcardMode verbs={filtered} />}
          {mode === 'quiz' && <QuizMode verbs={filtered} />}
          {mode === 'sprint' && <SprintMode verbs={filtered} user={user} />}
        </>
      )}
    </div>
  )

  // Pas de sidebar pendant l'entraînement actif (mode focus), sidebar visible sur l'écran de sélection
  return mode ? content : <AppLayout>{content}</AppLayout>
}

export default Verbs

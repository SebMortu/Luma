import { useEffect, useState } from 'react'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import AppLayout from '../components/AppLayout.jsx'

function shuffle(array) {
  const copy = [...array]
  for (let i = copy.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1))
    ;[copy[i], copy[j]] = [copy[j], copy[i]]
  }
  return copy
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

function QuizMode({ verbs }) {
  const [deck] = useState(() => shuffle(verbs).slice(0, 10))
  const [index, setIndex] = useState(0)
  const [options, setOptions] = useState([])
  const [selected, setSelected] = useState(null)
  const [score, setScore] = useState(0)

  const current = deck[index]
  const finished = index >= deck.length

  useEffect(() => {
    if (!current) return
    const wrongOnes = shuffle(verbs.filter((v) => v.past_form !== current.past_form)).slice(0, 3).map((v) => v.past_form)
    setOptions(shuffle([current.past_form, ...wrongOnes]))
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
      <p className="verb-progress">{index + 1} / {deck.length}</p>
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

  return (
    <AppLayout>
      <div className="page">
        <h1>🔤 Verbes irréguliers</h1>

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
            <button className="btn-primary" onClick={() => setMode('flashcards')}>🃏 Flashcards</button>
            <button className="btn-primary" onClick={() => setMode('quiz')} style={{ background: 'var(--accent-blue)' }}>❓ Quiz (10 questions)</button>
          </>
        )}

        {mode && (
          <>
            <button className="lesson-back" onClick={() => setMode(null)}>← Changer de mode</button>
            {mode === 'flashcards' && <FlashcardMode verbs={filtered} />}
            {mode === 'quiz' && <QuizMode verbs={filtered} />}
          </>
        )}
      </div>
    </AppLayout>
  )
}

export default Verbs

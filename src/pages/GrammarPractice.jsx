import { useEffect, useState } from 'react'
import { useParams, useNavigate, Link } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import { awardProgress } from '../lib/progress.js'
import ExerciseQCM from '../components/exercises/ExerciseQCM.jsx'
import ExerciseFillBlank from '../components/exercises/ExerciseFillBlank.jsx'
import ExerciseTrueFalse from '../components/exercises/ExerciseTrueFalse.jsx'
import ExerciseReorder from '../components/exercises/ExerciseReorder.jsx'
import ExerciseErrorCorrection from '../components/exercises/ExerciseErrorCorrection.jsx'

const EXERCISE_COMPONENTS = {
  qcm: ExerciseQCM,
  fill_blank: ExerciseFillBlank,
  true_false: ExerciseTrueFalse,
  reorder: ExerciseReorder,
  error_correction: ExerciseErrorCorrection,
}

function GrammarPractice() {
  const { ficheId } = useParams()
  const { user } = useAuth()
  const navigate = useNavigate()
  const [fiche, setFiche] = useState(null)
  const [exercises, setExercises] = useState([])
  const [currentIndex, setCurrentIndex] = useState(0)
  const [hasAnsweredCurrent, setHasAnsweredCurrent] = useState(false)
  const [results, setResults] = useState({})
  const [phase, setPhase] = useState('playing') // 'playing' | 'finished'
  const [loading, setLoading] = useState(true)
  const [xpGained, setXpGained] = useState(null)
  const [showExplanation, setShowExplanation] = useState(false)

  useEffect(() => {
    async function load() {
      const [{ data: ficheData }, { data: exData }] = await Promise.all([
        supabase.from('grammar_fiches').select('*').eq('id', ficheId).single(),
        supabase.from('grammar_fiche_exercises').select('*').eq('fiche_id', ficheId).order('position'),
      ])
      setFiche(ficheData)
      setExercises(exData || [])
      setLoading(false)
    }
    load()
  }, [ficheId])

  const handleAnswered = (correct) => {
    setResults((prev) => ({ ...prev, [currentIndex]: correct }))
    setHasAnsweredCurrent(true)
  }

  const goToNext = async () => {
    if (currentIndex + 1 >= exercises.length) {
      const correctCount = Object.values({ ...results }).filter(Boolean).length
      const xp = correctCount * 5
      setXpGained(xp)
      try {
        await awardProgress(user.id, { xpGained: xp })
        await supabase.from('user_grammar_practice').upsert({ user_id: user.id, fiche_id: ficheId })
      } catch (err) {
        // Silencieux : la pratique reste utile même si l'XP échoue à s'enregistrer
      }
      setPhase('finished')
    } else {
      setCurrentIndex((i) => i + 1)
      setHasAnsweredCurrent(false)
    }
  }

  if (loading) return <div className="page"><p>Chargement...</p></div>

  if (exercises.length === 0) {
    return (
      <div className="page">
        <Link to={`/grammar/${ficheId}`} className="back-link">← Retour à la fiche</Link>
        <p>Pas encore d'exercices pour cette fiche.</p>
      </div>
    )
  }

  if (phase === 'finished') {
    const correctCount = Object.values(results).filter(Boolean).length
    return (
      <div className="page">
        <h1>{fiche.title}</h1>
        <div className="lesson-summary">
          <p>Score : {correctCount} / {exercises.length}</p>
          <p className="feedback correct">+{xpGained} XP</p>
          <button className="btn-primary" onClick={() => navigate(`/grammar/${ficheId}`)}>Retour à la fiche</button>
          <button className="btn-secondary" style={{ marginTop: '0.5rem' }} onClick={() => window.location.reload()}>Refaire les exercices</button>
        </div>
      </div>
    )
  }

  const ex = exercises[currentIndex]
  const Component = EXERCISE_COMPONENTS[ex.type]
  const progressPct = Math.round(((currentIndex + (hasAnsweredCurrent ? 1 : 0)) / exercises.length) * 100)

  return (
    <div className="page">
      <div className="lesson-progress-top">
        <button className="lesson-back-icon" onClick={() => navigate(`/grammar/${ficheId}`)} aria-label="Quitter">←</button>
        <div className="progress-bar-track" style={{ flex: 1 }}>
          <div className="progress-bar-fill" style={{ width: `${progressPct}%` }} />
        </div>
        <button className="lesson-explain-icon" onClick={() => setShowExplanation(true)} aria-label="Revoir la fiche">📖</button>
      </div>
      <p className="dashboard-goal">{currentIndex + 1} / {exercises.length}</p>

      {Component ? (
        <Component key={ex.id} content={ex.content} onAnswered={handleAnswered} />
      ) : (
        <p>Type d'exercice inconnu : {ex.type}</p>
      )}

      {hasAnsweredCurrent && (
        <button className="btn-primary" onClick={goToNext}>
          {currentIndex + 1 >= exercises.length ? 'Terminer' : 'Suivant'}
        </button>
      )}

      {showExplanation && (
        <div className="lesson-overlay-backdrop" onClick={() => setShowExplanation(false)}>
          <div className="lesson-overlay-panel" onClick={(e) => e.stopPropagation()}>
            <button className="lesson-overlay-close" onClick={() => setShowExplanation(false)}>✕</button>
            <h2 style={{ marginBottom: '1rem' }}>{fiche.title}</h2>
            {fiche.content.sections.map((s, i) => (
              <div key={i} className="grammar-section">
                <p className="grammar-section-heading">{s.heading}</p>
                <div className="grammar-section-text">
                  {s.text.split('\n').map((line, li) => <p key={li}>{line}</p>)}
                </div>
              </div>
            ))}
          </div>
        </div>
      )}
    </div>
  )
}

export default GrammarPractice

import { useEffect, useState } from 'react'
import { useLocation, useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import { awardProgress } from '../lib/progress.js'
import AppLayout from '../components/AppLayout.jsx'
import ExerciseQCM from '../components/exercises/ExerciseQCM.jsx'
import ExerciseFillBlank from '../components/exercises/ExerciseFillBlank.jsx'
import ExerciseTrueFalse from '../components/exercises/ExerciseTrueFalse.jsx'
import ExerciseMatching from '../components/exercises/ExerciseMatching.jsx'

const EXERCISE_COMPONENTS = {
  qcm: ExerciseQCM,
  fill_blank: ExerciseFillBlank,
  true_false: ExerciseTrueFalse,
  matching: ExerciseMatching,
}

// Plafond volontaire : peu importe le nombre de niveaux cochés, la session
// reste digeste et ne devient jamais un marathon de 100+ exercices.
const MAX_EXERCISES = 20

function shuffle(array) {
  const a = [...array]
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1))
    ;[a[i], a[j]] = [a[j], a[i]]
  }
  return a
}

function VocabTrainingSession() {
  const { state } = useLocation()
  const navigate = useNavigate()
  const { user } = useAuth()
  const levelIds = state?.levelIds || []

  const [exercises, setExercises] = useState([])
  const [currentIndex, setCurrentIndex] = useState(0)
  const [hasAnsweredCurrent, setHasAnsweredCurrent] = useState(false)
  const [results, setResults] = useState({})
  const [phase, setPhase] = useState('playing') // 'playing' | 'finished'
  const [loading, setLoading] = useState(true)
  const [xpGained, setXpGained] = useState(null)

  useEffect(() => {
    if (levelIds.length === 0) {
      navigate('/vocab-training', { replace: true })
      return
    }
    async function load() {
      const { data } = await supabase.from('vocab_theme_exercises').select('*').in('level_id', levelIds)
      const mixed = shuffle(data || []).slice(0, MAX_EXERCISES)
      setExercises(mixed)
      setLoading(false)
    }
    load()
  }, [])

  const handleAnswered = (correct) => {
    setResults((prev) => ({ ...prev, [currentIndex]: correct }))
    setHasAnsweredCurrent(true)
  }

  const goToNext = async () => {
    if (currentIndex + 1 >= exercises.length) {
      const correctCount = Object.values(results).filter(Boolean).length
      const xp = correctCount * 5
      setXpGained(xp)
      try {
        await awardProgress(user.id, { xpGained: xp })
      } catch (err) { /* silencieux */ }
      setPhase('finished')
    } else {
      setCurrentIndex((i) => i + 1)
      setHasAnsweredCurrent(false)
    }
  }

  if (loading) return <AppLayout><div className="page"><p>Préparation de ton entraînement...</p></div></AppLayout>

  if (exercises.length === 0) {
    return (
      <AppLayout>
        <div className="page">
          <p>Aucun exercice trouvé pour cette sélection.</p>
          <button className="btn-primary" onClick={() => navigate('/vocab-training')}>Retour</button>
        </div>
      </AppLayout>
    )
  }

  if (phase === 'finished') {
    const correctCount = Object.values(results).filter(Boolean).length
    return (
      <AppLayout>
        <div className="page">
          <h1>🎯 Entraînement terminé</h1>
          <div className="lesson-summary">
            <p>Score : {correctCount} / {exercises.length}</p>
            <p className="feedback correct">+{xpGained} XP</p>
            <button className="btn-primary" onClick={() => navigate('/vocab-training')}>Nouvel entraînement</button>
            <button className="btn-secondary" style={{ marginTop: '0.5rem' }} onClick={() => navigate('/vocab-themes')}>Retour aux thèmes</button>
          </div>
        </div>
      </AppLayout>
    )
  }

  const ex = exercises[currentIndex]
  const Component = EXERCISE_COMPONENTS[ex.type]
  const progressPct = Math.round(((currentIndex + (hasAnsweredCurrent ? 1 : 0)) / exercises.length) * 100)

  return (
    <AppLayout>
      <div className="page">
        <div className="lesson-progress-top">
          <button className="lesson-back-icon" onClick={() => navigate('/vocab-training')} aria-label="Quitter">←</button>
          <div className="progress-bar-track" style={{ flex: 1 }}>
            <div className="progress-bar-fill" style={{ width: `${progressPct}%` }} />
          </div>
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
      </div>
    </AppLayout>
  )
}

export default VocabTrainingSession

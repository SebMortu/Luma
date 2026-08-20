import { useEffect, useState, useRef } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { estimateMinutesRemaining } from '../lib/level.js'
import { recordLessonCompletion } from '../lib/progress.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import ExerciseQCM from '../components/exercises/ExerciseQCM.jsx'
import ExerciseFillBlank from '../components/exercises/ExerciseFillBlank.jsx'
import ExerciseTrueFalse from '../components/exercises/ExerciseTrueFalse.jsx'
import ExerciseMatching from '../components/exercises/ExerciseMatching.jsx'
import ExerciseReorder from '../components/exercises/ExerciseReorder.jsx'
import ExerciseSpeakingPractice from '../components/exercises/ExerciseSpeakingPractice.jsx'

const EXERCISE_COMPONENTS = {
  qcm: ExerciseQCM,
  fill_blank: ExerciseFillBlank,
  true_false: ExerciseTrueFalse,
  matching: ExerciseMatching,
  reorder: ExerciseReorder,
  speaking_practice: ExerciseSpeakingPractice,
}

function LessonExplanation({ lesson }) {
  return (
    <>
      <div className="lesson-rule">
        <p>{lesson.content.rule}</p>
      </div>

      {lesson.content.table && (
        <table className="lesson-table">
          <tbody>
            {lesson.content.table.map((row, i) => (
              <tr key={i}>
                <td>{row.subject}</td>
                <td>{row.affirmative}</td>
                <td>{row.negative}</td>
              </tr>
            ))}
          </tbody>
        </table>
      )}

      {lesson.content.example && (
        <div className="lesson-example">
          <p><strong>{lesson.content.example.en}</strong></p>
          <p>{lesson.content.example.fr}</p>
        </div>
      )}
    </>
  )
}

function Lesson() {
  const { lessonId } = useParams()
  const { user } = useAuth()
  const navigate = useNavigate()

  const [lesson, setLesson] = useState(null)
  const [unit, setUnit] = useState(null)
  const [exercises, setExercises] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)

  const [phase, setPhase] = useState('explanation')
  const [currentIndex, setCurrentIndex] = useState(0)
  const [results, setResults] = useState({})
  const [showExplanationOverlay, setShowExplanationOverlay] = useState(false)
  const [hasAnsweredCurrent, setHasAnsweredCurrent] = useState(false)

  const [saving, setSaving] = useState(false)
  const [xpGained, setXpGained] = useState(null)
  const [newStreak, setNewStreak] = useState(null)
  const [alreadyCompleted, setAlreadyCompleted] = useState(false)
  const [goalInfo, setGoalInfo] = useState(null)
  const startTimeRef = useRef(Date.now())

  useEffect(() => {
    startTimeRef.current = Date.now()
  }, [lessonId])

  useEffect(() => {
    async function load() {
      try {
        const { data: lessonData, error: lessonErr } = await supabase
          .from('lessons').select('*').eq('id', lessonId).single()
        if (lessonErr) throw lessonErr
        setLesson(lessonData)

        const { data: unitData, error: unitErr } = await supabase
          .from('units').select('*').eq('id', lessonData.unit_id).single()
        if (unitErr) throw unitErr
        setUnit(unitData)

        const { data: exercisesData, error: exercisesErr } = await supabase
          .from('exercises').select('*').eq('lesson_id', lessonId).order('position')
        if (exercisesErr) throw exercisesErr
        setExercises(exercisesData)

        // Reprend une session interrompue si elle existe (même leçon, exercices identiques)
        try {
          const saved = JSON.parse(localStorage.getItem(`luma-lesson-progress-${lessonId}`) || 'null')
          if (saved && saved.phase === 'exercises' && saved.currentIndex < exercisesData.length) {
            setPhase('exercises')
            setCurrentIndex(saved.currentIndex)
            setResults(saved.results || {})
          }
        } catch { /* ignore une sauvegarde corrompue */ }
      } catch (err) {
        setError(err.message)
      } finally {
        setLoading(false)
      }
    }
    load()
  }, [lessonId])

  const handleAnswered = (exerciseId, correct) => {
    setResults((prev) => ({ ...prev, [exerciseId]: correct }))
    setHasAnsweredCurrent(true)
  }

  const goToNext = () => {
    if (currentIndex + 1 >= exercises.length) {
      setPhase('finished')
      localStorage.removeItem(`luma-lesson-progress-${lessonId}`)
    } else {
      const nextIndex = currentIndex + 1
      setCurrentIndex(nextIndex)
      setHasAnsweredCurrent(false)
      localStorage.setItem(`luma-lesson-progress-${lessonId}`, JSON.stringify({
        phase: 'exercises', currentIndex: nextIndex, results,
      }))
    }
  }

  const correctCount = Object.values(results).filter(Boolean).length
  const isFinished = phase === 'finished'

  useEffect(() => {
    if (!isFinished || xpGained !== null || saving) return
    async function save() {
      setSaving(true)
      try {
        const score = correctCount / exercises.length
        const secondsSpent = Math.round((Date.now() - startTimeRef.current) / 1000)
        const result = await recordLessonCompletion({
          userId: user.id,
          languageId: unit.language_id,
          unitId: unit.id,
          lessonId: lesson.id,
          score,
          secondsSpent,
        })
        setXpGained(result.xpGained)
        setNewStreak(result.newStreak)
        setAlreadyCompleted(result.alreadyCompleted)
        setGoalInfo({ goalMetNow: result.goalMetNow, xpToday: result.xpToday, threshold: result.threshold })
      } catch (err) {
        setError(err.message)
      } finally {
        setSaving(false)
      }
    }
    save()
  }, [isFinished])

  if (loading) return <div className="page"><p>Chargement de la leçon...</p></div>
  if (error) return <div className="page"><p className="feedback incorrect">Erreur : {error}</p></div>
  if (!lesson) return <div className="page"><p>Leçon introuvable.</p></div>

  if (phase === 'explanation') {
    return (
      <div className="page">
        <button className="lesson-back" onClick={() => navigate(-1)}>← Retour</button>
        <h1>{lesson.title}</h1>
        <LessonExplanation lesson={lesson} />
        {exercises.length > 0 ? (
          <button className="btn-primary" style={{ width: '100%', marginTop: '1.5rem' }} onClick={() => setPhase('exercises')}>
            Commencer les exercices ({exercises.length})
          </button>
        ) : (
          <p style={{ marginTop: '1.5rem' }}>Aucun exercice pour cette leçon pour l'instant.</p>
        )}
      </div>
    )
  }

  if (phase === 'exercises') {
    const ex = exercises[currentIndex]
    const Component = EXERCISE_COMPONENTS[ex.type]
    const progressPct = Math.round((currentIndex / exercises.length) * 100)

    return (
      <div className="page">
        <div className="lesson-progress-top">
          <button className="lesson-back-icon" onClick={() => navigate(-1)} aria-label="Quitter">←</button>
          <div className="progress-bar-track" style={{ flex: 1 }}>
            <div className="progress-bar-fill" style={{ width: `${progressPct}%` }} />
          </div>
          <button className="lesson-explain-icon" onClick={() => setShowExplanationOverlay(true)} aria-label="Revoir l'explication">📖</button>
        </div>
        <p className="verb-progress">
          {currentIndex + 1} / {exercises.length}
          {(() => {
            const mins = estimateMinutesRemaining(exercises.length - currentIndex)
            return mins ? ` · ~${mins} min restante${mins > 1 ? 's' : ''}` : ''
          })()}
        </p>

        {!EXERCISE_COMPONENTS[ex.type] && <p>Type d'exercice inconnu : {ex.type}</p>}
        {Component && (
          <Component
            key={ex.id}
            content={ex.content}
            onAnswered={(correct) => handleAnswered(ex.id, correct)}
          />
        )}

        {hasAnsweredCurrent && (
          <button className="btn-primary" style={{ width: '100%', marginTop: '1rem' }} onClick={goToNext}>
            {currentIndex + 1 >= exercises.length ? 'Terminer la leçon' : 'Exercice suivant →'}
          </button>
        )}

        {showExplanationOverlay && (
          <div className="lesson-overlay-backdrop" onClick={() => setShowExplanationOverlay(false)}>
            <div className="lesson-overlay-panel" onClick={(e) => e.stopPropagation()}>
              <button className="lesson-overlay-close" onClick={() => setShowExplanationOverlay(false)}>✕</button>
              <h2 style={{ marginBottom: '1rem' }}>{lesson.title}</h2>
              <LessonExplanation lesson={lesson} />
            </div>
          </div>
        )}
      </div>
    )
  }

  return (
    <div className="page">
      <h1>{lesson.title}</h1>
      <div className="lesson-summary">
        <p>Score : {correctCount} / {exercises.length}</p>
        {saving && <p>Enregistrement...</p>}
        {xpGained !== null && (
          <>
            {alreadyCompleted ? (
              <p className="feedback correct">Révision enregistrée · Streak : {newStreak} 🔥</p>
            ) : (
              <p className="feedback correct">+{xpGained} XP · Streak : {newStreak} 🔥</p>
            )}
            {goalInfo && (
              <div className="goal-progress-mini">
                <div className="progress-bar-track">
                  <div className="progress-bar-fill" style={{ width: `${Math.min(100, Math.round((goalInfo.xpToday / goalInfo.threshold) * 100))}%` }} />
                </div>
                <p className="progress-card-sub">
                  {goalInfo.goalMetNow
                    ? `Objectif du jour atteint ✅ (${goalInfo.xpToday}/${goalInfo.threshold} XP)`
                    : `Objectif du jour : ${goalInfo.xpToday}/${goalInfo.threshold} XP`}
                </p>
              </div>
            )}
            <button className="btn-primary" onClick={() => navigate(`/level/${unit.cecr_level}`)}>
              Retour au niveau {unit.cecr_level}
            </button>
          </>
        )}
      </div>
    </div>
  )
}

export default Lesson

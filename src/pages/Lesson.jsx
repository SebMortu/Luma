import { useEffect, useState } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { recordLessonCompletion } from '../lib/progress.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import ExerciseQCM from '../components/exercises/ExerciseQCM.jsx'
import ExerciseFillBlank from '../components/exercises/ExerciseFillBlank.jsx'
import ExerciseTrueFalse from '../components/exercises/ExerciseTrueFalse.jsx'

const EXERCISE_COMPONENTS = {
  qcm: ExerciseQCM,
  fill_blank: ExerciseFillBlank,
  true_false: ExerciseTrueFalse,
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
  const [results, setResults] = useState({})
  const [saving, setSaving] = useState(false)
  const [xpGained, setXpGained] = useState(null)
  const [newStreak, setNewStreak] = useState(null)
  const [alreadyCompleted, setAlreadyCompleted] = useState(false)

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
  }

  const answeredCount = Object.keys(results).length
  const correctCount = Object.values(results).filter(Boolean).length
  const isFinished = exercises.length > 0 && answeredCount === exercises.length

  useEffect(() => {
    if (!isFinished || xpGained !== null || saving) return
    async function save() {
      setSaving(true)
      try {
        const score = correctCount / exercises.length
        const result = await recordLessonCompletion({
          userId: user.id,
          languageId: unit.language_id,
          unitId: unit.id,
          lessonId: lesson.id,
          score,
        })
        setXpGained(result.xpGained)
        setNewStreak(result.newStreak)
        setAlreadyCompleted(result.alreadyCompleted)
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

  return (
    <div className="page">
      <h1>{lesson.title}</h1>

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

      <h2>Exercices</h2>
      {exercises.map((ex) => {
        const Component = EXERCISE_COMPONENTS[ex.type]
        if (!Component) return <p key={ex.id}>Type d'exercice inconnu : {ex.type}</p>
        return (
          <Component
            key={ex.id}
            content={ex.content}
            onAnswered={(correct) => handleAnswered(ex.id, correct)}
          />
        )
      })}

      {isFinished && (
        <div className="lesson-summary">
          <p>Score : {correctCount} / {exercises.length}</p>
          {saving && <p>Enregistrement...</p>}
          {xpGained !== null && (
            <>
              {alreadyCompleted ? (
                <p className="feedback correct">Révision enregistrée · Streak : {newStreak} 🔥 (pas d'XP supplémentaire, déjà validée)</p>
              ) : (
                <p className="feedback correct">+{xpGained} XP · Streak : {newStreak} 🔥</p>
              )}
              <button className="btn-primary" onClick={() => navigate('/dashboard')}>
                Retour au tableau de bord
              </button>
            </>
          )}
        </div>
      )}
    </div>
  )
}

export default Lesson

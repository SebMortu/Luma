import { useEffect, useState } from 'react'
import { supabase } from '../lib/supabaseClient.js'
import ExerciseQCM from '../components/exercises/ExerciseQCM.jsx'
import ExerciseFillBlank from '../components/exercises/ExerciseFillBlank.jsx'
import ExerciseTrueFalse from '../components/exercises/ExerciseTrueFalse.jsx'

const EXERCISE_COMPONENTS = {
  qcm: ExerciseQCM,
  fill_blank: ExerciseFillBlank,
  true_false: ExerciseTrueFalse,
}

function LessonDemo() {
  const [lesson, setLesson] = useState(null)
  const [exercises, setExercises] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)
  const [results, setResults] = useState({})

  useEffect(() => {
    async function loadLesson() {
      try {
        // 1. Trouver l'unité 1 de l'anglais
        const { data: language, error: langErr } = await supabase
          .from('languages').select('id').eq('code', 'en').single()
        if (langErr) throw langErr

        const { data: unit, error: unitErr } = await supabase
          .from('units').select('id').eq('language_id', language.id).eq('position', 1).single()
        if (unitErr) throw unitErr

        // 2. Trouver la leçon 1 de cette unité
        const { data: lessonData, error: lessonErr } = await supabase
          .from('lessons').select('*').eq('unit_id', unit.id).eq('position', 1).single()
        if (lessonErr) throw lessonErr
        setLesson(lessonData)

        // 3. Charger les exercices de cette leçon, dans l'ordre
        const { data: exercisesData, error: exercisesErr } = await supabase
          .from('exercises').select('*').eq('lesson_id', lessonData.id).order('position')
        if (exercisesErr) throw exercisesErr
        setExercises(exercisesData)
      } catch (err) {
        setError(err.message)
      } finally {
        setLoading(false)
      }
    }
    loadLesson()
  }, [])

  const handleAnswered = (exerciseId, correct) => {
    setResults((prev) => ({ ...prev, [exerciseId]: correct }))
  }

  if (loading) return <div className="page"><p>Chargement de la leçon...</p></div>
  if (error) return <div className="page"><p className="feedback incorrect">Erreur : {error}</p></div>
  if (!lesson) return <div className="page"><p>Aucune leçon trouvée.</p></div>

  const answeredCount = Object.keys(results).length
  const correctCount = Object.values(results).filter(Boolean).length

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

      {answeredCount === exercises.length && exercises.length > 0 && (
        <div className="lesson-summary">
          <p>Score : {correctCount} / {exercises.length}</p>
        </div>
      )}
    </div>
  )
}

export default LessonDemo

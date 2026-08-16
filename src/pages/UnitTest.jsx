import { useEffect, useState } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import { awardProgress } from '../lib/progress.js'
import ExerciseQCM from '../components/exercises/ExerciseQCM.jsx'
import ExerciseFillBlank from '../components/exercises/ExerciseFillBlank.jsx'
import ExerciseTrueFalse from '../components/exercises/ExerciseTrueFalse.jsx'
import ExerciseMatching from '../components/exercises/ExerciseMatching.jsx'
import ExerciseReorder from '../components/exercises/ExerciseReorder.jsx'

const EXERCISE_COMPONENTS = {
  qcm: ExerciseQCM,
  fill_blank: ExerciseFillBlank,
  true_false: ExerciseTrueFalse,
  matching: ExerciseMatching,
  reorder: ExerciseReorder,
}

const PASS_THRESHOLD = 0.8

function shuffle(array) {
  const copy = [...array]
  for (let i = copy.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1))
    ;[copy[i], copy[j]] = [copy[j], copy[i]]
  }
  return copy
}

function UnitTest() {
  const { unitId } = useParams()
  const { user } = useAuth()
  const navigate = useNavigate()

  const [unit, setUnit] = useState(null)
  const [lessons, setLessons] = useState([])
  const [testExercises, setTestExercises] = useState([])
  const [loading, setLoading] = useState(true)
  const [results, setResults] = useState({})
  const [finished, setFinished] = useState(false)
  const [saving, setSaving] = useState(false)
  const [passed, setPassed] = useState(false)
  const [xpGained, setXpGained] = useState(null)

  useEffect(() => {
    async function load() {
      const { data: unitData } = await supabase.from('units').select('*').eq('id', unitId).single()
      setUnit(unitData)

      const { data: lessonsData } = await supabase.from('lessons').select('*').eq('unit_id', unitId).order('position')
      setLessons(lessonsData || [])

      const picked = []
      for (const lesson of lessonsData || []) {
        const { data: exercises } = await supabase.from('exercises').select('*').eq('lesson_id', lesson.id).order('position')
        if (exercises && exercises.length > 0) {
          picked.push(...shuffle(exercises).slice(0, 2))
        }
      }
      setTestExercises(shuffle(picked))
      setLoading(false)
    }
    load()
  }, [unitId])

  const handleAnswered = (exerciseId, correct) => {
    setResults((prev) => ({ ...prev, [exerciseId]: correct }))
  }

  const answeredCount = Object.keys(results).length
  const correctCount = Object.values(results).filter(Boolean).length
  const isReady = testExercises.length > 0 && answeredCount === testExercises.length

  useEffect(() => {
    if (!isReady || finished || saving) return
    finish()
  }, [isReady])

  const finish = async () => {
    setSaving(true)
    setFinished(true)
    const score = correctCount / testExercises.length
    const didPass = score >= PASS_THRESHOLD
    setPassed(didPass)

    if (didPass) {
      let newlyCompleted = 0
      for (const lesson of lessons) {
        const { data: existing } = await supabase
          .from('user_progress').select('status, best_score')
          .eq('user_id', user.id).eq('language_id', unit.language_id)
          .eq('unit_id', unitId).eq('lesson_id', lesson.id)
          .maybeSingle()

        if (existing?.status !== 'completed') newlyCompleted++
        const bestScore = existing ? Math.max(existing.best_score ?? 0, score) : score

        await supabase.from('user_progress').upsert({
          user_id: user.id,
          language_id: unit.language_id,
          unit_id: unitId,
          lesson_id: lesson.id,
          status: 'completed',
          best_score: bestScore,
          updated_at: new Date().toISOString(),
        }, { onConflict: 'user_id,language_id,unit_id,lesson_id' })
      }

      const result = await awardProgress(user.id, { xpGained: newlyCompleted * 15 })
      setXpGained(result.xpGained)
    }
    setSaving(false)
  }

  if (loading) return <div className="page"><p>Préparation du test...</p></div>
  if (testExercises.length === 0) return <div className="page"><p>Pas assez de contenu dans cette unité pour un test de sortie.</p></div>

  return (
    <div className="page">
      <button className="lesson-back" onClick={() => navigate(-1)}>← Quitter le test</button>
      <h1>📝 Test de sortie</h1>
      <p className="dashboard-goal">
        Unité {unit?.position} · {unit?.title} — réponds à {testExercises.length} questions.
        <strong> {Math.round(PASS_THRESHOLD * 100)}% de réussite valide toute l'unité d'un coup.</strong>
      </p>

      {!finished && testExercises.map((ex) => {
        const Component = EXERCISE_COMPONENTS[ex.type]
        if (!Component) return null
        return (
          <Component key={ex.id} content={ex.content} onAnswered={(correct) => handleAnswered(ex.id, correct)} />
        )
      })}

      {finished && (
        <div className="lesson-summary">
          <p className="verb-result">Score : {correctCount} / {testExercises.length}</p>
          {saving && <p>Enregistrement...</p>}
          {!saving && passed && (
            <>
              <p className="feedback correct">✅ Unité validée ! {xpGained !== null && `+${xpGained} XP`}</p>
              <button className="btn-primary" onClick={() => navigate('/dashboard')}>Retour au tableau de bord</button>
            </>
          )}
          {!saving && !passed && (
            <>
              <p className="feedback incorrect">Pas encore — il faut au moins {Math.round(PASS_THRESHOLD * 100)}% pour valider l'unité.</p>
              <button className="btn-primary" onClick={() => window.location.reload()}>Réessayer</button>
            </>
          )}
        </div>
      )}
    </div>
  )
}

export default UnitTest

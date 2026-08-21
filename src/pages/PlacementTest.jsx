import { useEffect, useState } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
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

// Ordre des niveaux, du plus bas au plus haut ('A0' = Fondations, avant l'A1)
const LEVEL_ORDER = ['A0', 'A1', 'A2', 'B1', 'B2', 'C1']
const PASS_THRESHOLD = 0.7
const QUESTIONS_PER_LEVEL = 5

function shuffle(array) {
  const copy = [...array]
  for (let i = copy.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1))
    ;[copy[i], copy[j]] = [copy[j], copy[i]]
  }
  return copy
}

function PlacementTest() {
  const { targetLevel } = useParams()
  const { user } = useAuth()
  const navigate = useNavigate()

  const [loading, setLoading] = useState(true)
  const [languageId, setLanguageId] = useState(null)
  const [testExercises, setTestExercises] = useState([])
  const [levelsCovered, setLevelsCovered] = useState([])
  const [currentIndex, setCurrentIndex] = useState(0)
  const [results, setResults] = useState({})
  const [hasAnsweredCurrent, setHasAnsweredCurrent] = useState(false)
  const [finished, setFinished] = useState(false)
  const [saving, setSaving] = useState(false)
  const [passed, setPassed] = useState(false)

  useEffect(() => {
    async function load() {
      const { data: language } = await supabase.from('languages').select('id').eq('code', 'en').single()
      setLanguageId(language.id)

      // On teste sur tous les niveaux STRICTEMENT en dessous du niveau visé,
      // plus le niveau visé lui-même : ça vérifie à la fois les bases et la
      // compétence réellement revendiquée.
      const targetIdx = LEVEL_ORDER.indexOf(targetLevel)
      const levelsToTest = LEVEL_ORDER.slice(Math.max(targetIdx - 2, 1), targetIdx + 1) // 2 niveaux en dessous max + le niveau visé
      setLevelsCovered(levelsToTest)

      const picked = []
      for (const lvl of levelsToTest) {
        const { data: units } = await supabase
          .from('units').select('id').eq('language_id', language.id).eq('cecr_level', lvl).order('position')
        if (!units || units.length === 0) continue

        // On pioche dans 2-3 unités réparties sur le niveau pour une bonne couverture
        const sampledUnits = shuffle(units).slice(0, 3)
        const levelPicked = []
        for (const u of sampledUnits) {
          const { data: lessons } = await supabase.from('lessons').select('id').eq('unit_id', u.id)
          for (const lesson of shuffle(lessons || []).slice(0, 2)) {
            const { data: exercises } = await supabase
              .from('exercises').select('*').eq('lesson_id', lesson.id)
              .in('type', ['qcm', 'fill_blank', 'true_false'])
            if (exercises && exercises.length > 0) levelPicked.push(shuffle(exercises)[0])
          }
        }
        picked.push(...shuffle(levelPicked).slice(0, QUESTIONS_PER_LEVEL))
      }

      setTestExercises(shuffle(picked))
      setLoading(false)
    }
    load()
  }, [targetLevel])

  const handleAnswered = (exerciseId, correct) => {
    setResults((prev) => ({ ...prev, [exerciseId]: correct }))
    setHasAnsweredCurrent(true)
  }

  const goToNext = () => {
    if (currentIndex + 1 >= testExercises.length) {
      finish()
    } else {
      setCurrentIndex((i) => i + 1)
      setHasAnsweredCurrent(false)
    }
  }

  const correctCount = Object.values(results).filter(Boolean).length

  const finish = async () => {
    setSaving(true)
    setFinished(true)
    const score = correctCount / testExercises.length
    const didPass = score >= PASS_THRESHOLD
    setPassed(didPass)

    if (didPass) {
      // Déverrouille tous les niveaux strictement inférieurs au niveau visé,
      // exactement comme le fait l'onboarding pour un départ direct.
      const targetIdx = LEVEL_ORDER.indexOf(targetLevel)
      const levelsToUnlock = LEVEL_ORDER.slice(0, targetIdx)

      if (levelsToUnlock.length > 0) {
        const { data: unitsToUnlock } = await supabase
          .from('units').select('id').eq('language_id', languageId).in('cecr_level', levelsToUnlock)
        const unitIds = (unitsToUnlock || []).map((u) => u.id)
        if (unitIds.length > 0) {
          const { data: lessonsToUnlock } = await supabase.from('lessons').select('id, unit_id').in('unit_id', unitIds)
          const bypassRows = (lessonsToUnlock || []).map((l) => ({
            user_id: user.id, language_id: languageId, unit_id: l.unit_id, lesson_id: l.id,
            status: 'completed', best_score: 1,
          }))
          if (bypassRows.length > 0) {
            await supabase.from('user_progress').upsert(bypassRows, { onConflict: 'user_id,language_id,unit_id,lesson_id' })
          }
        }
      }
    }
    setSaving(false)
  }

  const startAtLowerLevel = async () => {
    const targetIdx = LEVEL_ORDER.indexOf(targetLevel)
    const fallbackLevel = LEVEL_ORDER[Math.max(targetIdx - 1, 0)]
    navigate(`/placement-test/${fallbackLevel}`, { replace: true })
  }

  const goToFirstLessonOfLevel = async () => {
    const { data: firstUnit } = await supabase
      .from('units').select('id').eq('language_id', languageId).eq('cecr_level', targetLevel)
      .order('position').limit(1).single()
    const { data: lesson } = await supabase
      .from('lessons').select('id').eq('unit_id', firstUnit.id).order('position').limit(1).single()
    navigate(lesson ? `/lesson/${lesson.id}` : '/dashboard', { replace: true })
  }

  if (loading) return <div className="page"><p>Préparation de ton test de positionnement...</p></div>
  if (testExercises.length === 0) return <div className="page"><p>Pas assez de contenu pour ce test. <button className="btn-primary" onClick={goToFirstLessonOfLevel}>Continuer quand même</button></p></div>

  if (!finished) {
    const ex = testExercises[currentIndex]
    const Component = EXERCISE_COMPONENTS[ex.type]
    const progressPct = Math.round((currentIndex / testExercises.length) * 100)

    return (
      <div className="page">
        <div className="lesson-progress-top">
          <div className="progress-bar-track" style={{ flex: 1 }}>
            <div className="progress-bar-fill" style={{ width: `${progressPct}%` }} />
          </div>
        </div>
        <p className="verb-progress">{currentIndex + 1} / {testExercises.length}</p>
        <p className="dashboard-goal">
          🎯 Test de positionnement pour le niveau {targetLevel}
          <strong> · {Math.round(PASS_THRESHOLD * 100)}% de réussite requis</strong>
        </p>

        {!Component && <p>Type d'exercice inconnu : {ex.type}</p>}
        {Component && (
          <Component key={ex.id} content={ex.content} onAnswered={(correct) => handleAnswered(ex.id, correct)} />
        )}

        {hasAnsweredCurrent && (
          <button className="btn-primary" style={{ width: '100%', marginTop: '1rem' }} onClick={goToNext}>
            {currentIndex + 1 >= testExercises.length ? 'Terminer le test' : 'Question suivante →'}
          </button>
        )}
      </div>
    )
  }

  return (
    <div className="page">
      <h1>🎯 Résultat du test de positionnement</h1>
      <div className="lesson-summary">
        <p className="verb-result">Score : {correctCount} / {testExercises.length}</p>
        {saving && <p>Enregistrement...</p>}
        {!saving && passed && (
          <>
            <p className="feedback correct">✅ Bravo, ton niveau {targetLevel} est confirmé !</p>
            <button className="btn-primary" onClick={goToFirstLessonOfLevel}>Commencer ma première leçon</button>
          </>
        )}
        {!saving && !passed && (
          <>
            <p className="feedback incorrect">
              Pas encore tout à fait — il te manque quelques bases pour démarrer directement en {targetLevel}.
              Rien de grave, on ajuste simplement ton point de départ.
            </p>
            <button className="btn-primary" onClick={startAtLowerLevel}>Retenter au niveau {LEVEL_ORDER[Math.max(LEVEL_ORDER.indexOf(targetLevel) - 1, 0)]}</button>
            <button className="btn-secondary" style={{ marginTop: '0.5rem' }} onClick={() => window.location.reload()}>Retenter ce niveau</button>
          </>
        )}
      </div>
    </div>
  )
}

export default PlacementTest

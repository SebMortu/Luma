import { useEffect, useState } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { estimateMinutesRemaining } from '../lib/level.js'
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

const LEVEL_ORDER = ['A1', 'A2', 'B1', 'B2', 'C1']
const PASS_THRESHOLD = 0.9
const QUESTIONS_PER_LESSON = 4 // le double du test de sortie classique (2)
const MAX_QUESTIONS = 45 // évite un test de plusieurs centaines de questions sur les gros niveaux

function shuffle(array) {
  const copy = [...array]
  for (let i = copy.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1))
    ;[copy[i], copy[j]] = [copy[j], copy[i]]
  }
  return copy
}

function LevelUpTest() {
  const { fromLevel } = useParams()
  const { user } = useAuth()
  const navigate = useNavigate()

  const nextLevel = LEVEL_ORDER[LEVEL_ORDER.indexOf(fromLevel) + 1]

  const [languageId, setLanguageId] = useState(null)
  const [units, setUnits] = useState([])
  const [lessons, setLessons] = useState([])
  const [testExercises, setTestExercises] = useState([])
  const [loading, setLoading] = useState(true)
  const [currentIndex, setCurrentIndex] = useState(0)
  const [results, setResults] = useState({})
  const [hasAnsweredCurrent, setHasAnsweredCurrent] = useState(false)
  const [finished, setFinished] = useState(false)
  const [saving, setSaving] = useState(false)
  const [passed, setPassed] = useState(false)
  const [xpGained, setXpGained] = useState(null)

  useEffect(() => {
    async function load() {
      const { data: settings } = await supabase.from('user_settings').select('active_language_id').eq('user_id', user.id).single()
      setLanguageId(settings.active_language_id)

      const { data: unitsData } = await supabase
        .from('units').select('*').eq('language_id', settings.active_language_id).eq('cecr_level', fromLevel).order('position')
      setUnits(unitsData || [])

      const unitIds = (unitsData || []).map((u) => u.id)
      if (unitIds.length === 0) { setLoading(false); return }

      const { data: lessonsData } = await supabase.from('lessons').select('*').in('unit_id', unitIds)
      setLessons(lessonsData || [])

      const picked = []
      for (const lesson of lessonsData || []) {
        const { data: exercises } = await supabase.from('exercises').select('*').eq('lesson_id', lesson.id).neq('type', 'speaking_practice').order('position')
        if (exercises && exercises.length > 0) {
          picked.push(...shuffle(exercises).slice(0, QUESTIONS_PER_LESSON))
        }
      }
      setTestExercises(shuffle(picked).slice(0, MAX_QUESTIONS))
      setLoading(false)
    }
    load()
  }, [fromLevel, user.id])

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
      let newlyCompleted = 0
      for (const lesson of lessons) {
        const { data: existing } = await supabase
          .from('user_progress').select('status, best_score')
          .eq('user_id', user.id).eq('language_id', languageId)
          .eq('unit_id', lesson.unit_id).eq('lesson_id', lesson.id)
          .maybeSingle()

        if (existing?.status !== 'completed') newlyCompleted++
        const bestScore = existing ? Math.max(existing.best_score ?? 0, score) : score

        await supabase.from('user_progress').upsert({
          user_id: user.id,
          language_id: languageId,
          unit_id: lesson.unit_id,
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

  const retry = () => {
    setCurrentIndex(0)
    setResults({})
    setHasAnsweredCurrent(false)
    setFinished(false)
    setPassed(false)
    setXpGained(null)
    setTestExercises((prev) => shuffle(prev))
  }

  if (!nextLevel) return <div className="page"><p>Il n'y a pas de niveau supérieur à {fromLevel}.</p></div>
  if (loading) return <div className="page"><p>Préparation du test de passage...</p></div>
  if (testExercises.length === 0) return <div className="page"><p>Pas assez de contenu dans le niveau {fromLevel} pour ce test.</p></div>

  if (!finished) {
    const ex = testExercises[currentIndex]
    const Component = EXERCISE_COMPONENTS[ex.type]
    const progressPct = Math.round((currentIndex / testExercises.length) * 100)

    const handleQuit = () => {
      if (currentIndex > 0 && !window.confirm('Ta progression sur ce test sera perdue si tu quittes maintenant. Continuer quand même ?')) {
        return
      }
      navigate(-1)
    }

    return (
      <div className="page">
        <div className="lesson-progress-top">
          <button className="lesson-back-icon" onClick={handleQuit} aria-label="Quitter">←</button>
          <div className="progress-bar-track" style={{ flex: 1 }}>
            <div className="progress-bar-fill" style={{ width: `${progressPct}%` }} />
          </div>
        </div>
        <p className="verb-progress">
          {currentIndex + 1} / {testExercises.length}
          {(() => {
            const mins = estimateMinutesRemaining(testExercises.length - currentIndex)
            return mins ? ` · ~${mins} min restante${mins > 1 ? 's' : ''}` : ''
          })()}
        </p>
        <p className="dashboard-goal">
          🎯 Test de passage {fromLevel} → {nextLevel}
          <strong> · {Math.round(PASS_THRESHOLD * 100)}% de réussite requis</strong>
        </p>

        {!Component && <p>Type d'exercice inconnu : {ex.type}</p>}
        {Component && (
          <Component
            key={ex.id}
            content={ex.content}
            onAnswered={(correct) => handleAnswered(ex.id, correct)}
          />
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
      <h1>🎯 Test de passage {fromLevel} → {nextLevel}</h1>
      <div className="lesson-summary">
        <p className="verb-result">Score : {correctCount} / {testExercises.length} ({Math.round((correctCount / testExercises.length) * 100)}%)</p>
        {saving && <p>Enregistrement...</p>}
        {!saving && passed && (
          <>
            <p className="feedback correct">🎉 Niveau {nextLevel} débloqué ! {xpGained !== null && `+${xpGained} XP`}</p>
            <button className="btn-primary" onClick={() => navigate('/dashboard')}>Retour au tableau de bord</button>
          </>
        )}
        {!saving && !passed && (
          <>
            <p className="feedback incorrect">Pas encore — il faut au moins {Math.round(PASS_THRESHOLD * 100)}% pour passer directement au niveau {nextLevel}.</p>
            <button className="btn-primary" onClick={retry}>Réessayer</button>
          </>
        )}
      </div>
    </div>
  )
}

export default LevelUpTest

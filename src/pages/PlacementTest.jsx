import { useEffect, useState, useRef } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import ExerciseQCM from '../components/exercises/ExerciseQCM.jsx'
import ExerciseFillBlank from '../components/exercises/ExerciseFillBlank.jsx'
import ExerciseTrueFalse from '../components/exercises/ExerciseTrueFalse.jsx'
import ExerciseMatching from '../components/exercises/ExerciseMatching.jsx'
import ExerciseReorder from '../components/exercises/ExerciseReorder.jsx'
import ExerciseDictation from '../components/exercises/ExerciseDictation.jsx'

const EXERCISE_COMPONENTS = {
  qcm: ExerciseQCM,
  fill_blank: ExerciseFillBlank,
  true_false: ExerciseTrueFalse,
  matching: ExerciseMatching,
  reorder: ExerciseReorder,
  dictation: ExerciseDictation,
}

const LEVEL_ORDER = ['A0', 'A1', 'A2', 'B1', 'B2', 'C1']
const MAX_QUESTIONS = 14
const MIN_QUESTIONS_BEFORE_STOP = 8
const STABILITY_WINDOW = 4

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
  const poolsRef = useRef({})
  const cursorsRef = useRef({})

  const [currentLevelIdx, setCurrentLevelIdx] = useState(0)
  const [currentExercise, setCurrentExercise] = useState(null)
  const [questionCount, setQuestionCount] = useState(0)
  const [levelHistory, setLevelHistory] = useState([])
  const [hasAnsweredCurrent, setHasAnsweredCurrent] = useState(false)
  const [lastWasCorrect, setLastWasCorrect] = useState(null)
  const [finished, setFinished] = useState(false)
  const [saving, setSaving] = useState(false)
  const [estimatedLevel, setEstimatedLevel] = useState(null)

  const ensurePool = async (levelIdx) => {
    const lvl = LEVEL_ORDER[levelIdx]
    if (poolsRef.current[lvl]) return
    const { data: units } = await supabase
      .from('units').select('id').eq('language_id', languageId).eq('cecr_level', lvl).order('position')
    const picked = []
    for (const u of shuffle(units || []).slice(0, 4)) {
      const { data: lessons } = await supabase.from('lessons').select('id').eq('unit_id', u.id)
      for (const lesson of shuffle(lessons || []).slice(0, 2)) {
        const { data: exercises } = await supabase
          .from('exercises').select('*').eq('lesson_id', lesson.id)
          .in('type', ['qcm', 'fill_blank', 'true_false'])
        if (exercises && exercises.length > 0) picked.push(shuffle(exercises)[0])
      }
    }
    poolsRef.current[lvl] = shuffle(picked)
    cursorsRef.current[lvl] = 0
  }

  const nextExerciseAtLevel = async (levelIdx) => {
    await ensurePool(levelIdx)
    const lvl = LEVEL_ORDER[levelIdx]
    const pool = poolsRef.current[lvl] || []
    const cursor = cursorsRef.current[lvl] || 0
    if (pool.length === 0) return null
    const ex = pool[cursor % pool.length]
    cursorsRef.current[lvl] = cursor + 1
    return ex
  }

  useEffect(() => {
    async function init() {
      const { data: language } = await supabase.from('languages').select('id').eq('code', 'en').single()
      setLanguageId(language.id)
      const startIdx = LEVEL_ORDER.indexOf(targetLevel)
      setCurrentLevelIdx(startIdx)
      setLoading(false)
    }
    init()
  }, [targetLevel])

  useEffect(() => {
    if (loading || !languageId || finished) return
    async function loadNext() {
      const ex = await nextExerciseAtLevel(currentLevelIdx)
      setCurrentExercise(ex)
      setLevelHistory((prev) => [...prev, currentLevelIdx])
    }
    loadNext()
  }, [loading, languageId, currentLevelIdx, questionCount])

  const handleAnswered = (correct) => {
    setLastWasCorrect(correct)
    setHasAnsweredCurrent(true)
  }

  const goToNext = () => {
    const nextCount = questionCount + 1

    let nextLevelIdx = currentLevelIdx
    if (lastWasCorrect) {
      nextLevelIdx = Math.min(currentLevelIdx + 1, LEVEL_ORDER.length - 1)
    } else {
      nextLevelIdx = Math.max(currentLevelIdx - 1, 0)
    }

    const willStop = nextCount >= MAX_QUESTIONS || (
      nextCount >= MIN_QUESTIONS_BEFORE_STOP &&
      new Set(levelHistory.slice(-STABILITY_WINDOW)).size <= 2
    )

    setQuestionCount(nextCount)
    setHasAnsweredCurrent(false)

    if (willStop) {
      finish([...levelHistory, nextLevelIdx])
    } else {
      setCurrentLevelIdx(nextLevelIdx)
    }
  }

  const finish = async (finalHistory) => {
    setSaving(true)
    setFinished(true)

    const window = finalHistory.slice(-STABILITY_WINDOW)
    const avgIdx = Math.round(window.reduce((a, b) => a + b, 0) / window.length)
    const finalLevel = LEVEL_ORDER[Math.max(0, Math.min(avgIdx, LEVEL_ORDER.length - 1))]
    setEstimatedLevel(finalLevel)

    // Débloque tous les niveaux jusqu'au niveau confirmé INCLUS — accessibles,
    // mais pas marqués comme "faits" (l'utilisateur n'a réellement rien complété).
    await supabase.from('user_settings').update({ level: finalLevel, unlocked_level: finalLevel }).eq('user_id', user.id)
    setSaving(false)
  }

  const goToFirstLessonOfLevel = async () => {
    const { data: firstUnit } = await supabase
      .from('units').select('id').eq('language_id', languageId).eq('cecr_level', estimatedLevel)
      .order('position').limit(1).single()
    const { data: lesson } = await supabase
      .from('lessons').select('id').eq('unit_id', firstUnit.id).order('position').limit(1).single()
    navigate(lesson ? `/lesson/${lesson.id}` : '/dashboard', { replace: true })
  }

  if (loading || (!currentExercise && !finished)) {
    return <div className="page"><p>Préparation de ton test de positionnement...</p></div>
  }

  if (!finished) {
    const Component = EXERCISE_COMPONENTS[currentExercise.type]
    const progressPct = Math.round((questionCount / MAX_QUESTIONS) * 100)

    return (
      <div className="page">
        <div className="lesson-progress-top">
          <div className="progress-bar-track" style={{ flex: 1 }}>
            <div className="progress-bar-fill" style={{ width: `${progressPct}%` }} />
          </div>
        </div>
        <p className="verb-progress">Question {questionCount + 1}</p>
        <p className="dashboard-goal">
          🎯 Test de positionnement adaptatif · niveau testé actuellement : <strong>{LEVEL_ORDER[currentLevelIdx]}</strong>
        </p>

        {!Component && <p>Type d'exercice inconnu : {currentExercise.type}</p>}
        {Component && (
          <Component key={currentExercise.id} content={currentExercise.content} onAnswered={handleAnswered} />
        )}

        {hasAnsweredCurrent && (
          <button className="btn-primary" style={{ width: '100%', marginTop: '1rem' }} onClick={goToNext}>
            Question suivante →
          </button>
        )}
      </div>
    )
  }

  return (
    <div className="page">
      <h1>🎯 Résultat du test de positionnement</h1>
      <div className="lesson-summary">
        {saving && <p>Analyse de tes réponses...</p>}
        {!saving && (
          <>
            <p className="feedback correct">✅ D'après tes réponses, ton niveau est : <strong>{estimatedLevel}</strong></p>
            <p className="progress-card-sub">
              Ce test s'est ajusté question après question pour trouver ton vrai niveau —
              pas seulement celui que tu avais déclaré.
            </p>
            <button className="btn-primary" onClick={goToFirstLessonOfLevel}>Commencer ma première leçon</button>
          </>
        )}
      </div>
    </div>
  )
}

export default PlacementTest

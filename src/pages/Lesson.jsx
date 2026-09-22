import { useEffect, useState, useRef } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import Confetti from '../components/Confetti.jsx'
import ReportButton from '../components/ReportButton.jsx'
import { estimateMinutesRemaining } from '../lib/level.js'
import { recordLessonCompletion } from '../lib/progress.js'
import { computeDiagnostic, CHECKPOINT_A0_COMPETENCIES } from '../lib/checkpointA0Config.js'

const LEVEL_ORDER = ['A0', 'A1', 'A2', 'B1', 'B2', 'C1']
import { getMascot } from '../lib/characters.js'
import CharacterAvatar from '../components/CharacterAvatar.jsx'
import { useAuth } from '../contexts/AuthContext.jsx'
import ExerciseQCM from '../components/exercises/ExerciseQCM.jsx'
import ExerciseFillBlank from '../components/exercises/ExerciseFillBlank.jsx'
import ExerciseTrueFalse from '../components/exercises/ExerciseTrueFalse.jsx'
import ExerciseMatching from '../components/exercises/ExerciseMatching.jsx'
import ExerciseReorder from '../components/exercises/ExerciseReorder.jsx'
import ExerciseDictation from '../components/exercises/ExerciseDictation.jsx'
import ExerciseSpeakingPractice from '../components/exercises/ExerciseSpeakingPractice.jsx'
import ExerciseMultiSelect from '../components/exercises/ExerciseMultiSelect.jsx'
import ExerciseBlockConstruction from '../components/exercises/ExerciseBlockConstruction.jsx'
import ExerciseComprehension from '../components/exercises/ExerciseComprehension.jsx'

const EXERCISE_COMPONENTS = {
  qcm: ExerciseQCM,
  fill_blank: ExerciseFillBlank,
  true_false: ExerciseTrueFalse,
  matching: ExerciseMatching,
  reorder: ExerciseReorder,
  dictation: ExerciseDictation,
  speaking_practice: ExerciseSpeakingPractice,
  multi_select: ExerciseMultiSelect,
  block_construction: ExerciseBlockConstruction,
  comprehension: ExerciseComprehension,
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
  const [mascot, setMascot] = useState(null)

  useEffect(() => {
    getMascot().then(setMascot).catch(() => setMascot(null))
  }, [])

  const [phase, setPhase] = useState('explanation')
  const [currentIndex, setCurrentIndex] = useState(0)
  const [results, setResults] = useState({})
  const [showExplanationOverlay, setShowExplanationOverlay] = useState(false)
  const [hasAnsweredCurrent, setHasAnsweredCurrent] = useState(false)

  const [saving, setSaving] = useState(false)
  const [xpGained, setXpGained] = useState(null)
  const [newStreak, setNewStreak] = useState(null)
  const [freezeUsed, setFreezeUsed] = useState(false)
  const [freezeGained, setFreezeGained] = useState(false)
  const [alreadyCompleted, setAlreadyCompleted] = useState(false)
  const [goalInfo, setGoalInfo] = useState(null)
  const startTimeRef = useRef(Date.now())

  const isCheckpoint = unit?.unit_type === 'checkpoint'
  // Stockage STRICTEMENT séparé de `results` -- ne participe jamais au
  // score historique. Clé = position réelle en DB (exercises.position).
  const checkpointAnswersRef = useRef({})
  const positionByOriginalIdRef = useRef({})
  const [diagnostic, setDiagnostic] = useState(null)

  useEffect(() => {
    startTimeRef.current = Date.now()
  }, [lessonId])

  useEffect(() => {
    async function load() {
      try {
        // Réinitialisation systématique -- empêche une tentative de
        // checkpoint précédente de contaminer une nouvelle session.
        checkpointAnswersRef.current = {}
        positionByOriginalIdRef.current = {}
        setDiagnostic(null)

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
        const posMap = {}
        exercisesData.forEach((e, i) => { posMap[e.id] = e.position ?? (i + 1) })
        positionByOriginalIdRef.current = posMap

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

    if (isCheckpoint) {
      const currentEx = exercises[currentIndex]
      const originalId = currentEx._originalId || currentEx.id
      const position = positionByOriginalIdRef.current[originalId]
      // Dernier résultat gagne (retry écrase la valeur précédente) --
      // stockage totalement indépendant de `results` / du score.
      checkpointAnswersRef.current[position] = correct
    }

    // Adaptivité légère : un exercice raté revient plus tard dans la même
    // session (quelques questions plus loin), pour que l'utilisateur le
    // retente une fois qu'il a eu le temps de digérer la correction —
    // plutôt que de simplement passer à la suite et l'oublier.
    // Plafonné à UNE seule réinjection par exercice : s'il est raté à nouveau
    // sur sa version réinjectée, on ne le réinjecte pas indéfiniment.
    const failedEx = exercises[currentIndex]
    if (!correct && !failedEx._requeued) {
      setExercises((prev) => {
        const insertAt = Math.min(currentIndex + 1 + 3, prev.length)
        const next = [...prev]
        // Identifiant distinct de l'original : deux exercices partageant le
        // même id dans le tableau perturbaient le suivi des résultats et le
        // rendu React (clé dupliquée), pouvant bloquer la progression.
        next.splice(insertAt, 0, { ...failedEx, id: `${failedEx.id}-retry`, _requeued: true, _originalId: failedEx.id })
        return next
      })
    }
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
    if (!isFinished || !isCheckpoint || diagnostic) return
    setDiagnostic(computeDiagnostic(checkpointAnswersRef.current))
  }, [isFinished])

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
          lessonTitle: lesson.title,
          vocabTable: lesson.content?.table,
        })
        setXpGained(result.xpGained)
        setNewStreak(result.newStreak)
        setFreezeUsed(result.freezeUsed)
        setFreezeGained(result.freezeGained)
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
          <ReportButton
            contentType="exercise"
            contentId={ex._originalId || ex.id}
            lessonTitle={lesson?.title}
            questionSnippet={ex.content?.question || ex.content?.statement || ex.content?.sentence || ''}
          />
        </div>
        <p className="verb-progress">
          {currentIndex + 1} / {exercises.length}
          {(() => {
            const mins = estimateMinutesRemaining(exercises.length - currentIndex)
            return mins ? ` · ~${mins} min restante${mins > 1 ? 's' : ''}` : ''
          })()}
        </p>
        {ex._requeued && <p className="requeued-badge">🔁 On retente celui-ci, tu l'avais raté tout à l'heure</p>}

        {mascot && (
          <div className="lesson-mascot-row">
            <CharacterAvatar
              character={mascot}
              state={!hasAnsweredCurrent ? 'thinking' : (results[ex.id] ? 'happy' : 'sad')}
              size={52}
            />
          </div>
        )}

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
    <div className="page" style={{ position: 'relative' }}>
      {xpGained !== null && !alreadyCompleted && (correctCount / exercises.length) >= 0.8 && <Confetti />}
      {mascot && (
        <div className="lesson-mascot-row" style={{ justifyContent: 'center', marginBottom: '0.5rem' }}>
          <CharacterAvatar
            character={mascot}
            state={xpGained !== null && (correctCount / exercises.length) >= 0.8 ? 'celebrating' : 'neutral'}
            size={72}
          />
        </div>
      )}
      <h1>{lesson.title}</h1>
      <div className="lesson-summary">
        <p>Score : {correctCount} / {exercises.length}</p>
        {saving && <p>Enregistrement...</p>}
        {xpGained !== null && (
          <>
            {alreadyCompleted ? (
              <p className="feedback correct">Révision enregistrée · Streak : {newStreak} 🔥</p>
            ) : (
              <p className="feedback correct"><span className="xp-pop">+{xpGained} XP</span> · Streak : {newStreak} <span className="streak-flame-pulse">🔥</span></p>
            )}
            {freezeUsed && (
              <p className="streak-freeze-message">🧊 Tu avais manqué un jour, mais un gel de série a protégé ta série automatiquement !</p>
            )}
            {freezeGained && (
              <p className="streak-freeze-message">🎉 Nouveau gel de série gagné (7 jours d'affilée) ! Il protégera ta série si jamais tu manques un jour.</p>
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
            {isCheckpoint && diagnostic && (
              <div className="checkpoint-diagnostic">
                <h2>Points solides</h2>
                <ul>
                  {Object.entries(diagnostic)
                    .filter(([, v]) => v === 'MAITRISE' || v === 'INDICE_POSITIF')
                    .map(([comp]) => <li key={comp}>{CHECKPOINT_A0_COMPETENCIES[comp]?.label}</li>)}
                </ul>
                <h2>Points fragiles</h2>
                <ul>
                  {Object.entries(diagnostic)
                    .filter(([, v]) => v === 'FRAGILE')
                    .map(([comp]) => <li key={comp}>{CHECKPOINT_A0_COMPETENCIES[comp]?.label}</li>)}
                </ul>
                <h2>À revoir</h2>
                <ul>
                  {Object.entries(diagnostic)
                    .filter(([, v]) => v === 'A_REVOIR' || v === 'NON_CONCLUANT')
                    .map(([comp]) => <li key={comp}>{CHECKPOINT_A0_COMPETENCIES[comp]?.label}</li>)}
                </ul>
              </div>
            )}
            <button
              className="btn-primary"
              onClick={() => {
                if (isCheckpoint) {
                  const currentLevelIdx = LEVEL_ORDER.indexOf(unit.cecr_level)
                  const nextLevel = LEVEL_ORDER[currentLevelIdx + 1]
                  navigate(nextLevel ? `/level/${nextLevel}` : '/dashboard')
                } else {
                  navigate(`/level/${unit.cecr_level}`)
                }
              }}
            >
              {isCheckpoint
                ? (() => {
                    const nextLevel = LEVEL_ORDER[LEVEL_ORDER.indexOf(unit.cecr_level) + 1]
                    return nextLevel ? `Continuer vers ${nextLevel}` : 'Retour au tableau de bord'
                  })()
                : `Retour au niveau ${unit.cecr_level}`}
            </button>
          </>
        )}
      </div>
    </div>
  )
}

export default Lesson

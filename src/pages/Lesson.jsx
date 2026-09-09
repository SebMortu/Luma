import { useEffect, useState, useRef } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import Confetti from '../components/Confetti.jsx'
import ReportButton from '../components/ReportButton.jsx'
import { estimateMinutesRemaining } from '../lib/level.js'
import { recordLessonCompletion } from '../lib/progress.js'
import { getMascot } from '../lib/characters.js'
import CharacterAvatar from '../components/CharacterAvatar.jsx'
import VocabIcon from '../components/VocabIcon.jsx'
import { useAuth } from '../contexts/AuthContext.jsx'
import ExerciseQCM from '../components/exercises/ExerciseQCM.jsx'
import ExerciseFillBlank from '../components/exercises/ExerciseFillBlank.jsx'
import ExerciseTrueFalse from '../components/exercises/ExerciseTrueFalse.jsx'
import ExerciseMatching from '../components/exercises/ExerciseMatching.jsx'
import ExerciseReorder from '../components/exercises/ExerciseReorder.jsx'
import ExerciseDictation from '../components/exercises/ExerciseDictation.jsx'
import ExerciseSpeakingPractice from '../components/exercises/ExerciseSpeakingPractice.jsx'

const EXERCISE_COMPONENTS = {
  qcm: ExerciseQCM,
  fill_blank: ExerciseFillBlank,
  true_false: ExerciseTrueFalse,
  matching: ExerciseMatching,
  reorder: ExerciseReorder,
  dictation: ExerciseDictation,
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
                <td><VocabIcon value={row.negative} alt={row.subject} /></td>
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
  const [themeProgress, setThemeProgress] = useState(null)
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

        const { data: unitLessons } = await supabase.from('lessons').select('id').eq('unit_id', unit.id)
        const { data: unitProgress } = await supabase
          .from('user_progress').select('lesson_id, status')
          .eq('user_id', user.id).eq('status', 'completed')
          .in('lesson_id', (unitLessons || []).map((l) => l.id))
        setThemeProgress({ done: unitProgress?.length || 0, total: unitLessons?.length || 0 })
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

  const score = exercises.length > 0 ? correctCount / exercises.length : 0
  const scoreMet80 = xpGained !== null && score >= 0.8
  const themePct = themeProgress && themeProgress.total > 0 ? Math.round((themeProgress.done / themeProgress.total) * 100) : 0
  const streakMsg = newStreak >= 2 ? `${newStreak}ᵉ jour d'affilée, ça devient une habitude !` : 'Bien joué, continue comme ça !'

  return (
    <div className="page ex2-finish-page">
      {scoreMet80 && !alreadyCompleted && <Confetti />}
      {xpGained === null ? (
        <p style={{ color: '#fff', textAlign: 'center', marginTop: '2rem' }}>Enregistrement...</p>
      ) : (
        <>
          <div className="ex2-finish-hero">
            <p className="ex2-finish-eyebrow">Leçon terminée</p>
            <div className="ex2-finish-xp-badge">+{xpGained}</div>
            <p className="ex2-finish-xp-label">XP gagnés</p>
            <p className="ex2-finish-lesson">{lesson.title} · {correctCount} bonne{correctCount > 1 ? 's' : ''} réponse{correctCount > 1 ? 's' : ''} sur {exercises.length}</p>

            <div className="ex2-finish-mascot-row">
              {mascot ? (
                <CharacterAvatar character={mascot} state={scoreMet80 ? 'celebrating' : 'neutral'} size={52} />
              ) : (
                <span className="ex2-finish-mascot-fallback">🦊</span>
              )}
              <span className="ex2-finish-mascot-text">
                {alreadyCompleted ? 'Révision enregistrée, continue de pratiquer !' : streakMsg}
              </span>
            </div>
          </div>

          <div className="ex2-finish-sheet">
            {freezeUsed && <p className="streak-freeze-message">🧊 Tu avais manqué un jour, mais un gel de série a protégé ta série automatiquement !</p>}
            {freezeGained && <p className="streak-freeze-message">🎉 Nouveau gel de série gagné (7 jours d'affilée) !</p>}

            <div className="ex2-finish-stat-row">
              <div className="ex2-finish-stat coral">
                <div style={{ fontSize: '19px' }}>🔥</div>
                <div className="ex2-finish-stat-value">{newStreak} jour{newStreak > 1 ? 's' : ''}</div>
                <div className="ex2-finish-stat-label">Série {alreadyCompleted ? '' : '· +1 aujourd\'hui'}</div>
              </div>
              <div className="ex2-finish-stat lime">
                <div style={{ fontSize: '19px' }}>🎯</div>
                <div className="ex2-finish-stat-value">{goalInfo?.xpToday ?? 0} / {goalInfo?.threshold ?? 0}</div>
                <div className="ex2-finish-stat-label">{goalInfo?.goalMetNow ? 'Objectif atteint' : 'Objectif du jour'}</div>
              </div>
            </div>

            {themeProgress && themeProgress.total > 0 && (
              <div className="ex2-finish-theme-card">
                <div className="ex2-finish-theme-row">
                  <span>{unit.title}</span>
                  <span>{themeProgress.done} / {themeProgress.total}</span>
                </div>
                <div className="d2-stat-track" style={{ marginTop: '9px', background: '#EDF1F7' }}>
                  <div style={{ height: '100%', width: `${themePct}%`, background: 'linear-gradient(90deg,#A3E635,#3B82F6)', borderRadius: '5px' }} />
                </div>
              </div>
            )}

            <button className="d2-cta" onClick={() => navigate(`/level/${unit.cecr_level}`)}>Leçon suivante</button>
            <button className="ex2-finish-back" onClick={() => navigate(`/level/${unit.cecr_level}`)}>Revenir au parcours</button>
          </div>
        </>
      )}
    </div>
  )
}

export default Lesson

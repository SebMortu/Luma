import { useEffect, useState } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { estimateMinutesRemaining } from '../lib/level.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import { awardProgress } from '../lib/progress.js'
import { EXERCISE_COMPONENTS, filterRenderableExercises, isTestableExercise } from '../components/exercises/registry.js'
import { filterModernPathUnits, isCheckpointUnit } from '../lib/pathUnits.js'

const LEVEL_ORDER = ['A0', 'A1', 'A2', 'B1', 'B2', 'C1']
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
  // 'unlocked' | 'already' | 'error' — résultat de l'écriture du déblocage
  const [unlockStatus, setUnlockStatus] = useState(null)

  useEffect(() => {
    async function load() {
      const { data: settings } = await supabase.from('user_settings').select('active_language_id').eq('user_id', user.id).single()
      setLanguageId(settings.active_language_id)

      const { data: allUnitsData } = await supabase
        .from('units').select('*').eq('language_id', settings.active_language_id).eq('cecr_level', fromLevel).order('position')
      // Parcours moderne uniquement : pas de questions legacy (Fondations),
      // et pas de leçons legacy marquées « terminées » en cas de réussite.
      // Banque de questions = unités STANDARD du niveau. Le Checkpoint n'est
      // pas une banque ordinaire : ses exercices servent à son diagnostic.
      const unitsData = filterModernPathUnits(allUnitsData).filter((u) => !isCheckpointUnit(u))
      setUnits(unitsData)

      const unitIds = unitsData.map((u) => u.id)
      if (unitIds.length === 0) { setLoading(false); return }

      const { data: lessonsData } = await supabase.from('lessons').select('*').in('unit_id', unitIds)
      setLessons(lessonsData || [])

      const picked = []
      for (const lesson of lessonsData || []) {
        const { data: exercises } = await supabase.from('exercises').select('*').eq('lesson_id', lesson.id).neq('type', 'speaking_practice').order('position')
        const testable = filterRenderableExercises(exercises, `test de passage, leçon ${lesson.id}`).filter(isTestableExercise)
        if (testable.length > 0) {
          picked.push(...shuffle(testable).slice(0, QUESTIONS_PER_LESSON))
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

  // XP de déblocage : 2 par bonne réponse, versés UNIQUEMENT lors du premier
  // déblocage réel du niveau (anti-farming). Réussite sans nouveau niveau
  // débloqué (rejeu, utilisateur déjà plus haut) = 0 XP.
  const XP_PER_CORRECT_ON_UNLOCK = 2

  // Réussite = DÉBLOCAGE du niveau supérieur, pas complétion des leçons :
  // user_progress n'est jamais modifié (leçons et Checkpoint restent non faits,
  // aucun diagnostic simulé). unlocked_level n'est jamais abaissé.
  const saveUnlock = async () => {
    setSaving(true)
    try {
      const { data: current, error: readErr } = await supabase
        .from('user_settings').select('unlocked_level').eq('user_id', user.id).maybeSingle()
      if (readErr) throw readErr
      const currentIdx = current?.unlocked_level ? LEVEL_ORDER.indexOf(current.unlocked_level) : -1
      const didUnlock = LEVEL_ORDER.indexOf(nextLevel) > currentIdx

      if (!didUnlock) {
        setUnlockStatus('already')
        setXpGained(0)
        return
      }

      const { error: updateErr } = await supabase
        .from('user_settings').update({ unlocked_level: nextLevel }).eq('user_id', user.id)
      if (updateErr) throw updateErr
      setUnlockStatus('unlocked')

      // XP seulement APRÈS l'écriture réussie du déblocage.
      try {
        const result = await awardProgress(user.id, { xpGained: correctCount * XP_PER_CORRECT_ON_UNLOCK })
        setXpGained(result.xpGained)
      } catch (xpErr) {
        // Le niveau EST débloqué ; seul le versement d'XP a échoué.
        console.warn('[Luma] XP de déblocage non enregistrée', xpErr)
        setXpGained(null)
      }
    } catch (err) {
      console.warn('[Luma] Déblocage de niveau non enregistré', err)
      setUnlockStatus('error')
      setXpGained(null)
    } finally {
      setSaving(false)
    }
  }

  const finish = async () => {
    setFinished(true)
    const score = correctCount / testExercises.length
    const didPass = score >= PASS_THRESHOLD
    setPassed(didPass)
    if (didPass) await saveUnlock()
  }

  const retry = () => {
    setCurrentIndex(0)
    setResults({})
    setHasAnsweredCurrent(false)
    setFinished(false)
    setPassed(false)
    setXpGained(null)
    setUnlockStatus(null)
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
        {!saving && passed && unlockStatus === 'unlocked' && (
          <>
            <p className="feedback correct">🎉 Niveau {nextLevel} débloqué ! {xpGained !== null && `+${xpGained} XP`}</p>
            <button className="btn-primary" onClick={() => navigate('/dashboard')}>Retour au tableau de bord</button>
          </>
        )}
        {!saving && passed && unlockStatus === 'already' && (
          <>
            <p className="feedback correct">✅ Test réussi. Le niveau {nextLevel} était déjà débloqué : pas d'XP supplémentaire.</p>
            <button className="btn-primary" onClick={() => navigate('/dashboard')}>Retour au tableau de bord</button>
          </>
        )}
        {!saving && passed && unlockStatus === 'error' && (
          <>
            <p className="feedback incorrect">Erreur : le déblocage du niveau {nextLevel} n'a pas pu être enregistré. Ton test est réussi, réessaie l'enregistrement.</p>
            <button className="btn-primary" onClick={saveUnlock}>Réessayer l'enregistrement</button>
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

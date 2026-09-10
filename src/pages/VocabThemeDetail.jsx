import { useEffect, useState } from 'react'
import { useParams, useNavigate, Link } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import { awardProgress } from '../lib/progress.js'
import AppLayout from '../components/AppLayout.jsx'
import SpeakButton, { speak } from '../components/SpeakButton.jsx'
import ExerciseQCM from '../components/exercises/ExerciseQCM.jsx'
import ExerciseFillBlank from '../components/exercises/ExerciseFillBlank.jsx'
import ExerciseTrueFalse from '../components/exercises/ExerciseTrueFalse.jsx'
import ExerciseMatching from '../components/exercises/ExerciseMatching.jsx'

const EXERCISE_COMPONENTS = {
  qcm: ExerciseQCM,
  fill_blank: ExerciseFillBlank,
  true_false: ExerciseTrueFalse,
  matching: ExerciseMatching,
}

const WORD_MASTERY_TARGET = 2
async function recordWordAnswer(userId, themeSlug, wordEn, isCorrect) {
  if (!isCorrect) return // on ne fait progresser que sur bonne réponse ; pas de retour en arrière ici
  const { data: existing } = await supabase
    .from('user_vocab_word_progress').select('*').eq('user_id', userId).eq('theme_slug', themeSlug).eq('word_en', wordEn).maybeSingle()
  const newCount = (existing?.correct_count || 0) + 1
  await supabase.from('user_vocab_word_progress').upsert({
    user_id: userId, theme_slug: themeSlug, word_en: wordEn,
    correct_count: newCount, mastered: newCount >= WORD_MASTERY_TARGET, updated_at: new Date().toISOString(),
  })
}

function VocabThemeDetail() {
  const { slug, levelPosition } = useParams()
  const { user } = useAuth()
  const navigate = useNavigate()
  const [theme, setTheme] = useState(null)
  const [level, setLevel] = useState(null)
  const [exercises, setExercises] = useState([])
  const [mode, setMode] = useState('words') // 'words' | 'practice' | 'finished'
  const [currentIndex, setCurrentIndex] = useState(0)
  const [hasAnsweredCurrent, setHasAnsweredCurrent] = useState(false)
  const [results, setResults] = useState({})
  const [loading, setLoading] = useState(true)
  const [xpGained, setXpGained] = useState(null)
  const [listeningAll, setListeningAll] = useState(false)
  const [masteredWords, setMasteredWords] = useState(new Set())

  const listenToAll = async () => {
    if (listeningAll) return
    setListeningAll(true)
    for (const w of level.words) {
      await speak(w.en)
      await new Promise((r) => setTimeout(r, 700))
    }
    setListeningAll(false)
  }

  useEffect(() => {
    async function load() {
      const { data: themeData } = await supabase.from('vocab_themes').select('*').eq('slug', slug).single()
      const { data: levelData } = await supabase
        .from('vocab_theme_levels').select('*').eq('theme_id', themeData.id).eq('position', levelPosition).single()
      const { data: exData } = await supabase.from('vocab_theme_exercises').select('*').eq('level_id', levelData.id).order('position')
      const { data: wordProgress } = await supabase
        .from('user_vocab_word_progress').select('word_en').eq('user_id', user.id).eq('theme_slug', slug).eq('mastered', true)
      setTheme(themeData)
      setLevel(levelData)
      setExercises(exData || [])
      setMasteredWords(new Set((wordProgress || []).map((w) => w.word_en)))
      setLoading(false)
    }
    load()
  }, [slug, levelPosition])

  const handleAnswered = (correct) => {
    setResults((prev) => ({ ...prev, [currentIndex]: correct }))
    setHasAnsweredCurrent(true)

    // Suivi par mot : seulement pour les types où le mot testé est net.
    const ex = exercises[currentIndex]
    let testedWord = null
    if (ex.type === 'qcm') testedWord = ex.content.options?.[ex.content.correct_index]
    if (ex.type === 'fill_blank') testedWord = ex.content.correct_answers?.[0]
    if (testedWord) recordWordAnswer(user.id, slug, testedWord, correct)
  }

  const goToNext = async () => {
    if (currentIndex + 1 >= exercises.length) {
      const correctCount = Object.values(results).filter(Boolean).length
      const xp = correctCount * 5
      setXpGained(xp)
      try {
        await awardProgress(user.id, { xpGained: xp })
        await supabase.from('user_vocab_level_practice').upsert({ user_id: user.id, level_id: level.id })
      } catch (err) { /* silencieux */ }
      setMode('finished')
    } else {
      setCurrentIndex((i) => i + 1)
      setHasAnsweredCurrent(false)
    }
  }

  if (loading) return <AppLayout><div className="page"><p>Chargement...</p></div></AppLayout>

  const backToLevels = `/vocab-themes/${slug}`

  if (mode === 'words') {
    return (
      <AppLayout>
        <div className="page vt2-page" style={{ paddingBottom: exercises.length > 0 ? '90px' : undefined }}>
          <div className="vt2-words-head">
            <Link to={backToLevels} className="sc2-back">← {theme.title}</Link>
            <span className="vt2-listen-all" onClick={listenToAll}>{listeningAll ? '🔊 En cours...' : '🔊 Tout écouter'}</span>
          </div>
          <div className="vt2-words-title-row">
            <div>
              <div className="vt2-words-title">{theme.icon} {level.title}</div>
              <div className="vt2-words-sub">{level.words.length} mots à découvrir, plusieurs niveaux CECRL mélangés.</div>
            </div>
          </div>

          <div className="vt2-word-list">
            {level.words.map((w, i) => (
              <div key={i} className="vt2-word-row">
                <span className={`vt2-word-dot ${masteredWords.has(w.en) ? 'mastered' : ''}`} />
                <div style={{ flex: 1, minWidth: 0 }}>
                  <div className="vt2-word-en">{w.en}</div>
                  <div className="vt2-word-fr">{w.fr}</div>
                </div>
                <span className="vt2-word-level">{w.level}</span>
                <SpeakButton text={w.en} size="small" />
              </div>
            ))}
          </div>

          {exercises.length > 0 && (
            <div className="vt2-sticky-cta">
              <button className="d2-cta" onClick={() => setMode('practice')}>
                S'entraîner sur ce niveau <span className="vt2-sticky-cta-badge">{level.words.length} mots</span>
              </button>
            </div>
          )}
        </div>
      </AppLayout>
    )
  }

  if (mode === 'finished') {
    const correctCount = Object.values(results).filter(Boolean).length
    return (
      <AppLayout>
        <div className="page">
          <h1>{theme.icon} {level.title}</h1>
          <div className="lesson-summary">
            <p>Score : {correctCount} / {exercises.length}</p>
            <p className="feedback correct">+{xpGained} XP</p>
            <button className="btn-primary" onClick={async () => {
              const { data: wordProgress } = await supabase
                .from('user_vocab_word_progress').select('word_en').eq('user_id', user.id).eq('theme_slug', slug).eq('mastered', true)
              setMasteredWords(new Set((wordProgress || []).map((w) => w.word_en)))
              setMode('words')
            }}>Revoir les mots</button>
            <button className="btn-secondary" style={{ marginTop: '0.5rem' }} onClick={() => navigate(backToLevels)}>Autres niveaux</button>
          </div>
        </div>
      </AppLayout>
    )
  }

  // mode === 'practice'
  const ex = exercises[currentIndex]
  const Component = EXERCISE_COMPONENTS[ex.type]
  const progressPct = Math.round(((currentIndex + (hasAnsweredCurrent ? 1 : 0)) / exercises.length) * 100)

  return (
    <AppLayout>
      <div className="page">
        <div className="lesson-progress-top">
          <button className="lesson-back-icon" onClick={() => setMode('words')} aria-label="Quitter">←</button>
          <div className="progress-bar-track" style={{ flex: 1 }}>
            <div className="progress-bar-fill" style={{ width: `${progressPct}%` }} />
          </div>
        </div>
        <p className="dashboard-goal">{currentIndex + 1} / {exercises.length}</p>

        {Component ? (
          <Component key={ex.id} content={ex.content} onAnswered={handleAnswered} />
        ) : (
          <p>Type d'exercice inconnu : {ex.type}</p>
        )}

        {hasAnsweredCurrent && (
          <button className="btn-primary" onClick={goToNext}>
            {currentIndex + 1 >= exercises.length ? 'Terminer' : 'Suivant'}
          </button>
        )}
      </div>
    </AppLayout>
  )
}

export default VocabThemeDetail

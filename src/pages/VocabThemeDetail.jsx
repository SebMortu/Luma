import { useEffect, useState } from 'react'
import { useParams, useNavigate, Link } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import { awardProgress } from '../lib/progress.js'
import AppLayout from '../components/AppLayout.jsx'
import SpeakButton from '../components/SpeakButton.jsx'
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

  useEffect(() => {
    async function load() {
      const { data: themeData } = await supabase.from('vocab_themes').select('*').eq('slug', slug).single()
      const { data: levelData } = await supabase
        .from('vocab_theme_levels').select('*').eq('theme_id', themeData.id).eq('position', levelPosition).single()
      const { data: exData } = await supabase.from('vocab_theme_exercises').select('*').eq('level_id', levelData.id).order('position')
      setTheme(themeData)
      setLevel(levelData)
      setExercises(exData || [])
      setLoading(false)
    }
    load()
  }, [slug, levelPosition])

  const handleAnswered = (correct) => {
    setResults((prev) => ({ ...prev, [currentIndex]: correct }))
    setHasAnsweredCurrent(true)
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
        <div className="page">
          <Link to={backToLevels} className="back-link">← {theme.title}</Link>
          <h1>{theme.icon} {level.title}</h1>
          <p className="dashboard-goal">{level.words.length} mots à découvrir, plusieurs niveaux CECRL mélangés.</p>

          <div className="vocab-theme-word-list">
            {level.words.map((w, i) => (
              <div key={i} className="vocab-theme-word-row">
                <div>
                  <p className="vocab-theme-word-en">{w.en}</p>
                  <p className="vocab-theme-word-fr">{w.fr}</p>
                </div>
                <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                  <span className="badge">{w.level}</span>
                  <SpeakButton text={w.en} size="small" />
                </div>
              </div>
            ))}
          </div>

          {exercises.length > 0 && (
            <button className="btn-primary" onClick={() => setMode('practice')}>✏️ S'entraîner sur ce niveau</button>
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
            <button className="btn-primary" onClick={() => setMode('words')}>Revoir les mots</button>
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

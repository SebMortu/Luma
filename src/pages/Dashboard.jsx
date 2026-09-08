import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { getNextLesson, computeUnitStates, dailyXpThreshold, countDueVocab } from '../lib/progress.js'
import { computeLevel } from '../lib/level.js'
import { getGuideCharacter, guideDashboardMessage } from '../lib/characters.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import AppLayout from '../components/AppLayout.jsx'
import CharacterAvatar from '../components/CharacterAvatar.jsx'
import DailyReviewPrompt from '../components/DailyReviewPrompt.jsx'
import DailyReviewPopup from '../components/DailyReviewPopup.jsx'

const DAY_LABELS = ['L', 'M', 'M', 'J', 'V', 'S', 'D']
const CECR_TITLES = {
  A0: 'Fondations · Premiers pas',
  A1: 'A1 · Débutant complet',
  A2: 'A2 · Élémentaire',
  B1: 'B1 · Intermédiaire',
  B2: 'B2 · Intermédiaire avancé',
  C1: 'C1 · Avancé',
}
// Dégradés distincts par niveau CECR, pour les cartes du parcours horizontal
const LEVEL_GRADIENTS = {
  A0: 'linear-gradient(150deg,#DCEFFB,#C3E4FA)',
  A1: 'linear-gradient(150deg,#E4F3D2,#D3ECAE)',
  A2: 'linear-gradient(150deg,#FFE9D6,#FFD9B8)',
  B1: 'linear-gradient(150deg,#FDE2E0,#FCC9C4)',
  B2: 'linear-gradient(150deg,#E7E1FB,#D3C7F7)',
  C1: 'linear-gradient(150deg,#1E2A4A,#334370)',
}
const LEVEL_FG = { A0:'#1E4A72', A1:'#3E5410', A2:'#8A4A12', B1:'#8A2E24', B2:'#4B2E8A', C1:'#FFFFFF' }
const LEVEL_SUB = { A0:'#4E7DA3', A1:'#6F8A3C', A2:'#B3702E', B1:'#B3574C', B2:'#7A63B3', C1:'#9FB0D8' }
const LEVEL_EMOJI = { A0:'🌱', A1:'📘', A2:'📗', B1:'📙', B2:'📕', C1:'🏆' }

function Dashboard() {
  const { user } = useAuth()
  const navigate = useNavigate()
  const [settings, setSettings] = useState(null)
  const [unitStates, setUnitStates] = useState([])
  const [nextLesson, setNextLesson] = useState(null)
  const [dueVocabCount, setDueVocabCount] = useState(0)
  const [guideCharacter, setGuideCharacter] = useState(null)
  const [activeDays, setActiveDays] = useState(new Set())

  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)

  useEffect(() => {
    async function load() {
      try {
        const { data: settingsData, error: settingsErr } = await supabase
          .from('user_settings').select('*').eq('user_id', user.id).single()
        if (settingsErr) throw settingsErr
        setSettings(settingsData)

        const { data: unitsData, error: unitsErr } = await supabase
          .from('units').select('*')
          .eq('language_id', settingsData.active_language_id)
          .order('position')
        if (unitsErr) throw unitsErr

        const states = await computeUnitStates(user.id, settingsData.active_language_id, unitsData, settingsData.unlocked_level)
        setUnitStates(states)

        const next = await getNextLesson(user.id, settingsData.active_language_id)
        setNextLesson(next)

        const dueCount = await countDueVocab(user.id)
        setDueVocabCount(dueCount)

        const guide = await getGuideCharacter(user.id)
        setGuideCharacter(guide)

        const mondayThisWeek = new Date()
        mondayThisWeek.setDate(mondayThisWeek.getDate() - ((mondayThisWeek.getDay() + 6) % 7))
        const mondayStr = mondayThisWeek.toISOString().slice(0, 10)
        const { data: activityRows } = await supabase
          .from('user_daily_activity').select('activity_date')
          .eq('user_id', user.id).gte('activity_date', mondayStr)
        setActiveDays(new Set((activityRows || []).map((r) => r.activity_date)))
      } catch (err) {
        setError(err.message)
      } finally {
        setLoading(false)
      }
    }
    load()
  }, [user.id])

  if (loading) return <AppLayout><div className="page"><p>Chargement...</p></div></AppLayout>
  if (error) return <AppLayout><div className="page"><p className="feedback incorrect">Erreur : {error}</p></div></AppLayout>

  const totalLessons = unitStates.reduce((sum, s) => sum + s.lessonCount, 0)
  const totalCompleted = unitStates.reduce((sum, s) => sum + s.completedCount, 0)
  const todayIndex = (new Date().getDay() + 6) % 7
  const mondayThisWeekStr = (() => {
    const d = new Date()
    d.setDate(d.getDate() - todayIndex)
    return d.toISOString().slice(0, 10)
  })()
  const todayStr = new Date().toISOString().slice(0, 10)
  const todayXp = settings.xp_today_date === todayStr ? settings.xp_gained_today : 0
  const goalThreshold = dailyXpThreshold(settings.daily_goal_minutes)
  const goalPct = Math.min(100, Math.round((todayXp / goalThreshold) * 100))
  const level = computeLevel(settings.total_xp)
  const displayName = user.email.split('@')[0]
  const initial = displayName.charAt(0).toUpperCase()

  const groupedByLevel = []
  unitStates.forEach((s) => {
    let group = groupedByLevel.find((g) => g.level === s.unit.cecr_level)
    if (!group) {
      group = { level: s.unit.cecr_level, units: [] }
      groupedByLevel.push(group)
    }
    group.units.push(s)
  })
  const levelSummaries = groupedByLevel.map((group) => {
    const totalInLevel = group.units.reduce((s, u) => s + u.lessonCount, 0)
    const completedInLevel = group.units.reduce((s, u) => s + u.completedCount, 0)
    const levelLocked = group.units[0]?.isLocked
    const levelPct = totalInLevel > 0 ? Math.round((completedInLevel / totalInLevel) * 100) : 0
    return { ...group, totalInLevel, completedInLevel, levelLocked, levelPct }
  })
  // Le niveau CECR "en cours" : premier débloqué, non terminé
  const currentLevelSummary = levelSummaries.find((l) => !l.levelLocked && l.levelPct < 100) || levelSummaries[0]

  const guideMsg = guideCharacter && guideDashboardMessage({
    goalMetToday: todayXp >= goalThreshold,
    currentStreak: settings.current_streak,
    hasNextLesson: !!nextLesson,
  })

  return (
    <AppLayout>
      <div className="page d2-page">
        <DailyReviewPopup dueVocabCount={dueVocabCount} />

        <div className="d2-topbar">
          <div className="d2-identity">
            <div className="d2-avatar">{initial}</div>
            <div>
              <p className="d2-greeting">Salut {displayName} 👋</p>
              <p className="d2-sub">Niveau {level} · {settings.total_xp} XP</p>
            </div>
          </div>
          <div className="d2-streak-pill">
            <span>🔥</span><span>{settings.current_streak}</span>
          </div>
        </div>

        <div className="d2-hero">
          {guideCharacter && <CharacterAvatar character={guideCharacter} state={guideMsg?.state || 'waving'} size={104} className="d2-hero-mascot" />}
          {guideMsg && <div className="d2-hero-bubble">{guideMsg.text}</div>}

          <div className="d2-ring-outer" style={{ '--ring-pct': `${currentLevelSummary?.levelPct ?? 0}%` }}>
            <div className="d2-ring-inner">
              <span className="d2-ring-label">{CECR_TITLES[currentLevelSummary?.level]?.split(' · ')[0] || currentLevelSummary?.level}</span>
              <span className="d2-ring-pct">{currentLevelSummary?.levelPct ?? 0}<span>%</span></span>
              <span className="d2-ring-sub">{currentLevelSummary?.completedInLevel ?? 0} / {currentLevelSummary?.totalInLevel ?? 0} leçons</span>
            </div>
          </div>

          {nextLesson ? (
            <button className="d2-cta" onClick={() => navigate(`/lesson/${nextLesson.lesson.id}`)}>Continuer la leçon</button>
          ) : (
            <p className="dashboard-goal">Tu as terminé tout le contenu disponible. Reviens bientôt !</p>
          )}
        </div>

        <div className="d2-stat-row">
          <div className="d2-stat-card d2-stat-lime">
            <div className="d2-stat-icon">🎯</div>
            <div className="d2-stat-value">{todayXp}<span> / {goalThreshold} XP</span></div>
            <div className="d2-stat-label">Objectif du jour</div>
            <div className="d2-stat-track"><div className="d2-stat-fill" style={{ width: `${goalPct}%` }} /></div>
          </div>
          <div className="d2-stat-card d2-stat-coral">
            <div className="d2-stat-icon">🔥</div>
            <div className="d2-stat-value">{settings.current_streak} jour{settings.current_streak > 1 ? 's' : ''}</div>
            <div className="d2-stat-label">Série en cours</div>
            <div className="d2-stat-week">
              {DAY_LABELS.map((label, i) => {
                const dayDate = new Date(mondayThisWeekStr)
                dayDate.setDate(dayDate.getDate() + i)
                const dayStr = dayDate.toISOString().slice(0, 10)
                const isActive = activeDays.has(dayStr)
                return <span key={i} className={`d2-stat-bar ${isActive ? 'active' : ''}`} />
              })}
            </div>
          </div>
        </div>

        {dueVocabCount > 0 && <DailyReviewPrompt />}

        <div className="dashboard-friends-shortcut" onClick={() => navigate('/friends')}>
          <span>👥 Amis & classement de la semaine</span>
          <span>→</span>
        </div>

        <div className="d2-section">
          <div className="d2-section-head">
            <span className="d2-section-title">Ton parcours</span>
            <span className="d2-section-sub">{totalCompleted} / {totalLessons} leçons</span>
          </div>
          <div className="d2-level-scroll">
            {levelSummaries.map((l) => (
              <div
                key={l.level}
                className={`d2-level-card ${l.levelLocked ? 'locked' : ''}`}
                style={{ background: LEVEL_GRADIENTS[l.level] || LEVEL_GRADIENTS.A0 }}
                onClick={() => !l.levelLocked && navigate(`/level/${l.level}`)}
              >
                <div className="d2-level-code" style={{ color: LEVEL_FG[l.level] }}>{l.level}</div>
                <div>
                  <div className="d2-level-emoji">{l.levelLocked ? '🔒' : LEVEL_EMOJI[l.level]}</div>
                  <div className="d2-level-name" style={{ color: LEVEL_FG[l.level] }}>{CECR_TITLES[l.level]?.split(' · ')[1] || CECR_TITLES[l.level] || l.level}</div>
                  <div className="d2-level-right" style={{ color: LEVEL_SUB[l.level] }}>
                    {l.levelLocked ? 'Verrouillé' : `${l.completedInLevel}/${l.totalInLevel} · ${l.levelPct}%`}
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>

        <div className="d2-section">
          <p className="d2-section-title" style={{ marginBottom: '10px' }}>Réviser en 2 minutes</p>
          <div className="d2-quickrow">
            <div className="d2-quickcard" onClick={() => navigate('/vocab-themes')}>
              <div className="d2-quickicon">📗</div><div className="d2-quicklabel">Vocabulaire</div>
            </div>
            <div className="d2-quickcard" onClick={() => navigate('/grammar')}>
              <div className="d2-quickicon">📖</div><div className="d2-quicklabel">Grammaire</div>
            </div>
            <div className="d2-quickcard" onClick={() => navigate('/verbs')}>
              <div className="d2-quickicon">🔤</div><div className="d2-quicklabel">Verbes</div>
            </div>
          </div>
        </div>

        {dueVocabCount > 0 && (
          <button className="btn-secondary" style={{ marginTop: '0.75rem' }} onClick={() => navigate('/vocab-review')}>
            🗂️ {dueVocabCount} mot{dueVocabCount > 1 ? 's' : ''} à réviser aujourd'hui
          </button>
        )}
      </div>
    </AppLayout>
  )
}

export default Dashboard

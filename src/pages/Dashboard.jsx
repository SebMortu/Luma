import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { getNextLesson, computeUnitStates, dailyXpThreshold, countDueVocab } from '../lib/progress.js'
import { computeLevel } from '../lib/level.js'
import { getGuideCharacter, guideDashboardMessage } from '../lib/characters.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import AppLayout from '../components/AppLayout.jsx'
import RingProgress from '../components/RingProgress.jsx'
import CharacterAvatar from '../components/CharacterAvatar.jsx'
import DailyReviewPrompt from '../components/DailyReviewPrompt.jsx'

const DAY_LABELS = ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim']
const CECR_TITLES = {
  A0: 'Fondations · Premiers pas',
  A1: 'A1 · Débutant complet',
  A2: 'A2 · Élémentaire',
  B1: 'B1 · Intermédiaire',
  B2: 'B2 · Intermédiaire avancé',
  C1: 'C1 · Avancé',
}

function Dashboard() {
  const { user } = useAuth()
  const navigate = useNavigate()
  const [settings, setSettings] = useState(null)
  const [unitStates, setUnitStates] = useState([])
  const [nextLesson, setNextLesson] = useState(null)
  const [dueVocabCount, setDueVocabCount] = useState(0)
  const [guideCharacter, setGuideCharacter] = useState(null)
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
  const progressPct = totalLessons > 0 ? Math.round((totalCompleted / totalLessons) * 100) : 0
  const todayIndex = (new Date().getDay() + 6) % 7
  const todayStr = new Date().toISOString().slice(0, 10)
  const todayXp = settings.xp_today_date === todayStr ? settings.xp_gained_today : 0
  const goalThreshold = dailyXpThreshold(settings.daily_goal_minutes)
  const level = computeLevel(settings.total_xp)
  const displayName = user.email.split('@')[0]
  const initial = displayName.charAt(0).toUpperCase()

  // Regrouper les unités par niveau CECR, dans l'ordre
  const groupedByLevel = []
  unitStates.forEach((s) => {
    let group = groupedByLevel.find((g) => g.level === s.unit.cecr_level)
    if (!group) {
      group = { level: s.unit.cecr_level, units: [] }
      groupedByLevel.push(group)
    }
    group.units.push(s)
  })

  return (
    <AppLayout>
      <div className="page">
        <div className="dashboard-header">
          <div className="dashboard-identity">
            <div className="avatar">{initial}</div>
            <div>
              <p className="dashboard-name">{displayName}</p>
              <p className="dashboard-level">Niveau {level}</p>
            </div>
          </div>
          <div className="dashboard-badges">
            <span className="badge badge-streak">🔥 {settings.current_streak}</span>
            <span className="badge badge-xp">⭐ {settings.total_xp}</span>
          </div>
        </div>

        {guideCharacter && (() => {
          const goalThreshold = dailyXpThreshold(settings.daily_goal_minutes)
          const msg = guideDashboardMessage({
            goalMetToday: todayXp >= goalThreshold,
            currentStreak: settings.current_streak,
            hasNextLesson: !!nextLesson,
          })
          return (
            <div className="guide-card">
              <CharacterAvatar character={guideCharacter} state={msg.state} size={56} />
              <p className="guide-card-message">{msg.text}</p>
            </div>
          )
        })()}

        <DailyReviewPrompt />

        <div className="streak-card">
          <p className="streak-card-title">Série actuelle 🔥</p>
          <p className="streak-card-value">{settings.current_streak} jour{settings.current_streak > 1 ? 's' : ''}</p>
          {settings.streak_freezes > 0 && (
            <p className="streak-freeze-count">
              🧊 {settings.streak_freezes} gel{settings.streak_freezes > 1 ? 's' : ''} de série disponible{settings.streak_freezes > 1 ? 's' : ''}
            </p>
          )}
          <div className="streak-week">
            {DAY_LABELS.map((label, i) => (
              <div key={label} className="streak-day">
                <div className={`streak-day-dot ${i <= todayIndex && i >= todayIndex - (settings.current_streak - 1) ? 'active' : ''}`}>
                  {i <= todayIndex && i >= todayIndex - (settings.current_streak - 1) ? '✓' : ''}
                </div>
                <span className="streak-day-label">{label}</span>
              </div>
            ))}
          </div>
          <div className="goal-progress-mini">
            <div className="progress-bar-track">
              <div className="progress-bar-fill" style={{ width: `${Math.min(100, Math.round((todayXp / goalThreshold) * 100))}%` }} />
            </div>
            <p className="progress-card-sub">
              {todayXp >= goalThreshold
                ? `Objectif du jour atteint ✅ (${todayXp}/${goalThreshold} XP)`
                : `Objectif du jour : ${todayXp}/${goalThreshold} XP`}
            </p>
          </div>
        </div>

        <div className="dashboard-friends-shortcut" onClick={() => navigate('/friends')}>
          <span>👥 Amis & classement de la semaine</span>
          <span>→</span>
        </div>

        <div className="progress-card">
          <p className="progress-card-title">Ta progression</p>
          <div className="progress-bar-track">
            <div className="progress-bar-fill" style={{ width: `${progressPct}%` }} />
          </div>
          <p className="progress-card-sub">{totalCompleted} / {totalLessons} leçons · {progressPct}%</p>
        </div>

        <p className="dashboard-section-title">Ton parcours</p>
        <div className="level-list">
          {groupedByLevel.map((group) => {
            const totalInLevel = group.units.reduce((s, u) => s + u.lessonCount, 0)
            const completedInLevel = group.units.reduce((s, u) => s + u.completedCount, 0)
            const levelLocked = group.units[0]?.isLocked
            const levelPct = totalInLevel > 0 ? Math.round((completedInLevel / totalInLevel) * 100) : 0
            return (
              <div
                key={group.level}
                className={`level-card ring-style ${levelLocked ? 'locked' : 'clickable'}`}
                onClick={() => !levelLocked && navigate(`/level/${group.level}`)}
              >
                {!levelLocked && totalInLevel > 0 && (
                  <RingProgress percent={levelPct} size={48} stroke={4} />
                )}
                {(levelLocked || totalInLevel === 0) && (
                  <div className="ring-placeholder">{levelLocked ? '🔒' : '—'}</div>
                )}
                <div>
                  <p className="level-card-title">{CECR_TITLES[group.level] || group.level}</p>
                  {!levelLocked && totalInLevel > 0 && (
                    <p className="progress-card-sub">{completedInLevel} / {totalInLevel} leçons · {levelPct}%</p>
                  )}
                  {!levelLocked && totalInLevel === 0 && (
                    <p className="progress-card-sub">Pas encore de contenu</p>
                  )}
                  {levelLocked && <p className="progress-card-sub">Verrouillé</p>}
                </div>
              </div>
            )
          })}
        </div>

        {nextLesson ? (
          <button className="btn-primary" onClick={() => navigate(`/lesson/${nextLesson.lesson.id}`)}>
            Continuer : {nextLesson.lesson.title} ↗
          </button>
        ) : (
          <p className="dashboard-goal">
            Tu as terminé tout le contenu disponible pour l'instant. Reviens bientôt !
          </p>
        )}

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

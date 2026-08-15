import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { getNextLesson, computeUnitStates } from '../lib/progress.js'
import { computeLevel } from '../lib/level.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import AppLayout from '../components/AppLayout.jsx'

const DAY_LABELS = ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim']
const CECR_TITLES = {
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
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)
  const [notifEnabled, setNotifEnabled] = useState(() => localStorage.getItem('luma-notifications') === 'true')

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

        const states = await computeUnitStates(user.id, settingsData.active_language_id, unitsData)
        setUnitStates(states)

        const next = await getNextLesson(user.id, settingsData.active_language_id)
        setNextLesson(next)
      } catch (err) {
        setError(err.message)
      } finally {
        setLoading(false)
      }
    }
    load()
  }, [user.id])

  const toggleNotifications = () => {
    const newValue = !notifEnabled
    setNotifEnabled(newValue)
    localStorage.setItem('luma-notifications', String(newValue))
    // Note : ceci enregistre seulement la préférence pour l'instant.
    // Les vraies notifications push seront branchées en V2.
  }

  if (loading) return <AppLayout><div className="page"><p>Chargement...</p></div></AppLayout>
  if (error) return <AppLayout><div className="page"><p className="feedback incorrect">Erreur : {error}</p></div></AppLayout>

  const statusLabels = {
    completed: 'Terminée · 80%+ validé',
    in_progress: 'En cours',
    not_started: 'À commencer',
    locked: 'Verrouillée',
  }
  const statusIcons = { completed: '✓', in_progress: '📖', not_started: '📖', locked: '🔒' }

  const totalLessons = unitStates.reduce((sum, s) => sum + s.lessonCount, 0)
  const totalCompleted = unitStates.reduce((sum, s) => sum + s.completedCount, 0)
  const progressPct = totalLessons > 0 ? Math.round((totalCompleted / totalLessons) * 100) : 0
  const todayIndex = (new Date().getDay() + 6) % 7
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
            <button className="bell-btn" onClick={toggleNotifications} title="Notifications">
              {notifEnabled ? '🔔' : '🔕'}
            </button>
          </div>
        </div>

        <div className="streak-card">
          <p className="streak-card-title">Série actuelle 🔥</p>
          <p className="streak-card-value">{settings.current_streak} jour{settings.current_streak > 1 ? 's' : ''}</p>
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
        </div>

        <div className="progress-card">
          <p className="progress-card-title">Ta progression</p>
          <div className="progress-bar-track">
            <div className="progress-bar-fill" style={{ width: `${progressPct}%` }} />
          </div>
          <p className="progress-card-sub">{totalCompleted} / {totalLessons} leçons · {progressPct}%</p>
        </div>

        {groupedByLevel.map((group) => (
          <div key={group.level}>
            <p className="cecr-level-header">{CECR_TITLES[group.level] || group.level}</p>
            <div className="unit-list">
              {group.units.map(({ unit, status, isLocked, lessonCount, completedCount }) => (
                <div
                  key={unit.id}
                  className={`unit-card ${isLocked ? 'locked' : 'clickable'}`}
                  onClick={() => !isLocked && navigate(`/unit/${unit.id}`)}
                >
                  <div className={`unit-icon ${status}`}>{statusIcons[status]}</div>
                  <div>
                    <p className="unit-title">{unit.title}</p>
                    <p className="unit-status">
                      {isLocked
                        ? "Verrouillée · termine l'unité précédente à 80%"
                        : lessonCount === 0
                          ? 'Pas encore de contenu'
                          : `${statusLabels[status]} (${completedCount}/${lessonCount})`}
                    </p>
                  </div>
                </div>
              ))}
            </div>
          </div>
        ))}

        {nextLesson ? (
          <button className="btn-primary" onClick={() => navigate(`/lesson/${nextLesson.lesson.id}`)}>
            Continuer : {nextLesson.lesson.title} ↗
          </button>
        ) : (
          <p className="dashboard-goal">
            Tu as terminé tout le contenu disponible pour l'instant. Reviens bientôt !
          </p>
        )}
      </div>
    </AppLayout>
  )
}

export default Dashboard

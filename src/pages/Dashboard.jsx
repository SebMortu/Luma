import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { getNextLesson, computeUnitStates } from '../lib/progress.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import BottomNav from '../components/BottomNav.jsx'

const DAY_LABELS = ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim']

function Dashboard() {
  const { user } = useAuth()
  const navigate = useNavigate()
  const [settings, setSettings] = useState(null)
  const [unitStates, setUnitStates] = useState([])
  const [nextLesson, setNextLesson] = useState(null)
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

  if (loading) return <div className="page"><p>Chargement...</p></div>
  if (error) return <div className="page"><p className="feedback incorrect">Erreur : {error}</p></div>

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

  // Calendrier de streak : jour actuel du monde réel (lundi = index 0)
  const todayIndex = (new Date().getDay() + 6) % 7

  return (
    <>
      <div className="page">
        <div className="dashboard-header">
          <div>
            <p className="dashboard-greeting">Bonjour</p>
            <p className="dashboard-email">{user.email.split('@')[0]}</p>
          </div>
          <div className="dashboard-badges">
            <span className="badge badge-streak">🔥 {settings.current_streak}</span>
            <span className="badge badge-xp">⭐ {settings.total_xp}</span>
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

        <p className="dashboard-section-title">Ton parcours</p>
        <div className="unit-list">
          {unitStates.map(({ unit, status, isLocked, lessonCount, completedCount }) => (
            <div
              key={unit.id}
              className={`unit-card ${isLocked ? 'locked' : 'clickable'}`}
              onClick={() => !isLocked && navigate(`/unit/${unit.id}`)}
            >
              <div className={`unit-icon ${status}`}>{statusIcons[status]}</div>
              <div>
                <p className="unit-title">Unité {unit.position} · {unit.title}</p>
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
      <BottomNav />
    </>
  )
}

export default Dashboard

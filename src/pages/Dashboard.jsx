import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { getNextLesson, computeUnitStates } from '../lib/progress.js'
import { useAuth } from '../contexts/AuthContext.jsx'

function Dashboard() {
  const { user, signOut } = useAuth()
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

  const statusIcons = {
    completed: '✓',
    in_progress: '📖',
    not_started: '📖',
    locked: '🔒',
  }

  return (
    <div className="page">
      <div className="dashboard-header">
        <div>
          <p className="dashboard-greeting">Bonjour</p>
          <p className="dashboard-email">{user.email}</p>
        </div>
        <div className="dashboard-badges">
          <span className="badge badge-streak">🔥 {settings.current_streak}</span>
          <span className="badge badge-xp">⭐ {settings.total_xp}</span>
        </div>
      </div>

      <div className="dashboard-goal">
        <p>Objectif quotidien : {settings.daily_goal_minutes} min</p>
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
                  ? 'Verrouillée · termine l\'unité précédente à 80% pour débloquer'
                  : lessonCount === 0
                    ? 'Pas encore de contenu'
                    : `${statusLabels[status]} (${completedCount}/${lessonCount} leçons)`}
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
          Tu as terminé tout le contenu disponible pour l'instant. Reviens bientôt, on en ajoute régulièrement !
        </p>
      )}

      <button className="dashboard-signout" onClick={signOut}>Se déconnecter</button>
    </div>
  )
}

export default Dashboard

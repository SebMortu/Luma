import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'

function Dashboard() {
  const { user, signOut } = useAuth()
  const navigate = useNavigate()
  const [settings, setSettings] = useState(null)
  const [units, setUnits] = useState([])
  const [progressByUnit, setProgressByUnit] = useState({})
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
        setUnits(unitsData)

        const { data: progressData, error: progressErr } = await supabase
          .from('user_progress').select('*')
          .eq('user_id', user.id)
          .eq('language_id', settingsData.active_language_id)
        if (progressErr) throw progressErr

        const map = {}
        progressData.forEach((p) => { map[p.unit_id] = p.status })
        setProgressByUnit(map)
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
        {units.map((unit, index) => {
          const status = progressByUnit[unit.id] || (index === 0 ? 'in_progress' : 'not_started')
          const isLocked = status === 'not_started' && index !== 0
          return (
            <div key={unit.id} className={`unit-card ${isLocked ? 'locked' : ''}`}>
              <div className={`unit-icon ${status}`}>
                {status === 'completed' ? '✓' : isLocked ? '🔒' : '📖'}
              </div>
              <div>
                <p className="unit-title">Unité {unit.position} · {unit.title}</p>
                <p className="unit-status">
                  {status === 'completed' ? 'Terminée' : isLocked ? 'Verrouillée' : 'En cours'}
                </p>
              </div>
            </div>
          )
        })}
      </div>

      <button className="btn-primary" onClick={() => navigate('/lesson-demo')}>
        Continuer la leçon ↗
      </button>

      <button className="dashboard-signout" onClick={signOut}>Se déconnecter</button>
    </div>
  )
}

export default Dashboard

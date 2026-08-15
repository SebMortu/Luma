import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { computeLevel, xpForNextLevel, formatDuration } from '../lib/level.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import AppLayout from '../components/AppLayout.jsx'

const DAY_LABELS = ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim']

function Profile() {
  const { user } = useAuth()
  const [settings, setSettings] = useState(null)
  const [completedCount, setCompletedCount] = useState(0)
  const [avgScore, setAvgScore] = useState(0)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      const { data: settingsData } = await supabase
        .from('user_settings').select('*').eq('user_id', user.id).single()
      setSettings(settingsData)

      const { data: progress } = await supabase
        .from('user_progress').select('best_score').eq('user_id', user.id).eq('status', 'completed')

      setCompletedCount(progress?.length || 0)
      if (progress && progress.length > 0) {
        const avg = progress.reduce((sum, p) => sum + (p.best_score || 0), 0) / progress.length
        setAvgScore(Math.round(avg * 100))
      }
      setLoading(false)
    }
    load()
  }, [user.id])

  if (loading || !settings) return <AppLayout><div className="page"><p>Chargement...</p></div></AppLayout>

  const { xpIntoLevel, xpNeeded, currentLevel } = xpForNextLevel(settings.total_xp)
  const levelPct = Math.round((xpIntoLevel / xpNeeded) * 100)
  const todayIndex = (new Date().getDay() + 6) % 7
  const displayName = user.email.split('@')[0]
  const initial = displayName.charAt(0).toUpperCase()

  return (
    <AppLayout>
      <div className="page">
        <div className="dashboard-header">
          <div className="dashboard-identity">
            <div className="avatar">{initial}</div>
            <div>
              <p className="dashboard-name">{displayName}</p>
              <p className="dashboard-level">Niveau {currentLevel}</p>
            </div>
          </div>
          <Link to="/settings" className="settings-gear" title="Réglages">⚙️</Link>
        </div>

        <div className="streak-card">
          <p className="streak-card-title">Série actuelle 🔥</p>
          <p className="streak-card-value">{settings.current_streak} jour{settings.current_streak > 1 ? 's' : ''}</p>
          <p className="progress-card-sub" style={{ marginBottom: 10 }}>Continue comme ça !</p>
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
          <div className="level-row">
            <span>Niveau {currentLevel}</span>
            <span>Niveau {currentLevel + 1}</span>
          </div>
          <div className="progress-bar-track">
            <div className="progress-bar-fill" style={{ width: `${levelPct}%` }} />
          </div>
          <p className="progress-card-sub">{xpIntoLevel} / {xpNeeded} XP</p>
        </div>

        <div className="stats-row">
          <div className="stat-box">
            <p className="stat-icon">✅</p>
            <p className="stat-value">{completedCount}</p>
            <p className="stat-label">Leçons terminées</p>
          </div>
          <div className="stat-box">
            <p className="stat-icon">🎯</p>
            <p className="stat-value">{avgScore}%</p>
            <p className="stat-label">Score moyen</p>
          </div>
          <div className="stat-box">
            <p className="stat-icon">⏱️</p>
            <p className="stat-value">{formatDuration(settings.total_learning_seconds)}</p>
            <p className="stat-label">Temps d'apprentissage</p>
          </div>
        </div>
      </div>
    </AppLayout>
  )
}

export default Profile

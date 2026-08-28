import { useEffect, useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { computeUnitStates, dailyXpThreshold } from '../lib/progress.js'
import { computeLevel, xpForNextLevel, formatDuration } from '../lib/level.js'
import { loadWordPuzzleHistory, formatTime } from '../lib/wordPuzzle.js'
import RingProgress from '../components/RingProgress.jsx'
import { useAuth } from '../contexts/AuthContext.jsx'
import AppLayout from '../components/AppLayout.jsx'

const DAY_LABELS = ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim']
const CECR_TITLES = {
  A0: 'Fondations · Premiers pas',
  A1: 'A1 · Débutant complet',
  A2: 'A2 · Élémentaire',
  B1: 'B1 · Intermédiaire',
  B2: 'B2 · Intermédiaire avancé',
  C1: 'C1 · Avancé',
}

function Profile() {
  const { user } = useAuth()
  const navigate = useNavigate()
  const [settings, setSettings] = useState(null)
  const [completedCount, setCompletedCount] = useState(0)
  const [avgScore, setAvgScore] = useState(0)
  const [levelProgress, setLevelProgress] = useState([])
  const [bestToeicScore, setBestToeicScore] = useState(null)
  const [wordPuzzleHistory, setWordPuzzleHistory] = useState([])
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

      const { data: unitsData } = await supabase
        .from('units').select('*').eq('language_id', settingsData.active_language_id).order('position')
      const states = await computeUnitStates(user.id, settingsData.active_language_id, unitsData || [], settingsData.unlocked_level)

      const grouped = []
      states.forEach((s) => {
        let group = grouped.find((g) => g.level === s.unit.cecr_level)
        if (!group) { group = { level: s.unit.cecr_level, units: [] }; grouped.push(group) }
        group.units.push(s)
      })
      setLevelProgress(grouped.map((g) => {
        const total = g.units.reduce((sum, u) => sum + u.lessonCount, 0)
        const done = g.units.reduce((sum, u) => sum + u.completedCount, 0)
        return {
          level: g.level,
          pct: total > 0 ? Math.round((done / total) * 100) : 0,
          isLocked: g.units[0]?.isLocked,
        }
      }))

      const { data: attempts } = await supabase.from('user_toeic_attempts').select('*').eq('user_id', user.id).order('estimated_score', { ascending: false }).limit(1)
      if (attempts && attempts.length > 0) setBestToeicScore(attempts[0])

      const history = await loadWordPuzzleHistory(supabase, user.id)
      setWordPuzzleHistory(history)

      setLoading(false)
    }
    load()
  }, [user.id])

  if (loading || !settings) return <AppLayout><div className="page"><p>Chargement...</p></div></AppLayout>

  const { xpIntoLevel, xpNeeded, currentLevel } = xpForNextLevel(settings.total_xp)
  const levelPct = Math.round((xpIntoLevel / xpNeeded) * 100)
  const todayIndex = (new Date().getDay() + 6) % 7
  const todayStr = new Date().toISOString().slice(0, 10)
  const todayXp = settings.xp_today_date === todayStr ? settings.xp_gained_today : 0
  const goalThreshold = dailyXpThreshold(settings.daily_goal_minutes)
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
          <button className="nav-item" style={{ width: 'auto' }} onClick={() => navigate('/settings')} aria-label="Réglages">
            <span className="nav-icon">⚙️</span>
          </button>
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

        <div className="progress-card ring-progress-card">
          <RingProgress percent={levelPct} size={90} stroke={7}>
            <span className="ring-level-number">{currentLevel}</span>
          </RingProgress>
          <div>
            <p className="progress-card-title">Vers le niveau {currentLevel + 1}</p>
            <p className="mono" style={{ fontSize: 15, marginTop: 4 }}>{xpIntoLevel} / {xpNeeded} XP</p>
          </div>
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

        <p className="dashboard-section-title">Progression par niveau</p>
        <div className="level-progress-list">
          {levelProgress.map((lp) => (
            <Link
              key={lp.level}
              to={lp.isLocked ? '#' : `/level/${lp.level}`}
              className={`level-progress-row ${lp.isLocked ? 'locked' : ''}`}
            >
              <span className="level-progress-label">{CECR_TITLES[lp.level] || lp.level}</span>
              <div className="level-progress-bar-track">
                <div className="level-progress-bar-fill" style={{ width: `${lp.pct}%` }} />
              </div>
              <span className="level-progress-pct">{lp.isLocked ? '🔒' : `${lp.pct}%`}</span>
            </Link>
          ))}
        </div>

        <p className="dashboard-section-title">🏆 Trophées</p>
        <div className="trophy-list">
          <div className="trophy-card clickable" onClick={() => navigate('/toeic-test')} style={{ opacity: 1 }}>
            <span className="trophy-icon">📝</span>
            <div>
              <p className="trophy-title">Meilleur score examen</p>
              <p className="trophy-value">
                {bestToeicScore ? `${bestToeicScore.estimated_score} / 990 · ${bestToeicScore.cecr_level_estimate}` : "Aucun test passé — clique pour commencer"}
              </p>
            </div>
          </div>
          <div className="trophy-card">
            <span className="trophy-icon">⚡</span>
            <div>
              <p className="trophy-title">Record verbes irréguliers (60s)</p>
              <p className="trophy-value">
                {settings.best_verb_sprint_score > 0 ? `${settings.best_verb_sprint_score} bonnes réponses` : 'Pas encore de record — tente ta chance !'}
              </p>
            </div>
          </div>
          <div className="trophy-card">
            <span className="trophy-icon">💬</span>
            <div>
              <p className="trophy-title">Record vocabulaire (60s)</p>
              <p className="trophy-value">Pas encore disponible</p>
            </div>
          </div>
        </div>
        <p className="setting-note">Ces modules (test type examen, verbes irréguliers) arrivent bientôt — les trophées s'activeront automatiquement une fois disponibles.</p>

        {wordPuzzleHistory.length > 0 && (
          <>
            <p className="dashboard-section-title">🧩 Jeux de mots</p>
            <div
              className="unit-card clickable"
              style={{ marginBottom: '1.5rem' }}
              onClick={() => navigate('/word-games/history')}
            >
              <div className="unit-icon">🧩</div>
              <div>
                <p className="unit-title">
                  {wordPuzzleHistory.length} grille{wordPuzzleHistory.length > 1 ? 's' : ''} résolue{wordPuzzleHistory.length > 1 ? 's' : ''}
                </p>
                <p className="unit-status">
                  🥇 {wordPuzzleHistory.filter((h) => h.rank === 1).length}
                  {' · '}🥈 {wordPuzzleHistory.filter((h) => h.rank === 2).length}
                  {' · '}🥉 {wordPuzzleHistory.filter((h) => h.rank === 3).length}
                  {' · Voir tout →'}
                </p>
              </div>
            </div>
          </>
        )}
      </div>
    </AppLayout>
  )
}

export default Profile

import { useEffect, useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { computeUnitStates, dailyXpThreshold } from '../lib/progress.js'
import { computeLevel, xpForNextLevel, formatDuration } from '../lib/level.js'
import { loadWordPuzzleHistory, formatTime } from '../lib/wordPuzzle.js'
import RingProgress from '../components/RingProgress.jsx'
import { useAuth } from '../contexts/AuthContext.jsx'
import AppLayout from '../components/AppLayout.jsx'

const DAY_LABELS = ['L', 'M', 'M', 'J', 'V', 'S', 'D']
const CECR_TITLES = {
  A0: 'Fondations · Premiers pas',
  A1: 'A1 · Débutant complet',
  A2: 'A2 · Élémentaire',
  B1: 'B1 · Intermédiaire',
  B2: 'B2 · Intermédiaire avancé',
  C1: 'C1 · Avancé',
}
const LEVEL_CHIP = {
  A0: { bg: '#DCEFFB', fg: '#1E4A72', fill: '#3B82F6' },
  A1: { bg: '#E4F3D2', fg: '#3E5410', fill: '#8DBF3A' },
  A2: { bg: '#FFE9D6', fg: '#8A4A12', fill: '#F0973E' },
  B1: { bg: '#FDE2E0', fg: '#8A2E24', fill: '#E0685A' },
  B2: { bg: '#E7E1FB', fg: '#4B2E8A', fill: '#8A6FE0' },
  C1: { bg: '#DCE1EC', fg: '#28324A', fill: '#4A5A82' },
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
  const [activeDays, setActiveDays] = useState(new Set())
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
          done, total,
        }
      }))

      const { data: attempts } = await supabase.from('user_toeic_attempts').select('*').eq('user_id', user.id).order('estimated_score', { ascending: false }).limit(1)
      if (attempts && attempts.length > 0) setBestToeicScore(attempts[0])

      const history = await loadWordPuzzleHistory(supabase, user.id)
      setWordPuzzleHistory(history)

      const mondayThisWeek = new Date()
      mondayThisWeek.setDate(mondayThisWeek.getDate() - ((mondayThisWeek.getDay() + 6) % 7))
      const mondayStr = mondayThisWeek.toISOString().slice(0, 10)
      const { data: activityRows } = await supabase
        .from('user_daily_activity').select('activity_date')
        .eq('user_id', user.id).gte('activity_date', mondayStr)
      setActiveDays(new Set((activityRows || []).map((r) => r.activity_date)))

      setLoading(false)
    }
    load()
  }, [user.id])

  if (loading || !settings) return <AppLayout><div className="page"><p>Chargement...</p></div></AppLayout>

  const { xpIntoLevel, xpNeeded, currentLevel } = xpForNextLevel(settings.total_xp)
  const levelPct = Math.round((xpIntoLevel / xpNeeded) * 100)
  const todayIndex = (new Date().getDay() + 6) % 7
  const mondayThisWeekStr = (() => {
    const d = new Date()
    d.setDate(d.getDate() - todayIndex)
    return d.toISOString().slice(0, 10)
  })()
  const todayStr = new Date().toISOString().slice(0, 10)
  const todayXp = settings.xp_today_date === todayStr ? settings.xp_gained_today : 0
  const goalThreshold = dailyXpThreshold(settings.daily_goal_minutes)
  const displayName = user.email.split('@')[0]
  const initial = displayName.charAt(0).toUpperCase()

  return (
    <AppLayout>
      <div className="page p3-page">
        <div className="p3-top">
          <p className="p3-title">👤 Profil</p>
          <span className="p3-settings" onClick={() => navigate('/settings')}>⚙️</span>
        </div>

        <div className="p3-id-card">
          <div className="p3-id-row">
            <span className="p3-id-avatar">{initial}</span>
            <div style={{ flex: 1, minWidth: 0 }}>
              <div className="p3-id-name">{displayName}</div>
              <div className="p3-id-sub">Niveau {currentLevel}</div>
            </div>
          </div>
          <div className="p3-id-xp-row">
            <span>Vers le niveau {currentLevel + 1}</span>
            <span>{xpIntoLevel} / {xpNeeded} XP</span>
          </div>
          <div className="p3-id-track"><div className="p3-id-fill" style={{ width: `${levelPct}%` }} /></div>
        </div>

        <div className="p3-streak-card">
          <div className="p3-streak-head">
            <span>🔥 Série de {settings.current_streak} jour{settings.current_streak > 1 ? 's' : ''}</span>
            <span className="p3-streak-record">record {settings.longest_streak}</span>
          </div>
          <div className="p3-streak-week">
            {DAY_LABELS.map((label, i) => {
              const dayDate = new Date(mondayThisWeekStr)
              dayDate.setDate(dayDate.getDate() + i)
              const dayStr = dayDate.toISOString().slice(0, 10)
              const isActive = activeDays.has(dayStr)
              return (
                <div key={i} className="p3-streak-day">
                  <div className={`p3-streak-mark ${isActive ? 'active' : ''}`}>{isActive ? '✓' : ''}</div>
                  <span className="p3-streak-daylabel">{label}</span>
                </div>
              )
            })}
          </div>
        </div>

        <div className="p3-stats-row">
          <div className="p3-stat">
            <div style={{ fontSize: '19px' }}>✅</div>
            <div className="p3-stat-value">{completedCount}</div>
            <div className="p3-stat-label">Leçons terminées</div>
          </div>
          <div className="p3-stat">
            <div style={{ fontSize: '19px' }}>🎯</div>
            <div className="p3-stat-value">{avgScore}%</div>
            <div className="p3-stat-label">Score moyen</div>
          </div>
          <div className="p3-stat">
            <div style={{ fontSize: '19px' }}>⏱️</div>
            <div className="p3-stat-value">{formatDuration(settings.total_learning_seconds)}</div>
            <div className="p3-stat-label">Temps total</div>
          </div>
        </div>

        <p className="p3-section-title">Progression par niveau</p>
        <div className="p3-level-card">
          {levelProgress.map((lp) => {
            const c = LEVEL_CHIP[lp.level] || LEVEL_CHIP.A1
            return (
              <Link key={lp.level} to={lp.isLocked ? '#' : `/level/${lp.level}`} className="p3-level-row">
                <span className="p3-level-chip" style={{ background: c.bg, color: c.fg }}>{lp.level}</span>
                <div style={{ flex: 1, minWidth: 0 }}>
                  <div className="p3-level-name">{CECR_TITLES[lp.level] || lp.level}</div>
                  <div className="p3-level-track"><div className="p3-level-fill" style={{ width: `${lp.pct}%`, background: c.fill }} /></div>
                </div>
                <span className="p3-level-right">{lp.isLocked ? '🔒' : `${lp.done}/${lp.total}`}</span>
              </Link>
            )
          })}
        </div>

        <p className="p3-section-title">🏆 Trophées</p>
        <div className="trophy-list">
          <div className="trophy-card clickable" onClick={() => navigate('/toeic-test')}>
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
        </div>

        {wordPuzzleHistory.length > 0 && (
          <>
            <p className="p3-section-title">🧩 Jeux de mots</p>
            <div className="p3-level-row" style={{ background: 'var(--bg-surface,#fff)', borderRadius: '20px', padding: '14px 16px', cursor: 'pointer' }} onClick={() => navigate('/word-games/history')}>
              <span style={{ fontSize: '22px' }}>🧩</span>
              <div style={{ flex: 1 }}>
                <div className="p3-level-name">{wordPuzzleHistory.length} grille{wordPuzzleHistory.length > 1 ? 's' : ''} résolue{wordPuzzleHistory.length > 1 ? 's' : ''}</div>
                <div style={{ fontSize: '11px', color: 'var(--text-secondary)', marginTop: '2px' }}>
                  🥇 {wordPuzzleHistory.filter((h) => h.rank === 1).length} · 🥈 {wordPuzzleHistory.filter((h) => h.rank === 2).length} · 🥉 {wordPuzzleHistory.filter((h) => h.rank === 3).length}
                </div>
              </div>
              <span className="p3-level-right">→</span>
            </div>
          </>
        )}
      </div>
    </AppLayout>
  )
}

export default Profile

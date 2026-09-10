import { useEffect, useState } from 'react'
import { useParams, useNavigate, Link } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import AppLayout from '../components/AppLayout.jsx'

const FORMAT_GROUPS = [
  { key: 'court', label: '⏱️ Court · moins de 2 min', color: '#4F6B1C' },
  { key: 'moyen', label: '⏱️ Moyen · 2 à 4 min', color: '#2563EB' },
  { key: 'long', label: '⏱️ Long · 4 à 6 min', color: '#B3402F' },
]
const LEVEL_CHIP = {
  A0: { bg: '#DCEFFB', fg: '#1E4A72' }, A1: { bg: '#E4F3D2', fg: '#3E5410' }, A2: { bg: '#FFE9D6', fg: '#8A4A12' },
  B1: { bg: '#FDE2E0', fg: '#8A2E24' }, B2: { bg: '#E7E1FB', fg: '#4B2E8A' }, C1: { bg: '#DCE1EC', fg: '#28324A' },
}
const THEME_ICONS = {
  'Restaurant': '🍽️', 'Rendez-vous amoureux': '💐', "Entretien d'embauche": '💼', 'Voyage / aéroport': '✈️',
  'Urgence médicale': '🚑', 'Colocation': '🏠', 'Shopping': '🛍️', 'Quête médiévale-fantasy': '🗡️',
  'Donjons & dragons': '🐉', 'Enquête policière / mystère': '🔍', 'Festival de musique': '🎪', 'Musée & histoire': '🏛️',
  'Networking professionnel': '🤝', 'Road trip aux États-Unis': '🚗', 'Semaine à Londres': '🎡',
  'Road trip en Australie': '🦘', 'Sport': '⚽',
}

function ScenarioList() {
  const { themeId } = useParams()
  const { user } = useAuth()
  const navigate = useNavigate()
  const [theme, setTheme] = useState(null)
  const [scenarios, setScenarios] = useState([])
  const [endingsMap, setEndingsMap] = useState({})
  const [activeSessions, setActiveSessions] = useState({})
  const [filter, setFilter] = useState('all')
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      const { data: themeData } = await supabase.from('scenario_themes').select('*').eq('id', themeId).single()
      setTheme(themeData)
      const { data } = await supabase.from('scenarios').select('*').eq('theme_id', themeId)
      setScenarios(data || [])

      const scenarioIds = (data || []).map((s) => s.id)
      if (scenarioIds.length > 0) {
        const { data: endingsData } = await supabase
          .from('user_scenario_endings').select('scenario_id, ending_label')
          .eq('user_id', user.id).in('scenario_id', scenarioIds)
        const map = {}
        ;(endingsData || []).forEach((e) => {
          if (!map[e.scenario_id]) map[e.scenario_id] = new Set()
          map[e.scenario_id].add(e.ending_label)
        })
        setEndingsMap(map)

        const { data: sessions } = await supabase
          .from('user_scenario_sessions').select('scenario_id, history').eq('user_id', user.id).in('scenario_id', scenarioIds)
        const sessionMap = {}
        ;(sessions || []).forEach((s) => { sessionMap[s.scenario_id] = s })
        setActiveSessions(sessionMap)
      }
      setLoading(false)
    }
    load()
  }, [themeId, user.id])

  if (loading) return <AppLayout><div className="page"><p>Chargement...</p></div></AppLayout>

  const doneCount = scenarios.filter((s) => (endingsMap[s.id]?.size || 0) > 0).length
  const donePct = scenarios.length > 0 ? Math.round((doneCount / scenarios.length) * 100) : 0
  const levelsSpan = [...new Set(scenarios.map((s) => s.cecr_level))].sort()

  const resumeScenarioId = Object.keys(activeSessions)[0]
  const resumeScenario = resumeScenarioId ? scenarios.find((s) => s.id === resumeScenarioId) : null
  const resumeSession = resumeScenarioId ? activeSessions[resumeScenarioId] : null
  const resumeStepCount = resumeSession ? resumeSession.history.length + 1 : 0

  const visible = scenarios.filter((s) => {
    if (filter === 'todo') return !((endingsMap[s.id]?.size || 0) > 0) && s.is_playable
    return true
  })

  return (
    <AppLayout>
      <div className="page sc2-page">
        <Link to="/scenarios" className="sc2-back">← Retour aux thématiques</Link>

        <div className="sc2-hero-card">
          <div className="sc2-hero-top">
            <div className="sc2-hero-left">
              <span style={{ fontSize: '26px' }}>{THEME_ICONS[theme?.title] || '🎬'}</span>
              <div>
                <div className="sc2-hero-title">{theme?.title}</div>
                <div className="sc2-hero-sub">{scenarios.length} scénario{scenarios.length > 1 ? 's' : ''} · {levelsSpan[0]} à {levelsSpan[levelsSpan.length - 1]}</div>
              </div>
            </div>
            <div style={{ textAlign: 'right' }}>
              <div className="sc2-hero-count">{doneCount} / {scenarios.length}</div>
              <div className="sc2-hero-count-label">terminés</div>
            </div>
          </div>
          <div className="sc2-hero-track"><div className="sc2-hero-fill" style={{ width: `${donePct}%` }} /></div>
        </div>

        <div className="sc2-filters">
          <span className={`sc2-filter-chip ${filter === 'all' ? 'active' : ''}`} onClick={() => setFilter('all')}>Tous</span>
          <span className={`sc2-filter-chip ${filter === 'todo' ? 'active' : ''}`} onClick={() => setFilter('todo')}>À faire</span>
        </div>

        {resumeScenario && (
          <div className="sc2-resume-card" onClick={() => navigate(`/scenario/${resumeScenario.id}`)}>
            <div className="sc2-resume-eyebrow">Reprendre</div>
            <div className="sc2-resume-title">{resumeScenario.title}</div>
            <div className="sc2-resume-sub">Réplique {resumeStepCount}</div>
          </div>
        )}

        {FORMAT_GROUPS.map((group) => {
          const groupScenarios = visible.filter((s) => s.format === group.key)
          if (groupScenarios.length === 0) return null
          return (
            <div key={group.key} className="sc2-format-group">
              <div className="sc2-section-head">
                <span style={{ color: group.color }}>{group.label}</span>
                <span className="sc2-section-line" />
              </div>
              {groupScenarios.map((s) => {
                const totalEndings = Object.values(s.content?.nodes || {}).filter((n) => n.end).length
                const discovered = endingsMap[s.id]?.size || 0
                const isDone = discovered > 0
                const c = LEVEL_CHIP[s.cecr_level] || LEVEL_CHIP.A1
                return (
                  <div
                    key={s.id}
                    className={`sc2-scenario-row ${isDone ? 'done' : ''} ${!s.is_playable ? 'locked' : ''}`}
                    onClick={() => s.is_playable && navigate(`/scenario/${s.id}`)}
                  >
                    <span className={`sc2-scenario-icon ${isDone ? 'done' : ''}`}>{isDone ? '✓' : s.is_playable ? '▶︎' : '🔒'}</span>
                    <div style={{ flex: 1, minWidth: 0 }}>
                      <div className="sc2-scenario-title" style={isDone ? { color: '#3E5410' } : {}}>{s.title}</div>
                      <div className="sc2-scenario-meta" style={isDone ? { color: '#4F6B1C' } : {}}>
                        {isDone ? `Terminé${totalEndings > 1 ? ` · ${discovered}/${totalEndings} fins` : ''}` : !s.is_playable ? 'Pas encore jouable' : `Niveau ${s.cecr_level}`}
                      </div>
                    </div>
                    {isDone ? (
                      <span className="sc2-scenario-replay">Rejouer ›</span>
                    ) : (
                      <span className="sc2-scenario-level" style={{ background: c.bg, color: c.fg }}>{s.cecr_level}</span>
                    )}
                  </div>
                )
              })}
            </div>
          )
        })}
      </div>
    </AppLayout>
  )
}

export default ScenarioList

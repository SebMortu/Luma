import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import AppLayout from '../components/AppLayout.jsx'

const CATEGORY_LABELS = {
  quotidien: '🏙️ Vie quotidienne',
  fantastique: '🐉 Fantastique & aventure',
  culture: '🎭 Culture',
  pays: '✈️ Pays / immersion',
}
const TILE_COLORS = [
  { bg: '#DCEFFB', fg: '#1E4A72', sub: '#4E7DA3', track: 'rgba(30,74,114,.14)', fill: '#3B82F6' },
  { bg: '#FDE2E0', fg: '#8A2E24', sub: '#B3574C', track: 'rgba(138,46,36,.14)', fill: '#E0685A' },
  { bg: '#E4F3D2', fg: '#3E5410', sub: '#6F8A3C', track: 'rgba(62,84,16,.14)', fill: '#8DBF3A' },
  { bg: '#FFE9D6', fg: '#8A4A12', sub: '#B3702E', track: 'rgba(138,74,18,.14)', fill: '#F0973E' },
  { bg: '#E7E1FB', fg: '#4B2E8A', sub: '#7A63B3', track: 'rgba(75,46,138,.14)', fill: '#8A6FE0' },
]
const THEME_ICONS = {
  'Restaurant': '🍽️',
  'Rendez-vous amoureux': '💐',
  "Entretien d'embauche": '💼',
  'Voyage / aéroport': '✈️',
  'Urgence médicale': '🚑',
  'Colocation': '🏠',
  'Shopping': '🛍️',
  'Quête médiévale-fantasy': '🗡️',
  'Donjons & dragons': '🐉',
  'Enquête policière / mystère': '🔍',
  'Festival de musique': '🎪',
  'Musée & histoire': '🏛️',
  'Networking professionnel': '🤝',
  'Road trip aux États-Unis': '🚗',
  'Semaine à Londres': '🎡',
  'Road trip en Australie': '🦘',
  'Sport': '⚽',
}

function ScenariosLibrary() {
  const { user } = useAuth()
  const navigate = useNavigate()
  const [themes, setThemes] = useState([])
  const [counts, setCounts] = useState({})
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      const { data: settings } = await supabase.from('user_settings').select('active_language_id').eq('user_id', user.id).single()
      const { data } = await supabase.from('scenario_themes').select('*').eq('language_id', settings.active_language_id).order('position')
      setThemes(data || [])

      const themeIds = (data || []).map((t) => t.id)
      if (themeIds.length > 0) {
        const { data: scenarios } = await supabase.from('scenarios').select('id, theme_id').in('theme_id', themeIds)
        const scenarioIds = (scenarios || []).map((s) => s.id)
        const { data: endings } = await supabase
          .from('user_scenario_endings').select('scenario_id').eq('user_id', user.id).in('scenario_id', scenarioIds)
        const doneScenarioIds = new Set((endings || []).map((e) => e.scenario_id))

        const map = {}
        ;(scenarios || []).forEach((s) => {
          map[s.theme_id] = map[s.theme_id] || { total: 0, done: 0 }
          map[s.theme_id].total++
          if (doneScenarioIds.has(s.id)) map[s.theme_id].done++
        })
        setCounts(map)
      }
      setLoading(false)
    }
    load()
  }, [user.id])

  if (loading) return <AppLayout><div className="page"><p>Chargement...</p></div></AppLayout>

  const grouped = []
  themes.forEach((t) => {
    let g = grouped.find((x) => x.category === t.category)
    if (!g) { g = { category: t.category, themes: [] }; grouped.push(g) }
    g.themes.push(t)
  })

  return (
    <AppLayout>
      <div className="page sc2-page">
        <p className="sc2-title">🎭 Mises en situation</p>
        <p className="sc2-subtitle">Des dialogues interactifs pour pratiquer la compréhension en contexte réel.</p>

        {grouped.map((g) => (
          <div key={g.category} className="sc2-section">
            <div className="sc2-section-head">
              <span>{CATEGORY_LABELS[g.category] || g.category}</span>
              <span className="sc2-section-line" />
            </div>
            <div className="sc2-tile-grid">
              {g.themes.map((t, i) => {
                const c = TILE_COLORS[i % TILE_COLORS.length]
                const count = counts[t.id] || { total: 0, done: 0 }
                const pct = count.total > 0 ? Math.round((count.done / count.total) * 100) : 0
                return (
                  <div key={t.id} className="sc2-tile" style={{ background: c.bg }} onClick={() => navigate(`/scenarios/${t.id}`)}>
                    <div className="sc2-tile-top">
                      <span style={{ fontSize: '24px' }}>{THEME_ICONS[t.title] || '🎬'}</span>
                      <span className="sc2-tile-done" style={{ color: c.sub }}>{count.done}/{count.total}</span>
                    </div>
                    <div>
                      <div className="sc2-tile-name" style={{ color: c.fg }}>{t.title}</div>
                      <div className="sc2-tile-track" style={{ background: c.track }}>
                        <div className="sc2-tile-fill" style={{ width: `${pct}%`, background: c.fill }} />
                      </div>
                    </div>
                  </div>
                )
              })}
            </div>
          </div>
        ))}
      </div>
    </AppLayout>
  )
}

export default ScenariosLibrary

import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import AppLayout from '../components/AppLayout.jsx'

const THEME_COLORS = [
  { bg: '#DCEFFB', fg: '#1E4A72', sub: '#4E7DA3', track: 'rgba(30,74,114,.14)', fill: '#3B82F6' },
  { bg: '#FDE2E0', fg: '#8A2E24', sub: '#B3574C', track: 'rgba(138,46,36,.14)', fill: '#E0685A' },
  { bg: '#E4F3D2', fg: '#3E5410', sub: '#6F8A3C', track: 'rgba(62,84,16,.14)', fill: '#8DBF3A' },
  { bg: '#FFE9D6', fg: '#8A4A12', sub: '#B3702E', track: 'rgba(138,74,18,.14)', fill: '#F0973E' },
  { bg: '#E7E1FB', fg: '#4B2E8A', sub: '#7A63B3', track: 'rgba(75,46,138,.14)', fill: '#8A6FE0' },
  { bg: '#F6E8D8', fg: '#6B4A24', sub: '#9C7A4E', track: 'rgba(107,74,36,.14)', fill: '#C99B5E' },
  { bg: '#DDF0EA', fg: '#1E5C4A', sub: '#4E8C76', track: 'rgba(30,92,74,.14)', fill: '#3BAF8A' },
]

function VocabThemesLibrary() {
  const { user } = useAuth()
  const [themes, setThemes] = useState([])
  const [levelsByTheme, setLevelsByTheme] = useState({})
  const [completedLevelIds, setCompletedLevelIds] = useState(new Set())
  const [filter, setFilter] = useState('all')
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      const { data: settings } = await supabase.from('user_settings').select('active_language_id').eq('user_id', user.id).single()
      const { data: themesData } = await supabase
        .from('vocab_themes').select('*').eq('language_id', settings.active_language_id).order('position')
      const { data: levelsData } = await supabase
        .from('vocab_theme_levels').select('id, theme_id, words').in('theme_id', (themesData || []).map((t) => t.id))
      const { data: completedData } = await supabase
        .from('user_vocab_level_practice').select('level_id').eq('user_id', user.id)

      const grouped = {}
      ;(levelsData || []).forEach((l) => { grouped[l.theme_id] = grouped[l.theme_id] || []; grouped[l.theme_id].push(l) })

      setThemes(themesData || [])
      setLevelsByTheme(grouped)
      setCompletedLevelIds(new Set((completedData || []).map((c) => c.level_id)))
      setLoading(false)
    }
    load()
  }, [user.id])

  if (loading) return <AppLayout><div className="page"><p>Chargement...</p></div></AppLayout>

  const visibleThemes = themes.filter((t) => {
    const levels = levelsByTheme[t.id] || []
    const done = levels.filter((l) => completedLevelIds.has(l.id)).length
    if (filter === 'started') return done > 0 && done < levels.length
    if (filter === 'todo') return done === 0
    return true
  })

  return (
    <AppLayout>
      <div className="page vt2-page">
        <Link to="/practice" className="sc2-back">← Pratiquer</Link>
        <p className="vt2-title">📚 Vocabulaire par thème</p>
        <p className="vt2-subtitle">Choisis un sujet qui t'intéresse — les mots mélangent volontairement plusieurs niveaux.</p>

        <div className="sc2-filters" style={{ marginBottom: '12px' }}>
          <span className={`sc2-filter-chip ${filter === 'all' ? 'active' : ''}`} onClick={() => setFilter('all')} style={filter === 'all' ? { background: '#1E2A4A', borderColor: '#1E2A4A' } : {}}>Tous</span>
          <span className={`sc2-filter-chip ${filter === 'started' ? 'active' : ''}`} onClick={() => setFilter('started')} style={filter === 'started' ? { background: '#1E2A4A', borderColor: '#1E2A4A' } : {}}>Commencés</span>
          <span className={`sc2-filter-chip ${filter === 'todo' ? 'active' : ''}`} onClick={() => setFilter('todo')} style={filter === 'todo' ? { background: '#1E2A4A', borderColor: '#1E2A4A' } : {}}>À revoir</span>
        </div>

        <div className="vt2-grid">
          {visibleThemes.map((t, i) => {
            const c = THEME_COLORS[i % THEME_COLORS.length]
            const levels = levelsByTheme[t.id] || []
            const done = levels.filter((l) => completedLevelIds.has(l.id)).length
            const pct = levels.length > 0 ? Math.round((done / levels.length) * 100) : 0
            return (
              <Link key={t.id} to={`/vocab-themes/${t.slug}`} className="vt2-tile" style={{ background: c.bg }}>
                <div className="vt2-tile-top">
                  <span style={{ fontSize: '23px' }}>{t.icon}</span>
                  <span className="vt2-tile-count" style={{ color: c.sub }}>{done}/{levels.length}</span>
                </div>
                <div>
                  <div className="vt2-tile-name" style={{ color: c.fg }}>{t.title}</div>
                  <div className="vt2-tile-track" style={{ background: c.track }}>
                    <div className="vt2-tile-fill" style={{ width: `${pct}%`, background: c.fill }} />
                  </div>
                </div>
              </Link>
            )
          })}
        </div>

        <Link to="/vocab-training" className="vocab-training-cta" style={{ marginTop: '16px' }}>
          <span className="vocab-training-cta-icon">🎯</span>
          <span>
            <span className="vocab-training-cta-title">Entraînement sur mesure</span>
            <span className="vocab-training-cta-desc">Choisis plusieurs thèmes et niveaux, on mélange tout dans une session.</span>
          </span>
        </Link>
      </div>
    </AppLayout>
  )
}

export default VocabThemesLibrary

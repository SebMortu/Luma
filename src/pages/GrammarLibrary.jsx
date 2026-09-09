import { useEffect, useState } from 'react'
import { useNavigate, useSearchParams, Link } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import AppLayout from '../components/AppLayout.jsx'

const CECR_TITLES = {
  A0: 'Fondations · Premiers pas', A1: 'A1 · Débutant complet', A2: 'A2 · Élémentaire',
  B1: 'B1 · Intermédiaire', B2: 'B2 · Intermédiaire avancé', C1: 'C1 · Avancé',
}
const CECR_ORDER = ['A1', 'A2', 'B1', 'B2', 'C1']
const LEVEL_NUM_COLORS = {
  A0: { bg: '#DCEFFB', fg: '#1E4A72' }, A1: { bg: '#E4F3D2', fg: '#3E5410' }, A2: { bg: '#FFE9D6', fg: '#8A4A12' },
  B1: { bg: '#FDE2E0', fg: '#8A2E24' }, B2: { bg: '#E7E1FB', fg: '#4B2E8A' }, C1: { bg: '#DCE1EC', fg: '#28324A' },
}

function GrammarLibrary() {
  const { user } = useAuth()
  const navigate = useNavigate()
  const [searchParams] = useSearchParams()
  const isReviewMode = searchParams.get('review') === '1'
  const [fiches, setFiches] = useState([])
  const [practicedIds, setPracticedIds] = useState(new Set())
  const [search, setSearch] = useState('')
  const [levelFilter, setLevelFilter] = useState('all')
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      const { data: settings } = await supabase.from('user_settings').select('active_language_id').eq('user_id', user.id).single()
      const { data } = await supabase.from('grammar_fiches').select('id, cecr_level, position, title, content')
        .eq('language_id', settings.active_language_id).order('position')
      setFiches(data || [])

      const { data: practiced } = await supabase.from('user_grammar_practice').select('fiche_id').eq('user_id', user.id)
      setPracticedIds(new Set((practiced || []).map((p) => p.fiche_id)))

      if (isReviewMode) {
        const { data: completed } = await supabase
          .from('user_progress').select('units(cecr_level)').eq('user_id', user.id).eq('status', 'completed')
        const reachedLevels = new Set((completed || []).map((c) => c.units?.cecr_level).filter(Boolean))
        const highest = [...CECR_ORDER].reverse().find((lvl) => reachedLevels.has(lvl))
        if (highest) setLevelFilter(highest)
      }
      setLoading(false)
    }
    load()
  }, [user.id, isReviewMode])

  const filtered = fiches.filter((f) => {
    const matchLevel = levelFilter === 'all' || f.cecr_level === levelFilter
    const matchSearch = f.title.toLowerCase().includes(search.toLowerCase())
    return matchLevel && matchSearch
  })

  const grouped = []
  filtered.forEach((f) => {
    let group = grouped.find((g) => g.level === f.cecr_level)
    if (!group) { group = { level: f.cecr_level, fiches: [] }; grouped.push(group) }
    group.fiches.push(f)
  })

  if (loading) return <AppLayout><div className="page"><p>Chargement...</p></div></AppLayout>

  return (
    <AppLayout>
      <div className="page gr2-page">
        <Link to="/learn" className="sc2-back">← Apprendre</Link>
        <p className="gr2-title">📚 Grammaire libre</p>
        <p className="gr2-subtitle">Consulte n'importe quelle notion déjà vue, à tout moment, indépendamment de ta progression.</p>

        <div className="gr2-search">
          <span>🔍</span>
          <input
            type="text"
            placeholder="Rechercher une notion (ex: passif, conditionnel...)"
            value={search}
            onChange={(e) => setSearch(e.target.value)}
          />
        </div>

        <div className="gr2-filters">
          <span className={`b2-filter-chip ${levelFilter === 'all' ? 'active' : ''}`} onClick={() => setLevelFilter('all')}>Tous</span>
          {CECR_ORDER.map((lvl) => (
            <span key={lvl} className={`b2-filter-chip ${levelFilter === lvl ? 'active' : ''}`} onClick={() => setLevelFilter(lvl)}>{lvl}</span>
          ))}
        </div>

        {grouped.map((g) => (
          <div key={g.level} className="sc2-format-group">
            <div className="sc2-section-head">
              <span style={{ color: 'var(--accent,#2563EB)' }}>{CECR_TITLES[g.level]}</span>
              <span className="sc2-section-line" />
              <span style={{ fontWeight: 700, fontSize: '11px', color: 'var(--text-secondary)', textTransform: 'none', letterSpacing: 0 }}>{g.fiches.length} fiche{g.fiches.length > 1 ? 's' : ''}</span>
            </div>
            {g.fiches.map((f) => {
              const c = LEVEL_NUM_COLORS[f.cecr_level] || LEVEL_NUM_COLORS.A1
              const done = practicedIds.has(f.id)
              const firstSection = f.content?.sections?.[0]?.text || ''
              return (
                <div key={f.id} className="gr2-card" onClick={() => navigate(`/grammar/${f.id}`)}>
                  <span className="gr2-num" style={{ background: c.bg, color: c.fg }}>{f.position}</span>
                  <div style={{ flex: 1, minWidth: 0 }}>
                    <div className="gr2-card-title">{f.title}</div>
                    <div className="gr2-card-desc">{firstSection.slice(0, 70)}{firstSection.length > 70 ? '...' : ''}</div>
                  </div>
                  {done && <span className="gr2-tag">Pratiquée</span>}
                </div>
              )
            })}
          </div>
        ))}

        {filtered.length === 0 && <p className="progress-card-sub">Aucune fiche ne correspond à ta recherche.</p>}
      </div>
    </AppLayout>
  )
}

export default GrammarLibrary

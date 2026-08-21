import { useEffect, useState } from 'react'
import { useNavigate, useSearchParams } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import AppLayout from '../components/AppLayout.jsx'

const CECR_TITLES = {
  A1: 'A1 · Débutant complet',
  A2: 'A2 · Élémentaire',
  B1: 'B1 · Intermédiaire',
  B2: 'B2 · Intermédiaire avancé',
  C1: 'C1 · Avancé',
}
const CECR_ORDER = ['A1', 'A2', 'B1', 'B2', 'C1']

function GrammarLibrary() {
  const { user } = useAuth()
  const navigate = useNavigate()
  const [searchParams] = useSearchParams()
  const isReviewMode = searchParams.get('review') === '1'
  const [fiches, setFiches] = useState([])
  const [search, setSearch] = useState('')
  const [levelFilter, setLevelFilter] = useState('all')
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      const { data: settings } = await supabase.from('user_settings').select('active_language_id').eq('user_id', user.id).single()
      const { data } = await supabase.from('grammar_fiches').select('id, cecr_level, position, title')
        .eq('language_id', settings.active_language_id).order('position')
      setFiches(data || [])

      // En mode révision, on ne montre par défaut que ce qui a déjà été appris :
      // le niveau le plus avancé où l'utilisateur a complété au moins une leçon.
      if (isReviewMode) {
        const { data: completed } = await supabase
          .from('user_progress')
          .select('units(cecr_level)')
          .eq('user_id', user.id)
          .eq('status', 'completed')
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
      <div className="page">
        <h1>📚 Grammaire libre</h1>
        <p className="dashboard-goal">Consulte n'importe quelle notion déjà vue, à tout moment, indépendamment de ta progression.</p>

        <input
          type="text"
          placeholder="Rechercher une notion (ex: passif, conditionnel...)"
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          className="auth-input"
          style={{ marginBottom: '1rem' }}
        />

        <div className="grammar-level-chips">
          <button className={`chip ${levelFilter === 'all' ? 'selected' : ''}`} onClick={() => setLevelFilter('all')}>Tous</button>
          {Object.keys(CECR_TITLES).map((lvl) => (
            <button key={lvl} className={`chip ${levelFilter === lvl ? 'selected' : ''}`} onClick={() => setLevelFilter(lvl)}>{lvl}</button>
          ))}
        </div>

        {grouped.map((g) => (
          <div key={g.level}>
            <p className="cecr-level-header">{CECR_TITLES[g.level]}</p>
            <div className="unit-list">
              {g.fiches.map((f) => (
                <div key={f.id} className="unit-card clickable" onClick={() => navigate(`/grammar/${f.id}`)}>
                  <div className="unit-icon">📖</div>
                  <div>
                    <p className="unit-title">Fiche {f.position} · {f.title}</p>
                  </div>
                </div>
              ))}
            </div>
          </div>
        ))}

        {filtered.length === 0 && <p>Aucune fiche ne correspond à ta recherche.</p>}
      </div>
    </AppLayout>
  )
}

export default GrammarLibrary

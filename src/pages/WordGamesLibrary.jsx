import { useEffect, useState } from 'react'
import { useNavigate, Link } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import { formatTime } from '../lib/wordPuzzle.js'
import AppLayout from '../components/AppLayout.jsx'

const LEVEL_CHIP = {
  A0: { bg: '#DCEFFB', fg: '#1E4A72' }, A1: { bg: '#E4F3D2', fg: '#3E5410' }, A2: { bg: '#FFE9D6', fg: '#8A4A12' },
  B1: { bg: '#FDE2E0', fg: '#8A2E24' }, B2: { bg: '#E7E1FB', fg: '#4B2E8A' }, C1: { bg: '#DCE1EC', fg: '#28324A' },
}
const GAME_TABS = [
  { key: 'all', label: 'Tous', bg: '#1E2A4A', bd: '#1E2A4A', fg: '#fff' },
  { key: 'crossword', label: '✏️ Mots croisés', bg: '#fff', bd: '#EAEEF6', fg: '#1E2A4A' },
  { key: 'fleche', label: '➡️ Mots fléchés', bg: '#fff', bd: '#EAEEF6', fg: '#1E2A4A' },
]

function WordGamesLibrary() {
  const { user } = useAuth()
  const navigate = useNavigate()
  const [puzzles, setPuzzles] = useState([])
  const [myScores, setMyScores] = useState({})
  const [playerCounts, setPlayerCounts] = useState({})
  const [levelFilter, setLevelFilter] = useState('all')
  const [typeFilter, setTypeFilter] = useState('all')
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      const { data: settings } = await supabase.from('user_settings').select('active_language_id').eq('user_id', user.id).single()
      const { data } = await supabase.from('word_puzzles').select('*').eq('language_id', settings.active_language_id).order('created_at')
      setPuzzles(data || [])

      const puzzleIds = (data || []).map((p) => p.id)
      if (puzzleIds.length > 0) {
        const { data: mine } = await supabase.from('word_puzzle_scores').select('puzzle_id, time_seconds').eq('user_id', user.id).in('puzzle_id', puzzleIds)
        const bestMap = {}
        ;(mine || []).forEach((s) => { if (!(s.puzzle_id in bestMap) || s.time_seconds < bestMap[s.puzzle_id]) bestMap[s.puzzle_id] = s.time_seconds })
        setMyScores(bestMap)

        const { data: allScores } = await supabase.from('word_puzzle_scores').select('puzzle_id, user_id').in('puzzle_id', puzzleIds)
        const counts = {}
        ;(allScores || []).forEach((s) => { counts[s.puzzle_id] = counts[s.puzzle_id] || new Set(); counts[s.puzzle_id].add(s.user_id) })
        const countMap = {}
        Object.keys(counts).forEach((pid) => { countMap[pid] = counts[pid].size })
        setPlayerCounts(countMap)
      }
      setLoading(false)
    }
    load()
  }, [user.id])

  if (loading) return <AppLayout><div className="page"><p>Chargement...</p></div></AppLayout>

  const availableLevels = [...new Set(puzzles.map((p) => p.cecr_level))]
  const filtered = puzzles.filter((p) => (levelFilter === 'all' || p.cecr_level === levelFilter) && (typeFilter === 'all' || p.type === typeFilter))
  const crosswords = filtered.filter((p) => p.type === 'crossword')
  const fleches = filtered.filter((p) => p.type === 'fleche')

  // "Grille du jour" : la première non encore jouée, sinon la première tout court.
  const featured = puzzles.find((p) => !(p.id in myScores)) || puzzles[0]

  const renderRow = (p) => {
    const c = LEVEL_CHIP[p.cecr_level] || LEVEL_CHIP.A1
    return (
      <div key={p.id} className="wg2-row" onClick={() => navigate(`/word-puzzle/${p.id}`)}>
        <span className="wg2-row-size" style={{ background: c.bg, color: c.fg }}>{p.rows}×{p.cols}</span>
        <div style={{ flex: 1, minWidth: 0 }}>
          <div className="wg2-row-title">{p.title}</div>
          <div className="wg2-row-sub">{myScores[p.id] ? `Ton meilleur temps : ${formatTime(myScores[p.id])}` : `${playerCounts[p.id] || 0} joueur${(playerCounts[p.id] || 0) > 1 ? 's' : ''} l'ont jouée`}</div>
        </div>
        <span className="wg2-row-level" style={{ background: c.bg, color: c.fg }}>{p.cecr_level}</span>
      </div>
    )
  }

  return (
    <AppLayout>
      <div className="page wg2-page">
        <Link to="/practice" className="sc2-back">← Pratiquer</Link>
        <p className="wg2-title">🧩 Jeux de mots</p>
        <p className="wg2-subtitle">Affronte le chrono, compare ton temps aux autres joueurs sur le classement partagé.</p>

        <div className="sc2-filters" style={{ marginBottom: '8px' }}>
          {GAME_TABS.map((t) => (
            <span key={t.key} className={`sc2-filter-chip ${typeFilter === t.key ? 'active' : ''}`} style={typeFilter === t.key ? { background: t.bg, borderColor: t.bd, color: t.fg } : {}} onClick={() => setTypeFilter(t.key)}>{t.label}</span>
          ))}
        </div>
        <div className="sc2-filters" style={{ marginBottom: '14px' }}>
          <span className={`b2-filter-chip ${levelFilter === 'all' ? 'active' : ''}`} onClick={() => setLevelFilter('all')}>Tous niveaux</span>
          {availableLevels.map((lvl) => (
            <span key={lvl} className={`b2-filter-chip ${levelFilter === lvl ? 'active' : ''}`} onClick={() => setLevelFilter(lvl)}>{lvl}</span>
          ))}
        </div>

        {featured && (
          <div className="wg2-featured" onClick={() => navigate(`/word-puzzle/${featured.id}`)}>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
              <span className="wg2-featured-eyebrow">🔥 {myScores[featured.id] ? 'À rejouer' : 'Grille suggérée'}</span>
              <span className="wg2-featured-level">{featured.cecr_level}</span>
            </div>
            <div className="wg2-featured-title">{featured.type === 'crossword' ? '✏️' : '➡️'} {featured.title}</div>
            <div className="wg2-featured-sub">{featured.rows}×{featured.cols} · {playerCounts[featured.id] || 0} joueur{(playerCounts[featured.id] || 0) > 1 ? 's' : ''} l'{(playerCounts[featured.id] || 0) > 1 ? 'ont' : 'a'} terminée</div>
          </div>
        )}

        {(typeFilter === 'all' || typeFilter === 'crossword') && crosswords.length > 0 && (
          <>
            <div className="sc2-section-head"><span style={{ color: '#B3402F' }}>✏️ Mots croisés</span><span className="sc2-section-line" /><span style={{ fontWeight: 700, fontSize: '11px', color: 'var(--text-secondary)', textTransform: 'none', letterSpacing: 0 }}>{crosswords.length} grilles</span></div>
            {crosswords.map(renderRow)}
          </>
        )}

        {(typeFilter === 'all' || typeFilter === 'fleche') && fleches.length > 0 && (
          <>
            <div className="sc2-section-head" style={{ marginTop: '14px' }}><span style={{ color: 'var(--accent,#2563EB)' }}>➡️ Mots fléchés</span><span className="sc2-section-line" /><span style={{ fontWeight: 700, fontSize: '11px', color: 'var(--text-secondary)', textTransform: 'none', letterSpacing: 0 }}>{fleches.length} grilles</span></div>
            {fleches.map(renderRow)}
          </>
        )}

        {filtered.length === 0 && <p className="progress-card-sub">Aucune grille disponible pour ce filtre.</p>}
      </div>
    </AppLayout>
  )
}

export default WordGamesLibrary

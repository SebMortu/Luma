import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import AppLayout from '../components/AppLayout.jsx'

const LEVEL_CHIP_COLORS = {
  A0: { bg: '#DCEFFB', bd: '#B7DEF7', fg: '#1E4A72' },
  A1: { bg: '#E4F3D2', bd: '#CBE8A8', fg: '#3E5410' },
  A2: { bg: '#FFE9D6', bd: '#FFD2A8', fg: '#8A4A12' },
  B1: { bg: '#FDE2E0', bd: '#FBC3C0', fg: '#8A2E24' },
  B2: { bg: '#E7E1FB', bd: '#D0C4F7', fg: '#4B2E8A' },
  C1: { bg: '#DCE1EC', bd: '#C0C8DC', fg: '#28324A' },
}

function BooksLibrary() {
  const { user } = useAuth()
  const navigate = useNavigate()
  const [books, setBooks] = useState([])
  const [volumes, setVolumes] = useState([])
  const [progressMap, setProgressMap] = useState({})
  const [levelFilter, setLevelFilter] = useState('all')
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      const { data: settings } = await supabase.from('user_settings').select('active_language_id').eq('user_id', user.id).single()
      const { data: booksData } = await supabase
        .from('books').select('*').eq('language_id', settings.active_language_id).is('series_id', null).order('position')
      const { data: volumesData } = await supabase
        .from('books').select('*').eq('language_id', settings.active_language_id).not('series_id', 'is', null)
      const { data: progressData } = await supabase
        .from('user_book_progress').select('*').eq('user_id', user.id)

      const map = {}
      ;(progressData || []).forEach((p) => { map[p.book_id] = p })

      setBooks(booksData || [])
      setVolumes(volumesData || [])
      setProgressMap(map)
      setLoading(false)
    }
    load()
  }, [user.id])

  if (loading) return <AppLayout><div className="page"><p>Chargement...</p></div></AppLayout>

  // La lecture "en cours" : un livre autonome OU un tome de série, avec
  // progression existante, non terminée, la plus avancée.
  const inProgressCandidates = [...books, ...volumes]
    .map((b) => ({ book: b, progress: progressMap[b.id] }))
    .filter((x) => x.progress && !x.progress.completed)
    .sort((a, b) => (b.progress.current_page || 0) - (a.progress.current_page || 0))
  const inProgress = inProgressCandidates[0]

  const levels = [...new Set(books.map((b) => b.cecr_level))].sort()
  const otherBooks = books.filter((b) => !inProgress || b.id !== inProgress.book.id)
  const filteredBooks = levelFilter === 'all' ? otherBooks : otherBooks.filter((b) => b.cecr_level === levelFilter)

  return (
    <AppLayout>
      <div className="page b2-page">
        <p className="b2-title">📖 Livre</p>
        <p className="b2-subtitle">Des histoires à ton niveau. Touche une phrase pour la traduire.</p>

        {inProgress && (
          <div className="b2-current-card" onClick={() => navigate(`/books/${inProgress.book.id}`)}>
            <div className="b2-current-cover">
              <span style={{ fontSize: '44px' }}>{inProgress.book.cover_emoji}</span>
              <span className="b2-current-level">{inProgress.book.cecr_level}</span>
              <span className="b2-current-badge">Lecture en cours</span>
            </div>
            <div style={{ padding: '17px' }}>
              <p className="b2-current-title">{inProgress.book.title}</p>
              <p className="b2-current-theme">
                {inProgress.book.series_id
                  ? `Tome ${inProgress.book.volume_number} · ${books.find((b) => b.id === inProgress.book.series_id)?.title || 'Série'}`
                  : inProgress.book.theme}
              </p>
              <p className="b2-current-desc">{inProgress.book.description}</p>
              <div className="b2-current-progress-row">
                <div className="d2-stat-track" style={{ flex: 1, background: '#EDF1F7' }}>
                  <div style={{ height: '100%', width: `${Math.round((inProgress.progress.current_page / inProgress.book.total_pages) * 100)}%`, background: 'linear-gradient(90deg,#A3E635,#3B82F6)', borderRadius: '5px' }} />
                </div>
                <span className="b2-current-page">Page {inProgress.progress.current_page} / {inProgress.book.total_pages}</span>
              </div>
              <button className="d2-cta" style={{ marginTop: '14px', padding: '15px' }}>Reprendre la lecture</button>
            </div>
          </div>
        )}

        <div className="b2-filters">
          <span className={`b2-filter-chip ${levelFilter === 'all' ? 'active' : ''}`} onClick={() => setLevelFilter('all')}>Tous</span>
          {levels.map((lvl) => {
            const c = LEVEL_CHIP_COLORS[lvl] || LEVEL_CHIP_COLORS.A1
            return (
              <span
                key={lvl}
                className="b2-filter-chip"
                style={levelFilter === lvl ? { background: c.bg, borderColor: c.bd, color: c.fg } : {}}
                onClick={() => setLevelFilter(lvl)}
              >
                {lvl}
              </span>
            )
          })}
        </div>

        {filteredBooks.map((b) => {
          const progress = progressMap[b.id]
          return (
            <div key={b.id} className="b2-book-row" onClick={() => navigate(b.is_series ? `/books/series/${b.id}` : `/books/${b.id}`)}>
              <div className="b2-book-cover">{b.cover_emoji}</div>
              <div style={{ flex: 1, minWidth: 0 }}>
                <div style={{ display: 'flex', alignItems: 'baseline', gap: '8px' }}>
                  <span className="b2-book-title">{b.title}</span>
                  <span className="b2-book-level">{b.cecr_level}</span>
                </div>
                <div className="b2-book-tag">{b.theme}</div>
                <div className="b2-book-desc">
                  {b.is_series ? 'Plusieurs tomes disponibles' : progress?.completed ? 'Terminé ✅' : `${b.total_pages} pages`}
                </div>
              </div>
            </div>
          )
        })}

        {books.length === 0 && <p className="progress-card-sub">Pas encore de livre disponible pour ce niveau.</p>}
      </div>
    </AppLayout>
  )
}

export default BooksLibrary

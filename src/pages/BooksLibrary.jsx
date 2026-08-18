import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import AppLayout from '../components/AppLayout.jsx'

function BooksLibrary() {
  const { user } = useAuth()
  const navigate = useNavigate()
  const [books, setBooks] = useState([])
  const [progressMap, setProgressMap] = useState({})
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      const { data: settings } = await supabase.from('user_settings').select('active_language_id').eq('user_id', user.id).single()
      const { data: booksData } = await supabase
        .from('books').select('*').eq('language_id', settings.active_language_id).is('series_id', null).order('position')
      const { data: progressData } = await supabase
        .from('user_book_progress').select('*').eq('user_id', user.id)

      const map = {}
      ;(progressData || []).forEach((p) => { map[p.book_id] = p })

      setBooks(booksData || [])
      setProgressMap(map)
      setLoading(false)
    }
    load()
  }, [user.id])

  if (loading) return <AppLayout><div className="page"><p>Chargement...</p></div></AppLayout>

  return (
    <AppLayout>
      <div className="page">
        <h1>📖 Livre</h1>
        <p className="dashboard-goal">Des histoires en anglais à ton niveau. Touche une phrase pour la traduire.</p>

        <div className="book-grid">
          {books.map((b) => {
            const progress = progressMap[b.id]
            const pct = progress && b.total_pages ? Math.round((progress.current_page / b.total_pages) * 100) : 0
            return (
              <div
                key={b.id}
                className="book-card clickable"
                onClick={() => navigate(b.is_series ? `/books/series/${b.id}` : `/books/${b.id}`)}
              >
                <div className="book-cover">
                  <span className="book-cover-emoji">{b.cover_emoji}</span>
                  <span className="book-cover-level">{b.cecr_level}</span>
                  {b.is_series && <span className="book-cover-series">Plusieurs tomes</span>}
                </div>
                <div className="book-card-info">
                  <p className="book-card-title">{b.title}</p>
                  <p className="book-card-theme">{b.theme}</p>
                  <p className="book-card-desc">{b.description}</p>
                  {b.is_series ? (
                    <p className="progress-card-sub">Voir les tomes →</p>
                  ) : progress ? (
                    <div className="book-progress-mini">
                      <div className="progress-bar-track">
                        <div className="progress-bar-fill" style={{ width: `${pct}%` }} />
                      </div>
                      <p className="progress-card-sub">
                        {progress.completed ? 'Terminé ✅' : `Page ${progress.current_page} / ${b.total_pages}`}
                      </p>
                    </div>
                  ) : (
                    <p className="progress-card-sub">{b.total_pages} pages</p>
                  )}
                </div>
              </div>
            )
          })}
        </div>

        {books.length === 0 && <p className="progress-card-sub">Pas encore de livre disponible pour ce niveau.</p>}
      </div>
    </AppLayout>
  )
}

export default BooksLibrary

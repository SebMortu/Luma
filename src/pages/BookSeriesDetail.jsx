import { useEffect, useState } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import AppLayout from '../components/AppLayout.jsx'

function BookSeriesDetail() {
  const { seriesId } = useParams()
  const { user } = useAuth()
  const navigate = useNavigate()
  const [series, setSeries] = useState(null)
  const [volumes, setVolumes] = useState([])
  const [progressMap, setProgressMap] = useState({})
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      const { data: seriesData } = await supabase.from('books').select('*').eq('id', seriesId).single()
      const { data: volumesData } = await supabase
        .from('books').select('*').eq('series_id', seriesId).order('volume_number')
      const { data: progressData } = await supabase
        .from('user_book_progress').select('*').eq('user_id', user.id)

      const map = {}
      ;(progressData || []).forEach((p) => { map[p.book_id] = p })

      setSeries(seriesData)
      setVolumes(volumesData || [])
      setProgressMap(map)
      setLoading(false)
    }
    load()
  }, [seriesId, user.id])

  if (loading || !series) return <AppLayout><div className="page"><p>Chargement...</p></div></AppLayout>

  return (
    <AppLayout>
      <div className="page">
        <button className="back-link" onClick={() => navigate('/books')}>← Retour à la bibliothèque</button>
        <h1>{series.cover_emoji} {series.title}</h1>
        <p className="dashboard-goal">{series.description}</p>

        <div className="book-volumes-list">
          {volumes.map((v) => {
            const progress = progressMap[v.id]
            const pct = progress && v.total_pages ? Math.round((progress.current_page / v.total_pages) * 100) : 0
            return (
              <div key={v.id} className="unit-card clickable" onClick={() => navigate(`/books/${v.id}`)}>
                <div className="unit-icon">📗</div>
                <div style={{ flex: 1 }}>
                  <p className="unit-title">Tome {v.volume_number} — {v.title}</p>
                  {progress ? (
                    <div className="book-progress-mini">
                      <div className="progress-bar-track">
                        <div className="progress-bar-fill" style={{ width: `${pct}%` }} />
                      </div>
                      <p className="progress-card-sub">
                        {progress.completed ? 'Terminé ✅' : `Page ${progress.current_page} / ${v.total_pages}`}
                      </p>
                    </div>
                  ) : (
                    <p className="unit-status">{v.total_pages} pages</p>
                  )}
                </div>
              </div>
            )
          })}
        </div>

        {volumes.length === 0 && <p className="progress-card-sub">Les tomes de cette série arrivent bientôt.</p>}
      </div>
    </AppLayout>
  )
}

export default BookSeriesDetail

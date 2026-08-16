import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import AppLayout from '../components/AppLayout.jsx'

function WordGamesLibrary() {
  const { user } = useAuth()
  const navigate = useNavigate()
  const [puzzles, setPuzzles] = useState([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      const { data: settings } = await supabase.from('user_settings').select('active_language_id').eq('user_id', user.id).single()
      const { data } = await supabase.from('word_puzzles').select('*').eq('language_id', settings.active_language_id).order('created_at')
      setPuzzles(data || [])
      setLoading(false)
    }
    load()
  }, [user.id])

  if (loading) return <AppLayout><div className="page"><p>Chargement...</p></div></AppLayout>

  const crosswords = puzzles.filter((p) => p.type === 'crossword')
  const fleches = puzzles.filter((p) => p.type === 'fleche')

  return (
    <AppLayout>
      <div className="page">
        <h1>🧩 Jeux de mots</h1>
        <p className="dashboard-goal">Affronte le chrono, compare ton temps aux autres joueurs sur le classement partagé.</p>

        <p className="cecr-level-header">✏️ Mots croisés</p>
        <div className="unit-list">
          {crosswords.map((p) => (
            <div key={p.id} className="unit-card clickable" onClick={() => navigate(`/word-puzzle/${p.id}`)}>
              <div className="unit-icon">🧩</div>
              <div>
                <p className="unit-title">{p.title}</p>
                <p className="unit-status">{p.cecr_level} · {p.rows}×{p.cols}</p>
              </div>
            </div>
          ))}
        </div>

        <p className="cecr-level-header">➡️ Mots fléchés</p>
        <div className="unit-list">
          {fleches.map((p) => (
            <div key={p.id} className="unit-card clickable" onClick={() => navigate(`/word-puzzle/${p.id}`)}>
              <div className="unit-icon">➡️</div>
              <div>
                <p className="unit-title">{p.title}</p>
                <p className="unit-status">{p.cecr_level} · {p.rows}×{p.cols}</p>
              </div>
            </div>
          ))}
        </div>

        {puzzles.length === 0 && <p>Aucune grille disponible pour l'instant.</p>}
      </div>
    </AppLayout>
  )
}

export default WordGamesLibrary

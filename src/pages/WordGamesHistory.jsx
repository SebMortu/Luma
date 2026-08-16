import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import { loadWordPuzzleHistory, formatTime } from '../lib/wordPuzzle.js'
import AppLayout from '../components/AppLayout.jsx'

function WordGamesHistory() {
  const { user } = useAuth()
  const [history, setHistory] = useState([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      const h = await loadWordPuzzleHistory(supabase, user.id)
      setHistory(h)
      setLoading(false)
    }
    load()
  }, [user.id])

  if (loading) return <AppLayout><div className="page"><p>Chargement...</p></div></AppLayout>

  return (
    <AppLayout>
      <div className="page">
        <Link to="/profile" className="back-link">← Retour au profil</Link>
        <h1>🧩 Historique complet</h1>
        <p className="dashboard-goal">{history.length} grille{history.length > 1 ? 's' : ''} résolue{history.length > 1 ? 's' : ''} au total.</p>

        <div className="unit-list">
          {history.map((h) => (
            <div key={h.puzzleId} className="unit-card">
              <div className="unit-icon">
                {h.rank === 1 ? '🥇' : h.rank === 2 ? '🥈' : h.rank === 3 ? '🥉' : `#${h.rank}`}
              </div>
              <div>
                <p className="unit-title">{h.title}</p>
                <p className="unit-status">{formatTime(h.bestTime)} · {h.rank}ᵉ sur {h.totalPlayers} joueur{h.totalPlayers > 1 ? 's' : ''}</p>
              </div>
            </div>
          ))}
        </div>

        {history.length === 0 && <p>Aucune grille résolue pour l'instant.</p>}
      </div>
    </AppLayout>
  )
}

export default WordGamesHistory

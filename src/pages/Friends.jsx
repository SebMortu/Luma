import { useEffect, useState } from 'react'
import { useAuth } from '../contexts/AuthContext.jsx'
import AppLayout from '../components/AppLayout.jsx'
import {
  searchUsersByUsername, sendFriendRequest, acceptFriendRequest,
  declineOrRemoveFriendship, getPendingRequests, getFriendsLeaderboard,
} from '../lib/social.js'

function Friends() {
  const { user } = useAuth()
  const [leaderboard, setLeaderboard] = useState([])
  const [pending, setPending] = useState([])
  const [search, setSearch] = useState('')
  const [searchResults, setSearchResults] = useState([])
  const [loading, setLoading] = useState(true)
  const [message, setMessage] = useState('')

  const loadAll = async () => {
    const [lb, req] = await Promise.all([
      getFriendsLeaderboard(user.id),
      getPendingRequests(user.id),
    ])
    setLeaderboard(lb)
    setPending(req)
    setLoading(false)
  }

  useEffect(() => { loadAll() }, [user.id])

  useEffect(() => {
    if (search.trim().length < 2) { setSearchResults([]); return }
    const t = setTimeout(async () => {
      const results = await searchUsersByUsername(search, user.id)
      setSearchResults(results)
    }, 300)
    return () => clearTimeout(t)
  }, [search, user.id])

  const handleAdd = async (addresseeId) => {
    try {
      await sendFriendRequest(user.id, addresseeId)
      setMessage('Demande envoyée !')
      setSearchResults((prev) => prev.filter((r) => r.user_id !== addresseeId))
      setTimeout(() => setMessage(''), 2500)
    } catch (err) {
      setMessage(err.message.includes('duplicate') ? 'Demande déjà envoyée.' : 'Erreur : ' + err.message)
    }
  }

  const handleAccept = async (friendshipId) => {
    await acceptFriendRequest(friendshipId)
    await loadAll()
  }

  const handleDecline = async (friendshipId) => {
    await declineOrRemoveFriendship(friendshipId)
    await loadAll()
  }

  if (loading) return <AppLayout><div className="page"><p>Chargement...</p></div></AppLayout>

  return (
    <AppLayout>
      <div className="page">
        <h1>Amis</h1>
        <p className="dashboard-goal">Classement hebdomadaire d'XP entre amis — remis à zéro chaque lundi.</p>

        <input
          type="text"
          className="auth-input"
          placeholder="Chercher un pseudo..."
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          style={{ marginBottom: '0.75rem' }}
        />
        {message && <p className="feedback correct">{message}</p>}
        {searchResults.length > 0 && (
          <div className="friend-search-results">
            {searchResults.map((r) => (
              <div key={r.user_id} className="friend-search-row">
                <span>{r.username}</span>
                <button className="btn-secondary" style={{ width: 'auto', padding: '6px 14px' }} onClick={() => handleAdd(r.user_id)}>
                  Ajouter
                </button>
              </div>
            ))}
          </div>
        )}

        {pending.length > 0 && (
          <>
            <h2>Demandes en attente</h2>
            {pending.map((p) => (
              <div key={p.id} className="friend-search-row">
                <span>{p.requesterUsername}</span>
                <div style={{ display: 'flex', gap: '6px' }}>
                  <button className="btn-primary" style={{ width: 'auto', padding: '6px 14px', marginTop: 0 }} onClick={() => handleAccept(p.id)}>Accepter</button>
                  <button className="btn-secondary" style={{ width: 'auto', padding: '6px 14px' }} onClick={() => handleDecline(p.id)}>Refuser</button>
                </div>
              </div>
            ))}
          </>
        )}

        <h2>Classement de la semaine</h2>
        {leaderboard.length <= 1 && (
          <p className="progress-card-sub">Ajoute des amis pour voir un classement ici !</p>
        )}
        <div className="leaderboard-list">
          {leaderboard.map((entry, i) => (
            <div key={entry.user_id} className={`leaderboard-row ${entry.user_id === user.id ? 'is-me' : ''}`}>
              <span className="leaderboard-rank">{i + 1}</span>
              <span className="leaderboard-name">{entry.username}{entry.user_id === user.id ? ' (toi)' : ''}</span>
              <span className="leaderboard-streak">🔥 {entry.current_streak || 0}</span>
              <span className="leaderboard-xp">{entry.weekly_xp} XP</span>
            </div>
          ))}
        </div>
      </div>
    </AppLayout>
  )
}

export default Friends

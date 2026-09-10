import { useEffect, useState } from 'react'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import CharacterAvatar from '../components/CharacterAvatar.jsx'
import AppLayout from '../components/AppLayout.jsx'
import {
  searchUsersByUsername, sendFriendRequest, acceptFriendRequest,
  declineOrRemoveFriendship, getPendingRequests, getFriendsLeaderboard,
} from '../lib/social.js'

function Friends() {
  const { user } = useAuth()
  const [leaderboard, setLeaderboard] = useState([])
  const [charactersById, setCharactersById] = useState({})
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

    const charIds = [...new Set(lb.map((e) => e.guide_character_id).filter(Boolean))]
    if (charIds.length > 0) {
      const { data: chars } = await supabase.from('characters').select('*').in('id', charIds)
      const map = {}
      ;(chars || []).forEach((c) => { map[c.id] = c })
      setCharactersById(map)
    }
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

  const copyUsername = () => {
    const me = leaderboard.find((e) => e.user_id === user.id)
    navigator.clipboard.writeText(me?.username || '')
    setMessage('Pseudo copié — partage-le à un ami !')
    setTimeout(() => setMessage(''), 2500)
  }

  if (loading) return <AppLayout><div className="page"><p>Chargement...</p></div></AppLayout>

  const hasFriends = leaderboard.length > 1
  const me = leaderboard.find((e) => e.user_id === user.id)

  const renderAvatar = (entry, size) => {
    const char = charactersById[entry.guide_character_id]
    if (char) return <CharacterAvatar character={char} state="neutral" size={size} />
    return <span className="fr2-avatar-placeholder" style={{ width: size, height: size }}>?</span>
  }

  return (
    <AppLayout>
      <div className="page fr2-page">
        <div className="fr2-top-row">
          <span className="fr2-title">👥 Amis</span>
          <span className="fr2-invite-btn" onClick={copyUsername}>+ Inviter</span>
        </div>
        <div className="fr2-search">
          <span>🔍</span>
          <input type="text" placeholder="Chercher un pseudo…" value={search} onChange={(e) => setSearch(e.target.value)} />
        </div>

        {message && <p className="feedback correct">{message}</p>}

        {searchResults.length > 0 && (
          <div className="fr2-card" style={{ marginTop: '10px' }}>
            {searchResults.map((r) => (
              <div key={r.user_id} className="fr2-simple-row">
                <span style={{ fontWeight: 700, fontSize: '13px', color: 'var(--text-primary)' }}>{r.username}</span>
                <span className="fr2-add-btn" onClick={() => handleAdd(r.user_id)}>Ajouter</span>
              </div>
            ))}
          </div>
        )}

        {pending.length > 0 && (
          <div className="fr2-card" style={{ marginTop: '10px' }}>
            <div style={{ fontWeight: 800, fontSize: '13px', color: 'var(--text-primary)', marginBottom: '8px' }}>Demandes en attente</div>
            {pending.map((p) => (
              <div key={p.id} className="fr2-simple-row">
                <span style={{ fontWeight: 700, fontSize: '13px', color: 'var(--text-primary)' }}>{p.requesterUsername}</span>
                <div style={{ display: 'flex', gap: '7px' }}>
                  <span className="fr2-add-btn" onClick={() => handleAccept(p.id)}>Accepter</span>
                  <span className="fr2-decline-btn" onClick={() => handleDecline(p.id)}>Refuser</span>
                </div>
              </div>
            ))}
          </div>
        )}

        {!hasFriends ? (
          <>
            <div className="fr2-empty-hero">
              <div className="fr2-empty-avatars">
                <span className="fr2-empty-ava">🦊</span>
                <span className="fr2-empty-ava ghost">?</span>
                <span className="fr2-empty-ava ghost">?</span>
              </div>
              <div className="fr2-empty-title">Ton classement t'attend</div>
              <div className="fr2-empty-sub">Ajoute des amis pour comparer vos XP chaque semaine. Remise à zéro tous les lundis.</div>
              <button className="fr2-empty-cta" onClick={copyUsername}>Inviter un ami</button>
            </div>

            {me && (
              <div className="fr2-card" style={{ marginTop: '14px' }}>
                <div style={{ fontWeight: 800, fontSize: '14.5px', color: 'var(--text-primary)', marginBottom: '10px' }}>Ta position actuelle</div>
                <div className="fr2-row fr2-row-me">
                  <span className="fr2-rank">1</span>
                  {renderAvatar(me, 44)}
                  <div style={{ flex: 1, minWidth: 0 }}>
                    <div className="fr2-name-row"><span className="fr2-name">{me.username}</span><span className="fr2-me-tag">toi</span></div>
                    <div className="fr2-sub" style={{ color: '#3B6BB5' }}>C'est toi</div>
                  </div>
                  <div style={{ textAlign: 'right', flex: 'none' }}>
                    <div className="fr2-xp" style={{ color: 'var(--accent,#2563EB)' }}>{me.weekly_xp} XP</div>
                    <div className="fr2-streak">🔥 {me.current_streak || 0}</div>
                  </div>
                </div>
              </div>
            )}
          </>
        ) : (
          <div className="fr2-card" style={{ marginTop: '14px' }}>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline' }}>
              <span style={{ fontWeight: 800, fontSize: '14.5px', color: 'var(--text-primary)' }}>Classement de la semaine</span>
              <span style={{ fontWeight: 600, fontSize: '11px', color: 'var(--text-secondary)' }}>reset lundi</span>
            </div>
            <div style={{ marginTop: '13px', display: 'flex', flexDirection: 'column', gap: '8px' }}>
              {leaderboard.map((entry, i) => (
                <div key={entry.user_id} className={`fr2-row ${entry.user_id === user.id ? 'fr2-row-me' : ''}`}>
                  <span className="fr2-rank">{i + 1}</span>
                  {renderAvatar(entry, 44)}
                  <div style={{ flex: 1, minWidth: 0 }}>
                    <div className="fr2-name-row">
                      <span className="fr2-name">{entry.username}</span>
                      {entry.user_id === user.id && <span className="fr2-me-tag">toi</span>}
                    </div>
                    <div className="fr2-sub">Série en cours</div>
                  </div>
                  <div style={{ textAlign: 'right', flex: 'none' }}>
                    <div className="fr2-xp">{entry.weekly_xp} XP</div>
                    <div className="fr2-streak">🔥 {entry.current_streak || 0}</div>
                  </div>
                </div>
              ))}
            </div>
          </div>
        )}
      </div>
    </AppLayout>
  )
}

export default Friends

import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { useAuth } from '../contexts/AuthContext.jsx'
import { countDueVocab } from '../lib/progress.js'
import { getFriendsLeaderboard } from '../lib/social.js'
import AppLayout from '../components/AppLayout.jsx'

const ROWS = [
  { path: '/vocab-themes', icon: '📚', bg: '#FDEBD3', title: 'Vocabulaire par thème', desc: 'Explore tes sujets préférés, tous niveaux mélangés.' },
  { path: '/word-games', icon: '🧩', bg: '#E3E1FB', title: 'Jeux de mots', desc: 'Mots croisés et jeux de vocabulaire.' },
]

function Practice() {
  const { user } = useAuth()
  const navigate = useNavigate()
  const [dueVocabCount, setDueVocabCount] = useState(0)
  const [friendRank, setFriendRank] = useState(null)

  useEffect(() => {
    async function load() {
      const [due, ranked] = await Promise.all([
        countDueVocab(user.id),
        getFriendsLeaderboard(user.id).catch(() => []),
      ])
      setDueVocabCount(due)
      const idx = ranked.findIndex((p) => p.user_id === user.id)
      if (idx !== -1) setFriendRank({ rank: idx + 1, xp: ranked[idx].weekly_xp })
    }
    load()
  }, [user.id])

  return (
    <AppLayout>
      <div className="page p2-page">
        <p className="p2-title">🎮 Pratiquer</p>
        <p className="p2-subtitle">Mets en pratique ce que tu as appris, de façon ludique.</p>

        <div className="p2-featured-row">
          <div className="p2-featured-tile p2-featured-blue" onClick={() => navigate('/scenarios')}>
            <div style={{ fontSize: '24px' }}>🎭</div>
            <div>
              <div className="p2-featured-title">Scénarios</div>
              <div className="p2-featured-desc">Dialogues à embranchements, avec traduction</div>
            </div>
            <div className="p2-featured-meta">Nouveaux dialogues</div>
          </div>
          <div className="p2-featured-tile p2-featured-lime" onClick={() => navigate('/vocab-review')}>
            <div style={{ fontSize: '24px' }}>🗂️</div>
            <div>
              <div className="p2-featured-title" style={{ color: '#3E5410' }}>Révision</div>
              <div className="p2-featured-desc" style={{ color: '#4F6B1C' }}>Flashcards du vocabulaire sauvegardé</div>
            </div>
            <div className="p2-featured-meta" style={{ color: '#4F6B1C' }}>
              {dueVocabCount > 0 ? `${dueVocabCount} mot${dueVocabCount > 1 ? 's' : ''} à revoir` : 'Tout est à jour'}
            </div>
          </div>
        </div>

        {ROWS.map((item) => (
          <div key={item.path} className="p2-row" onClick={() => navigate(item.path)}>
            <span className="p2-row-icon" style={{ background: item.bg }}>{item.icon}</span>
            <div style={{ flex: 1, minWidth: 0 }}>
              <div className="p2-row-title">{item.title}</div>
              <div className="p2-row-desc">{item.desc}</div>
            </div>
            <span className="p2-row-chevron">›</span>
          </div>
        ))}

        <div className="p2-row p2-row-coral" onClick={() => navigate('/friends')}>
          <span className="p2-row-icon" style={{ background: '#FFD9D3' }}>👥</span>
          <div style={{ flex: 1 }}>
            <div className="p2-row-title" style={{ color: '#B3402F' }}>Amis</div>
            <div className="p2-row-desc" style={{ color: '#A85445' }}>
              {friendRank ? `Tu es ${friendRank.rank}${friendRank.rank === 1 ? 'er' : 'ᵉ'} cette semaine · ${friendRank.xp} XP` : 'Rejoins le classement de la semaine'}
            </div>
          </div>
          <span className="p2-row-chevron" style={{ color: '#B3402F' }}>›</span>
        </div>
      </div>
    </AppLayout>
  )
}

export default Practice

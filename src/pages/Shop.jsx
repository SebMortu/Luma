import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import AppLayout from '../components/AppLayout.jsx'

const CATEGORY_LABELS = {
  streak_freeze: '🧊 Protection de série',
  profile_frame: '🖼️ Cadres de profil',
  badge: '🏅 Badges',
}

function Shop() {
  const { user } = useAuth()
  const [items, setItems] = useState([])
  const [ownedIds, setOwnedIds] = useState(new Set())
  const [balance, setBalance] = useState(0)
  const [equippedFrameId, setEquippedFrameId] = useState(null)
  const [streakFreezes, setStreakFreezes] = useState(0)
  const [loading, setLoading] = useState(true)
  const [message, setMessage] = useState(null)

  const loadAll = async () => {
    const { data: itemsData } = await supabase.from('shop_items').select('*').order('category').order('position')
    const { data: purchases } = await supabase.from('user_shop_purchases').select('item_id').eq('user_id', user.id)
    const { data: settings } = await supabase
      .from('user_settings').select('lums_balance, equipped_frame_id, streak_freezes').eq('user_id', user.id).single()
    setItems(itemsData || [])
    setOwnedIds(new Set((purchases || []).map((p) => p.item_id)))
    setBalance(settings?.lums_balance || 0)
    setEquippedFrameId(settings?.equipped_frame_id || null)
    setStreakFreezes(settings?.streak_freezes || 0)
    setLoading(false)
  }

  useEffect(() => { loadAll() }, [user.id])

  const handleBuy = async (item) => {
    setMessage(null)
    if (balance < item.price) {
      setMessage({ type: 'error', text: "Pas assez de Lums pour cet article." })
      return
    }
    if (item.category === 'streak_freeze') {
      // Consommable, pas de limite de possession — chaque achat ajoute une protection.
      await supabase.from('user_settings').update({
        lums_balance: balance - item.price,
        streak_freezes: streakFreezes + 1,
      }).eq('user_id', user.id)
      setMessage({ type: 'success', text: 'Protection de série ajoutée !' })
    } else {
      await supabase.from('user_settings').update({ lums_balance: balance - item.price }).eq('user_id', user.id)
      await supabase.from('user_shop_purchases').insert({ user_id: user.id, item_id: item.id })
      setMessage({ type: 'success', text: `${item.name} débloqué !` })
    }
    await loadAll()
  }

  const handleEquipFrame = async (item) => {
    const newValue = equippedFrameId === item.id ? null : item.id
    setEquippedFrameId(newValue)
    await supabase.from('user_settings').update({ equipped_frame_id: newValue }).eq('user_id', user.id)
  }

  if (loading) return <AppLayout><div className="page"><p>Chargement...</p></div></AppLayout>

  const grouped = ['streak_freeze', 'profile_frame', 'badge'].map((cat) => ({
    category: cat,
    items: items.filter((i) => i.category === cat),
  }))

  return (
    <AppLayout>
      <div className="page shop-page">
        <Link to="/dashboard" className="sc2-back">← Accueil</Link>
        <div className="shop-header">
          <p className="shop-title">🪙 Boutique</p>
          <div className="shop-balance">{balance} Lums</div>
        </div>
        <p className="shop-subtitle">Dépense les Lums gagnés en fin de leçon.</p>

        {message && <p className={message.type === 'error' ? 'feedback incorrect' : 'feedback correct'}>{message.text}</p>}

        {grouped.map((g) => (
          <div key={g.category} className="shop-section">
            <div className="sc2-section-head">
              <span>{CATEGORY_LABELS[g.category]}</span>
              <span className="sc2-section-line" />
            </div>
            <div className="shop-grid">
              {g.items.map((item) => {
                const owned = ownedIds.has(item.id)
                const isFrame = item.category === 'profile_frame'
                const isFreeze = item.category === 'streak_freeze'
                return (
                  <div key={item.id} className="shop-card">
                    <div className="shop-card-visual" style={isFrame ? { border: item.frame_css, borderRadius: '50%' } : {}}>
                      {!isFrame && <span style={{ fontSize: '26px' }}>{item.emoji}</span>}
                    </div>
                    <p className="shop-card-name">{item.name}</p>
                    <p className="shop-card-desc">{item.description}</p>
                    {isFreeze ? (
                      <button className="shop-buy-btn" onClick={() => handleBuy(item)} disabled={balance < item.price}>
                        🪙 {item.price}
                      </button>
                    ) : owned ? (
                      isFrame ? (
                        <button className={`shop-equip-btn ${equippedFrameId === item.id ? 'equipped' : ''}`} onClick={() => handleEquipFrame(item)}>
                          {equippedFrameId === item.id ? '✓ Équipé' : 'Équiper'}
                        </button>
                      ) : (
                        <span className="shop-owned-tag">✓ Possédé</span>
                      )
                    ) : (
                      <button className="shop-buy-btn" onClick={() => handleBuy(item)} disabled={balance < item.price}>
                        🪙 {item.price}
                      </button>
                    )}
                  </div>
                )
              })}
            </div>
          </div>
        ))}

        <div className="l2-tip" style={{ marginTop: '8px' }}>
          <span>💡</span>
          <span>D'autres catégories (cartes postales, histoires bonus) arrivent bientôt.</span>
        </div>
      </div>
    </AppLayout>
  )
}

export default Shop

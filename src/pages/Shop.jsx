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
const LUM_SOURCES = [
  { e: '📖', v: '3-10', t: 'Par leçon' },
  { e: '🎭', v: '10', t: 'Par scénario' },
  { e: '⚡', v: '2/juste', t: 'Défi verbes' },
]

function Shop() {
  const { user } = useAuth()
  const [items, setItems] = useState([])
  const [ownedIds, setOwnedIds] = useState(new Set())
  const [balance, setBalance] = useState(0)
  const [equippedFrameId, setEquippedFrameId] = useState(null)
  const [streakFreezes, setStreakFreezes] = useState(0)
  const [activeTab, setActiveTab] = useState('streak_freeze')
  const [showEarnInfo, setShowEarnInfo] = useState(false)
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
    if (balance < item.price) return
    if (item.category === 'streak_freeze') {
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

  const visibleItems = items.filter((i) => i.category === activeTab)
  const doneCounts = {
    profile_frame: `${items.filter((i) => i.category === 'profile_frame' && ownedIds.has(i.id)).length} / ${items.filter((i) => i.category === 'profile_frame').length} obtenus`,
    badge: `${items.filter((i) => i.category === 'badge').length} disponibles`,
    streak_freeze: `Tu en as ${streakFreezes}`,
  }

  return (
    <AppLayout>
      <div className="page shop2-page">
        <Link to="/dashboard" className="sc2-back">← Accueil</Link>

        <div className="shop2-hero">
          <div className="shop2-hero-top">
            <span className="shop2-hero-coin">🪙</span>
            <div style={{ flex: 1, minWidth: 0 }}>
              <div className="shop2-hero-balance">{balance} <span>Lums</span></div>
              <div className="shop2-hero-sub">Gagne-les en terminant tes leçons</div>
            </div>
            <span className="shop2-hero-how" onClick={() => setShowEarnInfo(!showEarnInfo)}>Comment ?</span>
          </div>
          {showEarnInfo && (
            <div className="shop2-sources-row">
              {LUM_SOURCES.map((s, i) => (
                <div key={i} className="shop2-source">
                  <div style={{ fontSize: '15px' }}>{s.e}</div>
                  <div className="shop2-source-value">{s.v}</div>
                  <div className="shop2-source-label">{s.t}</div>
                </div>
              ))}
            </div>
          )}
          <div className="shop2-tabs">
            {['streak_freeze', 'profile_frame', 'badge'].map((cat) => (
              <span key={cat} className={`shop2-tab ${activeTab === cat ? 'active' : ''}`} onClick={() => setActiveTab(cat)}>
                {CATEGORY_LABELS[cat]}
              </span>
            ))}
          </div>
        </div>

        {message && <p className="feedback correct">{message.text}</p>}

        <div className="sc2-section-head" style={{ marginTop: '4px' }}>
          <span>{CATEGORY_LABELS[activeTab]}</span>
          <span className="sc2-section-line" />
          <span style={{ fontWeight: 700, fontSize: '11px', color: 'var(--text-secondary)', textTransform: 'none', letterSpacing: 0 }}>{doneCounts[activeTab]}</span>
        </div>

        {activeTab === 'streak_freeze' && visibleItems.map((item) => (
          <div key={item.id} className="shop2-freeze-card">
            <span className="shop2-freeze-icon">🧊</span>
            <div style={{ flex: 1, minWidth: 0 }}>
              <div style={{ display: 'flex', alignItems: 'center', gap: '7px' }}>
                <span className="shop2-freeze-name">{item.name}</span>
                <span className="shop2-popular-tag">Populaire</span>
              </div>
              <div className="ob2-level-desc">{item.description} Tu en as {streakFreezes}.</div>
              <div className="shop2-freeze-buy-row">
                <button className="shop2-price-btn" onClick={() => handleBuy(item)} disabled={balance < item.price}>🪙 {item.price}</button>
                {balance < item.price && <span className="shop2-missing">Il te manque {item.price - balance} Lums</span>}
              </div>
            </div>
          </div>
        ))}

        {activeTab !== 'streak_freeze' && (
          <div className="shop-grid">
            {visibleItems.map((item) => {
              const owned = ownedIds.has(item.id)
              const isFrame = item.category === 'profile_frame'
              return (
                <div key={item.id} className="shop-card">
                  <div className="shop-card-visual" style={isFrame ? { border: item.frame_css, borderRadius: '50%' } : {}}>
                    {!isFrame && <span style={{ fontSize: '26px' }}>{item.emoji}</span>}
                  </div>
                  <p className="shop-card-name">{item.name}</p>
                  <p className="shop-card-desc">{item.description}</p>
                  {owned ? (
                    isFrame ? (
                      <button className={`shop-equip-btn ${equippedFrameId === item.id ? 'equipped' : ''}`} onClick={() => handleEquipFrame(item)}>
                        {equippedFrameId === item.id ? '✓ Équipé' : 'Équiper'}
                      </button>
                    ) : (
                      <span className="shop-owned-tag">✓ Possédé</span>
                    )
                  ) : (
                    <>
                      <button className="shop-buy-btn" onClick={() => handleBuy(item)} disabled={balance < item.price}>🪙 {item.price}</button>
                      {balance < item.price && <span className="shop2-missing" style={{ marginTop: '4px' }}>Il manque {item.price - balance}</span>}
                    </>
                  )}
                </div>
              )
            })}
          </div>
        )}

        <div className="l2-tip" style={{ marginTop: '14px' }}>
          <span>💡</span>
          <span>D'autres catégories (cartes postales, histoires bonus) arrivent bientôt.</span>
        </div>
      </div>
    </AppLayout>
  )
}

export default Shop

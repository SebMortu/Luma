import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import AppLayout from '../components/AppLayout.jsx'

const CATEGORY_LABELS = {
  quotidien: '🏙️ Vie quotidienne',
  fantastique: '🐉 Fantastique & aventure',
  culture: '🎭 Culture',
  pays: '✈️ Pays / immersion',
}

function ScenariosLibrary() {
  const { user } = useAuth()
  const navigate = useNavigate()
  const [themes, setThemes] = useState([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      const { data: settings } = await supabase.from('user_settings').select('active_language_id').eq('user_id', user.id).single()
      const { data } = await supabase.from('scenario_themes').select('*').eq('language_id', settings.active_language_id).order('position')
      setThemes(data || [])
      setLoading(false)
    }
    load()
  }, [user.id])

  const grouped = []
  themes.forEach((t) => {
    let g = grouped.find((x) => x.category === t.category)
    if (!g) { g = { category: t.category, themes: [] }; grouped.push(g) }
    g.themes.push(t)
  })

  if (loading) return <AppLayout><div className="page"><p>Chargement...</p></div></AppLayout>

  return (
    <AppLayout>
      <div className="page">
        <h1>🎭 Mises en situation</h1>
        <p className="dashboard-goal">Des dialogues interactifs pour pratiquer la compréhension en contexte réel.</p>

        {grouped.map((g) => (
          <div key={g.category}>
            <p className="cecr-level-header">{CATEGORY_LABELS[g.category] || g.category}</p>
            <div className="unit-list">
              {g.themes.map((t) => (
                <div key={t.id} className="unit-card clickable" onClick={() => navigate(`/scenarios/${t.id}`)}>
                  <div className="unit-icon">🎬</div>
                  <div>
                    <p className="unit-title">{t.title}</p>
                    <p className="unit-status">9 scénarios</p>
                  </div>
                </div>
              ))}
            </div>
          </div>
        ))}
      </div>
    </AppLayout>
  )
}

export default ScenariosLibrary

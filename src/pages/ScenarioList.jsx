import { useEffect, useState } from 'react'
import { useParams, useNavigate, Link } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import AppLayout from '../components/AppLayout.jsx'

const FORMAT_LABELS = { court: '⏱️ Court (< 5 min)', moyen: '⏱️ Moyen (5-10 min)', long: '⏱️ Long (10-20 min)' }

function ScenarioList() {
  const { themeId } = useParams()
  const navigate = useNavigate()
  const [theme, setTheme] = useState(null)
  const [scenarios, setScenarios] = useState([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      const { data: themeData } = await supabase.from('scenario_themes').select('*').eq('id', themeId).single()
      setTheme(themeData)
      const { data } = await supabase.from('scenarios').select('*').eq('theme_id', themeId)
      setScenarios((data || []).sort((a, b) => (a.format > b.format ? 1 : -1)))
      setLoading(false)
    }
    load()
  }, [themeId])

  if (loading) return <AppLayout><div className="page"><p>Chargement...</p></div></AppLayout>

  return (
    <AppLayout>
      <div className="page">
        <Link to="/scenarios" className="back-link">← Retour aux thématiques</Link>
        <h1>{theme?.title}</h1>

        <div className="unit-list">
          {scenarios.map((s) => (
            <div
              key={s.id}
              className={`unit-card ${s.is_playable ? 'clickable' : 'locked'}`}
              onClick={() => s.is_playable && navigate(`/scenario/${s.id}`)}
            >
              <div className={`unit-icon ${s.is_playable ? '' : ''}`}>{s.is_playable ? '▶️' : '🔒'}</div>
              <div>
                <p className="unit-title">{s.title}</p>
                <p className="unit-status">
                  {FORMAT_LABELS[s.format] || s.format} · {s.cecr_level}
                  {!s.is_playable && ' · Pas encore jouable'}
                </p>
              </div>
            </div>
          ))}
        </div>
      </div>
    </AppLayout>
  )
}

export default ScenarioList

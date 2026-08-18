import { useEffect, useState } from 'react'
import { useParams, useNavigate, Link } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import AppLayout from '../components/AppLayout.jsx'

const FORMAT_LABELS = { court: '⏱️ Court (< 2 min)', moyen: '⏱️ Moyen (2-4 min)', long: '⏱️ Long (4-6 min)' }

function ScenarioList() {
  const { themeId } = useParams()
  const { user } = useAuth()
  const navigate = useNavigate()
  const [theme, setTheme] = useState(null)
  const [scenarios, setScenarios] = useState([])
  const [endingsMap, setEndingsMap] = useState({})
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      const { data: themeData } = await supabase.from('scenario_themes').select('*').eq('id', themeId).single()
      setTheme(themeData)
      const { data } = await supabase.from('scenarios').select('*').eq('theme_id', themeId)
      const sorted = (data || []).sort((a, b) => (a.format > b.format ? 1 : -1))
      setScenarios(sorted)

      const scenarioIds = sorted.map((s) => s.id)
      if (scenarioIds.length > 0) {
        const { data: endingsData } = await supabase
          .from('user_scenario_endings').select('scenario_id, ending_label')
          .eq('user_id', user.id).in('scenario_id', scenarioIds)
        const map = {}
        ;(endingsData || []).forEach((e) => {
          if (!map[e.scenario_id]) map[e.scenario_id] = new Set()
          map[e.scenario_id].add(e.ending_label)
        })
        setEndingsMap(map)
      }
      setLoading(false)
    }
    load()
  }, [themeId, user.id])

  if (loading) return <AppLayout><div className="page"><p>Chargement...</p></div></AppLayout>

  return (
    <AppLayout>
      <div className="page">
        <Link to="/scenarios" className="back-link">← Retour aux thématiques</Link>
        <h1>{theme?.title}</h1>

        <div className="unit-list">
          {scenarios.map((s) => {
            const totalEndings = Object.values(s.content?.nodes || {}).filter((n) => n.end).length
            const discovered = endingsMap[s.id]?.size || 0
            const isDone = discovered > 0
            return (
              <div
                key={s.id}
                className={`unit-card ${s.is_playable ? 'clickable' : 'locked'}`}
                onClick={() => s.is_playable && navigate(`/scenario/${s.id}`)}
              >
                <div className="unit-icon">{isDone ? '✅' : s.is_playable ? '▶️' : '🔒'}</div>
                <div>
                  <p className="unit-title">{s.title}</p>
                  <p className="unit-status">
                    {FORMAT_LABELS[s.format] || s.format} · {s.cecr_level}
                    {!s.is_playable && ' · Pas encore jouable'}
                    {isDone && totalEndings > 0 && ` · 🔍 ${discovered}/${totalEndings} fins`}
                  </p>
                </div>
              </div>
            )
          })}
        </div>
      </div>
    </AppLayout>
  )
}

export default ScenarioList

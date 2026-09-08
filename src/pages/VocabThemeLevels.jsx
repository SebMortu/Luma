import { useEffect, useState } from 'react'
import { useParams, Link } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import AppLayout from '../components/AppLayout.jsx'

function VocabThemeLevels() {
  const { slug } = useParams()
  const { user } = useAuth()
  const [theme, setTheme] = useState(null)
  const [levels, setLevels] = useState([])
  const [completedIds, setCompletedIds] = useState(new Set())
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      const { data: themeData } = await supabase.from('vocab_themes').select('*').eq('slug', slug).single()
      const { data: levelsData } = await supabase
        .from('vocab_theme_levels').select('*').eq('theme_id', themeData.id).order('position')
      const { data: completedData } = await supabase
        .from('user_vocab_level_practice').select('level_id').eq('user_id', user.id)
      setTheme(themeData)
      setLevels(levelsData || [])
      setCompletedIds(new Set((completedData || []).map((c) => c.level_id)))
      setLoading(false)
    }
    load()
  }, [slug, user.id])

  if (loading) return <AppLayout><div className="page"><p>Chargement...</p></div></AppLayout>

  return (
    <AppLayout>
      <div className="page">
        <Link to="/vocab-themes" className="back-link">← Thèmes</Link>
        <h1>{theme.icon} {theme.title}</h1>
        <p className="dashboard-goal">{levels.length} niveau{levels.length > 1 ? 'x' : ''} disponible{levels.length > 1 ? 's' : ''}, ~20 mots chacun.</p>

        <div className="vocab-level-list">
          {levels.map((l) => (
            <Link key={l.id} to={`/vocab-themes/${slug}/${l.position}`} className="vocab-level-row">
              <span>{l.title}</span>
              <span style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                <span className="progress-card-sub">{l.words.length} mots</span>
                {completedIds.has(l.id) && <span className="vocab-theme-done">✓</span>}
              </span>
            </Link>
          ))}
        </div>
      </div>
    </AppLayout>
  )
}

export default VocabThemeLevels

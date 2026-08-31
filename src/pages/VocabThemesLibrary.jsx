import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import AppLayout from '../components/AppLayout.jsx'

function VocabThemesLibrary() {
  const { user } = useAuth()
  const [themes, setThemes] = useState([])
  const [completedIds, setCompletedIds] = useState(new Set())
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      const { data: settings } = await supabase.from('user_settings').select('active_language_id').eq('user_id', user.id).single()
      const { data: themesData } = await supabase
        .from('vocab_themes').select('*').eq('language_id', settings.active_language_id).order('position')
      const { data: completedData } = await supabase
        .from('user_vocab_theme_practice').select('theme_id').eq('user_id', user.id)
      setThemes(themesData || [])
      setCompletedIds(new Set((completedData || []).map((c) => c.theme_id)))
      setLoading(false)
    }
    load()
  }, [user.id])

  if (loading) return <AppLayout><div className="page"><p>Chargement...</p></div></AppLayout>

  return (
    <AppLayout>
      <div className="page">
        <h1>Vocabulaire par thème</h1>
        <p className="dashboard-goal">Choisis un sujet qui t'intéresse — les mots mélangent volontairement plusieurs niveaux.</p>

        <div className="vocab-theme-grid">
          {themes.map((t) => (
            <Link key={t.id} to={`/vocab-themes/${t.slug}`} className="vocab-theme-card">
              <span className="vocab-theme-icon">{t.icon}</span>
              <span className="vocab-theme-title">{t.title}</span>
              {completedIds.has(t.id) && <span className="vocab-theme-done">✓</span>}
            </Link>
          ))}
        </div>

        <Link to="/vocab-training" className="vocab-training-cta">
          <span className="vocab-training-cta-icon">🎯</span>
          <span>
            <span className="vocab-training-cta-title">Entraînement</span>
            <span className="vocab-training-cta-desc">Choisis plusieurs thèmes et niveaux, on mélange tout dans une session sur mesure.</span>
          </span>
        </Link>
      </div>
    </AppLayout>
  )
}

export default VocabThemesLibrary

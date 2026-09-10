import { useEffect, useState } from 'react'
import { useNavigate, Link } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import AppLayout from '../components/AppLayout.jsx'

function VocabTraining() {
  const { user } = useAuth()
  const navigate = useNavigate()
  const [themes, setThemes] = useState([])
  const [levelsByTheme, setLevelsByTheme] = useState({})
  const [expanded, setExpanded] = useState(new Set())
  const [selectedLevelIds, setSelectedLevelIds] = useState(new Set())
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      const { data: settings } = await supabase.from('user_settings').select('active_language_id').eq('user_id', user.id).single()
      const { data: themesData } = await supabase
        .from('vocab_themes').select('*').eq('language_id', settings.active_language_id).order('position')
      const { data: levelsData } = await supabase
        .from('vocab_theme_levels').select('id, theme_id, position, title')
        .in('theme_id', (themesData || []).map((t) => t.id)).order('position')

      const grouped = {}
      for (const l of levelsData || []) {
        grouped[l.theme_id] = grouped[l.theme_id] || []
        grouped[l.theme_id].push(l)
      }
      setThemes(themesData || [])
      setLevelsByTheme(grouped)
      setLoading(false)
    }
    load()
  }, [user.id])

  const toggleTheme = (themeId) => {
    setExpanded((prev) => {
      const next = new Set(prev)
      next.has(themeId) ? next.delete(themeId) : next.add(themeId)
      return next
    })
  }

  const toggleLevel = (levelId) => {
    setSelectedLevelIds((prev) => {
      const next = new Set(prev)
      next.has(levelId) ? next.delete(levelId) : next.add(levelId)
      return next
    })
  }

  const toggleAllLevelsOfTheme = (themeId) => {
    const levels = levelsByTheme[themeId] || []
    const allSelected = levels.every((l) => selectedLevelIds.has(l.id))
    setSelectedLevelIds((prev) => {
      const next = new Set(prev)
      levels.forEach((l) => (allSelected ? next.delete(l.id) : next.add(l.id)))
      return next
    })
  }

  const startTraining = () => {
    navigate('/vocab-training/session', { state: { levelIds: [...selectedLevelIds] } })
  }

  if (loading) return <AppLayout><div className="page"><p>Chargement...</p></div></AppLayout>

  return (
    <AppLayout>
      <div className="page">
        <Link to="/vocab-themes" className="back-link">← Vocabulaire par thème</Link>
        <h1>🎯 Entraînement personnalisé</h1>
        <p className="dashboard-goal">Coche les niveaux qui t'intéressent — on mélange tout dans une seule session.</p>

        <div className="vocab-training-theme-list">
          {themes.map((t) => {
            const levels = levelsByTheme[t.id] || []
            const selectedCount = levels.filter((l) => selectedLevelIds.has(l.id)).length
            return (
              <div key={t.id} className="vocab-training-theme-block">
                <button className="vocab-training-theme-header" onClick={() => toggleTheme(t.id)}>
                  <span>{t.icon} {t.title}</span>
                  <span style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                    {selectedCount > 0 && <span className="badge badge-xp">{selectedCount}</span>}
                    <span>{expanded.has(t.id) ? '▲' : '▼'}</span>
                  </span>
                </button>
                {expanded.has(t.id) && (
                  <div className="vocab-training-level-checklist">
                    <button className="vocab-training-select-all" onClick={() => toggleAllLevelsOfTheme(t.id)}>
                      Tout {levels.every((l) => selectedLevelIds.has(l.id)) ? 'décocher' : 'cocher'}
                    </button>
                    {levels.map((l) => (
                      <label key={l.id} className="vocab-training-checkbox-row">
                        <input
                          type="checkbox"
                          checked={selectedLevelIds.has(l.id)}
                          onChange={() => toggleLevel(l.id)}
                        />
                        {l.title}
                      </label>
                    ))}
                  </div>
                )}
              </div>
            )
          })}
        </div>

        <button
          className="btn-primary"
          disabled={selectedLevelIds.size === 0}
          onClick={startTraining}
          style={{ marginTop: '1rem' }}
        >
          Lancer l'entraînement ({selectedLevelIds.size} niveau{selectedLevelIds.size > 1 ? 'x' : ''} sélectionné{selectedLevelIds.size > 1 ? 's' : ''})
        </button>
      </div>
    </AppLayout>
  )
}

export default VocabTraining

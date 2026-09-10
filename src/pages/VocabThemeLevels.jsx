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

  const totalWords = levels.reduce((sum, l) => sum + l.words.length, 0)
  const wordsLearned = levels.filter((l) => completedIds.has(l.id)).reduce((sum, l) => sum + l.words.length, 0)
  const themePct = totalWords > 0 ? Math.round((wordsLearned / totalWords) * 100) : 0

  // Le "prochain" niveau à mettre en avant : le premier non terminé
  const nextIncompleteIdx = levels.findIndex((l) => !completedIds.has(l.id))

  return (
    <AppLayout>
      <div className="page vt2-page">
        <Link to="/vocab-themes" className="sc2-back">← Thèmes</Link>

        <div className="vt2-hero">
          <div className="vt2-hero-top">
            <span className="vt2-hero-icon">{theme.icon}</span>
            <div style={{ flex: 1, minWidth: 0 }}>
              <div className="vt2-hero-title">{theme.title}</div>
              <div className="vt2-hero-sub">{levels.length} niveau{levels.length > 1 ? 'x' : ''} disponible{levels.length > 1 ? 's' : ''}, ~20 mots chacun.</div>
            </div>
          </div>
          <div className="vt2-hero-stat-row">
            <span>{wordsLearned} mot{wordsLearned > 1 ? 's' : ''} appris sur {totalWords}</span>
            <span style={{ fontWeight: 800 }}>{themePct} %</span>
          </div>
          <div className="vt2-hero-track"><div className="vt2-hero-fill" style={{ width: `${themePct}%` }} /></div>
        </div>

        <div className="vt2-level-list">
          {levels.map((l, i) => {
            const done = completedIds.has(l.id)
            const isNext = i === nextIncompleteIdx
            return (
              <Link
                key={l.id}
                to={`/vocab-themes/${slug}/${l.position}`}
                className={`vt2-level-row ${done ? 'done' : ''} ${isNext ? 'next' : ''}`}
              >
                <div className="vt2-level-row-main">
                  <span className="vt2-level-chip" style={done ? { background: '#A3E635', color: '#22300A' } : isNext ? { background: '#3B82F6', color: '#fff' } : {}}>{l.position}</span>
                  <div style={{ flex: 1, minWidth: 0 }}>
                    <div className="vt2-level-title">{l.title}</div>
                    <div className="vt2-level-sub">{done ? 'Terminé' : isNext ? 'À continuer' : 'Pas encore commencé'}</div>
                  </div>
                  <span className="vt2-level-words">{l.words.length} mots</span>
                </div>
                {(done || isNext) && (
                  <div className="vt2-level-track"><div className="vt2-level-fill" style={{ width: done ? '100%' : '0%', background: done ? '#A3E635' : '#3B82F6' }} /></div>
                )}
              </Link>
            )
          })}
        </div>
      </div>
    </AppLayout>
  )
}

export default VocabThemeLevels

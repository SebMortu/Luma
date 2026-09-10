import { useEffect, useState } from 'react'
import { useParams, useNavigate, Link } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import SpeakButton from '../components/SpeakButton.jsx'
import MarkdownLite from '../components/MarkdownLite.jsx'

const LEVEL_BADGE = {
  A0: '#3B82F6', A1: '#8DBF3A', A2: '#F0973E', B1: '#E0685A', B2: '#8A6FE0', C1: '#28324A',
}

function sectionStyle(heading) {
  if (heading.includes('Pièges')) return { icon: '🚫', bg: '#FFEFEC', titleColor: '#B3402F', textColor: '#8E3729' }
  if (heading.includes('Exceptions')) return { icon: '⚠️', bg: '#FFF7E8', titleColor: '#7A5210', textColor: '#5E4413' }
  if (heading.includes('Comparaison')) return { icon: '🇫🇷', bg: '#EEF4FE', titleColor: '#1E4C93', textColor: '#2E5EA8' }
  if (heading.includes("Banque d'exemples") || heading.includes('exemples')) return { icon: '📝', bg: '#F1F8E0', titleColor: '#3E5410', textColor: '#4F6B1C' }
  return { icon: '📐', bg: '#fff', titleColor: '#1E2A4A', textColor: '#5F6A80', bordered: true }
}

function GrammarDetail() {
  const { ficheId } = useParams()
  const navigate = useNavigate()
  const { user } = useAuth()
  const [fiche, setFiche] = useState(null)
  const [siblings, setSiblings] = useState([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      const { data } = await supabase.from('grammar_fiches').select('*').eq('id', ficheId).single()
      setFiche(data)

      const { data: sameLevel } = await supabase
        .from('grammar_fiches').select('id, position, title')
        .eq('language_id', data.language_id).eq('cecr_level', data.cecr_level).order('position')
      setSiblings(sameLevel || [])

      await supabase.from('user_grammar_fiche_views').upsert({ user_id: user.id, fiche_id: ficheId, viewed_at: new Date().toISOString() })

      setLoading(false)
    }
    load()
  }, [ficheId])

  if (loading) return <div className="page"><p>Chargement...</p></div>
  if (!fiche) return <div className="page"><p>Fiche introuvable.</p></div>

  const idx = siblings.findIndex((s) => s.id === fiche.id)
  const prev = idx > 0 ? siblings[idx - 1] : null
  const next = idx < siblings.length - 1 ? siblings[idx + 1] : null
  const fullText = fiche.content.sections.map((s) => s.text).join(' ')

  return (
    <div className="page gr2-page">
      <div className="gr2-detail-head">
        <Link to="/grammar" className="sc2-back">← Retour à la bibliothèque</Link>
        <div className="gr2-detail-meta">
          <span className="gr2-level-badge" style={{ background: LEVEL_BADGE[fiche.cecr_level] }}>{fiche.cecr_level}</span>
          <span className="gr2-detail-position">Fiche {idx + 1} sur {siblings.length}</span>
        </div>
        <p className="gr2-detail-title">
          {fiche.title.split(/(\*[^*]+\*)/g).map((part, i) =>
            part.startsWith('*') && part.endsWith('*') ? <em key={i}>{part.slice(1, -1)}</em> : <span key={i}>{part}</span>
          )}
        </p>
      </div>

      {fiche.content.sections.map((s, i) => {
        const style = sectionStyle(s.heading)
        return (
          <div key={i} className="gr2-section-card" style={{ background: style.bg, border: style.bordered ? '2px solid var(--border,#EAEEF6)' : 'none', boxShadow: style.bordered ? '0 3px 12px rgba(30,42,74,.06)' : 'none' }}>
            <div className="gr2-section-head-row">
              <span style={{ fontSize: '15px' }}>{style.icon}</span>
              <span className="gr2-section-title" style={{ color: style.titleColor }}>{s.heading}</span>
            </div>
            <div className="gr2-section-body" style={{ color: style.textColor }}>
              <MarkdownLite text={s.text} />
            </div>
          </div>
        )
      })}

      <div className="gr2-action-row">
        <button className="d2-cta" style={{ flex: 1 }} onClick={() => navigate(`/grammar/${fiche.id}/practice`)}>S'entraîner sur cette notion</button>
        <div className="gr2-speak-btn"><SpeakButton text={fullText.slice(0, 300)} /></div>
      </div>

      {(prev || next) && (
        <div className="gr2-nav-row">
          {prev ? <span className="gr2-nav-prev" onClick={() => navigate(`/grammar/${prev.id}`)}>‹ Précédente</span> : <span />}
          {next ? <span className="gr2-nav-next" onClick={() => navigate(`/grammar/${next.id}`)}>Fiche {next.position} · {next.title} ›</span> : <span />}
        </div>
      )}
    </div>
  )
}

export default GrammarDetail

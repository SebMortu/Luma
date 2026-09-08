import { useEffect, useState } from 'react'
import { useParams, Link } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'

function GrammarDetail() {
  const { ficheId } = useParams()
  const [fiche, setFiche] = useState(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      const { data } = await supabase.from('grammar_fiches').select('*').eq('id', ficheId).single()
      setFiche(data)
      setLoading(false)
    }
    load()
  }, [ficheId])

  if (loading) return <div className="page"><p>Chargement...</p></div>
  if (!fiche) return <div className="page"><p>Fiche introuvable.</p></div>

  return (
    <div className="page">
      <Link to="/grammar" className="back-link">← Retour à la bibliothèque</Link>
      <h1>{fiche.title}</h1>
      <span className="chip selected" style={{ marginBottom: '1rem', display: 'inline-block' }}>{fiche.cecr_level}</span>

      {fiche.content.sections.map((s, i) => (
        <div key={i} className="grammar-section">
          <p className="grammar-section-heading">{s.heading}</p>
          <div className="grammar-section-text">
            {s.text.split('\n').map((line, li) => <p key={li}>{line}</p>)}
          </div>
        </div>
      ))}

      <Link to={`/grammar/${fiche.id}/practice`} className="btn-primary" style={{ display: 'block', textAlign: 'center', textDecoration: 'none' }}>
        ✏️ S'entraîner sur cette fiche
      </Link>
    </div>
  )
}

export default GrammarDetail

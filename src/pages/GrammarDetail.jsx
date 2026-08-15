import { useEffect, useState } from 'react'
import { useParams, Link } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import AppLayout from '../components/AppLayout.jsx'

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

  if (loading) return <AppLayout><div className="page"><p>Chargement...</p></div></AppLayout>
  if (!fiche) return <AppLayout><div className="page"><p>Fiche introuvable.</p></div></AppLayout>

  return (
    <AppLayout>
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
      </div>
    </AppLayout>
  )
}

export default GrammarDetail

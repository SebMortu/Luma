import { useEffect, useState } from 'react'
import { useParams, useNavigate, Link } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { getLevelPath } from '../lib/levelPath.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import AppLayout from '../components/AppLayout.jsx'

const CECR_TITLES = {
  A1: 'A1 · Débutant complet',
  A2: 'A2 · Élémentaire',
  B1: 'B1 · Intermédiaire',
  B2: 'B2 · Intermédiaire avancé',
  C1: 'C1 · Avancé',
}

const STATUS_ICON = { completed: '✓', current: '▶', available: '📖', locked: '🔒' }

function LevelPath() {
  const { levelCode } = useParams()
  const { user } = useAuth()
  const navigate = useNavigate()
  const [nodes, setNodes] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)

  useEffect(() => {
    async function load() {
      try {
        const { data: settings, error: settingsErr } = await supabase
          .from('user_settings').select('active_language_id').eq('user_id', user.id).single()
        if (settingsErr) throw settingsErr

        const { nodes: pathNodes } = await getLevelPath(user.id, settings.active_language_id, levelCode)
        setNodes(pathNodes)
      } catch (err) {
        setError(err.message)
      } finally {
        setLoading(false)
      }
    }
    load()
  }, [levelCode, user.id])

  if (loading) return <AppLayout><div className="page"><p>Chargement...</p></div></AppLayout>
  if (error) return <AppLayout><div className="page"><p className="feedback incorrect">Erreur : {error}</p></div></AppLayout>

  return (
    <AppLayout>
      <div className="page">
        <Link to="/dashboard" className="back-link">← Retour aux niveaux</Link>
        <h1>{CECR_TITLES[levelCode] || levelCode}</h1>

        {nodes.length === 0 && <p>Aucun contenu disponible pour ce niveau pour l'instant.</p>}

        <div className="path-container">
          <div className="path-line" />
          {[...nodes].reverse().map((node, i) => (
            <div key={node.lesson.id} className={`path-node-row ${i % 2 === 0 ? 'align-left' : 'align-right'}`}>
              <button
                className={`path-node ${node.status}`}
                disabled={node.status === 'locked'}
                onClick={() => navigate(`/lesson/${node.lesson.id}`)}
              >
                <span className="path-node-icon">{STATUS_ICON[node.status]}</span>
              </button>
              <div className="path-node-info">
                <p className="path-node-title">{node.lesson.title}</p>
                <p className="path-node-sub">
                  {node.status === 'completed' && node.bestScore !== null
                    ? `Terminée · ${Math.round(node.bestScore * 100)}%`
                    : node.status === 'locked'
                      ? 'Verrouillée'
                      : "Jusqu'à 20 XP"}
                </p>
              </div>
            </div>
          ))}
        </div>
      </div>
    </AppLayout>
  )
}

export default LevelPath

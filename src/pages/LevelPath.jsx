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

// Petits détails d'ambiance qui évoluent avec le niveau — du lever du jour (A1)
// à la nuit tombée (C1), sans image, juste une teinte de fond + un astre.
const LEVEL_SKY = {
  A1: { gradient: 'linear-gradient(180deg, #2a2340 0%, #4a3a5e 35%, #7a5a6e 65%, #c98a6e 100%)', orb: '#FFE9C4', orbGlow: 'rgba(255,220,150,0.5)', orbTop: '78%' },
  A2: { gradient: 'linear-gradient(180deg, #241f3a 0%, #453a5c 35%, #7a5478 65%, #c07666 100%)', orb: '#FFE0B0', orbGlow: 'rgba(255,200,130,0.45)', orbTop: '62%' },
  B1: { gradient: 'linear-gradient(180deg, #1c1830 0%, #362c52 35%, #6a3f66 65%, #a85560 100%)', orb: '#FFD79A', orbGlow: 'rgba(255,180,110,0.4)', orbTop: '46%' },
  B2: { gradient: 'linear-gradient(180deg, #141124 0%, #241d3f 40%, #4a2c58 70%, #7a3a52 100%)', orb: '#F4C77A', orbGlow: 'rgba(240,170,100,0.35)', orbTop: '28%' },
  C1: { gradient: 'linear-gradient(180deg, #0b0a16 0%, #17132b 30%, #2a1a3d 60%, #3a1f38 100%)', orb: '#EAD9FF', orbGlow: 'rgba(180,150,255,0.4)', orbTop: '14%' },
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

  const sky = LEVEL_SKY[levelCode] || LEVEL_SKY.A1

  return (
    <AppLayout>
      <div className="page path-page" style={{ background: sky.gradient, borderRadius: 20, position: 'relative', overflow: 'hidden', margin: '-4px', padding: '20px' }}>
        <div
          className="path-orb"
          style={{
            position: 'absolute', left: '50%', top: sky.orbTop, transform: 'translate(-50%, -50%)',
            width: 90, height: 90, borderRadius: '50%', background: sky.orb,
            boxShadow: `0 0 60px 20px ${sky.orbGlow}`, zIndex: 0, transition: 'top 0.6s ease',
          }}
        />
        <Link to="/dashboard" className="back-link">← Retour aux niveaux</Link>
        <h1>{CECR_TITLES[levelCode] || levelCode}</h1>

        {nodes.length === 0 && <p>Aucun contenu disponible pour ce niveau pour l'instant.</p>}

        <div className="path-container">
          <div className="path-line" />
          {(() => {
            // Insère un repère "Test de sortie" à la fin de chaque unité
            const items = []
            nodes.forEach((node, idx) => {
              const prevNode = nodes[idx - 1]
              if (prevNode && prevNode.unit.id !== node.unit.id) {
                items.push({ type: 'test', unit: prevNode.unit, locked: prevNode.status === 'locked' })
              }
              items.push({ type: 'lesson', node })
            })
            if (nodes.length > 0) {
              const lastNode = nodes[nodes.length - 1]
              items.push({ type: 'test', unit: lastNode.unit, locked: lastNode.status === 'locked' })
            }
            return items.map((item, i) => {
              if (item.type === 'test') {
                return (
                  <div key={`test-${item.unit.id}`} className={`path-node-row ${i % 2 === 0 ? 'align-left' : 'align-right'}`}>
                    <button
                      className="path-node test"
                      disabled={item.locked}
                      onClick={() => navigate(`/unit/${item.unit.id}/test`)}
                    >
                      <span className="path-node-icon">📝</span>
                    </button>
                    <div className="path-node-info">
                      <p className="path-node-title">Test de sortie</p>
                      <p className="path-node-sub">{item.locked ? 'Verrouillé' : 'Valide toute l\'unité à 80%'}</p>
                    </div>
                  </div>
                )
              }
              const node = item.node
              return (
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
              )
            })
          })()}
        </div>
      </div>
    </AppLayout>
  )
}

export default LevelPath

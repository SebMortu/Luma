import { useEffect, useState } from 'react'
import { useParams, useNavigate, Link } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { getLevelPath } from '../lib/levelPath.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import AppLayout from '../components/AppLayout.jsx'

const CECR_TITLES = {
  A0: 'Fondations · Premiers pas',
  A1: 'A1 · Débutant complet',
  A2: 'A2 · Élémentaire',
  B1: 'B1 · Intermédiaire',
  B2: 'B2 · Intermédiaire avancé',
  C1: 'C1 · Avancé',
}
const LEVEL_ORDER = ['A0', 'A1', 'A2', 'B1', 'B2', 'C1']

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

  const totalLessons = nodes.length
  const completedLessons = nodes.filter((n) => n.status === 'completed').length
  const levelPct = totalLessons > 0 ? Math.round((completedLessons / totalLessons) * 100) : 0

  // Regroupe les leçons par unité ("thème")
  const themes = []
  nodes.forEach((node) => {
    let theme = themes.find((t) => t.unit.id === node.unit.id)
    if (!theme) {
      theme = { unit: node.unit, nodes: [] }
      themes.push(theme)
    }
    theme.nodes.push(node)
  })
  const currentThemeIndex = Math.max(0, themes.findIndex((t) => t.nodes.some((n) => n.status === 'current')))

  // Le fond s'éclaircit progressivement avec l'avancement dans le niveau
  const bgTint = Math.min(0.22, 0.06 + (levelPct / 100) * 0.16)

  const canJumpNext = LEVEL_ORDER.includes(levelCode) && LEVEL_ORDER.indexOf(levelCode) < LEVEL_ORDER.length - 1

  return (
    <AppLayout>
      <div className="page lp2-page">
        <div className="lp2-header">
          <Link to="/dashboard" className="lp2-back">← Retour aux niveaux</Link>
          <div className="lp2-header-row">
            <div>
              <p className="lp2-eyebrow">Niveau {levelCode}</p>
              <p className="lp2-title">{CECR_TITLES[levelCode] || levelCode}</p>
            </div>
            <span className="lp2-pct">{levelPct}%</span>
          </div>
          <div className="lp2-progress-track"><div className="lp2-progress-fill" style={{ width: `${levelPct}%` }} /></div>
          <p className="lp2-progress-sub">{completedLessons} / {totalLessons} leçons · thème {Math.min(currentThemeIndex + 1, themes.length)} sur {themes.length}</p>
        </div>

        <div className="lp2-body" style={{ background: `linear-gradient(180deg, rgba(59,130,246,${bgTint}), rgba(17,23,51,0) 42%)` }}>
          {canJumpNext && (
            <button className="btn-secondary" style={{ width: '100%', marginBottom: '14px' }} onClick={() => navigate(`/level-up-test/${levelCode}`)}>
              🎯 Passer directement au niveau {LEVEL_ORDER[LEVEL_ORDER.indexOf(levelCode) + 1]} (test 90%)
            </button>
          )}

          <div className="lp2-info-banner">
            <span>🎯</span>
            <span>Un thème se débloque quand toutes ses leçons sont validées à 80% minimum.</span>
          </div>

          {themes.length === 0 && <p style={{ color: '#8FA3D0', marginTop: '1rem' }}>Aucun contenu disponible pour ce niveau pour l'instant.</p>}

          {themes.map((theme, ti) => {
            const themeDone = theme.nodes.filter((n) => n.status === 'completed').length
            return (
              <div key={theme.unit.id} className="lp2-theme">
                <div className="lp2-theme-head">
                  <span className="lp2-theme-name" style={{ color: themeDone === theme.nodes.length ? '#A3E635' : '#7CB0F8' }}>
                    Thème {ti + 1} · {theme.unit.title}
                  </span>
                  <span className="lp2-theme-line" />
                  <span className="lp2-theme-count">{themeDone} / {theme.nodes.length}</span>
                </div>

                <div className="lp2-lesson-list">
                  {theme.nodes.map((node) => {
                    const belowThreshold = node.status === 'completed' && node.bestScore !== null && node.bestScore < 0.8

                    if (node.status === 'current' || (node.status === 'available' && belowThreshold)) {
                      return (
                        <div key={node.lesson.id} className="lp2-current-card">
                          <div className="lp2-current-row">
                            <div className="lp2-current-play">▶︎</div>
                            <div>
                              <p className="lp2-current-title">{node.lesson.title}</p>
                              <p className="lp2-current-sub">
                                {belowThreshold ? `À retravailler · ${Math.round(node.bestScore * 100)}% (80% requis)` : "En cours · jusqu'à 20 XP"}
                              </p>
                            </div>
                          </div>
                          <button className="lp2-resume-btn" onClick={() => navigate(`/lesson/${node.lesson.id}`)}>
                            {belowThreshold ? 'Retravailler la leçon' : 'Reprendre la leçon'}
                          </button>
                        </div>
                      )
                    }

                    if (node.status === 'completed') {
                      return (
                        <div key={node.lesson.id} className="lp2-lesson-row" onClick={() => navigate(`/lesson/${node.lesson.id}`)}>
                          <div className="lp2-lesson-dot done">✓</div>
                          <div>
                            <p className="lp2-lesson-name">{node.lesson.title}</p>
                            <p className="lp2-lesson-meta">Terminée · {Math.round((node.bestScore ?? 1) * 100)}% · +20 XP</p>
                          </div>
                        </div>
                      )
                    }

                    if (node.status === 'available') {
                      return (
                        <div key={node.lesson.id} className="lp2-lesson-row" onClick={() => navigate(`/lesson/${node.lesson.id}`)}>
                          <div className="lp2-lesson-dot next">▶</div>
                          <div>
                            <p className="lp2-lesson-name">{node.lesson.title}</p>
                            <p className="lp2-lesson-meta">Jusqu'à 20 XP</p>
                          </div>
                        </div>
                      )
                    }

                    return (
                      <div key={node.lesson.id} className="lp2-lesson-row locked">
                        <div className="lp2-lesson-dot locked">🔒</div>
                        <div>
                          <p className="lp2-lesson-name locked">{node.lesson.title}</p>
                          <p className="lp2-lesson-meta">Jusqu'à 20 XP</p>
                        </div>
                      </div>
                    )
                  })}
                </div>

                <button
                  className="lp2-test-row"
                  disabled={theme.nodes.some((n) => n.status === 'locked')}
                  onClick={() => navigate(`/unit/${theme.unit.id}/test`)}
                >
                  <span className="lp2-test-icon">📝</span>
                  <span>
                    <span className="lp2-test-title">Test de sortie</span>
                    <span className="lp2-test-sub">{theme.nodes.some((n) => n.status === 'locked') ? 'Verrouillé' : "Valide toute l'unité à 80%"}</span>
                  </span>
                </button>
              </div>
            )
          })}
        </div>
      </div>
    </AppLayout>
  )
}

export default LevelPath

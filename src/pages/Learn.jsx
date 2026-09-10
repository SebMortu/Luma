import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { getNextLesson } from '../lib/progress.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import AppLayout from '../components/AppLayout.jsx'

const LEVEL_ORDER = ['A0', 'A1', 'A2', 'B1', 'B2', 'C1']
const CECR_TITLES = {
  A0: 'Fondations', A1: 'A1 · Débutant', A2: 'A2 · Élémentaire',
  B1: 'B1 · Intermédiaire', B2: 'B2 · Intermédiaire avancé', C1: 'C1 · Avancé',
}

function Learn() {
  const { user } = useAuth()
  const navigate = useNavigate()
  const [grammarUnlocked, setGrammarUnlocked] = useState(0)
  const [grammarTotal, setGrammarTotal] = useState(0)
  const [verbBest, setVerbBest] = useState(0)
  const [lastToeic, setLastToeic] = useState(null)
  const [nextLesson, setNextLesson] = useState(null)
  const [nextLevel, setNextLevel] = useState(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      const { data: settings } = await supabase.from('user_settings').select('*').eq('user_id', user.id).single()

      const unlockedIdx = LEVEL_ORDER.indexOf(settings.unlocked_level || 'A0')
      const unlockedLevels = LEVEL_ORDER.slice(0, unlockedIdx + 1)
      const { data: fiches } = await supabase.from('grammar_fiches').select('cecr_level')
      setGrammarTotal(fiches?.length || 0)
      setGrammarUnlocked((fiches || []).filter((f) => unlockedLevels.includes(f.cecr_level)).length)

      setVerbBest(settings.best_verb_sprint_score || 0)

      const { data: attempts } = await supabase
        .from('user_toeic_attempts').select('*').eq('user_id', user.id)
        .order('created_at', { ascending: false }).limit(1)
      if (attempts?.length > 0) setLastToeic(attempts[0])

      const next = await getNextLesson(user.id, settings.active_language_id)
      setNextLesson(next)
      setNextLevel(settings.unlocked_level)

      setLoading(false)
    }
    load()
  }, [user.id])

  if (loading) return <AppLayout><div className="page"><p>Chargement...</p></div></AppLayout>

  return (
    <AppLayout>
      <div className="page l2-page">
        <p className="l2-title">🎓 Apprendre</p>
        <p className="l2-subtitle">Ressources complémentaires pour renforcer tes bases.</p>

        <div className="l2-card l2-card-blue" onClick={() => navigate('/grammar')}>
          <div className="l2-card-row">
            <span className="l2-card-icon" style={{ background: 'var(--accent,#3B82F6)' }}>📚</span>
            <div style={{ flex: 1, minWidth: 0 }}>
              <div className="l2-card-title">Grammaire</div>
              <div className="l2-card-desc">Consulte n'importe quelle notion déjà vue, à tout moment.</div>
            </div>
          </div>
          <div className="l2-card-footer">
            <span className="l2-card-meta">{grammarUnlocked} / {grammarTotal} fiches débloquées</span>
            <span className="l2-card-link">Consulter ›</span>
          </div>
        </div>

        <div className="l2-card l2-card-lime" onClick={() => navigate('/verbs')}>
          <div className="l2-card-row">
            <span className="l2-card-icon" style={{ background: 'var(--accent-warm,#A3E635)', color: '#22300A' }}>🔤</span>
            <div style={{ flex: 1, minWidth: 0 }}>
              <div className="l2-card-title">Verbes irréguliers</div>
              <div className="l2-card-desc" style={{ color: '#4F6B1C' }}>Entraîne-toi en sprint chronométré ou en quiz.</div>
            </div>
          </div>
          <div className="l2-card-footer">
            <span className="l2-card-meta" style={{ color: '#4F6B1C' }}>
              {verbBest > 0 ? `Record : ${verbBest} bonnes réponses` : 'Pas encore de record'}
            </span>
            <span className="l2-card-link" style={{ color: '#3E5410' }}>Sprint ›</span>
          </div>
        </div>

        <div className="l2-card l2-card-coral" onClick={() => navigate('/toeic-test')}>
          <div className="l2-card-row">
            <span className="l2-card-icon" style={{ background: 'var(--danger-text,#FF6B5B)' }}>📝</span>
            <div style={{ flex: 1, minWidth: 0 }}>
              <div className="l2-card-title">Examen (TOEIC)</div>
              <div className="l2-card-desc" style={{ color: '#A85445' }}>Teste ton niveau avec un examen blanc et une estimation de score.</div>
            </div>
          </div>
          <div className="l2-card-stats">
            <div className="l2-card-stat">
              <div className="l2-card-stat-value">{lastToeic ? lastToeic.estimated_score : '—'}</div>
              <div className="l2-card-stat-label">Dernier score</div>
            </div>
            <div className="l2-card-stat">
              <div className="l2-card-stat-value">45 min</div>
              <div className="l2-card-stat-label">Durée du test</div>
            </div>
          </div>
        </div>

        <div className="l2-tip">
          <span>💡</span>
          <span>Ces ressources restent accessibles hors leçon : sers-t'en quand un point te bloque.</span>
        </div>

        {nextLesson && (
          <button className="l2-resume" onClick={() => navigate(`/lesson/${nextLesson.lesson.id}`)}>
            <div style={{ textAlign: 'left' }}>
              <div className="l2-resume-title">Reprendre mon parcours</div>
              <div className="l2-resume-sub">{CECR_TITLES[nextLevel] || nextLevel}</div>
            </div>
            <span style={{ fontWeight: 800, fontSize: '17px' }}>›</span>
          </button>
        )}
      </div>
    </AppLayout>
  )
}

export default Learn

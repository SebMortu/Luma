import { useEffect, useState } from 'react'
import { useParams, useNavigate, Link } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import AppLayout from '../components/AppLayout.jsx'

function UnitDetail() {
  const { unitId } = useParams()
  const { user } = useAuth()
  const navigate = useNavigate()

  const [unit, setUnit] = useState(null)
  const [lessons, setLessons] = useState([])
  const [progressByLesson, setProgressByLesson] = useState({})
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)

  useEffect(() => {
    async function load() {
      try {
        const { data: unitData, error: unitErr } = await supabase
          .from('units').select('*').eq('id', unitId).single()
        if (unitErr) throw unitErr
        setUnit(unitData)

        const { data: lessonsData, error: lessonsErr } = await supabase
          .from('lessons').select('*').eq('unit_id', unitId).order('position')
        if (lessonsErr) throw lessonsErr
        setLessons(lessonsData)

        const { data: progressData, error: progressErr } = await supabase
          .from('user_progress').select('lesson_id, status, best_score')
          .eq('user_id', user.id).eq('unit_id', unitId)
        if (progressErr) throw progressErr

        const map = {}
        progressData.forEach((p) => { map[p.lesson_id] = p })
        setProgressByLesson(map)
      } catch (err) {
        setError(err.message)
      } finally {
        setLoading(false)
      }
    }
    load()
  }, [unitId, user.id])

  if (loading) return <AppLayout><div className="page"><p>Chargement...</p></div></AppLayout>
  if (error) return <AppLayout><div className="page"><p className="feedback incorrect">Erreur : {error}</p></div></AppLayout>

  return (
    <AppLayout>
    <div className="page">
      <Link to="/dashboard" className="back-link">← Retour au tableau de bord</Link>
      <h1>Unité {unit.position} · {unit.title}</h1>

      <div className="unit-list">
        {lessons.map((lesson) => {
          const progress = progressByLesson[lesson.id]
          const isCompleted = progress?.status === 'completed'
          return (
            <div
              key={lesson.id}
              className="unit-card lesson-row"
              onClick={() => navigate(`/lesson/${lesson.id}`)}
            >
              <div className={`unit-icon ${isCompleted ? 'completed' : ''}`}>
                {isCompleted ? '✓' : '📖'}
              </div>
              <div>
                <p className="unit-title">Leçon {lesson.position} · {lesson.title}</p>
                <p className="unit-status">
                  {isCompleted ? `Terminée · ${Math.round(progress.best_score * 100)}%` : 'À faire'}
                </p>
              </div>
            </div>
          )
        })}
      </div>

      {lessons.length === 0 && <p>Aucune leçon disponible pour cette unité pour l'instant.</p>}
    </div>
    </AppLayout>
  )
}

export default UnitDetail

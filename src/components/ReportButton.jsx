import { useState } from 'react'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'

const CATEGORIES = [
  { value: 'grammaire', label: 'Faute de grammaire/orthographe' },
  { value: 'traduction', label: 'Traduction incorrecte' },
  { value: 'confus', label: 'Question confuse ou ambiguë' },
  { value: 'bug', label: 'Bug technique' },
  { value: 'autre', label: 'Autre' },
]

/**
 * Petit bouton discret (icône drapeau) qui ouvre un formulaire de signalement.
 * Réutilisable sur n'importe quel contenu : passer contentType/contentId/lessonTitle/
 * questionSnippet pour donner du contexte exploitable sans avoir à reproduire le contenu.
 */
function ReportButton({ contentType, contentId = null, lessonTitle = '', questionSnippet = '' }) {
  const { user } = useAuth()
  const [open, setOpen] = useState(false)
  const [category, setCategory] = useState('grammaire')
  const [comment, setComment] = useState('')
  const [submitting, setSubmitting] = useState(false)
  const [submitted, setSubmitted] = useState(false)

  const handleSubmit = async () => {
    setSubmitting(true)
    const { error } = await supabase.from('content_reports').insert({
      user_id: user.id,
      content_type: contentType,
      content_id: contentId,
      lesson_title: lessonTitle,
      question_snippet: (questionSnippet || '').slice(0, 300),
      category,
      comment: comment.trim() || null,
    })
    setSubmitting(false)
    if (!error) {
      setSubmitted(true)
      setTimeout(() => { setOpen(false); setSubmitted(false); setComment('') }, 1800)
    }
  }

  return (
    <>
      <button className="report-btn" onClick={() => setOpen(true)} aria-label="Signaler un problème" type="button">
        🚩
      </button>

      {open && (
        <div className="report-modal-overlay" onClick={() => setOpen(false)}>
          <div className="report-modal" onClick={(e) => e.stopPropagation()}>
            {submitted ? (
              <p className="feedback correct">Merci, ton signalement a été envoyé !</p>
            ) : (
              <>
                <h3>Signaler un problème</h3>
                <p className="report-modal-sub">Aide-nous à améliorer le contenu — ça ne prend que quelques secondes.</p>

                <div className="report-category-list">
                  {CATEGORIES.map((c) => (
                    <button
                      key={c.value}
                      className={`report-category-chip ${category === c.value ? 'selected' : ''}`}
                      onClick={() => setCategory(c.value)}
                      type="button"
                    >
                      {c.label}
                    </button>
                  ))}
                </div>

                <textarea
                  className="report-comment-input"
                  placeholder="Décris le problème (facultatif)..."
                  value={comment}
                  onChange={(e) => setComment(e.target.value)}
                  rows={3}
                />

                <div className="report-modal-actions">
                  <button className="btn-secondary" onClick={() => setOpen(false)} type="button">Annuler</button>
                  <button className="btn-primary" style={{ marginTop: 0 }} onClick={handleSubmit} disabled={submitting} type="button">
                    {submitting ? 'Envoi...' : 'Envoyer'}
                  </button>
                </div>
              </>
            )}
          </div>
        </div>
      )}
    </>
  )
}

export default ReportButton

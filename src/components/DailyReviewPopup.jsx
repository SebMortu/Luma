import { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'

const STORAGE_KEY = 'luma-review-popup-shown'

function todayStr() {
  return new Date().toISOString().slice(0, 10)
}

/**
 * Popup affiché une seule fois par jour, à la connexion, s'il y a du
 * vocabulaire à réviser. Distinct de la carte de révision du tableau de
 * bord (DailyReviewPrompt) : fermer ce popup ne fait pas disparaître la
 * carte, qui reste accessible comme solution de repli.
 */
function DailyReviewPopup({ dueVocabCount }) {
  const navigate = useNavigate()
  const [visible, setVisible] = useState(false)

  useEffect(() => {
    if (dueVocabCount <= 0) return
    const shownDate = localStorage.getItem(STORAGE_KEY)
    if (shownDate !== todayStr()) {
      setVisible(true)
    }
  }, [dueVocabCount])

  const dismiss = () => {
    localStorage.setItem(STORAGE_KEY, todayStr())
    setVisible(false)
  }

  const goTo = (path) => {
    dismiss()
    navigate(path)
  }

  if (!visible) return null

  return (
    <div className="review-popup-backdrop" onClick={dismiss}>
      <div className="review-popup-panel" onClick={(e) => e.stopPropagation()}>
        <p className="review-popup-title">🔁 Envie de réviser un peu ?</p>
        <p className="review-popup-subtitle">
          Tu as {dueVocabCount} mot{dueVocabCount > 1 ? 's' : ''} à réviser aujourd'hui.
        </p>
        <div className="review-prompt-options">
          <button className="review-prompt-option" onClick={() => goTo('/vocab-review')}>
            <span className="review-prompt-emoji">📗</span>
            <span>Vocabulaire</span>
          </button>
          <button className="review-prompt-option" onClick={() => goTo('/grammar?review=1')}>
            <span className="review-prompt-emoji">📖</span>
            <span>Grammaire</span>
          </button>
          <button className="review-prompt-option" onClick={() => goTo('/verbs')}>
            <span className="review-prompt-emoji">🔤</span>
            <span>Verbes irréguliers</span>
          </button>
        </div>
        <button className="review-prompt-skip" onClick={dismiss}>Non merci, plus tard</button>
      </div>
    </div>
  )
}

export default DailyReviewPopup

import { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'

const STORAGE_KEY = 'luma-review-prompt-dismissed'

function todayStr() {
  return new Date().toISOString().slice(0, 10)
}

function DailyReviewPrompt() {
  const navigate = useNavigate()
  const [visible, setVisible] = useState(false)

  useEffect(() => {
    const dismissedDate = localStorage.getItem(STORAGE_KEY)
    setVisible(dismissedDate !== todayStr())
  }, [])

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
    <div className="review-prompt-card">
      <p className="review-prompt-title">🔁 Envie de réviser un peu ?</p>
      <p className="review-prompt-subtitle">Un petit rappel de ce que tu as déjà appris, à ton rythme.</p>
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
  )
}

export default DailyReviewPrompt

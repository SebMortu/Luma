import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { useAuth } from '../contexts/AuthContext.jsx'
import { getDueVocab, reviewVocabItem } from '../lib/progress.js'
import AppLayout from '../components/AppLayout.jsx'

function VocabReview() {
  const { user } = useAuth()
  const navigate = useNavigate()
  const [items, setItems] = useState(null)
  const [currentIndex, setCurrentIndex] = useState(0)
  const [revealed, setRevealed] = useState(false)
  const [doneCount, setDoneCount] = useState(0)

  useEffect(() => {
    async function load() {
      const data = await getDueVocab(user.id)
      setItems(data)
    }
    load()
  }, [user.id])

  const handleAnswer = async (remembered) => {
    const item = items[currentIndex]
    await reviewVocabItem(item.id, remembered)
    setDoneCount((c) => c + 1)
    setRevealed(false)
    if (currentIndex + 1 >= items.length) {
      setItems([])
    } else {
      setCurrentIndex((i) => i + 1)
    }
  }

  if (items === null) return <AppLayout><div className="page"><p>Chargement...</p></div></AppLayout>

  if (items.length === 0) {
    return (
      <AppLayout>
        <div className="page">
          <h1>🗂️ Révision de vocabulaire</h1>
          {doneCount > 0 ? (
            <div className="lesson-summary">
              <p className="feedback correct">✅ {doneCount} mot{doneCount > 1 ? 's' : ''} révisé{doneCount > 1 ? 's' : ''} !</p>
              <button className="btn-primary" onClick={() => navigate('/dashboard')}>Retour au tableau de bord</button>
            </div>
          ) : (
            <>
              <p className="dashboard-goal">Rien à réviser aujourd'hui. Ajoute des phrases depuis un livre (📖) en cliquant sur « ⭐ Ajouter à mes révisions » sous une traduction.</p>
              <button className="btn-secondary" onClick={() => navigate('/books')}>Aller à la bibliothèque</button>
            </>
          )}
        </div>
      </AppLayout>
    )
  }

  const item = items[currentIndex]
  const progressPct = Math.round((currentIndex / items.length) * 100)

  return (
    <AppLayout>
      <div className="page">
        <div className="lesson-progress-top">
          <button className="lesson-back-icon" onClick={() => navigate('/dashboard')} aria-label="Quitter">←</button>
          <div className="progress-bar-track" style={{ flex: 1 }}>
            <div className="progress-bar-fill" style={{ width: `${progressPct}%` }} />
          </div>
        </div>
        <p className="verb-progress">{currentIndex + 1} / {items.length}</p>

        <div className="vocab-flashcard" onClick={() => setRevealed(true)}>
          <p className="vocab-flashcard-en">{item.content_en}</p>
          {revealed && <p className="vocab-flashcard-fr">🌐 {item.content_fr}</p>}
          {item.source_label && <p className="vocab-flashcard-source">📖 {item.source_label}</p>}
          {!revealed && <p className="progress-card-sub">Touche la carte pour révéler la traduction</p>}
        </div>

        {revealed && (
          <div className="vocab-flashcard-actions">
            <button className="btn-secondary" onClick={() => handleAnswer(false)}>😕 Je ne savais pas</button>
            <button className="btn-primary" onClick={() => handleAnswer(true)}>✅ Je savais</button>
          </div>
        )}
      </div>
    </AppLayout>
  )
}

export default VocabReview

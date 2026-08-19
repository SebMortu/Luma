import { useState } from 'react'
import TranslateToggle from '../TranslateToggle.jsx'
import SpeakButton from '../SpeakButton.jsx'
import { playCorrect } from '../../lib/sounds.js'

// Exercice d'entraînement à l'oral : l'utilisateur écoute le modèle,
// lit la phrase à voix haute lui-même, puis confirme qu'il l'a fait.
// Aucune vérification (pas de reconnaissance vocale) : l'objectif est
// la pratique active de la prononciation, pas la notation.
function ExerciseSpeakingPractice({ content, onAnswered }) {
  const [done, setDone] = useState(false)

  const handleConfirm = () => {
    setDone(true)
    playCorrect()
    onAnswered?.(true) // toujours "correct" : exercice de pratique, non noté
  }

  return (
    <div className="exercise">
      <p className="speaking-practice-label">🎙️ Entraînement à l'oral</p>
      <p className="exercise-question">{content.sentence}</p>
      <SpeakButton text={content.sentence} />
      <TranslateToggle translation={content.sentence_fr} autoReveal={done} />

      {content.tip && <p className="speaking-practice-tip">💡 {content.tip}</p>}

      {!done ? (
        <>
          <p className="progress-card-sub" style={{ marginTop: 10 }}>
            Écoute le modèle, puis lis la phrase à voix haute toi-même.
          </p>
          <button className="btn-primary" onClick={handleConfirm}>
            J'ai lu la phrase à voix haute ✓
          </button>
        </>
      ) : (
        <p className="feedback correct">Bien joué, continue à t'entraîner régulièrement !</p>
      )}
    </div>
  )
}

export default ExerciseSpeakingPractice

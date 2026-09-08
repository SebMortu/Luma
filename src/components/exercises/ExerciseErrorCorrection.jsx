import { useState } from 'react'
import SpeakButton from '../SpeakButton.jsx'
import { playCorrect, playIncorrect } from '../../lib/sounds.js'

// Exercice classique "trouve l'erreur" : l'utilisateur tape sur le mot qu'il
// pense fautif dans la phrase, puis voit la phrase corrigée + l'explication.
function ExerciseErrorCorrection({ content, onAnswered }) {
  const [selectedIndex, setSelectedIndex] = useState(null)
  const [answered, setAnswered] = useState(false)

  const words = content.wrong_sentence.split(' ')
  // Compare en ignorant la ponctuation finale et la casse, pour tolérer
  // "go." vs "go" sans complexifier l'auteur du contenu.
  const normalize = (w) => w.toLowerCase().replace(/[.,!?;:]+$/, '')
  const errorIndex = words.findIndex((w) => normalize(w) === normalize(content.error_word))

  const handleClick = (index) => {
    if (answered) return
    setSelectedIndex(index)
    setAnswered(true)
    const correct = index === errorIndex
    correct ? playCorrect() : playIncorrect()
    onAnswered?.(correct)
  }

  return (
    <div className="exercise">
      <p className="exercise-instruction">Trouve le mot incorrect dans cette phrase.</p>
      <div className="error-correction-sentence">
        {words.map((word, i) => {
          const isError = answered && i === errorIndex
          const isWrongPick = answered && i === selectedIndex && i !== errorIndex
          return (
            <button
              key={i}
              className={`error-correction-word ${isError ? 'is-error' : ''} ${isWrongPick ? 'is-wrong-pick' : ''}`}
              onClick={() => handleClick(i)}
              disabled={answered}
              type="button"
            >
              {word}
            </button>
          )
        })}
      </div>
      <SpeakButton text={content.wrong_sentence} size="small" />

      {answered && (
        <>
          <p className={selectedIndex === errorIndex ? 'feedback correct' : 'feedback incorrect'}>
            {selectedIndex === errorIndex ? (content.feedback_correct || 'Correct !') : (content.feedback_incorrect || 'Regarde le mot en rouge.')}
          </p>
          <div className="error-correction-fix">
            <p className="error-correction-fix-label">Phrase correcte :</p>
            <p className="error-correction-fix-sentence">{content.correct_sentence}</p>
            {content.explanation && <p className="error-correction-explanation">{content.explanation}</p>}
          </div>
        </>
      )}
    </div>
  )
}

export default ExerciseErrorCorrection

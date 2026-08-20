import { useState } from 'react'
import TranslateToggle from '../TranslateToggle.jsx'
import SpeakButton from '../SpeakButton.jsx'
import { extractQuotedOrFull } from '../../lib/speech.js'
import { playCorrect, playIncorrect } from '../../lib/sounds.js'

function ExerciseTrueFalse({ content, onAnswered }) {
  const [selected, setSelected] = useState(null)
  const [answered, setAnswered] = useState(false)

  const handleClick = (value) => {
    if (answered) return
    setSelected(value)
    setAnswered(true)
    const correct = value === content.correct_answer
    correct ? playCorrect() : playIncorrect()
    onAnswered?.(correct)
  }

  const isCorrectChoice = (value) => answered && value === content.correct_answer
  const isWrongChoice = (value) => answered && value === selected && value !== content.correct_answer

  return (
    <div className="exercise">
      <p className="exercise-instruction">Vrai ou faux ?</p>
      <p className="exercise-question">{content.statement}</p>
      <SpeakButton text={extractQuotedOrFull(content.statement)} size="small" />
      <TranslateToggle translation={content.statement_fr} autoReveal={answered} />
      <div className="exercise-options">
        <button
          className={`exercise-option ${isCorrectChoice(true) ? 'correct' : ''} ${isWrongChoice(true) ? 'incorrect' : ''}`}
          onClick={() => handleClick(true)}
          disabled={answered}
        >
          Vrai
        </button>
        <button
          className={`exercise-option ${isCorrectChoice(false) ? 'correct' : ''} ${isWrongChoice(false) ? 'incorrect' : ''}`}
          onClick={() => handleClick(false)}
          disabled={answered}
        >
          Faux
        </button>
      </div>
      {answered && (
        <p className={selected === content.correct_answer ? 'feedback correct' : 'feedback incorrect'}>
          {selected === content.correct_answer ? content.feedback_correct : content.feedback_incorrect}
        </p>
      )}
    </div>
  )
}

export default ExerciseTrueFalse

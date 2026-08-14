import { useState } from 'react'

function ExerciseTrueFalse({ content, onAnswered }) {
  const [selected, setSelected] = useState(null)
  const [answered, setAnswered] = useState(false)

  const handleClick = (value) => {
    if (answered) return
    setSelected(value)
    setAnswered(true)
    onAnswered?.(value === content.correct_answer)
  }

  const isCorrectChoice = (value) => answered && value === content.correct_answer
  const isWrongChoice = (value) => answered && value === selected && value !== content.correct_answer

  return (
    <div className="exercise">
      <p className="exercise-question">{content.statement}</p>
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

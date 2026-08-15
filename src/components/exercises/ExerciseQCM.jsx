import { useState } from 'react'
import TranslateToggle from '../TranslateToggle.jsx'

function ExerciseQCM({ content, onAnswered }) {
  const [selected, setSelected] = useState(null)
  const [answered, setAnswered] = useState(false)

  const handleClick = (index) => {
    if (answered) return
    setSelected(index)
    setAnswered(true)
    onAnswered?.(index === content.correct_index)
  }

  return (
    <div className="exercise">
      <p className="exercise-question">{content.question}</p>
      <TranslateToggle translation={content.question_fr} />
      <div className="exercise-options">
        {content.options.map((option, index) => {
          let className = 'exercise-option'
          if (answered) {
            if (index === content.correct_index) className += ' correct'
            else if (index === selected) className += ' incorrect'
          }
          return (
            <button
              key={index}
              className={className}
              onClick={() => handleClick(index)}
              disabled={answered}
            >
              {option}
            </button>
          )
        })}
      </div>
      {answered && (
        <p className={selected === content.correct_index ? 'feedback correct' : 'feedback incorrect'}>
          {selected === content.correct_index ? content.feedback_correct : content.feedback_incorrect}
        </p>
      )}
    </div>
  )
}

export default ExerciseQCM

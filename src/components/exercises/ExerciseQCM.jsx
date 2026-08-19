import { useState } from 'react'
import TranslateToggle from '../TranslateToggle.jsx'
import SpeakButton from '../SpeakButton.jsx'
import { playCorrect, playIncorrect } from '../../lib/sounds.js'

function ExerciseQCM({ content, onAnswered }) {
  const [selected, setSelected] = useState(null)
  const [answered, setAnswered] = useState(false)

  const handleClick = (index) => {
    if (answered) return
    setSelected(index)
    setAnswered(true)
    const correct = index === content.correct_index
    correct ? playCorrect() : playIncorrect()
    onAnswered?.(correct)
  }

  return (
    <div className="exercise">
      <div className="exercise-question-row">
        <p className="exercise-question">{content.question}</p>
        <SpeakButton text={content.question} />
      </div>
      <TranslateToggle translation={content.question_fr} autoReveal={answered} />
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

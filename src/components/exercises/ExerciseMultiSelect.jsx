import { useState } from 'react'
import TranslateToggle from '../TranslateToggle.jsx'
import SpeakButton from '../SpeakButton.jsx'
import { extractQuotedOrFull } from '../../lib/speech.js'
import { playCorrect, playIncorrect } from '../../lib/sounds.js'

function ExerciseMultiSelect({ content, onAnswered }) {
  const [checked, setChecked] = useState(() => new Set())
  const [answered, setAnswered] = useState(false)

  const toggle = (index) => {
    if (answered) return
    setChecked((prev) => {
      const next = new Set(prev)
      next.has(index) ? next.delete(index) : next.add(index)
      return next
    })
  }

  const handleSubmit = () => {
    if (checked.size === 0 || answered) return
    const correctSet = new Set(content.correct_indices)
    const correct = checked.size === correctSet.size && [...checked].every((i) => correctSet.has(i))
    setAnswered(true)
    correct ? playCorrect() : playIncorrect()
    onAnswered?.(correct)
  }

  const correctSet = new Set(content.correct_indices)

  return (
    <div className="exercise">
      <div className="exercise-question-row">
        <p className="exercise-question">{content.question}</p>
        <SpeakButton text={extractQuotedOrFull(content.question)} />
      </div>
      <TranslateToggle translation={content.question_fr} autoReveal={answered} />
      <p className="multi-select-hint">Plusieurs réponses sont possibles</p>

      <div className="exercise-options">
        {content.options.map((option, index) => {
          const isChecked = checked.has(index)
          let className = 'exercise-option multi-select-option'
          if (answered) {
            if (correctSet.has(index)) className += ' correct'
            else if (isChecked) className += ' incorrect'
          } else if (isChecked) {
            className += ' multi-select-checked'
          }
          return (
            <button
              key={index}
              className={className}
              onClick={() => toggle(index)}
              disabled={answered}
              aria-pressed={isChecked}
            >
              <span className="multi-select-checkbox" aria-hidden="true">{isChecked ? '☑' : '☐'}</span>
              <span className="multi-select-label">{option}</span>
              <SpeakButton text={option} size="small" />
            </button>
          )
        })}
      </div>

      {!answered && (
        <button className="exercise-submit" onClick={handleSubmit} disabled={checked.size === 0}>
          Valider
        </button>
      )}

      {answered && (
        <p className={[...checked].every((i) => correctSet.has(i)) && checked.size === correctSet.size ? 'feedback correct' : 'feedback incorrect'}>
          {[...checked].every((i) => correctSet.has(i)) && checked.size === correctSet.size
            ? (content.feedback_correct || 'Correct !')
            : (content.feedback_incorrect || 'Pas tout à fait — regarde les bonnes réponses surlignées.')}
        </p>
      )}
    </div>
  )
}

export default ExerciseMultiSelect

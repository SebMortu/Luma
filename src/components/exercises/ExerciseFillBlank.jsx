import { useState } from 'react'
import TranslateToggle from '../TranslateToggle.jsx'

function ExerciseFillBlank({ content, onAnswered }) {
  const [value, setValue] = useState('')
  const [answered, setAnswered] = useState(false)
  const [isCorrect, setIsCorrect] = useState(false)
  const [error, setError] = useState('')

  const handleSubmit = () => {
    if (!value.trim()) {
      setError('Écris une réponse avant de valider.')
      return
    }
    setError('')
    const correct = content.correct_answers
      .map((a) => a.toLowerCase())
      .includes(value.trim().toLowerCase())
    setIsCorrect(correct)
    setAnswered(true)
    onAnswered?.(correct)
  }

  return (
    <div className="exercise">
      <p className="exercise-question">
        {content.sentence_before}
        <input
          type="text"
          value={value}
          onChange={(e) => { setValue(e.target.value); setError('') }}
          disabled={answered}
          className="exercise-input"
        />
        {content.sentence_after}
      </p>
      <TranslateToggle translation={content.sentence_fr} autoReveal={answered} />
      {error && <p className="feedback incorrect">{error}</p>}
      {!answered && (
        <button className="exercise-submit" onClick={handleSubmit}>Valider</button>
      )}
      {answered && (
        <p className={isCorrect ? 'feedback correct' : 'feedback incorrect'}>
          {isCorrect ? content.feedback_correct : content.feedback_incorrect}
        </p>
      )}
    </div>
  )
}

export default ExerciseFillBlank

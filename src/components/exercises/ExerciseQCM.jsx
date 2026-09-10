import { useState } from 'react'
import TranslateToggle from '../TranslateToggle.jsx'
import SpeakButton from '../SpeakButton.jsx'
import VocabIcon from '../VocabIcon.jsx'
import { extractQuotedOrFull } from '../../lib/speech.js'
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
    <div className="exercise ex2-qcm">
      {content.image && (
        <div style={{ textAlign: 'center', marginBottom: '0.75rem' }}>
          <VocabIcon value={content.image} size={96} />
        </div>
      )}
      <p className="ex2-eyebrow">{content.eyebrow || 'Choisis la bonne réponse'}</p>
      <div className="exercise-question-row">
        <p className="ex2-question">{content.question}</p>
        <div className="ex2-listen-chip">
          <SpeakButton text={extractQuotedOrFull(content.question)} />
          <span>Écouter</span>
        </div>
      </div>
      <TranslateToggle translation={content.question_fr} autoReveal={answered} />
      <div className="ex2-options">
        {content.options.map((option, index) => {
          let state = ''
          if (answered) {
            if (index === content.correct_index) state = 'correct'
            else if (index === selected) state = 'incorrect'
          }
          return (
            <button
              key={index}
              className={`ex2-option ${state}`}
              onClick={() => handleClick(index)}
              disabled={answered}
            >
              <span className="ex2-option-key">{String.fromCharCode(65 + index)}</span>
              <span className="ex2-option-text">{option}</span>
              <SpeakButton text={option} size="small" />
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

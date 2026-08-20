import { useState, useMemo } from 'react'
import SpeakButton from '../SpeakButton.jsx'
import { playCorrect, playIncorrect } from '../../lib/sounds.js'

function shuffle(array) {
  const copy = [...array]
  for (let i = copy.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1))
    ;[copy[i], copy[j]] = [copy[j], copy[i]]
  }
  return copy
}

function ExerciseMatching({ content, onAnswered }) {
  // Dédupliqué : si plusieurs paires partagent la même bonne réponse (ex. "are"
  // pour you/we/they), elle ne doit apparaître qu'une seule fois dans la liste.
  const shuffledRights = useMemo(() => shuffle([...new Set(content.pairs.map((p) => p.right))]), [content])
  const [answers, setAnswers] = useState({})
  const [answered, setAnswered] = useState(false)

  const handleSelect = (left, value) => {
    if (answered) return
    setAnswers((prev) => ({ ...prev, [left]: value }))
  }

  const allFilled = content.pairs.every((p) => answers[p.left])

  const handleSubmit = () => {
    if (!allFilled) return
    setAnswered(true)
    const allCorrect = content.pairs.every((p) => answers[p.left] === p.right)
    allCorrect ? playCorrect() : playIncorrect()
    onAnswered?.(allCorrect)
  }

  return (
    <div className="exercise">
      <p className="exercise-question">{content.instruction}</p>
      <div className="matching-list">
        {content.pairs.map((p) => {
          const isCorrect = answered && answers[p.left] === p.right
          const isWrong = answered && answers[p.left] !== p.right
          return (
            <div key={p.left} className="matching-row">
              <span className="matching-left">{p.left}</span>
              <SpeakButton text={p.left} size="small" />
              <select
                className={`matching-select ${isCorrect ? 'correct' : ''} ${isWrong ? 'incorrect' : ''}`}
                value={answers[p.left] || ''}
                onChange={(e) => handleSelect(p.left, e.target.value)}
                disabled={answered}
              >
                <option value="">-- choisir --</option>
                {shuffledRights.map((r) => (
                  <option key={r} value={r}>{r}</option>
                ))}
              </select>
              {isWrong && <span className="matching-correct-hint">→ {p.right}</span>}
            </div>
          )
        })}
      </div>
      {!answered && (
        <button className="exercise-submit" onClick={handleSubmit} disabled={!allFilled}>
          Valider
        </button>
      )}
      {answered && (
        <p className={content.pairs.every((p) => answers[p.left] === p.right) ? 'feedback correct' : 'feedback incorrect'}>
          {content.pairs.every((p) => answers[p.left] === p.right)
            ? (content.feedback_correct || 'Correct !')
            : (content.feedback_incorrect || 'Certaines paires sont incorrectes, regarde les corrections ci-dessus.')}
        </p>
      )}
    </div>
  )
}

export default ExerciseMatching

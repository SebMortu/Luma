import { useState, useMemo } from 'react'

function shuffle(array) {
  const copy = [...array]
  for (let i = copy.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1))
    ;[copy[i], copy[j]] = [copy[j], copy[i]]
  }
  return copy
}

function ExerciseReorder({ content, onAnswered }) {
  // Chaque mot reçoit un id unique pour gérer les doublons (ex: "I'm" répété)
  const initialBank = useMemo(
    () => shuffle(content.words.map((word, i) => ({ word, id: i }))),
    [content]
  )
  const [bank, setBank] = useState(initialBank)
  const [selected, setSelected] = useState([])
  const [answered, setAnswered] = useState(false)
  const [isCorrect, setIsCorrect] = useState(false)

  const pickWord = (item) => {
    if (answered) return
    setBank((prev) => prev.filter((w) => w.id !== item.id))
    setSelected((prev) => [...prev, item])
  }

  const removeWord = (item) => {
    if (answered) return
    setSelected((prev) => prev.filter((w) => w.id !== item.id))
    setBank((prev) => [...prev, item])
  }

  const handleSubmit = () => {
    const builtSentence = selected.map((w) => w.word).join(' ')
    const correct = builtSentence === content.words.join(' ')
    setIsCorrect(correct)
    setAnswered(true)
    onAnswered?.(correct)
  }

  return (
    <div className="exercise">
      <p className="exercise-question">{content.instruction}</p>

      <div className="reorder-answer-zone">
        {selected.length === 0 && <span className="reorder-placeholder">Clique sur les mots ci-dessous, dans l'ordre</span>}
        {selected.map((item) => (
          <button key={item.id} className="reorder-chip selected" onClick={() => removeWord(item)} disabled={answered}>
            {item.word}
          </button>
        ))}
      </div>

      <div className="reorder-bank">
        {bank.map((item) => (
          <button key={item.id} className="reorder-chip" onClick={() => pickWord(item)} disabled={answered}>
            {item.word}
          </button>
        ))}
      </div>

      {!answered && (
        <button className="exercise-submit" onClick={handleSubmit} disabled={bank.length > 0}>
          Valider
        </button>
      )}

      {answered && (
        <>
          <p className={isCorrect ? 'feedback correct' : 'feedback incorrect'}>
            {isCorrect ? (content.feedback_correct || 'Correct !') : 'Pas tout à fait.'}
          </p>
          {!isCorrect && (
            <p className="translate-text">Réponse attendue : {content.correct_sentence || content.words.join(' ')}</p>
          )}
        </>
      )}
    </div>
  )
}

export default ExerciseReorder

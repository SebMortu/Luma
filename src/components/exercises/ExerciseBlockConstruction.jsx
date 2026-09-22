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

function ExerciseBlockConstruction({ content, onAnswered }) {
  const allBlocks = useMemo(() => {
    const real = (content.available_blocks || []).map((block, i) => ({ block, id: `real-${i}`, isDistractor: false }))
    const distractors = (content.distractor_blocks || []).map((block, i) => ({ block, id: `distractor-${i}`, isDistractor: true }))
    return shuffle([...real, ...distractors])
  }, [content])

  const [bank, setBank] = useState(allBlocks)
  const [selected, setSelected] = useState([])
  const [answered, setAnswered] = useState(false)
  const [isCorrect, setIsCorrect] = useState(false)

  const pickBlock = (item) => {
    if (answered) return
    setBank((prev) => prev.filter((b) => b.id !== item.id))
    setSelected((prev) => [...prev, item])
  }

  const removeBlock = (item) => {
    if (answered) return
    setSelected((prev) => prev.filter((b) => b.id !== item.id))
    setBank((prev) => [...prev, item])
  }

  const handleReset = () => {
    if (answered) return
    setBank(allBlocks)
    setSelected([])
  }

  const handleSubmit = () => {
    if (selected.length === 0 || answered) return
    const built = selected.map((b) => b.block)
    const correct = JSON.stringify(built) === JSON.stringify(content.correct_sequence)
    setIsCorrect(correct)
    setAnswered(true)
    correct ? playCorrect() : playIncorrect()
    onAnswered?.(correct)
  }

  return (
    <div className="exercise">
      <p className="exercise-question">{content.instruction}</p>
      {content.source_sentence && (
        <div className="block-construction-source">
          <span>{content.source_sentence}</span>
          <SpeakButton text={content.source_sentence} size="small" />
        </div>
      )}

      <div className="reorder-answer-zone block-construction-zone">
        {selected.length === 0 && <span className="reorder-placeholder">Touche les blocs ci-dessous, dans l'ordre</span>}
        {selected.map((item) => (
          <button key={item.id} className="reorder-chip selected" onClick={() => removeBlock(item)} disabled={answered}>
            {item.block}
          </button>
        ))}
      </div>

      <div className="reorder-bank">
        {bank.map((item) => (
          <button key={item.id} className="reorder-chip" onClick={() => pickBlock(item)} disabled={answered}>
            {item.block}
          </button>
        ))}
      </div>

      {!answered && (
        <div className="block-construction-actions">
          <button className="exercise-reset" onClick={handleReset} disabled={selected.length === 0}>
            ↺ Recommencer
          </button>
          <button className="exercise-submit" onClick={handleSubmit} disabled={selected.length === 0}>
            Valider
          </button>
        </div>
      )}

      {answered && (
        <>
          <p className={isCorrect ? 'feedback correct' : 'feedback incorrect'}>
            {isCorrect ? (content.feedback_correct || 'Correct !') : (content.feedback_incorrect || 'Pas tout à fait.')}
          </p>
          {!isCorrect && (
            <div className="translate-text">
              <span>Réponse attendue : {content.correct_sequence.join(' ')}</span>
              <SpeakButton text={content.correct_sequence.join(' ')} size="small" />
            </div>
          )}
        </>
      )}
    </div>
  )
}

export default ExerciseBlockConstruction

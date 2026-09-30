import { useState } from 'react'
import SpeakButton from '../SpeakButton.jsx'
import { playCorrect, playIncorrect } from '../../lib/sounds.js'
import { shuffleAvoiding } from '../../lib/shuffle.js'


function ExerciseReorder({ content, onAnswered }) {
  // Chaque mot reçoit un id unique pour gérer les doublons (ex: "I'm" répété)
  // Mélangé une fois par tentative, et jamais déjà dans un ordre accepté
  // (sinon une phrase de 3 mots est résolue d'avance 1 fois sur 6).
  const [initialBank] = useState(() => {
    const accepted = [content.words.join(' '), ...(content.alternate_orders || [])]
    return shuffleAvoiding(
      content.words.map((word, i) => ({ word, id: i })),
      (cand) => accepted.includes(cand.map((w) => w.word).join(' '))
    )
  })
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
    // Accepte soit l'ordre de référence (content.words), soit toute autre
    // reformulation explicitement listée comme valide (ex: complément de
    // temps en tête de phrase — "Yesterday I worked" est aussi correct que
    // "I worked yesterday").
    const acceptedOrders = [content.words.join(' '), ...(content.alternate_orders || [])]
    const correct = acceptedOrders.includes(builtSentence)
    setIsCorrect(correct)
    setAnswered(true)
    correct ? playCorrect() : playIncorrect()
    onAnswered?.(correct)
  }

  return (
    <div className="exercise ex2-reorder">
      <p className="ex2-reorder-eyebrow">{content.eyebrow || 'Traduis en anglais'}</p>
      <p className="ex2-reorder-question">{content.instruction}</p>

      <div className="ex2-reorder-zone">
        {selected.length === 0 && <span className="ex2-reorder-placeholder">Clique sur les mots ci-dessous, dans l'ordre</span>}
        {selected.map((item) => (
          <button key={item.id} className="ex2-chip ex2-chip-placed" onClick={() => removeWord(item)} disabled={answered}>
            {item.word}
          </button>
        ))}
      </div>

      <div className="ex2-reorder-bank">
        {bank.map((item) => (
          <button key={item.id} className="ex2-chip ex2-chip-bank" onClick={() => pickWord(item)} disabled={answered}>
            {item.word}
          </button>
        ))}
      </div>

      {!answered && (
        <button className="ex2-verify-btn" onClick={handleSubmit} disabled={bank.length > 0}>
          Vérifier
        </button>
      )}

      {answered && (
        <>
          <p className={isCorrect ? 'feedback correct' : 'feedback incorrect'}>
            {isCorrect ? (content.feedback_correct || 'Correct !') : 'Pas tout à fait.'}
          </p>
          <SpeakButton text={content.correct_sentence || content.words.join(' ')} size="small" />
          {!isCorrect && (
            <p className="translate-text">Réponse attendue : {content.correct_sentence || content.words.join(' ')}</p>
          )}
        </>
      )}
    </div>
  )
}

export default ExerciseReorder

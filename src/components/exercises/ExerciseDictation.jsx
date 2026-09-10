import { useEffect, useRef, useState } from 'react'
import TranslateToggle from '../TranslateToggle.jsx'
import SpeakButton, { speak } from '../SpeakButton.jsx'
import { playCorrect, playIncorrect } from '../../lib/sounds.js'

// Normalise pour la comparaison : minuscules, ponctuation retirée, espaces
// multiples réduits — on ne pénalise pas l'utilisateur pour un point ou une
// majuscule oubliée, seul le contenu compte.
function normalize(str) {
  return str
    .toLowerCase()
    .replace(/[.,!?;:'"]/g, '')
    .replace(/\s+/g, ' ')
    .trim()
}

function ExerciseDictation({ content, onAnswered }) {
  const [value, setValue] = useState('')
  const [answered, setAnswered] = useState(false)
  const [isCorrect, setIsCorrect] = useState(false)
  const hasAutoPlayed = useRef(false)

  useEffect(() => {
    // Lecture automatique une fois à l'arrivée sur l'exercice, pour que
    // l'utilisateur puisse écouter sans avoir à cliquer une première fois.
    if (!hasAutoPlayed.current) {
      hasAutoPlayed.current = true
      const t = setTimeout(() => speak(content.sentence), 400)
      return () => clearTimeout(t)
    }
  }, [content])

  const handleSubmit = () => {
    if (!value.trim() || answered) return
    const correct = normalize(value) === normalize(content.sentence)
    setIsCorrect(correct)
    setAnswered(true)
    correct ? playCorrect() : playIncorrect()
    onAnswered?.(correct)
  }

  return (
    <div className="exercise">
      <p className="exercise-instruction">🎧 Écoute et écris ce que tu entends</p>

      <div className="dictation-listen-row">
        <SpeakButton text={content.sentence} size="normal" />
        <SpeakButton text={content.sentence} size="normal" rate={0.4} label="🐢" />
        <span className="dictation-listen-hint">Réécoute autant de fois que nécessaire</span>
      </div>

      {!answered ? (
        <>
          <input
            type="text"
            value={value}
            onChange={(e) => setValue(e.target.value)}
            onKeyDown={(e) => { if (e.key === 'Enter') handleSubmit() }}
            autoCorrect="off"
            autoCapitalize="off"
            spellCheck="false"
            placeholder="Écris ce que tu entends..."
            className="exercise-input dictation-input"
          />
          <button className="exercise-submit" onClick={handleSubmit} disabled={!value.trim()}>Valider</button>
        </>
      ) : (
        <>
          <p className="exercise-question">
            {!isCorrect && <span className="exercise-blank-wrong">{value}</span>}
            <span className={`exercise-blank-filled ${isCorrect ? 'correct' : 'incorrect'}`}>
              {content.sentence}
            </span>
          </p>
          <TranslateToggle translation={content.sentence_fr} autoReveal />
          <p className={isCorrect ? 'feedback correct' : 'feedback incorrect'}>
            {isCorrect ? (content.feedback_correct || 'Parfait, tu as bien entendu !') : (content.feedback_incorrect || 'Pas tout à fait — regarde la phrase correcte ci-dessus.')}
          </p>
        </>
      )}
    </div>
  )
}

export default ExerciseDictation

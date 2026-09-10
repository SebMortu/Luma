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

function shuffle(array) {
  const copy = [...array]
  for (let i = copy.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1))
    ;[copy[i], copy[j]] = [copy[j], copy[i]]
  }
  return copy
}

function ExerciseDictation({ content, onAnswered }) {
  const [value, setValue] = useState('')
  const [answered, setAnswered] = useState(false)
  const [isCorrect, setIsCorrect] = useState(false)
  const [cantListen, setCantListen] = useState(false)
  const hasAutoPlayed = useRef(false)

  // Repli "sans son" : au lieu de valider gratuitement, l'exercice devient
  // une reconstruction de la phrase à partir des mots mélangés — ça reste
  // un vrai exercice, sans dépendre de l'audio.
  const [bank, setBank] = useState([])
  const [placed, setPlaced] = useState([])

  useEffect(() => {
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

  const handleCantListen = () => {
    if (answered) return
    const words = content.sentence.replace(/[.!?]$/, '').split(' ')
    setBank(shuffle(words.map((w, i) => ({ id: `${w}-${i}`, word: w }))))
    setPlaced([])
    setCantListen(true)
  }

  const pickWord = (item) => {
    setBank((b) => b.filter((w) => w.id !== item.id))
    setPlaced((p) => [...p, item])
  }
  const removeWord = (item) => {
    setPlaced((p) => p.filter((w) => w.id !== item.id))
    setBank((b) => [...b, item])
  }

  const handleSubmitReorder = () => {
    if (bank.length > 0 || answered) return
    const attempt = placed.map((p) => p.word).join(' ')
    const correct = normalize(attempt) === normalize(content.sentence.replace(/[.!?]$/, ''))
    setIsCorrect(correct)
    setAnswered(true)
    correct ? playCorrect() : playIncorrect()
    onAnswered?.(correct)
  }

  const reactivateAudio = () => {
    setCantListen(false)
    setBank([])
    setPlaced([])
  }

  return (
    <div className="exercise dict2-exercise">
      {cantListen && !answered && (
        <div className="dict2-noaudio-banner">
          <span>🔇</span>
          <span>Mode sans son activé pour cette question. L'audio revient à la suivante.</span>
        </div>
      )}

      <div className="dict2-card">
        <div className="dict2-eyebrow"><span>{cantListen ? '✍️' : '🎧'}</span><span>{cantListen ? 'Remets la phrase dans l\'ordre' : 'Écoute et écris ce que tu entends'}</span></div>

        {!cantListen ? (
          <>
            <button className="dict2-play-btn" onClick={() => speak(content.sentence)}>🔊</button>
            <div className="dict2-speed-row">
              <span className="dict2-pill" onClick={() => speak(content.sentence, { rate: 0.4 })}>🐢 Version lente</span>
              <span className="dict2-pill" onClick={() => speak(content.sentence)}>🔁 Réécouter</span>
            </div>
            <p className="dict2-hint">Autant de fois que nécessaire, sans pénalité.</p>

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
                  className="dict2-input"
                  autoFocus
                />
                <div className="dict2-actions-row">
                  <span className="dict2-cant-listen" onClick={handleCantListen}>🔇 Je ne peux pas écouter</span>
                </div>
              </>
            ) : (
              <div className="dict2-result-block">
                <p className="exercise-question">
                  {!isCorrect && <span className="exercise-blank-wrong">{value}</span>}
                  <span className={`exercise-blank-filled ${isCorrect ? 'correct' : 'incorrect'}`}>{content.sentence}</span>
                </p>
                <TranslateToggle translation={content.sentence_fr} autoReveal />
              </div>
            )}
          </>
        ) : (
          <>
            <div className="dict2-fr-hint">{content.sentence_fr}</div>
            <div className="dict2-reorder-zone">
              {placed.length === 0 && <span className="ex2-reorder-placeholder">Clique sur les mots dans l'ordre</span>}
              {placed.map((item) => (
                <button key={item.id} className="ex2-chip ex2-chip-placed" onClick={() => removeWord(item)} disabled={answered}>{item.word}</button>
              ))}
            </div>
            <div className="dict2-reorder-bank">
              {bank.map((item) => (
                <button key={item.id} className="ex2-chip ex2-chip-bank" onClick={() => pickWord(item)} disabled={answered}>{item.word}</button>
              ))}
            </div>
            {!answered ? (
              <div className="dict2-actions-row">
                <span className="dict2-cant-listen" style={{ color: '#2563EB' }} onClick={reactivateAudio}>🔊 Réactiver l'audio</span>
              </div>
            ) : (
              <p className={isCorrect ? 'feedback correct' : 'feedback incorrect'}>
                {isCorrect ? 'Correct !' : `Réponse attendue : ${content.sentence}`}
              </p>
            )}
          </>
        )}
      </div>

      {!answered && (
        <button className="dict2-submit" onClick={cantListen ? handleSubmitReorder : handleSubmit} disabled={cantListen ? bank.length > 0 : !value.trim()}>
          Valider
        </button>
      )}
    </div>
  )
}

export default ExerciseDictation

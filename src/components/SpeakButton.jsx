import { useEffect, useState } from 'react'
import { sanitizeForSpeech } from '../lib/speech.js'

// Sélectionne la meilleure voix anglaise disponible, une fois que le navigateur
// a fini de charger sa liste de voix (asynchrone sur certains navigateurs).
function pickEnglishVoice() {
  const voices = window.speechSynthesis?.getVoices() || []
  return (
    voices.find((v) => v.lang === 'en-US') ||
    voices.find((v) => v.lang?.startsWith('en')) ||
    null
  )
}

export function speak(text, { rate = 0.9 } = {}) {
  const clean = sanitizeForSpeech(text)
  if (!window.speechSynthesis || !clean) return
  window.speechSynthesis.cancel() // évite les lectures qui s'empilent
  const utterance = new SpeechSynthesisUtterance(clean)
  const voice = pickEnglishVoice()
  if (voice) utterance.voice = voice
  utterance.lang = voice?.lang || 'en-US'
  utterance.rate = rate
  window.speechSynthesis.speak(utterance)
}

// Vrai si le texte contient au moins une lettre — sert à ignorer les emoji/symboles
// purs (ex. 🔟, 1️⃣), que certains moteurs vocaux prononcent par leur description
// technique ("keycap one") au lieu de simplement les ignorer.
function hasRealLetters(str) {
  return /[a-zA-Zà-üÀ-Ü]/.test(str || '')
}

function SpeakButton({ text, size = 'normal', className = '' }) {
  const [supported, setSupported] = useState(true)
  const [speaking, setSpeaking] = useState(false)

  useEffect(() => {
    setSupported(!!window.speechSynthesis)
  }, [])

  if (!supported || !text || !hasRealLetters(text)) return null

  const handleClick = (e) => {
    e.stopPropagation()
    setSpeaking(true)
    speak(text)
    // Pas d'événement fiable multi-navigateurs pour "fin de lecture" ; on
    // retire l'état visuel "en cours" après une durée estimée.
    const estimatedMs = Math.max(600, text.length * 60)
    setTimeout(() => setSpeaking(false), estimatedMs)
  }

  return (
    <button
      className={`speak-btn ${size === 'small' ? 'speak-btn-small' : ''} ${speaking ? 'speaking' : ''} ${className}`}
      onClick={handleClick}
      aria-label="Écouter"
      type="button"
    >
      🔊
    </button>
  )
}

export default SpeakButton

import { useEffect, useState } from 'react'

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
  if (!window.speechSynthesis || !text) return
  window.speechSynthesis.cancel() // évite les lectures qui s'empilent
  const utterance = new SpeechSynthesisUtterance(text)
  const voice = pickEnglishVoice()
  if (voice) utterance.voice = voice
  utterance.lang = voice?.lang || 'en-US'
  utterance.rate = rate
  window.speechSynthesis.speak(utterance)
}

function SpeakButton({ text, size = 'normal', className = '' }) {
  const [supported, setSupported] = useState(true)
  const [speaking, setSpeaking] = useState(false)

  useEffect(() => {
    setSupported(!!window.speechSynthesis)
  }, [])

  if (!supported || !text) return null

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

import { useEffect, useState } from 'react'
import { sanitizeForSpeech, getPremiumAudioUrl } from '../lib/speech.js'

// Vitesse à laquelle les fichiers audio premium ont été générés — sert à
// calculer le bon ratio de ralenti/accéléré sur un fichier déjà enregistré.
const PREMIUM_BASE_RATE = 0.95

// Sélectionne la meilleure voix anglaise disponible, une fois que le navigateur
// a fini de charger sa liste de voix (asynchrone sur certains navigateurs).
// Priorité aux voix "premium"/neurales connues (nettement plus naturelles que
// la voix par défaut du système), avant de retomber sur n'importe quelle voix
// anglaise disponible.
const PREFERRED_VOICE_NAMES = [
  // iOS/macOS — voix "Améliorée"/"Premium" (Siri) si installées
  'Ava (Premium)', 'Ava', 'Samantha (Enhanced)', 'Samantha',
  // Android/Chrome — voix Google WaveNet, très naturelles
  'Google US English', 'Google UK English Female',
  // Windows Edge — voix neurales Microsoft
  'Microsoft Aria Online (Natural)', 'Microsoft Jenny Online (Natural)', 'Microsoft Guy Online (Natural)',
]

function pickEnglishVoice() {
  const voices = window.speechSynthesis?.getVoices() || []
  const englishVoices = voices.filter((v) => v.lang?.startsWith('en'))

  for (const name of PREFERRED_VOICE_NAMES) {
    const match = englishVoices.find((v) => v.name === name)
    if (match) return match
  }

  return (
    englishVoices.find((v) => v.lang === 'en-US') ||
    englishVoices[0] ||
    null
  )
}

export async function speak(text, { rate = 0.9 } = {}) {
  // 1. Cherche un fichier audio premium (voix naturelle pré-générée) pour ce
  // texte exact — bien plus agréable que la synthèse du navigateur.
  const premiumUrl = await getPremiumAudioUrl(text)
  if (premiumUrl) {
    const audio = new Audio(premiumUrl)
    audio.playbackRate = rate / PREMIUM_BASE_RATE
    audio.play().catch(() => {
      // Lecture bloquée/échouée (rare) -> repli sur la synthèse navigateur
      speakWithBrowser(text, rate)
    })
    return
  }

  // 2. Repli : synthèse vocale du navigateur (pour tout ce qui n'a pas
  // encore de fichier premium généré).
  speakWithBrowser(text, rate)
}

function speakWithBrowser(text, rate) {
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

function SpeakButton({ text, size = 'normal', className = '', rate = 0.9, label = '🔊' }) {
  const [supported, setSupported] = useState(true)
  const [speaking, setSpeaking] = useState(false)

  useEffect(() => {
    setSupported(!!window.speechSynthesis)
  }, [])

  if (!supported || !text || !hasRealLetters(text)) return null

  const handleClick = (e) => {
    e.stopPropagation()
    setSpeaking(true)
    speak(text, { rate })
    // Pas d'événement fiable multi-navigateurs pour "fin de lecture" ; on
    // retire l'état visuel "en cours" après une durée estimée (plus long à
    // vitesse réduite).
    const estimatedMs = Math.max(600, (text.length * 60) / rate)
    setTimeout(() => setSpeaking(false), estimatedMs)
  }

  return (
    <button
      className={`speak-btn ${size === 'small' ? 'speak-btn-small' : ''} ${speaking ? 'speaking' : ''} ${className}`}
      onClick={handleClick}
      aria-label="Écouter"
      type="button"
    >
      {label}
    </button>
  )
}

export default SpeakButton

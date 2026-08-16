const AudioCtx = window.AudioContext || window.webkitAudioContext

let ctx = null
function getCtx() {
  if (!ctx) ctx = new AudioCtx()
  return ctx
}

// Recolle le contexte audio s'il a été suspendu (typiquement après une mise
// en veille du téléphone) — sans ça, plus aucun son ne joue tant qu'on n'a
// pas rouvert l'app.
function ensureResumed(context) {
  if (context.state === 'suspended') {
    context.resume().catch(() => {})
  }
}

function soundsEnabled() {
  return localStorage.getItem('luma-sounds') !== 'false'
}

function playTone(context, freq, startTime, duration, type, gainPeak) {
  const o = context.createOscillator()
  const g = context.createGain()
  o.connect(g)
  g.connect(context.destination)
  o.type = type
  o.frequency.setValueAtTime(freq, startTime)
  g.gain.setValueAtTime(0.0001, startTime)
  g.gain.exponentialRampToValueAtTime(gainPeak, startTime + 0.025)
  g.gain.exponentialRampToValueAtTime(0.0001, startTime + duration)
  o.start(startTime)
  o.stop(startTime + duration + 0.02)
}

export function playCorrect() {
  if (!soundsEnabled()) return
  try {
    const context = getCtx()
    ensureResumed(context)
    const now = context.currentTime
    // Style Duolingo : petit arpège ascendant "ta-da", chaleureux mais bien audible
    playTone(context, 523.25, now, 0.14, 'triangle', 0.13) // Do5
    playTone(context, 659.25, now + 0.08, 0.14, 'triangle', 0.13) // Mi5
    playTone(context, 783.99, now + 0.16, 0.22, 'triangle', 0.14) // Sol5
  } catch (e) { /* audio non supporté, on ignore silencieusement */ }
}

export function playIncorrect() {
  if (!soundsEnabled()) return
  try {
    const context = getCtx()
    ensureResumed(context)
    const now = context.currentTime
    // Style Duolingo : deux notes courtes qui descendent ("bonk-bonk"), bien audibles
    playTone(context, 349.23, now, 0.13, 'square', 0.11) // F4
    playTone(context, 233.08, now + 0.11, 0.22, 'square', 0.13) // Sib3, un peu plus fort et plus long
  } catch (e) { /* audio non supporté, on ignore silencieusement */ }
}

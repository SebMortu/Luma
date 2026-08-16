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
    // Petit arpège chaleureux façon marimba (do → mi), doux et rond
    playTone(context, 523.25, now, 0.18, 'triangle', 0.10)
    playTone(context, 659.25, now + 0.09, 0.22, 'triangle', 0.10)
  } catch (e) { /* audio non supporté, on ignore silencieusement */ }
}

export function playIncorrect() {
  if (!soundsEnabled()) return
  try {
    const context = getCtx()
    ensureResumed(context)
    const now = context.currentTime
    // Ton bas et doux, jamais agressif — juste un signal discret
    playTone(context, 246, now, 0.22, 'sine', 0.08)
  } catch (e) { /* audio non supporté, on ignore silencieusement */ }
}

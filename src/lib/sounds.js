const AudioCtx = window.AudioContext || window.webkitAudioContext

let ctx = null
function getCtx() {
  if (!ctx) ctx = new AudioCtx()
  return ctx
}

function soundsEnabled() {
  return localStorage.getItem('luma-sounds') !== 'false'
}

export function playCorrect() {
  if (!soundsEnabled()) return
  try {
    const context = getCtx()
    const o = context.createOscillator()
    const g = context.createGain()
    o.connect(g)
    g.connect(context.destination)
    o.type = 'sine'
    o.frequency.setValueAtTime(880, context.currentTime)
    o.frequency.exponentialRampToValueAtTime(1320, context.currentTime + 0.15)
    g.gain.setValueAtTime(0.15, context.currentTime)
    g.gain.exponentialRampToValueAtTime(0.0001, context.currentTime + 0.2)
    o.start()
    o.stop(context.currentTime + 0.2)
  } catch (e) { /* audio non supporté, on ignore silencieusement */ }
}

export function playIncorrect() {
  if (!soundsEnabled()) return
  try {
    const context = getCtx()
    const o = context.createOscillator()
    const g = context.createGain()
    o.connect(g)
    g.connect(context.destination)
    o.type = 'sawtooth'
    o.frequency.setValueAtTime(220, context.currentTime)
    g.gain.setValueAtTime(0.12, context.currentTime)
    g.gain.exponentialRampToValueAtTime(0.0001, context.currentTime + 0.3)
    o.start()
    o.stop(context.currentTime + 0.3)
  } catch (e) { /* audio non supporté, on ignore silencieusement */ }
}

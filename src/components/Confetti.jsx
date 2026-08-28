const COLORS = ['var(--accent)', 'var(--accent-lime)', 'var(--accent-coral)', 'var(--accent-warm)']

function makePieces() {
  return Array.from({ length: 16 }, (_, i) => ({
    id: i,
    color: COLORS[i % COLORS.length],
    left: 5 + Math.random() * 90,
    delay: Math.random() * 0.15,
    duration: 0.9 + Math.random() * 0.5,
    rotate: Math.random() * 360,
    drift: (Math.random() - 0.5) * 60,
  }))
}

// Petite salve de confettis déclenchée une fois au montage (fin de leçon,
// objectif du jour atteint...) — CSS pur, aucune dépendance, très léger.
function Confetti() {
  const pieces = makePieces()
  return (
    <div className="confetti-burst" aria-hidden="true">
      {pieces.map((p) => (
        <span
          key={p.id}
          className="confetti-piece"
          style={{
            left: `${p.left}%`,
            background: p.color,
            animationDelay: `${p.delay}s`,
            animationDuration: `${p.duration}s`,
            '--rotate': `${p.rotate}deg`,
            '--drift': `${p.drift}px`,
          }}
        />
      ))}
    </div>
  )
}

export default Confetti

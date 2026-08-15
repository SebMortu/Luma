import { useState } from 'react'

function TranslateToggle({ translation }) {
  const [shown, setShown] = useState(false)

  if (!translation) return null

  return (
    <div className="translate-toggle">
      <button className="translate-btn" onClick={() => setShown(!shown)}>
        🌐 {shown ? 'Masquer la traduction' : 'Traduire'}
      </button>
      {shown && <p className="translate-text">{translation}</p>}
    </div>
  )
}

export default TranslateToggle

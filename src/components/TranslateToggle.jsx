import { useState, useEffect } from 'react'

function TranslateToggle({ translation, autoReveal }) {
  const [shown, setShown] = useState(false)

  useEffect(() => {
    if (autoReveal) setShown(true)
  }, [autoReveal])

  if (!translation) return null

  return (
    <div className="translate-toggle">
      {!autoReveal && (
        <button className="translate-btn" onClick={() => setShown(!shown)}>
          🌐 {shown ? 'Masquer la traduction' : 'Traduire'}
        </button>
      )}
      {shown && <p className="translate-text">🌐 {translation}</p>}
    </div>
  )
}

export default TranslateToggle

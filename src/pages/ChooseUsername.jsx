import { useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'

function ChooseUsername() {
  const { user, recheckUsername } = useAuth()
  const navigate = useNavigate()
  const [value, setValue] = useState('')
  const [error, setError] = useState('')
  const [saving, setSaving] = useState(false)

  const handleSubmit = async (e) => {
    e.preventDefault()
    setError('')
    const trimmed = value.trim()
    if (trimmed.length < 3) {
      setError('Au moins 3 caractères.')
      return
    }
    setSaving(true)
    const { error: dbError } = await supabase.from('user_settings').update({ username: trimmed }).eq('user_id', user.id)
    setSaving(false)
    if (dbError) {
      setError(dbError.message.includes('duplicate') ? 'Ce pseudo est déjà pris, essaie-en un autre.' : dbError.message)
      return
    }
    await recheckUsername()
    navigate('/dashboard')
  }

  return (
    <div className="page auth-page">
      <h1>Luma 🌱</h1>
      <p className="dashboard-goal" style={{ marginBottom: '1.5rem' }}>
        Choisis ton pseudo — c'est ce que tes amis verront dans le classement. Une fois validé, il ne pourra plus être modifié.
      </p>
      <form onSubmit={handleSubmit}>
        <input
          type="text"
          value={value}
          onChange={(e) => setValue(e.target.value)}
          placeholder="Ton pseudo"
          autoFocus
          className="exercise-input"
          maxLength={24}
        />
        {error && <p className="feedback incorrect">{error}</p>}
        <button type="submit" className="btn-primary" disabled={saving} style={{ marginTop: '1rem' }}>
          {saving ? 'Enregistrement...' : 'Valider mon pseudo'}
        </button>
      </form>
    </div>
  )
}

export default ChooseUsername

import { useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { useAuth } from '../contexts/AuthContext.jsx'
import { translateAuthError } from '../lib/authErrors.js'

function ResetPassword() {
  const { updatePassword } = useAuth()
  const navigate = useNavigate()
  const [password, setPassword] = useState('')
  const [confirm, setConfirm] = useState('')
  const [error, setError] = useState('')
  const [loading, setLoading] = useState(false)
  const [done, setDone] = useState(false)
  const [showPassword, setShowPassword] = useState(false)

  const handleSubmit = async (e) => {
    e.preventDefault()
    setError('')

    if (password.length < 6) {
      setError('Le mot de passe doit contenir au moins 6 caractères.')
      return
    }
    if (password !== confirm) {
      setError('Les deux mots de passe ne correspondent pas.')
      return
    }

    setLoading(true)
    const { error: authError } = await updatePassword(password)
    setLoading(false)

    if (authError) { setError(translateAuthError(authError.message)); return }
    setDone(true)
  }

  if (done) {
    return (
      <div className="page auth-page">
        <h1>Luma 🌱</h1>
        <p className="feedback correct">Mot de passe mis à jour avec succès !</p>
        <button className="btn-primary" onClick={() => navigate('/dashboard')}>Continuer</button>
      </div>
    )
  }

  return (
    <div className="page auth-page">
      <h1>Luma 🌱</h1>
      <p className="auth-subtitle">Choisis un nouveau mot de passe</p>

      <form onSubmit={handleSubmit} className="auth-form">
        <div className="auth-password-row">
          <input
            type={showPassword ? 'text' : 'password'}
            placeholder="Nouveau mot de passe"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            required
            minLength={6}
            className="auth-input"
          />
          <button
            type="button"
            className="auth-password-toggle"
            onClick={() => setShowPassword((v) => !v)}
            aria-label={showPassword ? 'Masquer le mot de passe' : 'Afficher le mot de passe'}
          >
            {showPassword ? '🙈' : '👁️'}
          </button>
        </div>
        <input
          type={showPassword ? 'text' : 'password'}
          placeholder="Confirme le mot de passe"
          value={confirm}
          onChange={(e) => setConfirm(e.target.value)}
          required
          minLength={6}
          className="auth-input"
        />
        {error && <p className="feedback incorrect">{error}</p>}
        <button type="submit" disabled={loading} className="btn-primary">
          {loading ? 'Enregistrement...' : 'Valider le nouveau mot de passe'}
        </button>
      </form>
    </div>
  )
}

export default ResetPassword

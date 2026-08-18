import { useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { useAuth } from '../contexts/AuthContext.jsx'
import { translateAuthError } from '../lib/authErrors.js'

function Login() {
  const { signIn, signUp, resetPassword } = useAuth()
  const navigate = useNavigate()
  const [mode, setMode] = useState('signin') // 'signin' | 'signup' | 'reset'
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [error, setError] = useState('')
  const [loading, setLoading] = useState(false)
  const [confirmMessage, setConfirmMessage] = useState('')

  const handleSubmit = async (e) => {
    e.preventDefault()
    setError('')
    setConfirmMessage('')
    setLoading(true)

    if (mode === 'reset') {
      const { error: authError } = await resetPassword(email)
      setLoading(false)
      if (authError) { setError(translateAuthError(authError.message)); return }
      setConfirmMessage('Email envoyé ! Suis le lien reçu pour choisir un nouveau mot de passe.')
      setMode('signin')
      return
    }

    const { error: authError } = mode === 'signin'
      ? await signIn(email, password)
      : await signUp(email, password)

    setLoading(false)

    if (authError) {
      setError(translateAuthError(authError.message))
      return
    }

    if (mode === 'signup') {
      setConfirmMessage('Compte créé ! Vérifie ta boîte mail pour confirmer ton adresse, puis connecte-toi.')
      setMode('signin')
      return
    }

    navigate('/')
  }

  const switchMode = (newMode) => {
    setMode(newMode)
    setError('')
    setConfirmMessage('')
  }

  return (
    <div className="page auth-page">
      <h1>Luma 🌱</h1>
      <p className="auth-subtitle">
        {mode === 'signin' && 'Connecte-toi pour continuer'}
        {mode === 'signup' && 'Crée ton compte'}
        {mode === 'reset' && 'Réinitialise ton mot de passe'}
      </p>

      <form onSubmit={handleSubmit} className="auth-form">
        <input
          type="email"
          placeholder="Adresse email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          required
          className="auth-input"
        />
        {mode !== 'reset' && (
          <input
            type="password"
            placeholder="Mot de passe"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            required
            minLength={6}
            className="auth-input"
          />
        )}
        {error && <p className="feedback incorrect">{error}</p>}
        {confirmMessage && <p className="feedback correct">{confirmMessage}</p>}
        <button type="submit" disabled={loading} className="btn-primary">
          {loading
            ? 'Chargement...'
            : mode === 'signin' ? 'Se connecter' : mode === 'signup' ? "S'inscrire" : 'Envoyer le lien'}
        </button>
      </form>

      {mode === 'signin' && (
        <button className="auth-forgot" onClick={() => switchMode('reset')}>
          Mot de passe oublié ?
        </button>
      )}

      {mode !== 'reset' ? (
        <button className="auth-switch" onClick={() => switchMode(mode === 'signin' ? 'signup' : 'signin')}>
          {mode === 'signin' ? "Pas encore de compte ? S'inscrire" : 'Déjà un compte ? Se connecter'}
        </button>
      ) : (
        <button className="auth-switch" onClick={() => switchMode('signin')}>
          ← Retour à la connexion
        </button>
      )}
    </div>
  )
}

export default Login

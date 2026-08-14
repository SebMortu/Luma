import { useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { useAuth } from '../contexts/AuthContext.jsx'

function Login() {
  const { signIn, signUp } = useAuth()
  const navigate = useNavigate()
  const [mode, setMode] = useState('signin') // 'signin' | 'signup'
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

    const { error: authError } = mode === 'signin'
      ? await signIn(email, password)
      : await signUp(email, password)

    setLoading(false)

    if (authError) {
      setError(authError.message)
      return
    }

    if (mode === 'signup') {
      setConfirmMessage('Compte créé ! Vérifie ta boîte mail pour confirmer ton adresse, puis connecte-toi.')
      setMode('signin')
      return
    }

    navigate('/')
  }

  return (
    <div className="page auth-page">
      <h1>Luma 🌱</h1>
      <p className="auth-subtitle">
        {mode === 'signin' ? 'Connecte-toi pour continuer' : 'Crée ton compte'}
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
        <input
          type="password"
          placeholder="Mot de passe"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          required
          minLength={6}
          className="auth-input"
        />
        {error && <p className="feedback incorrect">{error}</p>}
        {confirmMessage && <p className="feedback correct">{confirmMessage}</p>}
        <button type="submit" disabled={loading} className="btn-primary">
          {loading ? 'Chargement...' : mode === 'signin' ? 'Se connecter' : "S'inscrire"}
        </button>
      </form>

      <button
        className="auth-switch"
        onClick={() => { setMode(mode === 'signin' ? 'signup' : 'signin'); setError(''); setConfirmMessage('') }}
      >
        {mode === 'signin' ? "Pas encore de compte ? S'inscrire" : 'Déjà un compte ? Se connecter'}
      </button>
    </div>
  )
}

export default Login

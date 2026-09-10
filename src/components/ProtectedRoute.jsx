import { Navigate, useLocation } from 'react-router-dom'
import { useAuth } from '../contexts/AuthContext.jsx'

function ProtectedRoute({ children }) {
  const { user, loading, needsUsername } = useAuth()
  const location = useLocation()

  if (loading) return <div className="page"><p>Chargement...</p></div>
  if (!user) return <Navigate to="/login" replace />
  if (needsUsername && location.pathname !== '/choose-username') return <Navigate to="/choose-username" replace />

  return children
}

export default ProtectedRoute

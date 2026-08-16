import { useNavigate, useLocation } from 'react-router-dom'

const NAV_ITEMS = [
  { path: '/dashboard', icon: '🏠', label: 'Accueil', enabled: true },
  { path: '/grammar', icon: '📚', label: 'Grammaire', enabled: true },
  { path: '/toeic-test', icon: '📝', label: 'Examen', enabled: true },
  { path: '/verbs', icon: '🔤', label: 'Verbes', enabled: true },
  { path: '/scenarios', icon: '🎭', label: 'Scénarios', enabled: true },
  { path: '/profile', icon: '👤', label: 'Profil', enabled: true },
  { path: '/settings', icon: '⚙️', label: 'Réglages', enabled: true },
]

function Sidebar() {
  const navigate = useNavigate()
  const location = useLocation()

  return (
    <nav className="sidebar">
      {NAV_ITEMS.map((item) => (
        <button
          key={item.path}
          className={`nav-item ${location.pathname === item.path ? 'active' : ''} ${!item.enabled ? 'disabled' : ''}`}
          onClick={() => item.enabled && navigate(item.path)}
          disabled={!item.enabled}
        >
          <span className="nav-icon">{item.icon}</span>
          <span className="nav-label">{item.label}</span>
        </button>
      ))}
    </nav>
  )
}

export default Sidebar

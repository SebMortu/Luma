import { useNavigate, useLocation } from 'react-router-dom'

const NAV_ITEMS = [
  { path: '/dashboard', icon: '🏠', label: 'Accueil', enabled: true, matches: ['/dashboard'] },
  { path: '/learn', icon: '🎓', label: 'Apprendre', enabled: true, matches: ['/learn', '/grammar', '/toeic-test', '/verbs', '/unit', '/lesson', '/level'] },
  { path: '/practice', icon: '🎮', label: 'Pratiquer', enabled: true, matches: ['/practice', '/scenario', '/word-games', '/word-puzzle', '/vocab-review'] },
  { path: '/books', icon: '📖', label: 'Livre', enabled: true, matches: ['/books'] },
  { path: '/profile', icon: '👤', label: 'Profil', enabled: true, matches: ['/profile', '/settings', '/reset-password'] },
]

function Sidebar() {
  const navigate = useNavigate()
  const location = useLocation()

  const isActive = (item) => item.matches.some((prefix) => location.pathname.startsWith(prefix))

  return (
    <nav className="sidebar">
      {NAV_ITEMS.map((item) => (
        <button
          key={item.path}
          className={`nav-item ${isActive(item) ? 'active' : ''} ${!item.enabled ? 'disabled' : ''}`}
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

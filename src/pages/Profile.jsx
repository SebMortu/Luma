import { useAuth } from '../contexts/AuthContext.jsx'
import { useTheme, THEMES } from '../contexts/ThemeContext.jsx'
import BottomNav from '../components/BottomNav.jsx'

const SWATCH_COLORS = {
  night: '#0e1420',
  forest: '#1a1a1a',
  light: '#f7f6f3',
}

function Profile() {
  const { user, signOut } = useAuth()
  const { theme, setTheme } = useTheme()

  return (
    <>
      <div className="page">
        <h1>Profil</h1>
        <p className="dashboard-email">{user.email}</p>

        <h2>Apparence</h2>
        <div className="theme-options">
          {THEMES.map((t) => (
            <button
              key={t.value}
              className={`theme-option ${theme === t.value ? 'selected' : ''}`}
              onClick={() => setTheme(t.value)}
            >
              <span className="theme-swatch" style={{ background: SWATCH_COLORS[t.value] }} />
              <div>
                <p className="onboarding-option-title">{t.label}</p>
                <p className="onboarding-option-desc">{t.desc}</p>
              </div>
            </button>
          ))}
        </div>

        <button className="dashboard-signout" onClick={signOut}>Se déconnecter</button>
      </div>
      <BottomNav />
    </>
  )
}

export default Profile

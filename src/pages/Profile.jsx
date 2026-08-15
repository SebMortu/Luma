import { useAuth } from '../contexts/AuthContext.jsx'
import { useTheme, THEMES, PASTEL_SWATCHES } from '../contexts/ThemeContext.jsx'
import AppLayout from '../components/AppLayout.jsx'

const SWATCH_PREVIEW = {
  night: '#0e1420',
  forest: '#1a1a1a',
  light: '#f7f6f3',
  pastel: 'linear-gradient(135deg, #FFADAD, #A0C4FF)',
}

function Profile() {
  const { user, signOut } = useAuth()
  const { theme, setTheme, pastelBg, setPastelBg } = useTheme()

  return (
    <AppLayout>
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
              <span className="theme-swatch" style={{ background: SWATCH_PREVIEW[t.value] }} />
              <div>
                <p className="onboarding-option-title">{t.label}</p>
                <p className="onboarding-option-desc">{t.desc}</p>
              </div>
            </button>
          ))}
        </div>

        {theme === 'pastel' && (
          <>
            <p className="dashboard-section-title">Choisis ta couleur</p>
            <div className="pastel-grid">
              {PASTEL_SWATCHES.map((s) => (
                <button
                  key={s.bg}
                  className={`pastel-swatch ${pastelBg === s.bg ? 'selected' : ''}`}
                  style={{ background: s.bg }}
                  onClick={() => setPastelBg(s.bg)}
                  title={s.label}
                />
              ))}
            </div>
          </>
        )}

        <button className="dashboard-signout" onClick={signOut}>Se déconnecter</button>
      </div>
    </AppLayout>
  )
}

export default Profile

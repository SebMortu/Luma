import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import { useTheme, THEMES, PASTEL_SWATCHES } from '../contexts/ThemeContext.jsx'
import AppLayout from '../components/AppLayout.jsx'

const SWATCH_PREVIEW = {
  night: '#0e1420',
  forest: '#1a1a1a',
  light: '#f7f6f3',
  pastel: 'linear-gradient(135deg, #FFADAD, #A0C4FF)',
}

const TIME_OPTIONS = [5, 10, 20]
const LEVEL_OPTIONS = [
  { value: 'debutant', label: 'Débutant complet' },
  { value: 'bases', label: 'Bases acquises' },
  { value: 'intermediaire', label: 'Intermédiaire' },
]
const GOAL_OPTIONS = [
  { value: 'voyage', label: 'Voyage' },
  { value: 'travail', label: 'Travail' },
  { value: 'culture', label: 'Culture' },
  { value: 'perso', label: 'Défi personnel' },
]

function Settings() {
  const { user, signOut } = useAuth()
  const { theme, setTheme, pastelBg, setPastelBg } = useTheme()
  const [settings, setSettings] = useState(null)
  const [notifEnabled, setNotifEnabled] = useState(() => localStorage.getItem('luma-notifications') === 'true')
  const [soundsEnabled, setSoundsEnabled] = useState(() => localStorage.getItem('luma-sounds') !== 'false')
  const [saving, setSaving] = useState(false)

  useEffect(() => {
    async function load() {
      const { data } = await supabase.from('user_settings').select('*').eq('user_id', user.id).single()
      setSettings(data)
    }
    load()
  }, [user.id])

  const toggleNotifications = () => {
    const newValue = !notifEnabled
    setNotifEnabled(newValue)
    localStorage.setItem('luma-notifications', String(newValue))
  }

  const toggleSounds = () => {
    const newValue = !soundsEnabled
    setSoundsEnabled(newValue)
    localStorage.setItem('luma-sounds', String(newValue))
  }

  const updateSetting = async (field, value) => {
    setSaving(true)
    setSettings((prev) => ({ ...prev, [field]: value }))
    await supabase.from('user_settings').update({ [field]: value }).eq('user_id', user.id)
    setSaving(false)
  }

  if (!settings) return <AppLayout><div className="page"><p>Chargement...</p></div></AppLayout>

  return (
    <AppLayout>
      <div className="page">
        <Link to="/profile" className="back-link">← Retour au profil</Link>
        <h1>⚙️ Réglages</h1>

        <h2>Notifications</h2>
        <button className="setting-row" onClick={toggleNotifications}>
          <span>Rappels quotidiens</span>
          <span>{notifEnabled ? '🔔 Activées' : '🔕 Désactivées'}</span>
        </button>
        <p className="setting-note">
          Enregistre ta préférence dès maintenant — l'envoi effectif des notifications arrivera dans une prochaine mise à jour.
        </p>

        <h2>Sons</h2>
        <button className="setting-row" onClick={toggleSounds}>
          <span>Sons de réponse</span>
          <span>{soundsEnabled ? '🔊 Activés' : '🔇 Désactivés'}</span>
        </button>

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
          <div className="pastel-grid" style={{ marginTop: -10 }}>
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
        )}

        <h2>Objectif quotidien</h2>
        <div className="onboarding-options">
          {TIME_OPTIONS.map((t) => (
            <button
              key={t}
              className={`onboarding-option row ${settings.daily_goal_minutes === t ? 'selected' : ''}`}
              onClick={() => updateSetting('daily_goal_minutes', t)}
            >
              <span className="onboarding-option-title">{t} min / jour</span>
            </button>
          ))}
        </div>

        <h2>Ton niveau</h2>
        <div className="onboarding-options">
          {LEVEL_OPTIONS.map((l) => (
            <button
              key={l.value}
              className={`onboarding-option row ${settings.level === l.value ? 'selected' : ''}`}
              onClick={() => updateSetting('level', l.value)}
            >
              <span className="onboarding-option-title">{l.label}</span>
            </button>
          ))}
        </div>

        <h2>Ton objectif</h2>
        <div className="onboarding-options">
          {GOAL_OPTIONS.map((g) => (
            <button
              key={g.value}
              className={`onboarding-option row ${settings.objective === g.value ? 'selected' : ''}`}
              onClick={() => updateSetting('objective', g.value)}
            >
              <span className="onboarding-option-title">{g.label}</span>
            </button>
          ))}
        </div>

        <h2>Langue apprise</h2>
        <div className="setting-row disabled">
          <span>🇬🇧 Anglais</span>
          <span className="setting-note-inline">D'autres langues arrivent bientôt</span>
        </div>

        <button className="dashboard-signout" onClick={signOut} style={{ marginTop: '2rem' }}>
          Se déconnecter
        </button>
      </div>
    </AppLayout>
  )
}

export default Settings

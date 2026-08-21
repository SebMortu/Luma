import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import { useTheme, THEMES, TEXT_SCALES } from '../contexts/ThemeContext.jsx'
import { getMascot } from '../lib/characters.js'
import { getPushSubscriptionStatus, subscribeToPush, unsubscribeFromPush } from '../lib/push.js'
import CharacterAvatar from '../components/CharacterAvatar.jsx'
import AppLayout from '../components/AppLayout.jsx'

const SWATCH_PREVIEW = {
  lumen: 'linear-gradient(135deg, #0D1B2E, #14263D 55%, #3B82F6)',
  'lumen-light': 'linear-gradient(135deg, #F5F9FF, #E9F1FC 55%, #3B82F6)',
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
  const { theme, setTheme, textScale, setTextScale } = useTheme()
  const [settings, setSettings] = useState(null)
  const [mascot, setMascot] = useState(null)
  const [pushStatus, setPushStatus] = useState('checking') // 'unsupported' | 'denied' | 'subscribed' | 'not-subscribed'
  const [pushError, setPushError] = useState('')
  const [soundsEnabled, setSoundsEnabled] = useState(() => localStorage.getItem('luma-sounds') !== 'false')
  const [saving, setSaving] = useState(false)

  useEffect(() => {
    async function load() {
      const { data } = await supabase.from('user_settings').select('*').eq('user_id', user.id).single()
      setSettings(data)
      getMascot().then(setMascot).catch(() => setMascot(null))
      getPushSubscriptionStatus().then(setPushStatus).catch(() => setPushStatus('unsupported'))
    }
    load()
  }, [user.id])

  const toggleNotifications = async () => {
    setPushError('')
    if (pushStatus === 'subscribed') {
      await unsubscribeFromPush(user.id)
      setPushStatus('not-subscribed')
    } else {
      try {
        await subscribeToPush(user.id)
        setPushStatus('subscribed')
      } catch (err) {
        setPushError(err.message)
        setPushStatus(await getPushSubscriptionStatus())
      }
    }
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
        <button className="setting-row" onClick={toggleNotifications} disabled={pushStatus === 'unsupported' || pushStatus === 'denied'}>
          <span>Rappels quotidiens</span>
          <span>
            {pushStatus === 'checking' && '...'}
            {pushStatus === 'subscribed' && '🔔 Activées'}
            {pushStatus === 'not-subscribed' && '🔕 Désactivées'}
            {pushStatus === 'denied' && '🚫 Bloquées par le navigateur'}
            {pushStatus === 'unsupported' && '— Non disponible'}
          </span>
        </button>
        {pushError && <p className="feedback incorrect">{pushError}</p>}
        <p className="setting-note">
          {pushStatus === 'denied'
            ? "Tu as refusé les notifications pour ce site — change ça dans les réglages de ton navigateur pour les réactiver."
            : "Un petit rappel si tu n'as pas encore fait ta leçon du jour, pour ne pas perdre ta série."}
        </p>

        <h2>Sons</h2>
        <button className="setting-row" onClick={toggleSounds}>
          <span>Sons de réponse</span>
          <span>{soundsEnabled ? '🔊 Activés' : '🔇 Désactivés'}</span>
        </button>

        <h2>Ta mascotte</h2>
        <div className="mascot-settings-row">
          {mascot && <CharacterAvatar character={mascot} state="happy" size={56} />}
          <div>
            <p className="onboarding-option-title">{mascot?.name || 'Echo'}</p>
            <p className="progress-card-sub">{mascot?.description}</p>
          </div>
        </div>

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

        <h2>Taille du texte</h2>
        <div className="onboarding-options">
          {TEXT_SCALES.map((s) => (
            <button
              key={s.value}
              className={`onboarding-option row ${textScale === s.value ? 'selected' : ''}`}
              onClick={() => setTextScale(s.value)}
            >
              <span style={{ fontSize: s.value === 'normal' ? '14px' : s.value === 'large' ? '17px' : '20px' }}>Aa</span>
              {s.label}
            </button>
          ))}
        </div>

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

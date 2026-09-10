import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import { useTheme, THEMES, TEXT_SCALES } from '../contexts/ThemeContext.jsx'
import { getGuideCharacter, getSelectableCharacters, setGuideCharacter } from '../lib/characters.js'
import { getPushSubscriptionStatus, subscribeToPush, unsubscribeFromPush } from '../lib/push.js'
import CharacterAvatar from '../components/CharacterAvatar.jsx'
import AppLayout from '../components/AppLayout.jsx'

const SWATCH_PREVIEW = {
  lumen: 'linear-gradient(135deg, #0D1B2E, #14263D 55%, #3B82F6)',
  'lumen-light': 'linear-gradient(135deg, #F5F9FF, #E9F1FC 55%, #3B82F6)',
}

const TIME_OPTIONS = [5, 10, 20]

const isIOS = typeof navigator !== 'undefined' && /iPad|iPhone|iPod/.test(navigator.userAgent)
const isStandalone = typeof navigator !== 'undefined' && (window.navigator.standalone === true || window.matchMedia('(display-mode: standalone)').matches)

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
  const [usernameSaved, setUsernameSaved] = useState(false)
  const [mascot, setMascot] = useState(null)
  const [allCharacters, setAllCharacters] = useState([])
  const [showMascotPicker, setShowMascotPicker] = useState(false)
  const [pushStatus, setPushStatus] = useState('checking')
  const [pushError, setPushError] = useState('')
  const [soundsEnabled, setSoundsEnabled] = useState(() => localStorage.getItem('luma-sounds') !== 'false')

  useEffect(() => {
    async function load() {
      const { data } = await supabase.from('user_settings').select('*').eq('user_id', user.id).single()
      setSettings(data)
      getGuideCharacter(user.id).then(setMascot).catch(() => setMascot(null))
      getSelectableCharacters().then(setAllCharacters).catch(() => setAllCharacters([]))
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
    setSettings((prev) => ({ ...prev, [field]: value }))
    await supabase.from('user_settings').update({ [field]: value }).eq('user_id', user.id)
  }

  const handleChangeMascot = async (character) => {
    setMascot(character)
    await setGuideCharacter(user.id, character.id)
  }

  if (!settings) return <AppLayout><div className="page"><p>Chargement...</p></div></AppLayout>

  const initial = user.email.charAt(0).toUpperCase()

  return (
    <AppLayout>
      <div className="page set2-page">
        <Link to="/profile" className="sc2-back">← Retour au profil</Link>
        <p className="set2-title">⚙️ Réglages</p>

        <p className="set2-section-label">Compte</p>
        <div className="set2-card">
          <div className="set2-account-row">
            <span className="d2-avatar">{initial}</span>
            <div style={{ flex: 1, minWidth: 0 }}>
              <div className="set2-account-name">{settings.username}</div>
              <div className="ob2-level-desc">Ton pseudo, utilisé par tes amis pour te retrouver</div>
            </div>
            <span
              className="set2-link"
              onClick={() => {
                navigator.clipboard.writeText(settings.username || '')
                setUsernameSaved(true)
                setTimeout(() => setUsernameSaved(false), 2000)
              }}
            >
              {usernameSaved ? 'Copié !' : 'Copier'}
            </span>
          </div>
          <div className="set2-divider" />
          <div className="set2-account-row">
            <span className="set2-lang-chip">GB</span>
            <div style={{ flex: 1, minWidth: 0 }}>
              <div className="ob2-level-title">Anglais</div>
              <div className="ob2-level-desc">D'autres langues arrivent bientôt</div>
            </div>
          </div>
        </div>

        <p className="set2-section-label">Notifications et sons</p>
        <div className="set2-card set2-toggle-card">
          <div className="set2-toggle-row" onClick={pushStatus === 'unsupported' || pushStatus === 'denied' ? undefined : toggleNotifications}>
            <span className="set2-toggle-icon" style={{ background: '#EEF4FE' }}>🔔</span>
            <div style={{ flex: 1, minWidth: 0 }}>
              <div className="ob2-level-title">Rappels quotidiens</div>
              <div className="ob2-level-desc">
                {pushStatus === 'denied' ? 'Bloqués par le navigateur' : "Un rappel si tu n'as pas fait ta leçon du jour"}
              </div>
            </div>
            <span className={`set2-switch ${pushStatus === 'subscribed' ? 'on' : ''}`}><span className="set2-switch-knob" /></span>
          </div>
          <div className="set2-toggle-row" onClick={toggleSounds}>
            <span className="set2-toggle-icon" style={{ background: '#F1F8E0' }}>🔊</span>
            <div style={{ flex: 1, minWidth: 0 }}>
              <div className="ob2-level-title">Sons de réponse</div>
              <div className="ob2-level-desc">Petit son à chaque bonne/mauvaise réponse</div>
            </div>
            <span className={`set2-switch ${soundsEnabled ? 'on' : ''}`}><span className="set2-switch-knob" /></span>
          </div>
        </div>
        {pushError && <p className="feedback incorrect">{pushError}</p>}
        {isIOS && !isStandalone && (
          <p className="setting-note">📲 Sur iPhone/iPad, ajoute Luma à l'écran d'accueil pour activer les notifications (bouton de partage Safari → "Sur l'écran d'accueil").</p>
        )}

        <p className="set2-section-label">Apprentissage</p>
        <div className="set2-card">
          <div className="set2-block-head">
            <span className="ob2-level-title">Objectif quotidien</span>
            <span className="ob2-level-desc">Actuel : {settings.daily_goal_minutes} min</span>
          </div>
          <div className="set2-segmented">
            {TIME_OPTIONS.map((t) => (
              <span key={t} className={`set2-segment ${settings.daily_goal_minutes === t ? 'selected' : ''}`} onClick={() => updateSetting('daily_goal_minutes', t)}>
                {t} min
              </span>
            ))}
          </div>

          <div className="set2-block-head" style={{ marginTop: '16px' }}>
            <span className="ob2-level-title">Ton niveau de départ</span>
          </div>
          <div className="set2-radio-list">
            {LEVEL_OPTIONS.map((l) => (
              <div key={l.value} className={`set2-radio-row ${settings.level === l.value ? 'selected' : ''}`} onClick={() => updateSetting('level', l.value)}>
                <span className={`ob2-radio ${settings.level === l.value ? 'selected' : ''}`} />
                <span style={{ flex: 1, fontWeight: 700, fontSize: '13px', color: 'var(--text-primary)' }}>{l.label}</span>
              </div>
            ))}
          </div>

          <div className="set2-block-head" style={{ marginTop: '16px' }}>
            <span className="ob2-level-title">Ton objectif</span>
          </div>
          <div className="set2-chip-row">
            {GOAL_OPTIONS.map((g) => (
              <span key={g.value} className={`set2-chip ${settings.objective === g.value ? 'selected' : ''}`} onClick={() => updateSetting('objective', g.value)}>
                {g.label}
              </span>
            ))}
          </div>
        </div>

        <p className="set2-section-label">Apparence</p>
        <div className="set2-card">
          <div className="ob2-theme-row">
            {THEMES.map((t) => (
              <div key={t.value} className={`ob2-theme-card ${theme === t.value ? 'selected' : ''}`} onClick={() => setTheme(t.value)}>
                <span className="ob2-theme-swatch" style={{ background: SWATCH_PREVIEW[t.value], height: '46px' }} />
                <div className="ob2-level-title" style={{ marginTop: '9px', fontSize: '13px' }}>{t.label}</div>
                <div className="ob2-level-desc">{t.desc}</div>
              </div>
            ))}
          </div>
          <div className="set2-block-head" style={{ marginTop: '16px' }}>
            <span className="ob2-level-title">Taille du texte</span>
          </div>
          <div className="ob2-textsize-row">
            {TEXT_SCALES.map((s) => (
              <div key={s.value} className={`ob2-textsize-btn ${textScale === s.value ? 'selected' : ''}`} onClick={() => setTextScale(s.value)}>
                <span style={{ display: 'block', fontWeight: 800, fontSize: s.value === 'normal' ? '14px' : s.value === 'large' ? '17px' : '20px' }}>Aa</span>
                <span style={{ display: 'block', fontWeight: 700, fontSize: '10.5px', marginTop: '3px' }}>{s.label}</span>
              </div>
            ))}
          </div>
        </div>

        <p className="set2-section-label">Ta mascotte</p>
        <div className="set2-card set2-mascot-summary" onClick={() => setShowMascotPicker(!showMascotPicker)}>
          {mascot && <CharacterAvatar character={mascot} state="neutral" size={48} />}
          <div style={{ flex: 1, minWidth: 0 }}>
            <div className="ob2-level-title">{mascot?.name}</div>
            <div className="ob2-level-desc">{mascot?.description}</div>
          </div>
          <span style={{ fontWeight: 800, fontSize: '15px', color: '#66718A' }}>{showMascotPicker ? '⌃' : '›'}</span>
        </div>
        {showMascotPicker && (
          <div className="character-picker-grid" style={{ marginTop: '10px' }}>
            {allCharacters.map((c) => (
              <button
                key={c.id}
                className={`character-picker-card ${mascot?.id === c.id ? 'selected' : ''}`}
                onClick={() => handleChangeMascot(c)}
              >
                <CharacterAvatar character={c} state={mascot?.id === c.id ? 'happy' : 'neutral'} size={56} />
                <p className="character-picker-name">{c.name}</p>
              </button>
            ))}
          </div>
        )}

        <div className="set2-signout-block">
          <span className="set2-signout" onClick={signOut}>Se déconnecter</span>
          <div className="set2-version">Luma · version 1.4</div>
        </div>
      </div>
    </AppLayout>
  )
}

export default Settings

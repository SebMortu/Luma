import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import { useTheme, THEMES, TEXT_SCALES } from '../contexts/ThemeContext.jsx'
import { getSelectableCharacters } from '../lib/characters.js'
import CharacterAvatar from '../components/CharacterAvatar.jsx'

const LEVELS = [
  { value: 'A0', label: 'Vrai grand débutant', desc: "Je n'ai jamais appris de langue étrangère" },
  { value: 'A1', label: 'A1 · Quelques bases', desc: 'Je connais déjà quelques mots simples' },
  { value: 'A2', label: 'A2 · Élémentaire', desc: 'Je connais quelques structures de phrase' },
  { value: 'B1', label: 'B1 · Intermédiaire', desc: 'Je peux tenir une conversation simple' },
  { value: 'B2', label: 'B2 · Intermédiaire avancé', desc: 'Je suis à l\'aise à l\'oral et à l\'écrit' },
  { value: 'C1', label: 'C1 · Avancé', desc: 'Je maîtrise déjà bien la langue' },
]
const LEVEL_CHIP = {
  A0: { bg: '#DCEFFB', fg: '#1E4A72' }, A1: { bg: '#E4F3D2', fg: '#3E5410' }, A2: { bg: '#FFE9D6', fg: '#8A4A12' },
  B1: { bg: '#FDE2E0', fg: '#8A2E24' }, B2: { bg: '#E7E1FB', fg: '#4B2E8A' }, C1: { bg: '#DCE1EC', fg: '#28324A' },
}

const GOALS = [
  { value: 'voyage', label: 'Voyager sereinement', icon: '✈️' },
  { value: 'travail', label: 'Progresser au travail', icon: '💼' },
  { value: 'culture', label: 'Films, jeux, culture', icon: '🎮' },
  { value: 'perso', label: 'Défi personnel', icon: '🎯' },
]

const TIMES = [
  { value: 5, label: '5 min / jour', desc: 'Décontracté', tag: 'Le plus tenable' },
  { value: 10, label: '10 min / jour', desc: 'Régulier', tag: null },
  { value: 20, label: '20 min / jour', desc: 'Sérieux', tag: null },
]

const SWATCH_PREVIEW = { lumen: '#0D1B2E', 'lumen-light': '#F5F9FF' }

const TOUR_SLIDES = [
  { emoji: '🔥', title: 'Ta progression au jour le jour', text: "Chaque leçon terminée te rapporte de l'XP et fait grandir ta série de jours consécutifs (streak). Reviens chaque jour pour ne pas la perdre !" },
  { emoji: '🧭', title: 'Apprendre, Pratiquer, Livre', text: "Apprendre pour la grammaire et le vocabulaire de base. Pratiquer pour les scénarios, jeux et révisions. Livre pour lire des histoires à ton niveau." },
  { emoji: '🔊', title: "Écoute et parle à voix haute", text: "Le bouton 🔊 lit les phrases à voix haute. Profites-en pour répéter toi-même — c'est comme ça qu'on progresse le plus vite à l'oral." },
]

function Onboarding() {
  const { user } = useAuth()
  const navigate = useNavigate()
  const { theme, setTheme, textScale, setTextScale } = useTheme()
  const [step, setStep] = useState(1)
  const [tourIndex, setTourIndex] = useState(0)
  const [level, setLevel] = useState(null)
  const [goal, setGoal] = useState(null)
  const [time, setTime] = useState(null)
  const [mascot, setMascot] = useState(null)
  const [characters, setCharacters] = useState([])
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState('')

  useEffect(() => {
    getSelectableCharacters().then(setCharacters).catch(() => setCharacters([]))
  }, [])

  const finish = async () => {
    setSaving(true)
    setError('')
    try {
      const { data: language, error: langErr } = await supabase
        .from('languages').select('id').eq('code', 'en').single()
      if (langErr) throw langErr

      const { error: updateErr } = await supabase
        .from('user_settings')
        .update({
          active_language_id: language.id,
          level,
          objective: goal,
          daily_goal_minutes: time,
          guide_character_id: mascot?.id || null,
        })
        .eq('user_id', user.id)
      if (updateErr) throw updateErr

      const levelOrder = ['A0', 'A1', 'A2', 'B1', 'B2', 'C1']
      const targetIndex = levelOrder.indexOf(level)

      if (targetIndex > 1) {
        navigate(`/placement-test/${level}`, { replace: true })
        return
      }

      let firstLessonId = null

      if (targetIndex === 1) {
        await supabase.from('user_settings').update({ unlocked_level: 'A0' }).eq('user_id', user.id)
        const { data: firstUnitAtLevel } = await supabase
          .from('units').select('id')
          .eq('language_id', language.id).eq('cecr_level', level)
          .order('position').limit(1).single()
        if (firstUnitAtLevel) {
          const { data: lesson } = await supabase
            .from('lessons').select('id').eq('unit_id', firstUnitAtLevel.id).order('position').limit(1).single()
          firstLessonId = lesson?.id || null
        }
      } else {
        const { data: firstUnitAtLevel } = await supabase
          .from('units').select('id')
          .eq('language_id', language.id).eq('cecr_level', level)
          .order('position').limit(1).single()
        if (firstUnitAtLevel) {
          const { data: lesson } = await supabase
            .from('lessons').select('id').eq('unit_id', firstUnitAtLevel.id).order('position').limit(1).single()
          firstLessonId = lesson?.id || null
        }
      }

      navigate(firstLessonId ? `/lesson/${firstLessonId}` : '/dashboard', { replace: true })
    } catch (err) {
      setError(err.message)
      setSaving(false)
    }
  }

  const TOTAL_STEPS = 5

  return (
    <div className="page ob2-page">
      {step <= TOTAL_STEPS && (
        <div className="ob2-header-row">
          {step > 1 ? <span className="ob2-back" onClick={() => setStep(step - 1)}>←</span> : <span className="ob2-back-spacer" />}
          <div className="ob2-progress-track">
            {[1, 2, 3, 4, 5].map((s) => <span key={s} className={`ob2-progress-seg ${step >= s ? 'active' : ''}`} />)}
          </div>
          <span className="ob2-step-label">{step}/{TOTAL_STEPS}</span>
        </div>
      )}

      {step === 1 && (
        <>
          <h1 className="ob2-title">Quel est ton niveau actuel ?</h1>
          <p className="ob2-subtitle">On adaptera les leçons en fonction. Rien n'est définitif.</p>
          <div className="ob2-option-list">
            {LEVELS.map((opt) => {
              const c = LEVEL_CHIP[opt.value]
              return (
                <div key={opt.value} className={`ob2-level-row ${level === opt.value ? 'selected' : ''}`} onClick={() => setLevel(opt.value)}>
                  <span className="ob2-level-chip" style={{ background: c.bg, color: c.fg }}>{opt.value}</span>
                  <div style={{ flex: 1, minWidth: 0 }}>
                    <div className="ob2-level-title">{opt.label}</div>
                    <div className="ob2-level-desc">{opt.desc}</div>
                  </div>
                  <span className={`ob2-radio ${level === opt.value ? 'selected' : ''}`} />
                </div>
              )
            })}
          </div>
          <button className="d2-cta" disabled={!level} onClick={() => setStep(2)}>Continuer</button>
        </>
      )}

      {step === 2 && (
        <>
          <h1 className="ob2-title">Quel est ton objectif ?</h1>
          <p className="ob2-subtitle">Ça oriente le vocabulaire et les mises en situation.</p>
          <div className="ob2-option-list">
            {GOALS.map((opt) => (
              <div key={opt.value} className={`ob2-goal-row ${goal === opt.value ? 'selected' : ''}`} onClick={() => setGoal(opt.value)}>
                <span className="ob2-goal-icon">{opt.icon}</span>
                <span style={{ flex: 1, fontWeight: 800, fontSize: '15.5px', color: 'var(--text-primary)' }}>{opt.label}</span>
                <span className={`ob2-check ${goal === opt.value ? 'selected' : ''}`}>{goal === opt.value ? '✓' : ''}</span>
              </div>
            ))}
          </div>
          <button className="d2-cta" disabled={!goal} onClick={() => setStep(3)}>Continuer</button>
        </>
      )}

      {step === 3 && (
        <>
          <h1 className="ob2-title">Combien de temps par jour ?</h1>
          <p className="ob2-subtitle">Tu pourras changer ça plus tard. Mieux vaut peu, tous les jours.</p>
          <div className="ob2-option-list">
            {TIMES.map((opt) => (
              <div key={opt.value} className={`ob2-time-row ${time === opt.value ? 'selected' : ''}`} onClick={() => setTime(opt.value)}>
                <span className="ob2-time-ring"><span className="ob2-time-min">{opt.value}</span></span>
                <div style={{ flex: 1, minWidth: 0 }}>
                  <div className="ob2-level-title">{opt.label}</div>
                  <div className="ob2-level-desc">{opt.desc}</div>
                </div>
                {opt.tag && <span className="ob2-time-tag">{opt.tag}</span>}
              </div>
            ))}
          </div>
          <div className="l2-tip">
            <span>💡</span>
            <span>5 minutes par jour suffisent à garder une série. C'est le choix le plus tenable au départ.</span>
          </div>
          <button className="d2-cta" disabled={!time} onClick={() => setStep(4)}>Continuer</button>
        </>
      )}

      {step === 4 && (
        <>
          <h1 className="ob2-title">Choisis ton guide</h1>
          <p className="ob2-subtitle">Il t'accompagnera tout au long de ton apprentissage.</p>
          <div className="character-picker-grid">
            {characters.map((c) => (
              <button
                key={c.id}
                className={`character-picker-card ${mascot?.id === c.id ? 'selected' : ''}`}
                onClick={() => setMascot(c)}
              >
                <CharacterAvatar character={c} state={mascot?.id === c.id ? 'happy' : 'neutral'} size={64} />
                <p className="character-picker-name">{c.name}</p>
                <p className="character-picker-desc">{c.description}</p>
              </button>
            ))}
          </div>
          {mascot && (
            <div className="ob2-mascot-confirm">
              <CharacterAvatar character={mascot} state="waving" size={48} />
              <div style={{ flex: 1, minWidth: 0 }}>
                <div className="ob2-level-title">{mascot.name}</div>
                <div className="ob2-level-desc">{mascot.description}</div>
              </div>
            </div>
          )}
          <button className="d2-cta" disabled={!mascot} onClick={() => setStep(5)}>
            Continuer avec {mascot?.name || '...'}
          </button>
        </>
      )}

      {step === 5 && (
        <>
          <h1 className="ob2-title">Personnalise l'affichage</h1>
          <p className="ob2-subtitle">Tu pourras en changer à tout moment dans les réglages.</p>
          <p className="ob2-section-label">Thème</p>
          <div className="ob2-theme-row">
            {THEMES.map((t) => (
              <div key={t.value} className={`ob2-theme-card ${theme === t.value ? 'selected' : ''}`} onClick={() => setTheme(t.value)}>
                <span className="ob2-theme-swatch" style={{ background: SWATCH_PREVIEW[t.value] }} />
                <div className="ob2-level-title" style={{ marginTop: '10px' }}>{t.label}</div>
                <div className="ob2-level-desc">{t.desc}</div>
              </div>
            ))}
          </div>

          <p className="ob2-section-label" style={{ marginTop: '18px' }}>Taille du texte</p>
          <div className="ob2-textsize-row">
            {TEXT_SCALES.map((s) => (
              <div key={s.value} className={`ob2-textsize-btn ${textScale === s.value ? 'selected' : ''}`} onClick={() => setTextScale(s.value)}>
                <span style={{ display: 'block', fontWeight: 800, fontSize: s.value === 'normal' ? '14px' : s.value === 'large' ? '17px' : '20px' }}>Aa</span>
                <span style={{ display: 'block', fontWeight: 700, fontSize: '10.5px', marginTop: '4px' }}>{s.label}</span>
              </div>
            ))}
          </div>

          <button className="d2-cta" style={{ marginTop: '18px' }} onClick={() => setStep(6)}>Continuer</button>
        </>
      )}

      {step === 6 && (
        <div className="onboarding-tour">
          {tourIndex === 0 && mascot ? (
            <div className="onboarding-tour-slide">
              <CharacterAvatar character={mascot} state="waving" size={96} />
              <h2 style={{ marginTop: '1rem' }}>Voici {mascot.name} !</h2>
              <p className="onboarding-subtitle">{mascot.description || "Il t'accompagnera tout au long de ton apprentissage."}</p>
            </div>
          ) : (
            <div className="onboarding-tour-slide">
              <div className="onboarding-tour-emoji">{TOUR_SLIDES[tourIndex - 1].emoji}</div>
              <h2>{TOUR_SLIDES[tourIndex - 1].title}</h2>
              <p className="onboarding-subtitle">{TOUR_SLIDES[tourIndex - 1].text}</p>
            </div>
          )}
          <div className="onboarding-tour-dots">
            {[mascot, ...TOUR_SLIDES].map((_, i) => (
              <span key={i} className={`onboarding-tour-dot ${i === tourIndex ? 'active' : ''}`} />
            ))}
          </div>
          {tourIndex < TOUR_SLIDES.length ? (
            <button className="d2-cta" onClick={() => setTourIndex(tourIndex + 1)}>Suivant</button>
          ) : (
            <button className="d2-cta" style={{ background: 'var(--accent-warm,#A3E635)', color: '#22300A', boxShadow: '0 6px 0 #7FA82B' }} disabled={saving} onClick={finish}>
              {saving ? 'Préparation de ton parcours...' : '🚀 Commencer ma première leçon'}
            </button>
          )}
          {error && <p className="feedback incorrect">{error}</p>}
        </div>
      )}
    </div>
  )
}

export default Onboarding

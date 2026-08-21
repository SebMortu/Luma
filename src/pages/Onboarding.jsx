import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import { useTheme, THEMES, TEXT_SCALES } from '../contexts/ThemeContext.jsx'
import { getMascot } from '../lib/characters.js'
import CharacterAvatar from '../components/CharacterAvatar.jsx'

const LEVELS = [
  { value: 'A0', label: 'Vrai grand débutant', desc: "Je n'ai jamais appris de langue étrangère" },
  { value: 'A1', label: 'A1 · Quelques bases', desc: 'Je connais déjà quelques mots simples' },
  { value: 'A2', label: 'A2 · Élémentaire', desc: 'Je connais quelques structures de phrase' },
  { value: 'B1', label: 'B1 · Intermédiaire', desc: 'Je peux tenir une conversation simple' },
  { value: 'B2', label: 'B2 · Intermédiaire avancé', desc: 'Je suis à l\'aise à l\'oral et à l\'écrit' },
  { value: 'C1', label: 'C1 · Avancé', desc: 'Je maîtrise déjà bien la langue' },
]

const GOALS = [
  { value: 'voyage', label: 'Voyager sereinement' },
  { value: 'travail', label: 'Progresser au travail' },
  { value: 'culture', label: 'Films, jeux, culture' },
  { value: 'perso', label: 'Défi personnel' },
]

const TIMES = [
  { value: 5, label: '5 min / jour', desc: 'Décontracté' },
  { value: 10, label: '10 min / jour', desc: 'Régulier' },
  { value: 20, label: '20 min / jour', desc: 'Sérieux' },
]

const SWATCH_PREVIEW = { lumen: '#0D1B2E', 'lumen-light': '#F5F9FF' }

const TOUR_SLIDES = [
  {
    emoji: '🔥',
    title: 'Ta progression au jour le jour',
    text: "Chaque leçon terminée te rapporte de l'XP et fait grandir ta série de jours consécutifs (streak). Reviens chaque jour pour ne pas la perdre !",
  },
  {
    emoji: '🧭',
    title: 'Apprendre, Pratiquer, Livre',
    text: "Apprendre pour la grammaire et le vocabulaire de base. Pratiquer pour les scénarios, jeux et révisions. Livre pour lire des histoires à ton niveau.",
  },
  {
    emoji: '🔊',
    title: "Écoute et parle à voix haute",
    text: "Le bouton 🔊 lit les phrases à voix haute. Profites-en pour répéter toi-même — c'est comme ça qu'on progresse le plus vite à l'oral.",
  },
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
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState('')

  useEffect(() => {
    getMascot().then(setMascot).catch(() => setMascot(null))
  }, [])

  const selectAndAdvance = (setter, value, nextStep) => {
    setter(value)
    setTimeout(() => setStep(nextStep), 200)
  }

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

      // A0 (Fondations) et A1 démarrent directement — aucune base à vérifier.
      // À partir de A2, un test de positionnement est obligatoire avant de
      // déverrouiller quoi que ce soit, pour confirmer le niveau revendiqué.
      const levelOrder = ['A0', 'A1', 'A2', 'B1', 'B2', 'C1']
      const targetIndex = levelOrder.indexOf(level)

      if (targetIndex > 1) {
        navigate(`/placement-test/${level}`, { replace: true })
        return
      }

      let firstLessonId = null

      if (targetIndex === 1) {
        // A1 sans test : on déverrouille juste A0 s'il existe, sans vérification.
        const { data: unitsToUnlock } = await supabase
          .from('units').select('id')
          .eq('language_id', language.id).eq('cecr_level', 'A0')
        const unitIds = (unitsToUnlock || []).map((u) => u.id)
        if (unitIds.length > 0) {
          const { data: lessonsToUnlock } = await supabase
            .from('lessons').select('id, unit_id').in('unit_id', unitIds)
          const bypassRows = (lessonsToUnlock || []).map((l) => ({
            user_id: user.id, language_id: language.id, unit_id: l.unit_id, lesson_id: l.id,
            status: 'completed', best_score: 1,
          }))
          if (bypassRows.length > 0) {
            await supabase.from('user_progress').upsert(bypassRows, { onConflict: 'user_id,language_id,unit_id,lesson_id' })
          }
        }
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

  return (
    <div className="page">
      <div className="onboarding-progress">
        <div className={`bar ${step >= 1 ? 'active' : ''}`} />
        <div className={`bar ${step >= 2 ? 'active' : ''}`} />
        <div className={`bar ${step >= 3 ? 'active' : ''}`} />
        <div className={`bar ${step >= 4 ? 'active' : ''}`} />
        <div className={`bar ${step >= 5 ? 'active' : ''}`} />
      </div>

      {step === 1 && (
        <>
          <h2>Quel est ton niveau actuel ?</h2>
          <p className="onboarding-subtitle">On adaptera les leçons en fonction.</p>
          <div className="onboarding-options">
            {LEVELS.map((opt) => (
              <button
                key={opt.value}
                className={`onboarding-option ${level === opt.value ? 'selected' : ''}`}
                onClick={() => selectAndAdvance(setLevel, opt.value, 2)}
              >
                <span className="onboarding-option-title">{opt.label}</span>
                <span className="onboarding-option-desc">{opt.desc}</span>
              </button>
            ))}
          </div>
        </>
      )}

      {step === 2 && (
        <>
          <div className="onboarding-back-row">
            <button className="onboarding-back" onClick={() => setStep(1)}>←</button>
          </div>
          <h2>Quel est ton objectif ?</h2>
          <p className="onboarding-subtitle">Ça oriente le vocabulaire des leçons.</p>
          <div className="onboarding-options">
            {GOALS.map((opt) => (
              <button
                key={opt.value}
                className={`onboarding-option ${goal === opt.value ? 'selected' : ''}`}
                onClick={() => selectAndAdvance(setGoal, opt.value, 3)}
              >
                <span className="onboarding-option-title">{opt.label}</span>
              </button>
            ))}
          </div>
        </>
      )}

      {step === 3 && (
        <>
          <div className="onboarding-back-row">
            <button className="onboarding-back" onClick={() => setStep(2)}>←</button>
          </div>
          <h2>Combien de temps par jour ?</h2>
          <p className="onboarding-subtitle">Tu pourras changer ça plus tard.</p>
          <div className="onboarding-options">
            {TIMES.map((opt) => (
              <button
                key={opt.value}
                className={`onboarding-option row ${time === opt.value ? 'selected' : ''}`}
                onClick={() => selectAndAdvance(setTime, opt.value, 4)}
              >
                <span className="onboarding-option-title">{opt.label}</span>
                <span className="onboarding-option-desc">{opt.desc}</span>
              </button>
            ))}
          </div>
        </>
      )}

      {step === 4 && (
        <>
          <div className="onboarding-back-row">
            <button className="onboarding-back" onClick={() => setStep(3)}>←</button>
          </div>
          <h2>Personnalise l'affichage</h2>
          <p className="onboarding-subtitle">Tu pourras en changer à tout moment dans les réglages.</p>
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

          <h2 style={{ marginTop: '1.5rem' }}>Taille du texte</h2>
          <p className="onboarding-subtitle">Utile si tu préfères un texte plus grand et confortable à lire.</p>
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

          <button className="btn-primary" style={{ marginTop: '1.5rem' }} onClick={() => setStep(5)}>Continuer</button>
        </>
      )}

      {step === 5 && (
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
            <button className="btn-primary" onClick={() => setTourIndex(tourIndex + 1)}>Suivant</button>
          ) : (
            <button className="btn-primary" disabled={saving} onClick={finish}>
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

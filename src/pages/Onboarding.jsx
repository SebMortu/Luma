import { useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'

const LEVELS = [
  { value: 'debutant', label: 'Débutant complet', desc: 'Je ne connais presque rien' },
  { value: 'bases', label: 'Bases acquises', desc: 'Je connais quelques mots et structures' },
  { value: 'intermediaire', label: 'Intermédiaire', desc: 'Je peux tenir une conversation simple' },
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

function Onboarding() {
  const { user } = useAuth()
  const navigate = useNavigate()
  const [step, setStep] = useState(1)
  const [level, setLevel] = useState(null)
  const [goal, setGoal] = useState(null)
  const [time, setTime] = useState(null)
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState('')

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
        })
        .eq('user_id', user.id)
      if (updateErr) throw updateErr

      navigate('/dashboard')
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
                onClick={() => { setTime(opt.value); setTimeout(finish, 200) }}
              >
                <span className="onboarding-option-title">{opt.label}</span>
                <span className="onboarding-option-desc">{opt.desc}</span>
              </button>
            ))}
          </div>
          {saving && <p>Préparation de ton parcours...</p>}
          {error && <p className="feedback incorrect">{error}</p>}
        </>
      )}
    </div>
  )
}

export default Onboarding

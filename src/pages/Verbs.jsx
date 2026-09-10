import { useEffect, useState, useRef } from 'react'
import { Link } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import AppLayout from '../components/AppLayout.jsx'
import SpeakButton from '../components/SpeakButton.jsx'
import { playCorrect, playIncorrect } from '../lib/sounds.js'

function shuffle(array) {
  const copy = [...array]
  for (let i = copy.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1))
    ;[copy[i], copy[j]] = [copy[j], copy[i]]
  }
  return copy
}

// Enregistre le résultat d'une réponse pour un verbe donné (tous modes
// confondus) : incrémente la série de bonnes réponses, et marque le verbe
// "maîtrisé" à partir de 3 d'affilée — ce badge reste acquis ensuite.
const MASTERY_STREAK_TARGET = 3
async function recordVerbAnswer(userId, verbId, isCorrect) {
  const { data: existing } = await supabase.from('user_verb_mastery').select('*').eq('user_id', userId).eq('verb_id', verbId).maybeSingle()
  const newStreak = isCorrect ? (existing?.correct_streak || 0) + 1 : 0
  const nowMastered = existing?.mastered || newStreak >= MASTERY_STREAK_TARGET
  await supabase.from('user_verb_mastery').upsert({
    user_id: userId, verb_id: verbId, correct_streak: newStreak, mastered: nowMastered, updated_at: new Date().toISOString(),
  })
}

// ---------- Fiche d'usage (bandeau dépliable) ----------
function UsageSheet() {
  const [open, setOpen] = useState(false)
  return (
    <div className="v2-usage">
      <button className="v2-usage-toggle" onClick={() => setOpen(!open)}>
        <span>ℹ️</span>
        <span style={{ flex: 1, textAlign: 'left' }}>Comment utiliser ces 3 formes</span>
        <span>{open ? '⌃' : '⌄'}</span>
      </button>
      {open && (
        <div className="v2-usage-content">
          <div className="v2-usage-card">
            <div className="v2-usage-card-title">Base</div>
            <div className="v2-usage-card-desc">Utilisée au present simple (I/you/we/they) et après les modaux (can, must...).</div>
            <div className="v2-usage-example">I go to work. / She can go.</div>
          </div>
          <div className="v2-usage-card">
            <div className="v2-usage-card-title">Passé (past form)</div>
            <div className="v2-usage-card-desc">Utilisée seule au past simple, pour une action terminée à un moment précisé.</div>
            <div className="v2-usage-example">I went to Paris last year.</div>
          </div>
          <div className="v2-usage-card">
            <div className="v2-usage-card-title">Participe passé</div>
            <div className="v2-usage-card-desc">Utilisé avec have/has (present perfect) ou avec to be (voix passive).</div>
            <div className="v2-usage-example">I have gone there before. / The letter was written yesterday.</div>
          </div>
        </div>
      )}
    </div>
  )
}

// ---------- Liste ----------
function ListMode({ verbs, groupLabel, masteryMap }) {
  return (
    <div>
      <p className="v2-mode-title">Réviser la liste</p>
      <p className="v2-mode-sub">{groupLabel} · {verbs.length} verbe{verbs.length > 1 ? 's' : ''} affiché{verbs.length > 1 ? 's' : ''}</p>
      <div className="v2-list-head">
        <span>BASE</span><span>PASSÉ</span><span>PARTICIPE</span><span></span>
      </div>
      <div className="v2-list-body">
        {verbs.map((v, i) => {
          const mastered = masteryMap.has(v.id)
          return (
            <div key={v.id} className="v2-list-row" style={{ background: i % 2 === 0 ? '#fff' : '#FAFBFD' }}>
              <div style={{ minWidth: 0 }}>
                <div className="v2-list-base">{v.base_form}</div>
                <div className="v2-list-fr">{v.translation}</div>
              </div>
              <span className="v2-list-form">{v.past_form}</span>
              <span className="v2-list-form">{v.participle_form}</span>
              <span className={`v2-list-dot ${mastered ? 'mastered' : ''}`}>{mastered ? '✓' : ''}</span>
            </div>
          )
        })}
      </div>
    </div>
  )
}

// ---------- Flashcards ----------
const FLASH_LABELS = [
  { label: 'Passé', key: 'past_form', bg: '#EEF4FE', fg: '#2563EB' },
  { label: 'Participe', key: 'participle_form', bg: '#F1F8E0', fg: '#5F7A26' },
  { label: 'Traduction', key: 'translation', bg: '#F6F8FC', fg: '#5F6A80' },
]

function FlashcardMode({ verbs, user }) {
  const [deck, setDeck] = useState(() => shuffle(verbs))
  const [index, setIndex] = useState(0)
  const [revealed, setRevealed] = useState(false)
  const [known, setKnown] = useState(0)
  const [toReview, setToReview] = useState(0)

  const current = deck[index]
  const finished = index >= deck.length

  const next = (wasKnown) => {
    wasKnown ? setKnown((k) => k + 1) : setToReview((k) => k + 1)
    recordVerbAnswer(user.id, current.id, wasKnown)
    setRevealed(false)
    setIndex((i) => i + 1)
  }
  const restart = () => { setDeck(shuffle(verbs)); setIndex(0); setRevealed(false); setKnown(0); setToReview(0) }

  if (finished) {
    return (
      <div className="v2-result-card">
        <p className="v2-result-title">Terminé !</p>
        <p className="v2-result-sub">✅ {known} connus · 🔁 {toReview} à revoir</p>
        <button className="d2-cta" onClick={restart}>Recommencer</button>
      </div>
    )
  }

  return (
    <div>
      <div className="v2-flash-progress-row">
        <div className="d2-stat-track" style={{ flex: 1, background: '#EDF1F7' }}>
          <div style={{ height: '100%', width: `${(index / deck.length) * 100}%`, background: 'linear-gradient(90deg,#A3E635,#3B82F6)', borderRadius: '5px' }} />
        </div>
        <span className="v2-flash-progress-label">{index + 1} / {deck.length}</span>
      </div>

      <div className="v2-flash-card" onClick={() => setRevealed(true)}>
        <div className="v2-flash-card-top">
          <span className="v2-flash-chip">{current.family}</span>
          <SpeakButton text={current.base_form} size="small" />
        </div>
        <div className="v2-flash-word">{current.base_form}</div>
        {revealed ? (
          <div className="v2-flash-forms">
            {FLASH_LABELS.map((f) => (
              <div key={f.key} className="v2-flash-form-row" style={{ background: f.bg }}>
                <span className="v2-flash-form-label" style={{ color: f.fg }}>{f.label}</span>
                <span className="v2-flash-form-value" style={{ color: f.key === 'translation' ? 'var(--text-primary)' : f.fg }}>{current[f.key]}</span>
              </div>
            ))}
          </div>
        ) : (
          <p className="v2-flash-hint">Touche la carte pour la retourner</p>
        )}
      </div>

      {revealed && (
        <div className="v2-flash-buttons">
          <button className="v2-flash-btn-no" onClick={() => next(false)}>À revoir</button>
          <button className="v2-flash-btn-yes" onClick={() => next(true)}>Je le savais</button>
        </div>
      )}
    </div>
  )
}

// ---------- Quiz ----------
const DIFFICULTY_LABELS = {
  easy: { label: 'A1-A2 · Facile', desc: 'Réponses assez distinctes' },
  medium: { label: 'B1-B2 · Intermédiaire', desc: "Pièges sur les temps et l'orthographe" },
  hard: { label: 'C1 · Avancé', desc: "Fautes d'orthographe plausibles incluses" },
}

function regularize(base) {
  if (base.endsWith('e')) return base + 'd'
  if (/[^aeiou]y$/.test(base)) return base.slice(0, -1) + 'ied'
  return base + 'ed'
}
function mutateSpelling(word) {
  if (word.length < 4) return word + 'e'
  const i = 1 + Math.floor(Math.random() * (word.length - 3))
  return word.slice(0, i) + word[i + 1] + word[i] + word.slice(i + 2)
}
function buildOptions(verb, pool, difficulty) {
  const distractors = new Set()
  if (difficulty !== 'easy' && verb.participle_form !== verb.past_form) distractors.add(verb.participle_form)
  if (difficulty !== 'easy') distractors.add(regularize(verb.base_form))
  if (difficulty === 'hard') distractors.add(mutateSpelling(verb.past_form))
  while (distractors.size < 3) {
    const other = pool[Math.floor(Math.random() * pool.length)]
    if (other.past_form !== verb.past_form) distractors.add(other.past_form)
  }
  return shuffle([verb.past_form, ...Array.from(distractors).slice(0, 3)])
}

function DifficultyPicker({ difficulty, onChange }) {
  return (
    <div className="v2-diff-list">
      {Object.entries(DIFFICULTY_LABELS).map(([key, v]) => (
        <div key={key} className={`v2-diff-row ${difficulty === key ? 'selected' : ''}`} onClick={() => onChange(key)}>
          <span className={`v2-diff-radio ${difficulty === key ? 'selected' : ''}`} />
          <div>
            <div className="v2-diff-title">{v.label}</div>
            <div className="v2-diff-desc">{v.desc}</div>
          </div>
        </div>
      ))}
    </div>
  )
}

function QuizSetup({ onStart }) {
  const [difficulty, setDifficulty] = useState('medium')
  return (
    <div>
      <p className="v2-mode-title">Quiz (10 questions)</p>
      <p className="v2-section-label">Niveau de difficulté</p>
      <DifficultyPicker difficulty={difficulty} onChange={setDifficulty} />
      <button className="d2-cta" style={{ marginTop: '14px' }} onClick={() => onStart(difficulty)}>Commencer le quiz</button>
    </div>
  )
}

function QuizMode({ verbs, user }) {
  const [difficulty, setDifficulty] = useState(null)
  if (!difficulty) return <QuizSetup onStart={setDifficulty} />
  return <QuizRun verbs={verbs} difficulty={difficulty} user={user} />
}

function QuizRun({ verbs, difficulty, user }) {
  const pool = difficulty === 'easy' ? verbs.filter((v) => v.is_priority) : verbs
  const usablePool = pool.length >= 4 ? pool : verbs
  const [deck] = useState(() => shuffle(usablePool).slice(0, 10))
  const [index, setIndex] = useState(0)
  const [options, setOptions] = useState([])
  const [selected, setSelected] = useState(null)
  const [score, setScore] = useState(0)

  const current = deck[index]
  const finished = index >= deck.length

  useEffect(() => {
    if (!current) return
    setOptions(buildOptions(current, usablePool, difficulty))
    setSelected(null)
  }, [index])

  if (finished) {
    return (
      <div className="v2-result-card">
        <p className="v2-result-title">Score : {score} / {deck.length}</p>
        <button className="d2-cta" onClick={() => window.location.reload()}>Recommencer</button>
      </div>
    )
  }
  if (!current) return null

  const handleSelect = (opt) => {
    if (selected) return
    setSelected(opt)
    const isCorrect = opt === current.past_form
    if (isCorrect) setScore((s) => s + 1)
    recordVerbAnswer(user.id, current.id, isCorrect)
    setTimeout(() => setIndex((i) => i + 1), 900)
  }

  return (
    <div>
      <p className="v2-flash-progress-label" style={{ marginBottom: '10px' }}>{index + 1} / {deck.length} · {DIFFICULTY_LABELS[difficulty].label}</p>
      <div className="ex2-qcm">
        <p className="ex2-question">Passé de "{current.base_form}" ?</p>
        <div className="ex2-options" style={{ marginTop: '14px' }}>
          {options.map((opt, i) => {
            let state = ''
            if (selected) {
              if (opt === current.past_form) state = 'correct'
              else if (opt === selected) state = 'incorrect'
            }
            return (
              <button key={opt} className={`ex2-option ${state}`} onClick={() => handleSelect(opt)} disabled={!!selected}>
                <span className="ex2-option-key">{String.fromCharCode(65 + i)}</span>
                <span className="ex2-option-text">{opt}</span>
              </button>
            )
          })}
        </div>
      </div>
    </div>
  )
}

// ---------- Sprint 60s ----------
function SprintSetup({ onStart }) {
  const [difficulty, setDifficulty] = useState('medium')
  const [writeMode, setWriteMode] = useState(false)
  return (
    <div>
      <p className="v2-section-label">Niveau de difficulté</p>
      <DifficultyPicker difficulty={difficulty} onChange={setDifficulty} />

      <p className="v2-section-label" style={{ marginTop: '14px' }}>Format</p>
      <div style={{ display: 'flex', gap: '10px' }}>
        <div className={`v2-format-tile ${!writeMode ? 'selected' : ''}`} onClick={() => setWriteMode(false)}>
          <div style={{ fontSize: '19px' }}>🔘</div>
          <div className="v2-format-title">QCM</div>
          <div className="v2-format-sub">4 propositions</div>
        </div>
        <div className={`v2-format-tile ${writeMode ? 'selected' : ''}`} onClick={() => setWriteMode(true)}>
          <div style={{ fontSize: '19px' }}>⌨️</div>
          <div className="v2-format-title">Écriture</div>
          <div className="v2-format-sub">Tu tapes la forme</div>
        </div>
      </div>

      <button className="v2-sprint-cta" onClick={() => onStart({ difficulty, writeMode })}>Commencer le défi</button>
      <div className="l2-tip" style={{ marginTop: '10px' }}>
        <span>💡</span>
        <span>Une bonne réponse ajoute 2 secondes au chrono.</span>
      </div>
    </div>
  )
}

function SprintMode({ verbs, user, bestScore }) {
  const [config, setConfig] = useState(null)
  if (!config) return <SprintSetup onStart={setConfig} />
  return <SprintChallenge verbs={verbs} user={user} difficulty={config.difficulty} writeMode={config.writeMode} initialBest={bestScore} />
}

function SprintChallenge({ verbs, user, difficulty, writeMode, initialBest }) {
  const pool = difficulty === 'easy' ? verbs.filter((v) => v.is_priority) : verbs
  const usablePool = pool.length >= 4 ? pool : verbs

  const [current, setCurrent] = useState(null)
  const [options, setOptions] = useState([])
  const [inputValue, setInputValue] = useState('')
  const [score, setScore] = useState(0)
  const [secondsLeft, setSecondsLeft] = useState(60)
  const [finished, setFinished] = useState(false)
  const [bestScore, setBestScore] = useState(initialBest)
  const [isNewRecord, setIsNewRecord] = useState(false)
  const scoreRef = useRef(0)
  const finishedRef = useRef(false)
  const startTimeRef = useRef(Date.now())
  const bonusMsRef = useRef(0)
  const DURATION_MS = 60000
  const BONUS_MS = 2000

  const pickQuestion = () => {
    const verb = usablePool[Math.floor(Math.random() * usablePool.length)]
    setCurrent(verb)
    setInputValue('')
    if (!writeMode) setOptions(buildOptions(verb, usablePool, difficulty))
  }

  useEffect(() => { pickQuestion() }, [])

  useEffect(() => {
    const tick = () => {
      if (finishedRef.current) return
      const elapsed = Date.now() - startTimeRef.current
      const remaining = Math.max(0, Math.ceil((DURATION_MS + bonusMsRef.current - elapsed) / 1000))
      setSecondsLeft(remaining)
      if (remaining <= 0) finish()
    }
    tick()
    const interval = setInterval(tick, 1000)
    const onVisible = () => { if (document.visibilityState === 'visible') tick() }
    document.addEventListener('visibilitychange', onVisible)
    return () => { clearInterval(interval); document.removeEventListener('visibilitychange', onVisible) }
  }, [])

  const finish = async () => {
    if (finishedRef.current) return
    finishedRef.current = true
    setFinished(true)
    if (scoreRef.current > bestScore) {
      setIsNewRecord(true)
      await supabase.from('user_settings').update({ best_verb_sprint_score: scoreRef.current }).eq('user_id', user.id)
    }
  }

  const registerAnswer = (isCorrect) => {
    isCorrect ? playCorrect() : playIncorrect()
    if (isCorrect) { scoreRef.current += 1; setScore(scoreRef.current); bonusMsRef.current += BONUS_MS }
    recordVerbAnswer(user.id, current.id, isCorrect)
    pickQuestion()
  }
  const answerQCM = (opt) => { if (!finished) registerAnswer(opt === current.past_form) }
  const submitWritten = () => { if (!finished && inputValue.trim()) registerAnswer(inputValue.trim().toLowerCase() === current.past_form.toLowerCase()) }

  if (finished) {
    return (
      <div className="v2-result-card">
        <p className="v2-result-title">⚡ Score : {score}</p>
        {isNewRecord ? <p className="feedback correct">🏆 Nouveau record !</p> : <p className="v2-result-sub">Record actuel : {bestScore}</p>}
        <button className="d2-cta" onClick={() => window.location.reload()}>Rejouer</button>
      </div>
    )
  }

  const pct = Math.round((secondsLeft / 60) * 100)

  return (
    <div className="v2-sprint-play">
      <div className="v2-sprint-top">
        <div>
          <div className="v2-sprint-score-label">Score</div>
          <div className="v2-sprint-score-value">{score}</div>
        </div>
        <div className="v2-sprint-ring-outer" style={{ '--sprint-pct': `${pct}%` }}>
          <div className="v2-sprint-ring-inner">
            <span className="v2-sprint-time">{secondsLeft}</span>
            <span className="v2-sprint-time-label">sec</span>
          </div>
        </div>
      </div>

      <div className="v2-sprint-question">
        <div className="v2-sprint-question-label">Passé de</div>
        <div className="v2-sprint-question-word">{current?.base_form}</div>
      </div>

      {writeMode ? (
        <div className="v2-sprint-write-card">
          <input
            type="text"
            autoFocus
            value={inputValue}
            onChange={(e) => setInputValue(e.target.value)}
            onKeyDown={(e) => e.key === 'Enter' && submitWritten()}
            className="v2-sprint-input"
          />
          <button className="v2-sprint-validate" onClick={submitWritten}>Valider</button>
        </div>
      ) : (
        <div className="v2-sprint-qcm">
          {options.map((opt, i) => (
            <div key={opt} className="v2-sprint-option" onClick={() => answerQCM(opt)}>
              <span className="v2-sprint-option-key">{String.fromCharCode(65 + i)}</span>
              <span>{opt}</span>
            </div>
          ))}
        </div>
      )}
    </div>
  )
}

// ---------- Écran principal ----------
const GROUP_COLORS = ['#EAEEF6', '#D8E5F5', '#E4F3D2', '#FFE9D6', '#FDE2E0', '#E7E1FB']

function Verbs() {
  const { user } = useAuth()
  const [verbs, setVerbs] = useState([])
  const [mode, setMode] = useState(null)
  const [familyFilter, setFamilyFilter] = useState('priority')
  const [bestScore, setBestScore] = useState(0)
  const [masteryMap, setMasteryMap] = useState(new Map())
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      const { data: settings } = await supabase.from('user_settings').select('active_language_id, best_verb_sprint_score').eq('user_id', user.id).single()
      const { data } = await supabase.from('irregular_verbs').select('*').eq('language_id', settings.active_language_id)
      setVerbs(data || [])
      setBestScore(settings.best_verb_sprint_score || 0)

      const { data: mastery } = await supabase.from('user_verb_mastery').select('verb_id, mastered').eq('user_id', user.id).eq('mastered', true)
      setMasteryMap(new Map((mastery || []).map((m) => [m.verb_id, true])))

      setLoading(false)
    }
    load()
  }, [user.id])

  const refreshMastery = async () => {
    const { data: mastery } = await supabase.from('user_verb_mastery').select('verb_id, mastered').eq('user_id', user.id).eq('mastered', true)
    setMasteryMap(new Map((mastery || []).map((m) => [m.verb_id, true])))
    setMode(null)
  }

  const families = [...new Set(verbs.map((v) => v.family))]
  const priorityCount = verbs.filter((v) => v.is_priority).length
  const filtered = familyFilter === 'priority' ? verbs.filter((v) => v.is_priority) : familyFilter === 'all' ? verbs : verbs.filter((v) => v.family === familyFilter)
  const groupLabel = familyFilter === 'priority' ? 'Top 30 prioritaires' : familyFilter === 'all' ? 'Tous les verbes' : `Famille : ${familyFilter}`
  const totalMastered = verbs.filter((v) => masteryMap.has(v.id)).length
  const overallPct = verbs.length > 0 ? Math.round((totalMastered / verbs.length) * 100) : 0
  const priorityMastered = verbs.filter((v) => v.is_priority && masteryMap.has(v.id)).length
  const priorityPct = priorityCount > 0 ? Math.round((priorityMastered / priorityCount) * 100) : 0

  if (loading) return <AppLayout><div className="page"><p>Chargement...</p></div></AppLayout>

  const content = (
    <div className="page v2-page">
      {!mode && (
        <>
          <Link to="/learn" className="sc2-back">← Apprendre</Link>
          <div className="v2-header-row">
            <div>
              <p className="v2-title">🔤 Verbes irréguliers</p>
              <p className="v2-subtitle">{totalMastered} verbe{totalMastered > 1 ? 's' : ''} maîtrisé{totalMastered > 1 ? 's' : ''} sur {verbs.length}</p>
            </div>
            <div className="v2-ring-outer" style={{ '--v2-pct': `${overallPct}%` }}>
              <div className="v2-ring-inner">{overallPct}%</div>
            </div>
          </div>

          <UsageSheet />

          <div className="sc2-section-head" style={{ marginTop: '14px' }}>
            <span style={{ color: 'var(--accent,#2563EB)' }}>Choisis un groupe</span>
            <span className="sc2-section-line" />
          </div>

          <div className="v2-priority-tile" onClick={() => setFamilyFilter('priority')} style={familyFilter === 'priority' ? { outline: '2.5px solid #fff', outlineOffset: '-2.5px' } : {}}>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
              <div style={{ display: 'flex', alignItems: 'center', gap: '11px' }}>
                <span style={{ fontSize: '22px' }}>⭐</span>
                <div>
                  <div className="v2-priority-title">Top 30 prioritaires</div>
                  <div className="v2-priority-sub">Les plus fréquents à l'oral</div>
                </div>
              </div>
              <span className="v2-priority-count">{priorityCount}</span>
            </div>
            <div className="v2-priority-track"><div className="v2-priority-fill" style={{ width: `${priorityPct}%` }} /></div>
            <p className="v2-priority-progress-label">{priorityMastered} sur {priorityCount} maîtrisés</p>
          </div>

          <div className="v2-group-grid">
            <div className={`v2-group-tile ${familyFilter === 'all' ? 'selected' : ''}`} onClick={() => setFamilyFilter('all')}>
              <div className="v2-group-top"><span style={{ fontSize: '17px' }}>🔠</span><span className="v2-group-count">{totalMastered}/{verbs.length}</span></div>
              <div className="v2-group-name">Tous les verbes</div>
            </div>
            {families.map((f) => {
              const familyVerbs = verbs.filter((v) => v.family === f)
              const familyMastered = familyVerbs.filter((v) => masteryMap.has(v.id)).length
              return (
                <div key={f} className={`v2-group-tile ${familyFilter === f ? 'selected' : ''}`} onClick={() => setFamilyFilter(f)}>
                  <div className="v2-group-top">
                    <span style={{ fontSize: '17px' }}>🔤</span>
                    <span className="v2-group-count">{familyMastered}/{familyVerbs.length}</span>
                  </div>
                  <div className="v2-group-name">{f}</div>
                </div>
              )
            })}
          </div>

          <div className="sc2-section-head" style={{ marginTop: '16px' }}>
            <span style={{ color: '#4F6B1C' }}>Mode d'entraînement · {filtered.length} verbe{filtered.length > 1 ? 's' : ''}</span>
            <span className="sc2-section-line" />
          </div>

          <div className="v2-mode-grid">
            <div className="v2-mode-tile" style={{ background: 'var(--bg-surface,#fff)', border: '2px solid var(--border,#EAEEF6)' }} onClick={() => setMode('list')}>
              <span style={{ fontSize: '20px' }}>📋</span>
              <div className="v2-mode-tile-title">Réviser la liste</div>
            </div>
            <div className="v2-mode-tile" style={{ background: '#EEF4FE' }} onClick={() => setMode('flashcards')}>
              <span style={{ fontSize: '20px' }}>🃏</span>
              <div className="v2-mode-tile-title" style={{ color: '#1E4C93' }}>Flashcards</div>
            </div>
            <div className="v2-mode-tile" style={{ background: '#F1F8E0' }} onClick={() => setMode('quiz')}>
              <span style={{ fontSize: '20px' }}>❓</span>
              <div className="v2-mode-tile-title" style={{ color: '#3E5410' }}>Quiz (10 questions)</div>
            </div>
            <div className="v2-mode-tile" style={{ background: 'linear-gradient(155deg,#FF6B5B,#F09A8E)' }} onClick={() => setMode('sprint')}>
              <span style={{ fontSize: '20px' }}>⚡</span>
              <div className="v2-mode-tile-title" style={{ color: '#fff' }}>Défi 60 secondes</div>
              {bestScore > 0 && <div className="v2-mode-tile-sub" style={{ color: '#fff' }}>Record : {bestScore}</div>}
            </div>
          </div>
        </>
      )}

      {mode && (
        <>
          <button className="sc2-back" style={{ background: 'none', border: 'none', cursor: 'pointer', marginBottom: '12px' }} onClick={refreshMastery}>← Changer de mode</button>
          {mode === 'list' && <ListMode verbs={filtered} groupLabel={groupLabel} masteryMap={masteryMap} />}
          {mode === 'flashcards' && <FlashcardMode verbs={filtered} user={user} />}
          {mode === 'quiz' && <QuizMode verbs={filtered} user={user} />}
          {mode === 'sprint' && <SprintMode verbs={filtered} user={user} bestScore={bestScore} />}
        </>
      )}
    </div>
  )

  return mode ? content : <AppLayout>{content}</AppLayout>
}

export default Verbs

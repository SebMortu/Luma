import { useEffect, useState, useRef } from 'react'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import AppLayout from '../components/AppLayout.jsx'

const EXAM_LABELS = {
  toeic: { name: 'TOEIC', desc: 'Anglais professionnel · score /990' },
  toefl: { name: 'TOEFL', desc: 'Anglais académique · score /120' },
  ielts: { name: 'IELTS', desc: 'Anglais général/académique · bande /9' },
}

function scoreToEstimate(raw, max, examType) {
  const pct = raw / max
  if (examType === 'toefl') {
    const estimated = Math.round(pct * 120)
    let level = 'A1'
    if (estimated >= 110) level = 'C1+'
    else if (estimated >= 95) level = 'C1'
    else if (estimated >= 72) level = 'B2'
    else if (estimated >= 42) level = 'B1'
    else if (estimated >= 20) level = 'A2'
    return { estimated, level, scale: '/120' }
  }
  if (examType === 'ielts') {
    let band = 4
    if (pct >= 0.97) band = 9
    else if (pct >= 0.90) band = 8.5
    else if (pct >= 0.83) band = 8
    else if (pct >= 0.77) band = 7.5
    else if (pct >= 0.70) band = 7
    else if (pct >= 0.63) band = 6.5
    else if (pct >= 0.57) band = 6
    else if (pct >= 0.50) band = 5.5
    else if (pct >= 0.43) band = 5
    else if (pct >= 0.37) band = 4.5
    let level = 'A1'
    if (band >= 8) level = 'C1+'
    else if (band >= 7) level = 'C1'
    else if (band >= 5.5) level = 'B2'
    else if (band >= 4) level = 'B1'
    return { estimated: band, level, scale: '/9' }
  }
  // toeic par défaut
  const estimated = Math.round(pct * 990)
  let level = 'A1'
  if (estimated >= 905) level = 'C1+ / C2'
  else if (estimated >= 785) level = 'C1'
  else if (estimated >= 605) level = 'B2'
  else if (estimated >= 405) level = 'B1'
  else if (estimated >= 255) level = 'A2'
  return { estimated, level, scale: '/990' }
}

function formatTime(seconds) {
  const m = Math.floor(seconds / 60)
  const s = seconds % 60
  return `${m}:${s.toString().padStart(2, '0')}`
}

function TestRunner({ test, onFinish }) {
  const allQuestions = []
  test.questions.part_a.forEach((q) => allQuestions.push({ ...q, passage: null }))
  test.questions.part_b.forEach((t, ti) => {
    t.questions.forEach((q, qi) => allQuestions.push({ ...q, num: `b${ti}-${qi}`, passage: t.passage, passageTitle: t.title }))
  })

  const [index, setIndex] = useState(0)
  const [answers, setAnswers] = useState({})
  const [secondsLeft, setSecondsLeft] = useState(test.questions.duration_minutes * 60)
  const timerRef = useRef(null)

  useEffect(() => {
    timerRef.current = setInterval(() => {
      setSecondsLeft((s) => {
        if (s <= 1) {
          clearInterval(timerRef.current)
          finish()
          return 0
        }
        return s - 1
      })
    }, 1000)
    return () => clearInterval(timerRef.current)
  }, [])

  const current = allQuestions[index]

  const select = (optionIndex) => {
    setAnswers((prev) => ({ ...prev, [index]: optionIndex }))
  }

  const finish = () => {
    clearInterval(timerRef.current)
    let correct = 0
    allQuestions.forEach((q, i) => {
      if (answers[i] === q.correct_index) correct++
    })
    onFinish(correct, allQuestions.length)
  }

  return (
    <div>
      <div className="toeic-header">
        <span>Question {index + 1} / {allQuestions.length}</span>
        <span className={secondsLeft < 300 ? 'toeic-timer warning' : 'toeic-timer'}>⏱ {formatTime(secondsLeft)}</span>
      </div>

      {current.passage && (
        <div className="lesson-example">
          <p className="grammar-section-heading">{current.passageTitle}</p>
          <p>{current.passage}</p>
        </div>
      )}

      <div className="exercise">
        <p className="exercise-question">{current.question}</p>
        <div className="exercise-options">
          {current.options.map((opt, i) => (
            <button
              key={i}
              className={`exercise-option ${answers[index] === i ? 'correct' : ''}`}
              onClick={() => select(i)}
            >
              {opt}
            </button>
          ))}
        </div>
      </div>

      <div className="toeic-nav">
        <button className="exercise-submit" disabled={index === 0} onClick={() => setIndex((i) => i - 1)}>← Précédent</button>
        {index < allQuestions.length - 1 ? (
          <button className="exercise-submit" onClick={() => setIndex((i) => i + 1)}>Suivant →</button>
        ) : (
          <button className="btn-primary" onClick={finish}>Terminer le test</button>
        )}
      </div>
    </div>
  )
}

function TestResult({ raw, max, examType, onClose }) {
  const { estimated, level, scale } = scoreToEstimate(raw, max, examType)
  return (
    <div className="verb-card">
      <p className="verb-result">Score : {raw} / {max}</p>
      <p style={{ fontSize: 32, fontWeight: 700, margin: '10px 0' }}>{estimated} {scale}</p>
      <p className="verb-translation">Niveau CECR estimé : {level}</p>
      <button className="btn-primary" onClick={onClose}>Retour</button>
    </div>
  )
}

function ToeicTest() {
  const { user } = useAuth()
  const [tests, setTests] = useState([])
  const [selectedCategory, setSelectedCategory] = useState(null)
  const [selectedTest, setSelectedTest] = useState(null)
  const [history, setHistory] = useState([])
  const [screen, setScreen] = useState('categories') // categories | select | intro | running | result
  const [result, setResult] = useState(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      const { data: settings } = await supabase.from('user_settings').select('active_language_id').eq('user_id', user.id).single()
      const { data: testsData } = await supabase.from('toeic_tests').select('*').eq('language_id', settings.active_language_id).order('title')
      setTests(testsData || [])
      const { data: attempts } = await supabase.from('user_toeic_attempts').select('*').eq('user_id', user.id).order('created_at', { ascending: false })
      setHistory(attempts || [])
      setLoading(false)
    }
    load()
  }, [user.id])

  const chooseCategory = (cat) => {
    setSelectedCategory(cat)
    setScreen('select')
  }

  const chooseTest = (t) => {
    setSelectedTest(t)
    setScreen('intro')
  }

  const handleFinish = async (correct, max) => {
    const { estimated, level } = scoreToEstimate(correct, max, selectedTest.exam_type)
    setResult({ raw: correct, max })
    setScreen('result')
    await supabase.from('user_toeic_attempts').insert({
      user_id: user.id,
      toeic_test_id: selectedTest.id,
      raw_score: correct,
      max_score: max,
      estimated_score: estimated,
      cecr_level_estimate: level,
    })
  }

  if (loading) return <AppLayout><div className="page"><p>Chargement...</p></div></AppLayout>

  const categories = [...new Set(tests.map((t) => t.exam_type))]
  const testsInCategory = tests.filter((t) => t.exam_type === selectedCategory)

  return (
    <AppLayout>
      <div className="page">
        {screen === 'categories' && (
          <>
            <h1>📝 Tests type examen</h1>
            <p className="dashboard-goal">Choisis un type d'examen à t'entraîner.</p>
            <div className="unit-list">
              {categories.map((cat) => {
                const count = tests.filter((t) => t.exam_type === cat).length
                return (
                  <div key={cat} className="unit-card clickable" onClick={() => chooseCategory(cat)}>
                    <div className="unit-icon">📝</div>
                    <div>
                      <p className="unit-title">{EXAM_LABELS[cat]?.name || cat}</p>
                      <p className="unit-status">{EXAM_LABELS[cat]?.desc} · {count} test{count > 1 ? 's' : ''} disponible{count > 1 ? 's' : ''}</p>
                    </div>
                  </div>
                )
              })}
            </div>
          </>
        )}

        {screen === 'select' && (
          <>
            <button className="lesson-back" onClick={() => setScreen('categories')}>← Changer de catégorie</button>
            <h1>{EXAM_LABELS[selectedCategory]?.name}</h1>
            <div className="unit-list">
              {testsInCategory.map((t) => {
                const testHistory = history.filter((h) => h.toeic_test_id === t.id)
                const best = testHistory[0]
                return (
                  <div key={t.id} className="unit-card clickable" onClick={() => chooseTest(t)}>
                    <div className="unit-icon">📝</div>
                    <div>
                      <p className="unit-title">{t.title}</p>
                      <p className="unit-status">
                        {best ? `Meilleur score : ${best.estimated_score} ${EXAM_LABELS[selectedCategory]?.desc.split('·')[1]?.trim() || ''}` : `Jamais passé`}
                      </p>
                    </div>
                  </div>
                )
              })}
            </div>
          </>
        )}

        {screen === 'intro' && selectedTest && (
          <>
            <button className="lesson-back" onClick={() => setScreen('select')}>← Choisir un autre test</button>
            <h1>📝 {selectedTest.title}</h1>
            <div className="dashboard-goal">
              <p>60 questions · 45 minutes chronométrées</p>
              <p>30 questions de grammaire/vocabulaire + 30 questions de compréhension écrite (5 textes)</p>
            </div>
            <button className="btn-primary" onClick={() => setScreen('running')}>Commencer le test</button>

            {history.filter((h) => h.toeic_test_id === selectedTest.id).length > 0 && (
              <>
                <p className="dashboard-section-title" style={{ marginTop: '2rem' }}>Historique sur ce test</p>
                <div className="unit-list">
                  {history.filter((h) => h.toeic_test_id === selectedTest.id).map((h) => (
                    <div key={h.id} className="unit-card">
                      <div className="unit-icon completed">📝</div>
                      <div>
                        <p className="unit-title">{h.estimated_score} · {h.cecr_level_estimate}</p>
                        <p className="unit-status">{new Date(h.created_at).toLocaleDateString('fr-FR')} · {h.raw_score}/{h.max_score} bonnes réponses</p>
                      </div>
                    </div>
                  ))}
                </div>
              </>
            )}
          </>
        )}

        {screen === 'running' && selectedTest && <TestRunner test={selectedTest} onFinish={handleFinish} />}

        {screen === 'result' && result && (
          <TestResult raw={result.raw} max={result.max} examType={selectedTest.exam_type} onClose={() => setScreen('select')} />
        )}
      </div>
    </AppLayout>
  )
}

export default ToeicTest

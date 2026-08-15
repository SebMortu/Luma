import { useEffect, useState, useRef } from 'react'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import AppLayout from '../components/AppLayout.jsx'

function scoreToEstimate(raw, max) {
  const pct = raw / max
  const estimated = Math.round(pct * 990)
  let level = 'A1'
  if (estimated >= 905) level = 'C1+ / C2'
  else if (estimated >= 785) level = 'C1'
  else if (estimated >= 605) level = 'B2'
  else if (estimated >= 405) level = 'B1'
  else if (estimated >= 255) level = 'A2'
  return { estimated, level }
}

function formatTime(seconds) {
  const m = Math.floor(seconds / 60)
  const s = seconds % 60
  return `${m}:${s.toString().padStart(2, '0')}`
}

function TestRunner({ test, onFinish }) {
  // Aplatir toutes les questions dans un seul flux (Partie A puis Partie B avec passages)
  const allQuestions = []
  test.questions.part_a.forEach((q) => allQuestions.push({ ...q, passage: null }))
  test.questions.part_b.forEach((t) => {
    t.questions.forEach((q) => allQuestions.push({ ...q, passage: t.passage, passageTitle: t.title }))
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
    setAnswers((prev) => ({ ...prev, [current.num]: optionIndex }))
  }

  const finish = () => {
    clearInterval(timerRef.current)
    let correct = 0
    allQuestions.forEach((q) => {
      if (answers[q.num] === q.correct_index) correct++
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
              className={`exercise-option ${answers[current.num] === i ? 'correct' : ''}`}
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

function TestResult({ raw, max, onClose }) {
  const { estimated, level } = scoreToEstimate(raw, max)
  return (
    <div className="verb-card">
      <p className="verb-result">Score : {raw} / {max}</p>
      <p style={{ fontSize: 32, fontWeight: 700, margin: '10px 0' }}>{estimated} / 990</p>
      <p className="verb-translation">Niveau CECR estimé : {level}</p>
      <button className="btn-primary" onClick={onClose}>Retour</button>
    </div>
  )
}

function ToeicTest() {
  const { user } = useAuth()
  const [tests, setTests] = useState([])
  const [selectedTest, setSelectedTest] = useState(null)
  const [history, setHistory] = useState([])
  const [screen, setScreen] = useState('select') // select | intro | running | result
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

  const chooseTest = (t) => {
    setSelectedTest(t)
    setScreen('intro')
  }

  const handleFinish = async (correct, max) => {
    const { estimated, level } = scoreToEstimate(correct, max)
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
  if (tests.length === 0) return <AppLayout><div className="page"><p>Aucun test disponible pour l'instant.</p></div></AppLayout>

  return (
    <AppLayout>
      <div className="page">
        {screen === 'select' && (
          <>
            <h1>📝 Tests type examen</h1>
            <p className="dashboard-goal">
              {tests.length} test{tests.length > 1 ? 's' : ''} disponible{tests.length > 1 ? 's' : ''}, avec des questions différentes à chaque fois — choisis-en un.
            </p>
            <div className="unit-list">
              {tests.map((t) => {
                const testHistory = history.filter((h) => h.toeic_test_id === t.id)
                const best = testHistory[0]
                return (
                  <div key={t.id} className="unit-card clickable" onClick={() => chooseTest(t)}>
                    <div className="unit-icon">📝</div>
                    <div>
                      <p className="unit-title">{t.title}</p>
                      <p className="unit-status">
                        {best ? `Meilleur score : ${best.estimated_score} / 990` : `Jamais passé · ${testHistory.length} tentative(s)`}
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
                        <p className="unit-title">{h.estimated_score} / 990 · {h.cecr_level_estimate}</p>
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
          <TestResult raw={result.raw} max={result.max} onClose={() => setScreen('select')} />
        )}
      </div>
    </AppLayout>
  )
}

export default ToeicTest

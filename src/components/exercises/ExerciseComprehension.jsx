import { useState, useEffect } from 'react'
import SpeakButton, { speak } from '../SpeakButton.jsx'
import { playCorrect, playIncorrect } from '../../lib/sounds.js'

function SupportPanel({ supportType, supportContent }) {
  const [playedOnce, setPlayedOnce] = useState(false)

  const handlePlay = () => {
    const text = Array.isArray(supportContent)
      ? supportContent.map((turn) => turn.text || turn.line || '').join('. ')
      : supportContent
    speak(text, { rate: 0.85 })
    setPlayedOnce(true)
  }

  if (supportType === 'dialogue' && Array.isArray(supportContent)) {
    return (
      <div className="comprehension-support comprehension-support-dialogue">
        {supportContent.map((turn, i) => (
          <p key={i} className="comprehension-dialogue-turn">
            <strong>{turn.speaker ? `${turn.speaker} : ` : ''}</strong>
            {turn.text || turn.line}
          </p>
        ))}
      </div>
    )
  }

  if (supportType === 'audio') {
    return (
      <div className="comprehension-support comprehension-support-audio">
        <button className="comprehension-play-btn" onClick={handlePlay}>
          {playedOnce ? '🔊 Réécouter' : '▶️ Écouter'}
        </button>
        {playedOnce && <p className="comprehension-audio-hint">Tu peux réécouter autant de fois que nécessaire.</p>}
      </div>
    )
  }

  return (
    <div className="comprehension-support comprehension-support-text">
      <p>{supportContent}</p>
      <SpeakButton text={supportContent} size="small" />
    </div>
  )
}

function SubQuestion({ question, onAnswer }) {
  const [selected, setSelected] = useState(null)
  const [checked, setChecked] = useState(new Set())
  const [answered, setAnswered] = useState(false)

  const submitSingle = (index) => {
    if (answered) return
    setSelected(index)
    setAnswered(true)
    const correct = index === question.correct_index
    onAnswer(correct)
  }

  const submitTrueFalse = (value) => {
    if (answered) return
    setSelected(value)
    setAnswered(true)
    onAnswer(value === question.correct_answer)
  }

  const toggleMulti = (index) => {
    if (answered) return
    setChecked((prev) => {
      const next = new Set(prev)
      next.has(index) ? next.delete(index) : next.add(index)
      return next
    })
  }

  const submitMulti = () => {
    if (checked.size === 0 || answered) return
    setAnswered(true)
    const correctSet = new Set(question.correct_indices)
    const correct = checked.size === correctSet.size && [...checked].every((i) => correctSet.has(i))
    onAnswer(correct)
  }

  if (question.type === 'true_false') {
    return (
      <div className="comprehension-question">
        <p className="exercise-question">{question.statement}</p>
        <div className="exercise-options">
          {[true, false].map((val) => {
            let cls = 'exercise-option'
            if (answered) {
              if (val === question.correct_answer) cls += ' correct'
              else if (val === selected) cls += ' incorrect'
            }
            return (
              <button key={String(val)} className={cls} disabled={answered} onClick={() => submitTrueFalse(val)}>
                {val ? 'Vrai' : 'Faux'}
              </button>
            )
          })}
        </div>
      </div>
    )
  }

  if (question.type === 'multi_select') {
    const correctSet = new Set(question.correct_indices)
    return (
      <div className="comprehension-question">
        <p className="exercise-question">{question.question}</p>
        <div className="exercise-options">
          {question.options.map((opt, i) => {
            const isChecked = checked.has(i)
            let cls = 'exercise-option multi-select-option'
            if (answered) {
              if (correctSet.has(i)) cls += ' correct'
              else if (isChecked) cls += ' incorrect'
            } else if (isChecked) cls += ' multi-select-checked'
            return (
              <button key={i} className={cls} disabled={answered} onClick={() => toggleMulti(i)}>
                <span className="multi-select-checkbox" aria-hidden="true">{isChecked ? '☑' : '☐'}</span>
                <span className="multi-select-label">{opt}</span>
              </button>
            )
          })}
        </div>
        {!answered && (
          <button className="exercise-submit" onClick={submitMulti} disabled={checked.size === 0}>Valider</button>
        )}
      </div>
    )
  }

  return (
    <div className="comprehension-question">
      <p className="exercise-question">{question.question}</p>
      <div className="exercise-options">
        {question.options.map((opt, i) => {
          let cls = 'exercise-option'
          if (answered) {
            if (i === question.correct_index) cls += ' correct'
            else if (i === selected) cls += ' incorrect'
          }
          return (
            <button key={i} className={cls} disabled={answered} onClick={() => submitSingle(i)}>{opt}</button>
          )
        })}
      </div>
    </div>
  )
}

function ExerciseComprehension({ content, onAnswered }) {
  const [questionIndex, setQuestionIndex] = useState(0)
  const [subResults, setSubResults] = useState([])
  const [waitingNext, setWaitingNext] = useState(false)
  const [lastCorrect, setLastCorrect] = useState(null)

  const questions = content.questions || []
  const total = questions.length
  const finished = questionIndex >= total

  const handleSubAnswer = (correct) => {
    correct ? playCorrect() : playIncorrect()
    setLastCorrect(correct)
    setWaitingNext(true)
    // La mise à jour d'état reste pure (pas d'appel à onAnswered ici) --
    // important sous React.StrictMode, qui double-invoque les fonctions
    // de mise à jour d'état en développement : un appel à onAnswered
    // placé ici serait déclenché deux fois pour la même réponse.
    setSubResults((prev) => [...prev, correct])
  }

  // Appel de onAnswered déclenché une seule fois, via un effet qui réagit
  // au nombre réel de réponses enregistrées -- résistant à StrictMode.
  useEffect(() => {
    if (subResults.length > 0 && subResults.length === total) {
      onAnswered?.(subResults.every(Boolean))
    }
  }, [subResults, total])

  const goNext = () => {
    setWaitingNext(false)
    setLastCorrect(null)
    setQuestionIndex((i) => i + 1)
  }

  return (
    <div className="exercise comprehension-exercise">
      <SupportPanel supportType={content.support_type} supportContent={content.support_content} />

      {!finished && (
        <>
          <p className="comprehension-progress">Question {questionIndex + 1} / {total}</p>
          <SubQuestion key={questionIndex} question={questions[questionIndex]} onAnswer={handleSubAnswer} />
          {waitingNext && (
            <>
              <p className={lastCorrect ? 'feedback correct' : 'feedback incorrect'}>
                {lastCorrect ? 'Correct !' : 'Pas tout à fait.'}
              </p>
              <button className="exercise-submit" onClick={goNext}>
                {questionIndex + 1 >= total ? 'Voir le résultat' : 'Question suivante →'}
              </button>
            </>
          )}
        </>
      )}

      {finished && (
        <p className={subResults.every(Boolean) ? 'feedback correct' : 'feedback incorrect'}>
          {subResults.filter(Boolean).length} / {total} bonnes réponses sur ce support.
        </p>
      )}
    </div>
  )
}

export default ExerciseComprehension

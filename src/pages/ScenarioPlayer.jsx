import { useEffect, useState } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import TranslateToggle from '../components/TranslateToggle.jsx'
import { awardProgress } from '../lib/progress.js'

function ScenarioPlayer() {
  const { scenarioId } = useParams()
  const { user } = useAuth()
  const navigate = useNavigate()
  const [scenario, setScenario] = useState(null)
  const [currentNodeId, setCurrentNodeId] = useState(null)
  const [history, setHistory] = useState([])
  const [loading, setLoading] = useState(true)
  const [xpAwarded, setXpAwarded] = useState(false)
  const [shownTranslations, setShownTranslations] = useState({})

  useEffect(() => {
    async function load() {
      const { data } = await supabase.from('scenarios').select('*').eq('id', scenarioId).single()
      setScenario(data)
      setCurrentNodeId(data.content.start_node)
      setLoading(false)
    }
    load()
  }, [scenarioId])

  const chooseOption = async (choice) => {
    const node = scenario.content.nodes[currentNodeId]
    setHistory((h) => [...h, { speaker: node.speaker, text: node.text, text_fr: node.text_fr, chosenReply: choice.text }])
    setCurrentNodeId(choice.next)
    setShownTranslations({})

    const nextNode = scenario.content.nodes[choice.next]
    if (nextNode.end && !xpAwarded) {
      setXpAwarded(true)
      await awardProgress(user.id, { xpGained: 10 })
    }
  }

  if (loading) return <div className="page"><p>Chargement...</p></div>
  if (!scenario) return <div className="page"><p>Scénario introuvable.</p></div>

  const node = scenario.content.nodes[currentNodeId]
  const speakerName = scenario.content.characters[node.speaker] || node.speaker

  return (
    <div className="page">
        <button className="lesson-back" onClick={() => navigate(-1)}>← Quitter le scénario</button>
        <h1>{scenario.title}</h1>

        <div className="dialogue-history">
          {history.map((h, i) => (
            <div key={i} className="dialogue-turn">
              <div className="dialogue-bubble npc">
                <p className="dialogue-speaker">{scenario.content.characters[h.speaker] || h.speaker}</p>
                <p>{h.text}</p>
                <TranslateToggle translation={h.text_fr} />
              </div>
              <div className="dialogue-bubble user">
                <p>{h.chosenReply}</p>
              </div>
            </div>
          ))}
        </div>

        <div className="dialogue-bubble npc current">
          <p className="dialogue-speaker">{speakerName}</p>
          <p>{node.text}</p>
          <TranslateToggle translation={node.text_fr} />
        </div>

        {node.end ? (
          <div className="lesson-summary">
            <p className="verb-result">{node.ending_label}</p>
            <p className="feedback correct">+10 XP</p>
            <button className="btn-primary" onClick={() => navigate(-1)}>Retour aux scénarios</button>
          </div>
        ) : (
          <div className="dialogue-choices">
            {node.choices.map((choice, i) => (
              <div key={i} className="dialogue-choice-row">
                <button className="exercise-option dialogue-choice-btn" onClick={() => chooseOption(choice)}>
                  {choice.text}
                </button>
                {choice.text_fr && (
                  <button
                    className="dialogue-choice-translate"
                    onClick={(e) => { e.stopPropagation(); setShownTranslations((s) => ({ ...s, [i]: !s[i] })) }}
                    aria-label="Traduire cette réponse"
                  >
                    🌐
                  </button>
                )}
                {shownTranslations[i] && choice.text_fr && (
                  <p className="dialogue-choice-fr">🌐 {choice.text_fr}</p>
                )}
              </div>
            ))}
          </div>
        )}
    </div>
  )
}

export default ScenarioPlayer

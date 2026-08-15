import { useEffect, useState } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import AppLayout from '../components/AppLayout.jsx'

function ScenarioPlayer() {
  const { scenarioId } = useParams()
  const { user } = useAuth()
  const navigate = useNavigate()
  const [scenario, setScenario] = useState(null)
  const [currentNodeId, setCurrentNodeId] = useState(null)
  const [history, setHistory] = useState([])
  const [loading, setLoading] = useState(true)
  const [xpAwarded, setXpAwarded] = useState(false)

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
    setHistory((h) => [...h, { speaker: node.speaker, text: node.text, chosenReply: choice.text }])
    setCurrentNodeId(choice.next)

    const nextNode = scenario.content.nodes[choice.next]
    if (nextNode.end && !xpAwarded) {
      setXpAwarded(true)
      const { data: settings } = await supabase.from('user_settings').select('total_xp').eq('user_id', user.id).single()
      await supabase.from('user_settings').update({ total_xp: settings.total_xp + 10 }).eq('user_id', user.id)
    }
  }

  if (loading) return <AppLayout><div className="page"><p>Chargement...</p></div></AppLayout>
  if (!scenario) return <AppLayout><div className="page"><p>Scénario introuvable.</p></div></AppLayout>

  const node = scenario.content.nodes[currentNodeId]
  const speakerName = scenario.content.characters[node.speaker] || node.speaker

  return (
    <AppLayout>
      <div className="page">
        <button className="lesson-back" onClick={() => navigate(-1)}>← Quitter le scénario</button>
        <h1>{scenario.title}</h1>

        <div className="dialogue-history">
          {history.map((h, i) => (
            <div key={i} className="dialogue-turn">
              <div className="dialogue-bubble npc">
                <p className="dialogue-speaker">{scenario.content.characters[h.speaker] || h.speaker}</p>
                <p>{h.text}</p>
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
              <button key={i} className="exercise-option" onClick={() => chooseOption(choice)}>
                {choice.text}
              </button>
            ))}
          </div>
        )}
      </div>
    </AppLayout>
  )
}

export default ScenarioPlayer

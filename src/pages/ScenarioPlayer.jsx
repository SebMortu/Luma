import { useEffect, useState } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import TranslateToggle from '../components/TranslateToggle.jsx'
import CharacterAvatar from '../components/CharacterAvatar.jsx'
import SpeakButton from '../components/SpeakButton.jsx'
import { awardProgress } from '../lib/progress.js'

const FORMAT_LABELS = { court: 'court', moyen: 'moyen', long: 'long' }

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
  const [discoveredEndings, setDiscoveredEndings] = useState([])
  const [newEnding, setNewEnding] = useState(false)
  const [speakerCharacters, setSpeakerCharacters] = useState({})

  useEffect(() => {
    async function load() {
      const { data } = await supabase.from('scenarios').select('*').eq('id', scenarioId).single()
      setScenario(data)
      setCurrentNodeId(data.content.start_node)

      const { data: endingsData } = await supabase
        .from('user_scenario_endings').select('ending_label')
        .eq('user_id', user.id).eq('scenario_id', scenarioId)
      setDiscoveredEndings((endingsData || []).map((e) => e.ending_label))

      const { data: mappings } = await supabase
        .from('scenario_speaker_characters').select('speaker_key, characters(*)')
        .eq('scenario_id', scenarioId)
      const map = {}
      ;(mappings || []).forEach((m) => { map[m.speaker_key] = m.characters })
      setSpeakerCharacters(map)

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

      const isNew = !discoveredEndings.includes(nextNode.ending_label)
      setNewEnding(isNew)
      if (isNew) {
        await supabase.from('user_scenario_endings').insert({
          user_id: user.id,
          scenario_id: scenarioId,
          ending_label: nextNode.ending_label,
        })
        setDiscoveredEndings((prev) => [...prev, nextNode.ending_label])
      }
    }
  }

  if (loading) return <div className="page"><p>Chargement...</p></div>
  if (!scenario) return <div className="page"><p>Scénario introuvable.</p></div>

  const node = scenario.content.nodes[currentNodeId]
  const speakerName = scenario.content.characters[node.speaker] || node.speaker
  const totalEndings = Object.values(scenario.content.nodes).filter((n) => n.end).length
  // Estimation raisonnable de la progression : le récit se ramifie, donc pas
  // de "total" fixe universel — on approxime avec le nombre de nœuds non-fin
  // du scénario, en repère de longueur plutôt qu'un compte exact.
  const storyLengthEstimate = Object.values(scenario.content.nodes).filter((n) => !n.end).length
  const currentStep = Math.min(history.length + 1, storyLengthEstimate)
  const mainChar = speakerCharacters[node.speaker]

  return (
    <div className="page sc2-play-page">
      <div className="sc2-play-header">
        <div className="sc2-play-header-top">
          <span className="sc2-play-quit" onClick={() => navigate(-1)}>✕ Quitter le scénario</span>
          <span className="sc2-play-level-chip">{scenario.cecr_level} · {FORMAT_LABELS[scenario.format] || scenario.format}</span>
        </div>
        <div className="sc2-play-title-row">
          {mainChar ? (
            <CharacterAvatar character={mainChar} state={node.end ? 'celebrating' : 'waving'} size={58} />
          ) : (
            <span className="sc2-play-portrait-placeholder">portrait</span>
          )}
          <div style={{ flex: 1, minWidth: 0 }}>
            <div className="sc2-play-title">{scenario.title}</div>
            <div className="sc2-play-with">Tu discutes avec <strong>{speakerName}</strong></div>
          </div>
        </div>
        <div className="sc2-play-progress-row">
          <div className="d2-stat-track" style={{ flex: 1, background: '#EDF1F7' }}>
            <div style={{ height: '100%', width: `${Math.round((currentStep / storyLengthEstimate) * 100)}%`, background: 'linear-gradient(90deg,#A3E635,#3B82F6)', borderRadius: '5px' }} />
          </div>
          <span className="sc2-play-progress-label">{currentStep} / {storyLengthEstimate}</span>
        </div>
      </div>

      <div className="sc2-play-body">
        {history.map((h, i) => {
          const char = speakerCharacters[h.speaker]
          return (
            <div key={i} className="sc2-play-turn">
              <div className="sc2-play-npc-row">
                {char ? <CharacterAvatar character={char} state="neutral" size={40} /> : <span className="sc2-play-avatar-placeholder" />}
                <div style={{ minWidth: 0 }}>
                  <p className="sc2-play-speaker">{scenario.content.characters[h.speaker] || h.speaker}</p>
                  <div className="sc2-play-bubble npc">
                    <p>{h.text}</p>
                    <TranslateToggle translation={h.text_fr} />
                  </div>
                </div>
              </div>
              <div className="sc2-play-user-row">
                <div className="sc2-play-bubble user">{h.chosenReply}</div>
              </div>
            </div>
          )
        })}

        <div className="sc2-play-turn">
          <div className="sc2-play-npc-row">
            {mainChar ? <CharacterAvatar character={mainChar} state={node.end ? 'celebrating' : 'waving'} size={40} /> : <span className="sc2-play-avatar-placeholder" />}
            <div style={{ minWidth: 0 }}>
              <p className="sc2-play-speaker">{speakerName}</p>
              <div className="sc2-play-bubble npc current">
                <p>{node.text}</p>
                <SpeakButton text={node.text} size="small" />
                <TranslateToggle translation={node.text_fr} />
              </div>
            </div>
          </div>
        </div>
      </div>

      {node.end ? (
        <div className="sc2-play-footer">
          <p className="verb-result">{node.ending_label}</p>
          {newEnding && <p className="feedback correct">🆕 Nouvelle fin découverte !</p>}
          <p className="feedback correct">+10 XP</p>
          <p className="progress-card-sub">
            🔍 {discoveredEndings.length} / {totalEndings} fin{totalEndings > 1 ? 's' : ''} découverte{discoveredEndings.length > 1 ? 's' : ''}
          </p>
          <button className="d2-cta" onClick={() => navigate(-1)}>Retour aux scénarios</button>
        </div>
      ) : (
        <div className="sc2-play-footer">
          <div className="sc2-play-footer-head">
            <span>À toi de répondre</span>
          </div>
          {node.choices.map((choice, i) => (
            <div key={i}>
              <div className="sc2-play-choice" onClick={() => chooseOption(choice)}>
                <span className="sc2-play-choice-key">{String.fromCharCode(65 + i)}</span>
                <span style={{ flex: 1 }}>{choice.text}</span>
                {choice.text_fr && (
                  <span
                    className="sc2-play-choice-translate"
                    onClick={(e) => { e.stopPropagation(); setShownTranslations((s) => ({ ...s, [i]: !s[i] })) }}
                  >
                    🌐
                  </span>
                )}
              </div>
              {shownTranslations[i] && choice.text_fr && <p className="dialogue-choice-fr">🌐 {choice.text_fr}</p>}
            </div>
          ))}
        </div>
      )}
    </div>
  )
}

export default ScenarioPlayer

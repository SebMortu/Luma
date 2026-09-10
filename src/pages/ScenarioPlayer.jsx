import { useEffect, useState } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabaseClient.js'
import { useAuth } from '../contexts/AuthContext.jsx'
import TranslateToggle from '../components/TranslateToggle.jsx'
import CharacterAvatar from '../components/CharacterAvatar.jsx'
import SpeakButton from '../components/SpeakButton.jsx'
import { awardProgress } from '../lib/progress.js'
import { evaluateCondition, applyMutations, resolveNodeText, visibleChoices, buildJourneySummary } from '../lib/scenarioEngine.js'

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
  const [variables, setVariables] = useState({})
  const [lastGrammarNote, setLastGrammarNote] = useState(null)

  useEffect(() => {
    async function load() {
      const { data } = await supabase.from('scenarios').select('*').eq('id', scenarioId).single()
      setScenario(data)

      const { data: session } = await supabase
        .from('user_scenario_sessions').select('*').eq('user_id', user.id).eq('scenario_id', scenarioId).maybeSingle()
      if (session) {
        setCurrentNodeId(session.current_node_id)
        setHistory(session.history || [])
        setVariables(session.variables && Object.keys(session.variables).length > 0 ? session.variables : { ...data.content.variables })
      } else {
        setCurrentNodeId(data.content.start_node)
        setVariables({ ...data.content.variables })
      }

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
    const resolved = resolveNodeText(node, variables)
    const newHistory = [...history, { speaker: node.speaker, text: resolved.text, text_fr: resolved.text_fr, chosenReply: choice.text }]
    const newVariables = applyMutations(variables, choice.set)
    setHistory(newHistory)
    setVariables(newVariables)
    setCurrentNodeId(choice.next)
    setShownTranslations({})
    // Note grammaticale brève et exceptionnelle (voir choice.grammar_note) —
    // reste affichée un instant puis s'efface, sans bloquer la suite.
    setLastGrammarNote(choice.grammar_note || null)
    if (choice.grammar_note) setTimeout(() => setLastGrammarNote(null), 4000)

    const nextNode = scenario.content.nodes[choice.next]
    if (nextNode.end) {
      // Scénario terminé : plus besoin de session à reprendre.
      await supabase.from('user_scenario_sessions').delete().eq('user_id', user.id).eq('scenario_id', scenarioId)
      if (!xpAwarded) {
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
    } else {
      // Sauvegarde la progression (dialogue ET variables) pour pouvoir reprendre plus tard.
      await supabase.from('user_scenario_sessions').upsert({
        user_id: user.id,
        scenario_id: scenarioId,
        current_node_id: choice.next,
        history: newHistory,
        variables: newVariables,
        updated_at: new Date().toISOString(),
      })
    }
  }

  if (loading) return <div className="page"><p>Chargement...</p></div>
  if (!scenario) return <div className="page"><p>Scénario introuvable.</p></div>

  const node = scenario.content.nodes[currentNodeId]
  const resolvedCurrent = resolveNodeText(node, variables)
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
                <p>{resolvedCurrent.text}</p>
                <SpeakButton text={resolvedCurrent.text} size="small" />
                <TranslateToggle translation={resolvedCurrent.text_fr} />
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

          {buildJourneySummary(variables, scenario.content.variable_labels).length > 0 && (
            <div className="sc2-journey-card">
              <div className="sc2-journey-title">Ton parcours</div>
              {buildJourneySummary(variables, scenario.content.variable_labels).map((item, i) => (
                <div key={i} className="sc2-journey-row">
                  <span className="sc2-journey-label">{item.label}</span>
                  <span className="sc2-journey-value">{item.value}</span>
                </div>
              ))}
            </div>
          )}

          <p className="progress-card-sub">
            🔍 {discoveredEndings.length} / {totalEndings} fin{totalEndings > 1 ? 's' : ''} découverte{discoveredEndings.length > 1 ? 's' : ''}
          </p>
          {totalEndings > 1 && discoveredEndings.length < totalEndings && (
            <p className="sc2-replay-hint">Tes choix ont influencé cette histoire. D'autres chemins t'attendent.</p>
          )}
          <button className="d2-cta" onClick={() => navigate(-1)}>Retour aux scénarios</button>
        </div>
      ) : (
        <div className="sc2-play-footer">
          {lastGrammarNote && <p className="sc2-grammar-note">💡 {lastGrammarNote}</p>}
          <div className="sc2-play-footer-head">
            <span>À toi de répondre</span>
          </div>
          {visibleChoices(node, variables).map((choice, i) => (
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

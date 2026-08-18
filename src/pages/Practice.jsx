import { useNavigate } from 'react-router-dom'
import AppLayout from '../components/AppLayout.jsx'

const ITEMS = [
  { path: '/scenarios', icon: '🎭', title: 'Scénarios', desc: 'Dialogues interactifs à embranchements, avec traduction.' },
  { path: '/word-games', icon: '🧩', title: 'Jeux de mots', desc: 'Mots croisés et jeux de vocabulaire.' },
  { path: '/vocab-review', icon: '🗂️', title: 'Révision', desc: 'Flashcards de vocabulaire sauvegardé, à réviser régulièrement.' },
]

function Practice() {
  const navigate = useNavigate()

  return (
    <AppLayout>
      <div className="page">
        <h1>🎮 Pratiquer</h1>
        <p className="dashboard-goal">Mets en pratique ce que tu as appris, de façon ludique.</p>

        <div className="unit-list">
          {ITEMS.map((item) => (
            <div key={item.path} className="unit-card clickable" onClick={() => navigate(item.path)}>
              <div className="unit-icon">{item.icon}</div>
              <div>
                <p className="unit-title">{item.title}</p>
                <p className="unit-status">{item.desc}</p>
              </div>
            </div>
          ))}
        </div>
      </div>
    </AppLayout>
  )
}

export default Practice

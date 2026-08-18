import { useNavigate } from 'react-router-dom'
import AppLayout from '../components/AppLayout.jsx'

const ITEMS = [
  { path: '/grammar', icon: '📚', title: 'Grammaire', desc: "Consulte n'importe quelle notion déjà vue, à tout moment." },
  { path: '/verbs', icon: '🔤', title: 'Verbes irréguliers', desc: 'Entraîne-toi en sprint chronométré ou en quiz.' },
  { path: '/toeic-test', icon: '📝', title: 'Examen (TOEIC)', desc: "Teste ton niveau avec un examen blanc et une estimation de score." },
]

function Learn() {
  const navigate = useNavigate()

  return (
    <AppLayout>
      <div className="page">
        <h1>🎓 Apprendre</h1>
        <p className="dashboard-goal">Ressources complémentaires pour renforcer tes bases.</p>

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

export default Learn

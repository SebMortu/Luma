import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App.jsx'
import UpdatePrompt from './components/UpdatePrompt.jsx'
import './styles/themes.css'
import './styles/global.css'
import './styles/lesson.css'
import './styles/app.css'

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <App />
    <UpdatePrompt />
  </React.StrictMode>
)

import { BrowserRouter, Routes, Route } from 'react-router-dom'
import Home from './pages/Home.jsx'
import LessonDemo from './pages/LessonDemo.jsx'
import DebugEnv from './pages/DebugEnv.jsx'

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/lesson-demo" element={<LessonDemo />} />
        <Route path="/debug-env" element={<DebugEnv />} />
      </Routes>
    </BrowserRouter>
  )
}

export default App

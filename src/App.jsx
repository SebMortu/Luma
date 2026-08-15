import { BrowserRouter, Routes, Route } from 'react-router-dom'
import { AuthProvider } from './contexts/AuthContext.jsx'
import { ThemeProvider } from './contexts/ThemeContext.jsx'
import ProtectedRoute from './components/ProtectedRoute.jsx'
import RootRedirect from './pages/RootRedirect.jsx'
import Login from './pages/Login.jsx'
import Onboarding from './pages/Onboarding.jsx'
import Dashboard from './pages/Dashboard.jsx'
import UnitDetail from './pages/UnitDetail.jsx'
import LevelPath from './pages/LevelPath.jsx'
import Lesson from './pages/Lesson.jsx'
import Profile from './pages/Profile.jsx'
import Settings from './pages/Settings.jsx'

function App() {
  return (
    <ThemeProvider>
      <AuthProvider>
        <BrowserRouter>
          <Routes>
            <Route path="/login" element={<Login />} />
            <Route path="/" element={<ProtectedRoute><RootRedirect /></ProtectedRoute>} />
            <Route path="/onboarding" element={<ProtectedRoute><Onboarding /></ProtectedRoute>} />
            <Route path="/dashboard" element={<ProtectedRoute><Dashboard /></ProtectedRoute>} />
            <Route path="/unit/:unitId" element={<ProtectedRoute><UnitDetail /></ProtectedRoute>} />
            <Route path="/level/:levelCode" element={<ProtectedRoute><LevelPath /></ProtectedRoute>} />
            <Route path="/lesson/:lessonId" element={<ProtectedRoute><Lesson /></ProtectedRoute>} />
            <Route path="/profile" element={<ProtectedRoute><Profile /></ProtectedRoute>} />
            <Route path="/settings" element={<ProtectedRoute><Settings /></ProtectedRoute>} />
          </Routes>
        </BrowserRouter>
      </AuthProvider>
    </ThemeProvider>
  )
}

export default App

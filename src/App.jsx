import { BrowserRouter, Routes, Route } from 'react-router-dom'
import { AuthProvider } from './contexts/AuthContext.jsx'
import { ThemeProvider } from './contexts/ThemeContext.jsx'
import ProtectedRoute from './components/ProtectedRoute.jsx'
import RootRedirect from './pages/RootRedirect.jsx'
import Login from './pages/Login.jsx'
import ResetPassword from './pages/ResetPassword.jsx'
import Onboarding from './pages/Onboarding.jsx'
import Dashboard from './pages/Dashboard.jsx'
import UnitDetail from './pages/UnitDetail.jsx'
import UnitTest from './pages/UnitTest.jsx'
import LevelUpTest from './pages/LevelUpTest.jsx'
import PlacementTest from './pages/PlacementTest.jsx'
import LevelPath from './pages/LevelPath.jsx'
import Lesson from './pages/Lesson.jsx'
import Profile from './pages/Profile.jsx'
import Settings from './pages/Settings.jsx'
import Verbs from './pages/Verbs.jsx'
import GrammarLibrary from './pages/GrammarLibrary.jsx'
import Learn from './pages/Learn.jsx'
import Friends from './pages/Friends.jsx'
import Practice from './pages/Practice.jsx'
import GrammarDetail from './pages/GrammarDetail.jsx'
import ToeicTest from './pages/ToeicTest.jsx'
import ScenariosLibrary from './pages/ScenariosLibrary.jsx'
import ScenarioList from './pages/ScenarioList.jsx'
import ScenarioPlayer from './pages/ScenarioPlayer.jsx'
import WordGamesLibrary from './pages/WordGamesLibrary.jsx'
import WordPuzzlePlayer from './pages/WordPuzzlePlayer.jsx'
import WordGamesHistory from './pages/WordGamesHistory.jsx'
import BooksLibrary from './pages/BooksLibrary.jsx'
import BookReader from './pages/BookReader.jsx'
import BookSeriesDetail from './pages/BookSeriesDetail.jsx'
import VocabReview from './pages/VocabReview.jsx'

function App() {
  return (
    <ThemeProvider>
      <AuthProvider>
        <BrowserRouter>
          <Routes>
            <Route path="/login" element={<Login />} />
            <Route path="/reset-password" element={<ResetPassword />} />
            <Route path="/" element={<ProtectedRoute><RootRedirect /></ProtectedRoute>} />
            <Route path="/onboarding" element={<ProtectedRoute><Onboarding /></ProtectedRoute>} />
            <Route path="/dashboard" element={<ProtectedRoute><Dashboard /></ProtectedRoute>} />
            <Route path="/unit/:unitId" element={<ProtectedRoute><UnitDetail /></ProtectedRoute>} />
            <Route path="/unit/:unitId/test" element={<ProtectedRoute><UnitTest /></ProtectedRoute>} />
            <Route path="/level-up-test/:fromLevel" element={<ProtectedRoute><LevelUpTest /></ProtectedRoute>} />
            <Route path="/placement-test/:targetLevel" element={<ProtectedRoute><PlacementTest /></ProtectedRoute>} />
            <Route path="/level/:levelCode" element={<ProtectedRoute><LevelPath /></ProtectedRoute>} />
            <Route path="/lesson/:lessonId" element={<ProtectedRoute><Lesson /></ProtectedRoute>} />
            <Route path="/profile" element={<ProtectedRoute><Profile /></ProtectedRoute>} />
            <Route path="/settings" element={<ProtectedRoute><Settings /></ProtectedRoute>} />
            <Route path="/verbs" element={<ProtectedRoute><Verbs /></ProtectedRoute>} />
            <Route path="/grammar" element={<ProtectedRoute><GrammarLibrary /></ProtectedRoute>} />
            <Route path="/learn" element={<ProtectedRoute><Learn /></ProtectedRoute>} />
            <Route path="/practice" element={<ProtectedRoute><Practice /></ProtectedRoute>} />
            <Route path="/friends" element={<ProtectedRoute><Friends /></ProtectedRoute>} />
            <Route path="/grammar/:ficheId" element={<ProtectedRoute><GrammarDetail /></ProtectedRoute>} />
            <Route path="/toeic-test" element={<ProtectedRoute><ToeicTest /></ProtectedRoute>} />
            <Route path="/scenarios" element={<ProtectedRoute><ScenariosLibrary /></ProtectedRoute>} />
            <Route path="/scenarios/:themeId" element={<ProtectedRoute><ScenarioList /></ProtectedRoute>} />
            <Route path="/scenario/:scenarioId" element={<ProtectedRoute><ScenarioPlayer /></ProtectedRoute>} />
            <Route path="/word-games" element={<ProtectedRoute><WordGamesLibrary /></ProtectedRoute>} />
            <Route path="/word-puzzle/:puzzleId" element={<ProtectedRoute><WordPuzzlePlayer /></ProtectedRoute>} />
            <Route path="/word-games/history" element={<ProtectedRoute><WordGamesHistory /></ProtectedRoute>} />
            <Route path="/books" element={<ProtectedRoute><BooksLibrary /></ProtectedRoute>} />
            <Route path="/books/series/:seriesId" element={<ProtectedRoute><BookSeriesDetail /></ProtectedRoute>} />
            <Route path="/books/:bookId" element={<ProtectedRoute><BookReader /></ProtectedRoute>} />
            <Route path="/vocab-review" element={<ProtectedRoute><VocabReview /></ProtectedRoute>} />
          </Routes>
        </BrowserRouter>
      </AuthProvider>
    </ThemeProvider>
  )
}

export default App

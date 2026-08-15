import { createContext, useContext, useEffect, useState } from 'react'

const ThemeContext = createContext(null)

export const THEMES = [
  { value: 'night', label: 'Nuit', desc: 'Marine profond, accent citron' },
  { value: 'forest', label: 'Forêt', desc: 'Sombre et végétal (thème d\'origine)' },
  { value: 'light', label: 'Clair', desc: 'Fond lumineux' },
]

export function ThemeProvider({ children }) {
  const [theme, setThemeState] = useState(() => localStorage.getItem('luma-theme') || 'night')

  useEffect(() => {
    document.documentElement.setAttribute('data-theme', theme)
    localStorage.setItem('luma-theme', theme)
  }, [theme])

  const setTheme = (value) => setThemeState(value)

  return (
    <ThemeContext.Provider value={{ theme, setTheme }}>
      {children}
    </ThemeContext.Provider>
  )
}

export function useTheme() {
  return useContext(ThemeContext)
}

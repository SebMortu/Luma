import { createContext, useContext, useEffect, useState } from 'react'

const ThemeContext = createContext(null)

export const THEMES = [
  { value: 'lumen', label: 'Lumen', desc: 'Sombre et lumineux (par défaut)' },
  { value: 'lumen-light', label: 'Lumen Clair', desc: 'Même identité, fond clair' },
]

export function ThemeProvider({ children }) {
  const [theme, setThemeState] = useState(() => {
    const saved = localStorage.getItem('luma-theme')
    // Migration douce : les anciens thèmes retirés retombent sur Lumen sombre
    return saved === 'lumen' || saved === 'lumen-light' ? saved : 'lumen'
  })

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

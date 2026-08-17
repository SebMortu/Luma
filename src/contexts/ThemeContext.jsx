import { createContext, useContext, useEffect, useState } from 'react'

const ThemeContext = createContext(null)

export const THEMES = [
  { value: 'lumen', label: 'Lumen', desc: 'Notre nouvelle identité — premium et lumineuse' },
  { value: 'night', label: 'Nuit', desc: 'Marine profond, accent citron' },
  { value: 'forest', label: 'Forêt', desc: 'Sombre et végétal (thème d\'origine)' },
  { value: 'light', label: 'Clair', desc: 'Fond lumineux' },
  { value: 'pastel', label: 'Pastel', desc: 'Choisis ta couleur' },
]

export const PASTEL_SWATCHES = [
  { bg: '#FFADAD', accent: '#C1121F', label: 'Corail' },
  { bg: '#FFD6A5', accent: '#B5651D', label: 'Abricot' },
  { bg: '#FDFFB6', accent: '#8C6D00', label: 'Citron' },
  { bg: '#CAFFBF', accent: '#2F7D4C', label: 'Menthe' },
  { bg: '#9BF6FF', accent: '#157A8A', label: 'Turquoise' },
  { bg: '#A0C4FF', accent: '#2E5C94', label: 'Azur' },
  { bg: '#BDB2FF', accent: '#5A3E8C', label: 'Lavande' },
  { bg: '#FFC6FF', accent: '#A32C74', label: 'Magenta' },
]

export function ThemeProvider({ children }) {
  const [theme, setThemeState] = useState(() => localStorage.getItem('luma-theme') || 'lumen')
  const [pastelBg, setPastelBgState] = useState(() => localStorage.getItem('luma-pastel-bg') || PASTEL_SWATCHES[0].bg)

  useEffect(() => {
    document.documentElement.setAttribute('data-theme', theme)
    localStorage.setItem('luma-theme', theme)

    if (theme === 'pastel') {
      const swatch = PASTEL_SWATCHES.find((s) => s.bg === pastelBg) || PASTEL_SWATCHES[0]
      document.documentElement.style.setProperty('--bg-page', swatch.bg)
      document.documentElement.style.setProperty('--accent', swatch.accent)
    } else {
      document.documentElement.style.removeProperty('--bg-page')
      document.documentElement.style.removeProperty('--accent')
    }
  }, [theme, pastelBg])

  const setTheme = (value) => setThemeState(value)
  const setPastelBg = (bg) => {
    setPastelBgState(bg)
    localStorage.setItem('luma-pastel-bg', bg)
  }

  return (
    <ThemeContext.Provider value={{ theme, setTheme, pastelBg, setPastelBg }}>
      {children}
    </ThemeContext.Provider>
  )
}

export function useTheme() {
  return useContext(ThemeContext)
}

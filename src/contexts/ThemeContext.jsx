import { createContext, useContext, useEffect, useState } from 'react'

const ThemeContext = createContext(null)

export const THEMES = [
  { value: 'night', label: 'Nuit', desc: 'Marine profond, accent citron' },
  { value: 'forest', label: 'Forêt', desc: 'Sombre et végétal (thème d\'origine)' },
  { value: 'light', label: 'Clair', desc: 'Fond lumineux' },
  { value: 'pastel', label: 'Pastel', desc: 'Choisis ta couleur' },
]

export const PASTEL_SWATCHES = [
  { bg: '#FFADAD', accent: '#E63946', label: 'Corail' },
  { bg: '#FFD6A5', accent: '#E08E45', label: 'Abricot' },
  { bg: '#FDFFB6', accent: '#C9A227', label: 'Citron' },
  { bg: '#CAFFBF', accent: '#3A9152', label: 'Menthe' },
  { bg: '#9BF6FF', accent: '#1E90A3', label: 'Turquoise' },
  { bg: '#A0C4FF', accent: '#3A6EA5', label: 'Azur' },
  { bg: '#BDB2FF', accent: '#6B4FA0', label: 'Lavande' },
  { bg: '#FFC6FF', accent: '#C2438E', label: 'Magenta' },
]

export function ThemeProvider({ children }) {
  const [theme, setThemeState] = useState(() => localStorage.getItem('luma-theme') || 'night')
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

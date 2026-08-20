import { createContext, useContext, useEffect, useState } from 'react'

const ThemeContext = createContext(null)

export const THEMES = [
  { value: 'lumen', label: 'Lumen', desc: 'Sombre et lumineux (par défaut)' },
  { value: 'lumen-light', label: 'Lumen Clair', desc: 'Même identité, fond clair' },
]

export const TEXT_SCALES = [
  { value: 'normal', label: 'Normale' },
  { value: 'large', label: 'Grande' },
  { value: 'xlarge', label: 'Très grande' },
]

export function ThemeProvider({ children }) {
  const [theme, setThemeState] = useState(() => {
    const saved = localStorage.getItem('luma-theme')
    // Migration douce : les anciens thèmes retirés retombent sur Lumen sombre
    return saved === 'lumen' || saved === 'lumen-light' ? saved : 'lumen'
  })

  const [textScale, setTextScaleState] = useState(() => {
    const saved = localStorage.getItem('luma-text-scale')
    return ['normal', 'large', 'xlarge'].includes(saved) ? saved : 'normal'
  })

  useEffect(() => {
    document.documentElement.setAttribute('data-theme', theme)
    localStorage.setItem('luma-theme', theme)
  }, [theme])

  useEffect(() => {
    document.documentElement.setAttribute('data-text-scale', textScale)
    localStorage.setItem('luma-text-scale', textScale)
  }, [textScale])

  const setTheme = (value) => setThemeState(value)
  const setTextScale = (value) => setTextScaleState(value)

  return (
    <ThemeContext.Provider value={{ theme, setTheme, textScale, setTextScale }}>
      {children}
    </ThemeContext.Provider>
  )
}

export function useTheme() {
  return useContext(ThemeContext)
}

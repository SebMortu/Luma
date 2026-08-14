import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
// PWA temporairement désactivée le temps de stabiliser l'app de base
// import { VitePWA } from 'vite-plugin-pwa'

export default defineConfig({
  plugins: [
    react(),
    // VitePWA({ ... }) — on réactivera ça une fois l'app stable
  ]
})

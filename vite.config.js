import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import { VitePWA } from 'vite-plugin-pwa'

export default defineConfig({
  plugins: [
    react(),
    VitePWA({
      registerType: 'prompt',
      strategies: 'injectManifest',
      srcDir: 'src',
      filename: 'sw.js',
      manifestFilename: 'manifest-v3.webmanifest',
      injectManifest: {
        swSrc: 'src/sw.js',
        swDest: 'dist/sw.js',
      },
      manifest: {
        name: 'Luma',
        short_name: 'Luma',
        description: 'Apprends une langue de façon ludique',
        theme_color: '#3B82F6',
        background_color: '#F5F9FF',
        display: 'standalone',
        start_url: '/',
        icons: [
          {
            src: 'icons/icon-192-v3.png',
            sizes: '192x192',
            type: 'image/png'
          },
          {
            src: 'icons/icon-512-v3.png',
            sizes: '512x512',
            type: 'image/png'
          }
        ]
      }
    })
  ]
})

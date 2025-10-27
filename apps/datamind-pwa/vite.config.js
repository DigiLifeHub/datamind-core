import { defineConfig } from 'vite'
import { svelte } from '@sveltejs/vite-plugin-svelte'
import path from 'path'

// https://vite.dev/config/
export default defineConfig({
  plugins: [svelte()],
  root: __dirname,
  build: {
    outDir: '../../dist/apps/datamind-pwa',
    emptyOutDir: true,
    reportCompressedSize: true,
  },
  server: {
    host: true,
    port: 5173
  },
  preview: {
    host: true,
    port: 4173
  }
})

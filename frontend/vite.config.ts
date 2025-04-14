import tailwindcss from '@tailwindcss/vite'
import react from '@vitejs/plugin-react-swc'
import type { UserConfig } from 'vite'
import tsconfigPaths from 'vite-tsconfig-paths'

// https://vitejs.dev/config/
export default {
  plugins: [react(), tsconfigPaths(), tailwindcss()],
  build: {
    target: 'esnext'
  }
} satisfies UserConfig

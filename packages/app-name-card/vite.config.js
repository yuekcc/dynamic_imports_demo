import { defineConfig } from 'vite';
import vue from '@vitejs/plugin-vue';

export default defineConfig({
  build: {
    minify: false,
    lib: {
      entry: 'src/index.js',
      formats: ['esm'],
      fileName: 'index',
    },
    rollupOptions: {
      external: ['vue'],
    },
    emptyOutDir: true,
  },
  plugins: [vue()],
});

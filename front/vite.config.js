import { defineConfig } from 'vite'
import uni from '@dcloudio/vite-plugin-uni'
// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    uni(),
  ],
  server: {
    host: true, // 监听 0.0.0.0，真机/局域网可访问（之前只绑 IPv6 ::1）
    port: 5173,
    proxy: {
      // 把前端 /paper_png/** 反代到后端 8080，解决 H5 dev 环境图片跨域
      '/paper_png': {
        target: 'http://localhost:8080',
        changeOrigin: true
      },
      // 顺便也代理 API（以防用户手机调试时 BASE_URL 不可达）
      '/api': {
        target: 'http://localhost:8080',
        changeOrigin: true
      }
    }
  },
})

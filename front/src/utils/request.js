/**
 * 网络请求统一封装（uni.request → Promise）
 *
 * 用法：
 *   import { request } from '@/utils/request'
 *   const data = await request({ url: '/api/chat', method: 'POST', data: { question: '...' } })
 *
 * 注意：
 * - H5 开发：BASE_URL 用 localhost 即可
 * - 微信开发者工具/真机：localhost 指向手机/工具自身，需改成电脑局域网 IP（如 http://192.168.x.x:8080）
 * - 登录态：自动携带 satoken 请求头；401 统一跳登录页
 */

const BASE_URL = 'http://192.168.71.202:8080' // H5 开发用（电脑 Wi-Fi IP，换网络需同步更新）

/** 认证相关接口（401 不跳登录页，避免死循环） */
const AUTH_URLS = ['/api/auth/login', '/api/auth/register']

function handleUnauthorized() {
	if (AUTH_URLS.some(u => (this && this.url || '').includes(u))) return
	uni.removeStorageSync('token')
	uni.removeStorageSync('user')
	uni.reLaunch({ url: '/pages/login/login' })
}

export function request(options) {
	return new Promise((resolve, reject) => {
		const fullUrl = BASE_URL + options.url
		const token = uni.getStorageSync('token')
		const headers = {
			'Content-Type': 'application/json',
			...(token ? { satoken: token } : {}),
			...(options.header || {})
		}
		console.log('[request]', options.method, fullUrl, options.data)
		// #ifdef H5
		// H5 环境：用原生 fetch，避免 uni.request 跨域问题
		fetch(fullUrl, {
			method: options.method || 'GET',
			headers,
			body: ['POST', 'PUT', 'PATCH'].includes(options.method) ? JSON.stringify(options.data || {}) : undefined,
			signal: AbortSignal.timeout(options.timeout || 90000)
		})
			.then(async r => {
				console.log('[request] HTTP', r.status)
				const d = await r.json().catch(() => ({}))
				if (r.status === 401 || d.code === 401) {
					handleUnauthorized.call({ url: options.url })
					reject(d)
					return
				}
				resolve(d)
			})
			.catch(e => { console.error('[request] 失败', e); reject(e) })
		// #endif
		// #ifndef H5
		uni.request({
			url: fullUrl,
			method: options.method || 'GET',
			data: options.data || {},
			header: headers,
			timeout: options.timeout || 90000,
			success: (res) => {
				console.log('[request] 响应', res.statusCode, res.data)
				if (res.statusCode === 401 || (res.data && res.data.code === 401)) {
					handleUnauthorized.call({ url: options.url })
					reject(res)
					return
				}
				if (res.statusCode >= 200 && res.statusCode < 300) resolve(res.data)
				else { uni.showToast({ title: `请求失败(${res.statusCode})`, icon: 'none' }); reject(res) }
			},
			fail: (err) => { console.error('[request] 失败', err); uni.showToast({ title: '网络异常，请检查后端是否启动', icon: 'none' }); reject(err) }
		})
		// #endif
	})
}

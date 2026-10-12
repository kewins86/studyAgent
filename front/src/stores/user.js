/**
 * 用户状态（Pinia）
 * 登录态：token + 学生信息（存本地，启动自动恢复）
 */
import { defineStore } from 'pinia'
import { ref } from 'vue'

const TOKEN_KEY = 'token'
const USER_KEY = 'user'

export const useUserStore = defineStore('user', () => {
	const token = ref(uni.getStorageSync(TOKEN_KEY) || '')
	const id = ref(uni.getStorageSync(USER_KEY)?.id || null)
	const name = ref(uni.getStorageSync(USER_KEY)?.name || '')
	const grade = ref(uni.getStorageSync(USER_KEY)?.grade || '')
	const phone = ref(uni.getStorageSync(USER_KEY)?.phone || '')

	/** 登录/注册成功后写入登录态 */
	function setLogin(data) {
		token.value = data.token
		id.value = data.student.id
		name.value = data.student.name
		grade.value = data.student.grade
		phone.value = data.student.phone
		uni.setStorageSync(TOKEN_KEY, data.token)
		uni.setStorageSync(USER_KEY, { id: id.value, name: name.value, grade: grade.value, phone: phone.value })
	}

	/** 清空登录态（退出登录 / token 失效） */
	function clearLogin() {
		token.value = ''
		id.value = null
		name.value = ''
		grade.value = ''
		phone.value = ''
		uni.removeStorageSync(TOKEN_KEY)
		uni.removeStorageSync(USER_KEY)
	}

	/** 是否已登录 */
	function isLoggedIn() {
		return !!token.value
	}

	/** 设置昵称（本地 + 存储） */
	function setName(n) {
		name.value = n
		uni.setStorageSync(USER_KEY, { id: id.value, name: name.value, grade: grade.value, phone: phone.value })
	}

	return { token, id, name, grade, phone, setLogin, clearLogin, isLoggedIn, setName }
})

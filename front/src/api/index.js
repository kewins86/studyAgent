/**
 * 后端 API 接口定义（全部集中在这里，页面不直接写 URL）
 */
import { request } from '@/utils/request'

/* ========== 认证 ========== */
/** 注册（手机号+密码，返回 {token, student}） */
export function register(data) {
	return request({ url: '/api/auth/register', method: 'POST', data })
}

/** 登录（返回 {token, student}） */
export function login(data) {
	return request({ url: '/api/auth/login', method: 'POST', data })
}

/** 当前登录学生 */
export function getMe() {
	return request({ url: '/api/auth/me', method: 'GET' })
}

/** 登出 */
export function logout() {
	return request({ url: '/api/auth/logout', method: 'POST' })
}

/* ========== 智能答疑 ========== */
/** 智能答疑：识别学科 → LLM 回答（sessionId 用于多轮上下文） */
export function chat(question, sessionId) {
	return request({
		url: '/api/chat',
		method: 'POST',
		data: { question, sessionId }
	})
}

/** 图片答疑：上传图片 + 文字问题 → Vision LLM 识别解析 */
export function chatWithImage(question, image, sessionId) {
	return request({
		url: '/api/chat/image',
		method: 'POST',
		data: { question, image, sessionId }
	})
}

/** 判断学生回答是否正确（交互式分步解题用） */
export function chatCheck(question, answer, studentAnswer) {
	return request({
		url: '/api/chat/check',
		method: 'POST',
		data: { question, answer, studentAnswer }
	})
}

/** 题目解析总结（全部步骤答完后，生成考点/知识点/注意事项） */
export function chatSummary(question, steps) {
	return request({
		url: '/api/chat/summary',
		method: 'POST',
		data: { question, steps }
	})
}

/** 生成摸底测试 */
export function generateAssessment() {
	return request({ url: '/api/assessment/generate', method: 'POST' })
}

/** 查询测试状态 */
export function getAssessmentStatus() {
	return request({ url: '/api/assessment/status', method: 'GET' })
}

/** 获取测试题目 */
export function getAssessmentQuestions(assessmentId) {
	return request({ url: `/api/assessment/${assessmentId}`, method: 'GET' })
}

/** 提交测试 */
export function submitAssessment(assessmentId, answers) {
	return request({
		url: `/api/assessment/${assessmentId}/submit`,
		method: 'POST',
		data: answers
	})
}

/* ========== TTS 语音合成 ========== */
/** 文字转语音（后端调 edge-tts 生成 mp3，返回 base64） */
export function tts(text) {
	return request({
		url: '/api/tts',
		method: 'POST',
		data: { text }
	})
}

/* ========== 讯飞 ASR ========== */
/** 获取讯飞 WebSocket 签名参数（前端直连讯飞用） */
export function getAsrSignature() {
	return request({ url: '/api/asr/signature', method: 'GET' })
}

/** 提交画像问卷 */
export function saveProfile(studentId, profile) {
	return request({
		url: `/api/students/${studentId}/profile`,
		method: 'POST',
		data: profile
	})
}

/** 查询画像 */
export function getProfile(studentId) {
	return request({
		url: `/api/students/${studentId}/profile`,
		method: 'GET'
	})
}

/* ========== 错题本 ========== */
/** 错题列表 */
export function getMistakes(status = 'all') {
	const q = status && status !== 'all' ? `?status=${status}` : ''
	return request({ url: `/api/mistakes${q}`, method: 'GET' })
}

/** 错题统计 */
export function getMistakeStats() {
	return request({ url: '/api/mistakes/stats', method: 'GET' })
}

/** 标记已掌握 */
export function markMistakeMastered(id) {
	return request({ url: `/api/mistakes/${id}/mastered`, method: 'POST' })
}

/* ========== 首页统计 ========== */
/** 今日学习统计 */
export function getTodayStats() {
	return request({ url: '/api/today', method: 'GET' })
}

/* ========== 练习闭环（V1 题库） ========== */
/** 生成练习题目（不含答案） */
export function generatePractice(subject = '数学', grade = '三年级', count = 5, nodeId = null) {
	const body = { subject, grade, count }
	if (nodeId) body.nodeId = nodeId
	return request({ url: '/api/practice/generate', method: 'POST', data: body })
}

/** 提交批改 */
export function submitPractice(items) {
	return request({ url: '/api/practice/submit', method: 'POST', data: { items } })
}

/* ========== 知识树 ========== */
/** 知识树（树形结构） */
export function getKnowledgeTree(subject) {
	const q = subject ? `?subject=${encodeURIComponent(subject)}` : ''
	return request({ url: `/api/knowledge/tree${q}`, method: 'GET' })
}

/* ========== 今日家作 ========== */
/** 获取今日家作 */
export function getTodayHomework() {
	return request({ url: '/api/homework/today', method: 'GET' })
}

/** 获取家作历史（家长检查） */
export function getHomeworkHistory(days = 7) {
	return request({ url: `/api/homework/history?days=${days}`, method: 'GET' })
}

/** 获取指定日期家作 */
export function getHomeworkByDate(date) {
	return request({ url: `/api/homework/date/${date}`, method: 'GET' })
}

/** 录入家作条目 */
export function submitHomeworkItems(items) {
	return request({ url: '/api/homework/items', method: 'POST', data: items })
}

/** 标记条目完成 */
export function markHomeworkItemDone(id, data = {}) {
	return request({ url: `/api/homework/items/${id}/done`, method: 'POST', data })
}

/** 提交作业成果（照片/录音，不标记完成） */
export function submitHomeworkResult(id, data = {}) {
	return request({ url: `/api/homework/items/${id}/submit`, method: 'POST', data })
}

/** 更新AI检查结果 */
export function updateHomeworkAiCheck(id, result) {
	return request({ url: `/api/homework/items/${id}/ai`, method: 'POST', data: { result } })
}

/** AI 识别家作（拍照/文字 → 结构化条目） */
export function recognizeHomework(data) {
	return request({ url: '/api/homework/recognize', method: 'POST', data })
}

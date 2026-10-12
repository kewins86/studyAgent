<template>
	<view class="assessment-page">
		<!-- 顶部栏 -->
		<view class="top-bar">
			<image class="home-icon" src="/static/tabbar/home_active.png" mode="aspectFit" @click="goHome" />
			<text class="top-title">摸底小测</text>
			<text class="top-progress">{{ currentIndex + 1 }}/{{ questions.length }}</text>
		</view>

		<!-- 加载中 -->
		<view v-if="loading" class="loading-wrap">
			<text class="loading-text">正在准备题目...</text>
		</view>

		<!-- 测试内容 -->
		<view v-else-if="!submitted" class="quiz-wrap">
			<!-- 进度条 -->
			<view class="progress-bar">
				<view class="progress-fill" :style="{ width: progressPct + '%' }"></view>
			</view>

			<!-- 题目卡片 -->
			<view class="question-card" v-if="currentQuestion">
				<view class="q-header">
					<text class="q-num">第 {{ currentIndex + 1 }} 题</text>
					<text class="q-tag">{{ currentQuestion.knowledgePoint }}</text>
				</view>
				<text class="q-stem">{{ currentQuestion.stem }}</text>

				<!-- 选项 -->
				<view class="options">
					<view
						v-for="(opt, i) in currentQuestion.options"
						:key="i"
						class="option"
						:class="{ selected: selectedOption === optionLetters[i] }"
						@click="selectOption(optionLetters[i])"
					>
						<view class="option-letter">{{ optionLetters[i] }}</view>
						<text class="option-text">{{ opt }}</text>
					</view>
				</view>
			</view>

			<!-- 底部按钮 -->
			<view class="bottom-bar">
				<view v-if="currentIndex > 0" class="btn-secondary" @click="prevQuestion">上一题</view>
				<view v-if="currentIndex < questions.length - 1" class="btn-primary" :class="{ disabled: !selectedOption }" @click="nextQuestion">
					下一题
				</view>
				<view v-else class="btn-primary" :class="{ disabled: !selectedOption }" @click="submitTest">
					提交测试
				</view>
			</view>
		</view>

		<!-- 测试结果 -->
		<view v-else class="result-wrap">
			<view class="result-card">
				<image class="result-logo" src="/static/logo-deer.png" mode="aspectFit" />
				<text class="result-title">测试完成！</text>
				<view class="result-score">
					<text class="score-num">{{ result.score }}</text>
					<text class="score-unit">分</text>
				</view>
				<text class="result-detail">{{ result.correctCount }}/{{ result.totalCount }} 道正确</text>

				<!-- 答题详情 -->
				<view class="answer-details">
					<view v-for="(d, i) in result.details" :key="i" class="detail-item">
						<text class="detail-num">{{ i + 1 }}</text>
						<text class="detail-result" :class="{ correct: d.isCorrect, wrong: !d.isCorrect }">
							{{ d.isCorrect ? '✓ 正确' : '✗ 错误' }}
						</text>
						<text class="detail-kp">{{ d.knowledgePoint }}</text>
					</view>
				</view>

				<text class="result-hint">画像已更新，快去看看吧～</text>
			</view>

			<view class="btn-primary result-btn" @click="goHome">回到首页</view>
		</view>
	</view>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import { generateAssessment, getAssessmentQuestions, submitAssessment, getProfile } from '@/api/index'

const loading = ref(true)
const submitted = ref(false)
const questions = ref([])
const currentIndex = ref(0)
const answers = ref({}) // { questionId: "A" }
const result = ref(null)
const assessmentId = ref(null)

const optionLetters = ['A', 'B', 'C', 'D', 'E', 'F']

const currentQuestion = computed(() => {
	if (questions.value.length === 0) return null
	const q = questions.value[currentIndex.value]
	// 解析 content JSON
	try {
		const content = typeof q.content === 'string' ? JSON.parse(q.content) : q.content
		return {
			stem: content.stem,
			options: content.options || [],
			knowledgePoint: q.knowledgePoint || ''
		}
	} catch (e) {
		return null
	}
})

const selectedOption = computed(() => {
	const q = questions.value[currentIndex.value]
	if (!q) return null
	return answers.value[q.id] || null
})

const progressPct = computed(() => {
	if (questions.value.length === 0) return 0
	return Math.round(((currentIndex.value + 1) / questions.value.length) * 100)
})

onMounted(async () => {
	await loadAssessment()
})

async function loadAssessment() {
	loading.value = true
	try {
		// 先尝试生成（如果已有未完成的会直接返回）
		let res = await generateAssessment()
		if (res.code === 0 && res.data) {
			assessmentId.value = res.data.assessmentId
			// 如果已完成
			if (res.data.status === 'completed') {
				// 已完成，直接显示结果
				questions.value = res.data.questions || []
				result.value = {
					score: res.data.score,
					correctCount: res.data.correctCount,
					totalCount: res.data.totalCount,
					details: []
				}
				submitted.value = true
				loading.value = false
				return
			}
			// 有题目直接用
			if (res.data.questions && res.data.questions.length > 0) {
				questions.value = res.data.questions
				loading.value = false
				return
			}
		} else {
			// 业务异常（如未设置年级 1003）：把后端 message 直接展示
			uni.showToast({ title: res.message || '加载失败', icon: 'none', duration: 2500 })
			console.warn('[assessment] 生成失败:', res)
			loading.value = false
			return
		}
		// 没有题目，调获取题目接口
		if (assessmentId.value) {
			res = await getAssessmentQuestions(assessmentId.value)
			if (res.code === 0 && res.data) {
				questions.value = res.data.questions || []
			} else {
				uni.showToast({ title: res.message || '加载题目失败', icon: 'none' })
			}
		}
	} catch (e) {
		// 解析后端 1003 等业务异常体（uni.request 在 fail 钩子外抛出的对象可能含 data）
		const msg = e?.data?.message || e?.message || '加载失败'
		uni.showToast({ title: msg, icon: 'none', duration: 2500 })
		console.error('加载测试失败:', e)
	}
	loading.value = false
}

function selectOption(letter) {
	const q = questions.value[currentIndex.value]
	if (q) {
		answers.value[q.id] = letter
	}
}

function nextQuestion() {
	if (!selectedOption.value) return
	if (currentIndex.value < questions.value.length - 1) {
		currentIndex.value++
	}
}

function prevQuestion() {
	if (currentIndex.value > 0) {
		currentIndex.value--
	}
}

async function submitTest() {
	if (!selectedOption.value) return
	uni.showLoading({ title: '批改中...' })
	try {
		const res = await submitAssessment(assessmentId.value, answers.value)
		if (res.code === 0 && res.data) {
			result.value = res.data
			submitted.value = true
			// 提交后更新摸底状态缓存
			uni.setStorageSync('cachedAssessmentStatus', 'completed')
			// 异步刷新画像缓存（后端可能修正了画像）
			refreshProfileCache()
		} else {
			uni.showToast({ title: res.message || '提交失败', icon: 'none' })
		}
	} catch (e) {
		uni.showToast({ title: '提交失败', icon: 'none' })
		console.error('提交测试失败:', e)
	}
	uni.hideLoading()
}

// 异步刷新画像缓存（不阻塞 UI）
async function refreshProfileCache() {
	try {
		const user = uni.getStorageSync('user')
		const sid = user?.id
		if (!sid) return
		const res = await getProfile(sid)
		if (res && res.code === 0 && res.data) {
			uni.setStorageSync('cachedProfile', res.data)
			if (res.data.aiSummary) {
				uni.setStorageSync('aiSummary', res.data.aiSummary)
			}
		}
	} catch (e) {
		console.error('[assessment] 刷新画像缓存失败', e)
	}
}

function goHome() {
	uni.switchTab({ url: '/pages/index/index' })
}
</script>

<style>
.assessment-page {
	min-height: 100vh;
	background: #f7f8fa;
	padding-top: 0;
}

/* 顶部栏 */
.top-bar {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	height: 88rpx;
	background: #ffffff;
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 0 32rpx;
	padding-top: env(safe-area-inset-top);
	z-index: 100;
	box-shadow: 0 2rpx 8rpx rgba(0, 0, 0, 0.04);
}

.home-icon {
	width: 44rpx;
	height: 44rpx;
}

.top-title {
	font-size: 32rpx;
	font-weight: 600;
	color: #1f2937;
}

.top-progress {
	font-size: 26rpx;
	color: #f0a000;
	font-weight: 600;
}

/* 加载 */
.loading-wrap {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 60vh;
}

.loading-text {
	font-size: 30rpx;
	color: #9ca3af;
}

/* 测验 */
.quiz-wrap {
	padding: 120rpx 32rpx 160rpx;
}

.progress-bar {
	height: 8rpx;
	background: #e5e7eb;
	border-radius: 4rpx;
	overflow: hidden;
	margin-bottom: 32rpx;
}

.progress-fill {
	height: 100%;
	background: linear-gradient(90deg, #ffc64d, #f0a000);
	border-radius: 4rpx;
	transition: width 0.3s;
}

/* 题目卡 */
.question-card {
	background: #ffffff;
	border-radius: 28rpx;
	padding: 40rpx 32rpx;
	box-shadow: 0 2rpx 12rpx rgba(31, 41, 55, 0.04);
}

.q-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 24rpx;
}

.q-num {
	font-size: 26rpx;
	color: #f0a000;
	font-weight: 600;
}

.q-tag {
	font-size: 22rpx;
	color: #6b7280;
	background: #f3f4f6;
	padding: 6rpx 20rpx;
	border-radius: 999rpx;
}

.q-stem {
	display: block;
	font-size: 32rpx;
	line-height: 1.7;
	color: #1f2937;
	margin-bottom: 36rpx;
}

/* 选项 */
.options {
	display: flex;
	flex-direction: column;
	gap: 20rpx;
}

.option {
	display: flex;
	align-items: center;
	gap: 20rpx;
	padding: 28rpx 24rpx;
	background: #f9fafb;
	border-radius: 20rpx;
	border: 3rpx solid transparent;
	transition: all 0.2s;
}

.option.selected {
	background: #fff4dc;
	border-color: #f0a000;
}

.option-letter {
	width: 56rpx;
	height: 56rpx;
	border-radius: 50%;
	background: #e5e7eb;
	color: #6b7280;
	font-size: 28rpx;
	font-weight: 600;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-shrink: 0;
}

.option.selected .option-letter {
	background: #f0a000;
	color: #ffffff;
}

.option-text {
	font-size: 30rpx;
	color: #1f2937;
	flex: 1;
}

/* 底部按钮 */
.bottom-bar {
	position: fixed;
	bottom: 0;
	left: 0;
	right: 0;
	display: flex;
	gap: 24rpx;
	padding: 24rpx 32rpx calc(24rpx + env(safe-area-inset-bottom));
	background: #ffffff;
	box-shadow: 0 -2rpx 12rpx rgba(0, 0, 0, 0.04);
}

.btn-primary {
	flex: 1;
	background: linear-gradient(135deg, #f0a000, #ffc64d);
	color: #ffffff;
	font-size: 32rpx;
	font-weight: 600;
	text-align: center;
	padding: 24rpx 0;
	border-radius: 999rpx;
}

.btn-primary.disabled {
	opacity: 0.4;
}

.btn-secondary {
	flex: 1;
	background: #f3f4f6;
	color: #6b7280;
	font-size: 32rpx;
	text-align: center;
	padding: 24rpx 0;
	border-radius: 999rpx;
}

/* 结果页 */
.result-wrap {
	padding: 120rpx 32rpx 60rpx;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.result-card {
	background: #ffffff;
	border-radius: 32rpx;
	padding: 48rpx 36rpx;
	width: 100%;
	box-sizing: border-box;
	box-shadow: 0 4rpx 20rpx rgba(31, 41, 55, 0.06);
	display: flex;
	flex-direction: column;
	align-items: center;
}

.result-logo {
	width: 120rpx;
	height: 120rpx;
	margin-bottom: 20rpx;
}

.result-title {
	font-size: 36rpx;
	font-weight: 700;
	color: #1f2937;
	margin-bottom: 24rpx;
}

.result-score {
	display: flex;
	align-items: baseline;
	gap: 8rpx;
	margin-bottom: 12rpx;
}

.score-num {
	font-size: 80rpx;
	font-weight: 800;
	color: #f0a000;
}

.score-unit {
	font-size: 32rpx;
	color: #f0a000;
}

.result-detail {
	font-size: 28rpx;
	color: #6b7280;
	margin-bottom: 32rpx;
}

.answer-details {
	width: 100%;
	display: flex;
	flex-direction: column;
	gap: 16rpx;
	margin-bottom: 24rpx;
}

.detail-item {
	display: flex;
	align-items: center;
	gap: 20rpx;
	padding: 16rpx 0;
	border-bottom: 2rpx solid #f3f4f6;
}

.detail-num {
	width: 48rpx;
	height: 48rpx;
	border-radius: 50%;
	background: #f3f4f6;
	font-size: 24rpx;
	color: #6b7280;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-shrink: 0;
}

.detail-result {
	font-size: 26rpx;
	font-weight: 600;
	width: 140rpx;
}

.detail-result.correct {
	color: #10b981;
}

.detail-result.wrong {
	color: #ef4444;
}

.detail-kp {
	font-size: 24rpx;
	color: #9ca3af;
	flex: 1;
}

.result-hint {
	font-size: 26rpx;
	color: #f0a000;
	margin-top: 12rpx;
}

.result-btn {
	margin-top: 40rpx;
	width: 100%;
}
</style>

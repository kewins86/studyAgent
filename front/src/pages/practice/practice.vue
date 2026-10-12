<template>
	<view class="practice-page">
		<!-- 顶部栏 -->
		<view class="nav-bar">
			<view class="nav-left" @click="goBack">
				<text class="nav-back">‹</text>
			</view>
			<text class="nav-title">智能练习</text>
			<view class="nav-right"></view>
		</view>

		<!-- 开始面板 -->
		<view v-if="phase === 'start'" class="start-panel">
			<view class="card">
				<text class="card-title">选择练习内容</text>
				<view class="field">
					<text class="field-label">学科</text>
					<view class="seg">
						<view v-for="s in subjects" :key="s" class="seg-item" :class="{ active: form.subject === s }" @click="form.subject = s">{{ s }}</view>
					</view>
				</view>
				<view class="field">
					<text class="field-label">题量</text>
					<view class="seg">
						<view v-for="c in counts" :key="c" class="seg-item" :class="{ active: form.count === c }" @click="form.count = c">{{ c }} 题</view>
					</view>
				</view>
				<button class="primary-btn" @click="startPractice">开始练习</button>
			</view>
			<text class="tip">题目来自人工预置题库（三年级·沪教版），做完自动批改并记入掌握度</text>
		</view>

		<!-- 答题面板 -->
		<view v-else-if="phase === 'doing'" class="doing-panel">
			<view class="progress-bar">
				<text class="progress-text">第 {{ currentIndex + 1 }} / {{ questions.length }} 题</text>
				<view class="progress-track"><view class="progress-fill" :style="{ width: (currentIndex / questions.length * 100) + '%' }"></view></view>
			</view>

			<scroll-view scroll-y class="q-scroll">
				<view v-for="(q, i) in displayQuestions" :key="q.id" class="q-card">
					<text class="q-no">Q{{ i + 1 }}</text>
					<text class="q-stem">{{ q.stem }}</text>

					<!-- 题目图片 -->
					<view v-if="q.images && q.images.length" class="q-images">
						<image v-for="(img, idx) in q.images" :key="idx" :src="IMG_BASE + img" mode="widthFix" class="q-image" />
					</view>

					<!-- 选择题 -->
					<view v-if="q.options && q.options.length" class="options">
						<view v-for="opt in q.options" :key="opt" class="option"
							:class="{ chosen: answers[q.id] === optLetter(opt) }"
							@click="answers[q.id] = optLetter(opt)">
							<text class="opt-letter">{{ optLetter(opt) }}</text>
							<text class="opt-text">{{ optText(opt) }}</text>
						</view>
					</view>

					<!-- 填空/计算题 -->
					<view v-else class="fill">
						<input class="fill-input" v-model="answers[q.id]" placeholder="输入你的答案" placeholder-class="ph" />
					</view>
				</view>
			</scroll-view>

			<button class="primary-btn submit-btn" @click="handleSubmit">提交批改</button>
		</view>

		<!-- 结果面板 -->
		<view v-else-if="phase === 'result'" class="result-panel">
			<view class="score-card">
				<text class="score-num">{{ result.correctCount }}/{{ result.total }}</text>
				<text class="score-label">答对题数</text>
			</view>
			<scroll-view scroll-y class="r-scroll">
				<view v-for="(r, i) in result.results" :key="r.questionId" class="r-card" :class="r.correct ? 'ok' : 'no'">
					<view class="r-head">
						<text class="r-no">Q{{ i + 1 }}</text>
						<text class="r-tag">{{ r.correct ? '✓ 答对' : '✗ 答错' }}</text>
					</view>
					<text class="r-stem">{{ stemOf(r.content) }}</text>
					<text class="r-line">你的答案：{{ r.myAnswer || '（空）' }}</text>
					<text class="r-line right">正确答案：{{ r.rightAnswer }}</text>
					<text class="r-analysis">💡 {{ r.analysis }}</text>
				</view>
			</scroll-view>
			<view class="btn-row">
				<button class="primary-btn" @click="restart">再来一组</button>
				<button class="secondary-btn" @click="goHome">返回首页</button>
			</view>
		</view>

	</view>
</template>

<script setup>
import { ref, reactive } from 'vue'
import { generatePractice, submitPractice } from '@/api/index'

// 图片服务地址（H5 dev 由 vite proxy 转 /paper_png/** 到后端；线上部署同源可直接用）
const IMG_BASE = '/'

const subjects = ['数学', '语文', '英语']
const counts = [5, 8, 10]

const form = reactive({ subject: '数学', count: 5 })

const phase = ref('start') // start | doing | result
const questions = ref([])
const displayQuestions = ref([])
const answers = reactive({}) // questionId -> 答案（选择存字母，填空存文本）
const currentIndex = ref(0)
const result = ref({ results: [], correctCount: 0, total: 0 })

function goBack() {
	uni.navigateBack({ delta: 1 })
}

function optLetter(opt) {
	// "A. xxx" -> "A"
	return opt.split('.')[0].trim()
}
function optText(opt) {
	const idx = opt.indexOf('.')
	return idx >= 0 ? opt.slice(idx + 1).trim() : opt
}
function stemOf(content) {
	if (!content) return ''
	try {
		const o = JSON.parse(content)
		return o.stem || content
	} catch (e) {
		return content
	}
}

async function startPractice() {
	try {
		uni.showLoading({ title: '出题中', mask: true })
		const res = await generatePractice(form.subject, '三年级', form.count)
		uni.hideLoading()
		if (res.code === 0 && res.data && res.data.length) {
			// 解析 content，剥离答案
			questions.value = res.data.map(q => {
				let parsed = {}
				try { parsed = JSON.parse(q.content) } catch (e) {}
				let imgs = []
				try { imgs = q.images ? JSON.parse(q.images) : [] } catch (e) {}
				return {
					id: q.id,
					stem: parsed.stem || q.content,
					options: parsed.options || [],
					images: imgs
				}
			})
			displayQuestions.value = questions.value
			Object.keys(answers).forEach(k => delete answers[k])
			currentIndex.value = 0
			phase.value = 'doing'
		} else {
			uni.showToast({ title: '暂无题目，换学科试试', icon: 'none' })
		}
	} catch (e) {
		uni.hideLoading()
		uni.showToast({ title: '出题失败', icon: 'none' })
	}
}

async function handleSubmit() {
	// 校验是否全部作答
	const unanswered = questions.value.filter(q => !answers[q.id])
	if (unanswered.length) {
		uni.showToast({ title: `还有 ${unanswered.length} 题未作答`, icon: 'none' })
		return
	}
	const items = questions.value.map(q => ({ questionId: q.id, myAnswer: String(answers[q.id]) }))
	try {
		uni.showLoading({ title: '批改中', mask: true })
		const res = await submitPractice(items)
		uni.hideLoading()
		if (res.code === 0 && res.data) {
			result.value = res.data
			phase.value = 'result'
		} else {
			uni.showToast({ title: '批改失败', icon: 'none' })
		}
	} catch (e) {
		uni.hideLoading()
		uni.showToast({ title: '批改失败', icon: 'none' })
	}
}

function restart() {
	phase.value = 'start'
}

function goHome() {
	uni.switchTab({ url: '/pages/index/index' })
}
</script>

<style>
.practice-page {
	min-height: 100vh;
	background: #f7f8fa;
	box-sizing: border-box;
}

.nav-bar {
	padding: calc(20rpx + env(safe-area-inset-top)) 32rpx 20rpx;
	background: #ffffff;
	display: flex;
	align-items: center;
	justify-content: space-between;
}
.nav-left, .nav-right {
	width: 60rpx;
	display: flex;
	align-items: center;
}
.nav-back {
	font-size: 44rpx;
	color: #1f2937;
	line-height: 1;
}
.nav-title {
	font-size: 34rpx;
	font-weight: 700;
	color: #1f2937;
	text-align: center;
}

/* 开始面板 */
.start-panel {
	padding: 40rpx 32rpx calc(40rpx + env(safe-area-inset-bottom));
	display: flex;
	flex-direction: column;
	align-items: center;
}
.card {
	width: 100%;
	background: #ffffff;
	border-radius: 28rpx;
	padding: 36rpx 32rpx;
	box-shadow: 0 2rpx 12rpx rgba(31, 41, 55, 0.04);
}
.card-title {
	font-size: 30rpx;
	font-weight: 600;
	color: #1f2937;
	display: block;
	margin-bottom: 28rpx;
}
.field {
	margin-bottom: 28rpx;
}
.field-label {
	font-size: 26rpx;
	color: #6b7280;
	display: block;
	margin-bottom: 14rpx;
}
.seg {
	display: flex;
	gap: 16rpx;
	flex-wrap: wrap;
}
.seg-item {
	padding: 14rpx 32rpx;
	border-radius: 999rpx;
	background: #f3f4f6;
	color: #6b7280;
	font-size: 26rpx;
	border: 2rpx solid transparent;
}
.seg-item.active {
	background: #fff4dc;
	color: #f0a000;
	border-color: #f0a000;
	font-weight: 600;
}
.tip {
	font-size: 22rpx;
	color: #9ca3af;
	margin-top: 28rpx;
	text-align: center;
	line-height: 1.6;
}

.primary-btn {
	margin-top: 32rpx;
	background: linear-gradient(135deg, #f0a000, #ffc64d);
	color: #ffffff;
	font-size: 30rpx;
	font-weight: 600;
	border-radius: 999rpx;
	padding: 24rpx 0;
	width: 100%;
	border: none;
}

/* 答题面板 */
.doing-panel {
	padding: 24rpx 32rpx calc(40rpx + env(safe-area-inset-bottom));
}
.progress-bar {
	margin-bottom: 20rpx;
}
.progress-text {
	font-size: 24rpx;
	color: #6b7280;
}
.progress-track {
	margin-top: 10rpx;
	height: 10rpx;
	background: #eef0f3;
	border-radius: 999rpx;
	overflow: hidden;
}
.progress-fill {
	height: 100%;
	background: #f0a000;
	border-radius: 999rpx;
	transition: width 0.3s;
}
.q-scroll {
	max-height: calc(100vh - 320rpx);
}
.q-card {
	background: #ffffff;
	border-radius: 24rpx;
	padding: 28rpx;
	margin-bottom: 20rpx;
}
.q-no {
	font-size: 24rpx;
	font-weight: 700;
	color: #f0a000;
}
.q-stem {
	display: block;
	font-size: 30rpx;
	color: #1f2937;
	line-height: 1.6;
	margin: 12rpx 0 20rpx;
}
.q-images {
	display: flex;
	flex-direction: column;
	gap: 12rpx;
	margin: 0 0 20rpx;
}
.q-image {
	width: 100%;
	border-radius: 12rpx;
}
.options {
	display: flex;
	flex-direction: column;
	gap: 14rpx;
}
.option {
	display: flex;
	align-items: center;
	padding: 20rpx 24rpx;
	border-radius: 16rpx;
	background: #f7f8fa;
	border: 2rpx solid #eef0f3;
}
.option.chosen {
	background: #fff4dc;
	border-color: #f0a000;
}
.opt-letter {
	width: 44rpx;
	height: 44rpx;
	line-height: 44rpx;
	text-align: center;
	border-radius: 50%;
	background: #e3e7ee;
	color: #6b7280;
	font-size: 24rpx;
	font-weight: 600;
	margin-right: 18rpx;
	flex-shrink: 0;
}
.option.chosen .opt-letter {
	background: #f0a000;
	color: #fff;
}
.opt-text {
	font-size: 28rpx;
	color: #1f2937;
}
.fill-input {
	background: #f7f8fa;
	border: 2rpx solid #eef0f3;
	border-radius: 16rpx;
	padding: 22rpx 24rpx;
	font-size: 28rpx;
	color: #1f2937;
}
.ph {
	color: #b8bec9;
}
.submit-btn {
	position: fixed;
	left: 32rpx;
	right: 32rpx;
	bottom: calc(112rpx + env(safe-area-inset-bottom));
	width: auto;
	z-index: 60;
}

/* 结果面板 */
.result-panel {
	padding: 24rpx 32rpx calc(200rpx + env(safe-area-inset-bottom));
}
.score-card {
	background: linear-gradient(135deg, #f0a000, #ffc64d);
	border-radius: 28rpx;
	padding: 40rpx;
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-bottom: 24rpx;
}
.score-num {
	font-size: 64rpx;
	font-weight: 800;
	color: #ffffff;
}
.score-label {
	font-size: 24rpx;
	color: rgba(255, 255, 255, 0.9);
	margin-top: 6rpx;
}
.r-scroll {
	max-height: calc(100vh - 460rpx);
}
.r-card {
	background: #ffffff;
	border-radius: 24rpx;
	padding: 26rpx;
	margin-bottom: 18rpx;
	border-left: 8rpx solid #e3e7ee;
}
.r-card.ok {
	border-left-color: #22a55e;
}
.r-card.no {
	border-left-color: #e8960c;
}
.r-head {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 12rpx;
}
.r-no {
	font-size: 26rpx;
	font-weight: 700;
	color: #1f2937;
}
.r-tag {
	font-size: 22rpx;
	padding: 4rpx 16rpx;
	border-radius: 999rpx;
}
.r-card.ok .r-tag {
	background: #e6f7ec;
	color: #22a55e;
}
.r-card.no .r-tag {
	background: #fef3e2;
	color: #e8960c;
}
.r-stem {
	display: block;
	font-size: 28rpx;
	color: #1f2937;
	line-height: 1.6;
	margin-bottom: 12rpx;
}
.r-line {
	display: block;
	font-size: 24rpx;
	color: #6b7280;
	margin-top: 6rpx;
}
.r-line.right {
	color: #22a55e;
}
.r-analysis {
	display: block;
	font-size: 24rpx;
	color: #9ca3af;
	margin-top: 10rpx;
	line-height: 1.6;
}

/* 结果页按钮行 */
.btn-row {
	display: flex;
	gap: 20rpx;
	margin-top: 32rpx;
}
.btn-row .primary-btn,
.btn-row .secondary-btn {
	flex: 1;
	margin-top: 0;
}
.secondary-btn {
	background: #ffffff;
	color: #f0a000;
	border: 2rpx solid #f0a000;
	font-size: 30rpx;
	font-weight: 600;
	border-radius: 999rpx;
	padding: 24rpx 0;
}
</style>

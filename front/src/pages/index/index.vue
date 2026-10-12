<template>
	<view class="home-page">
		<!-- 顶部问候 -->
		<view class="greet">
			<view class="greet-text">
				<text class="greet-hi">{{ greetText }}，{{ nickname }}</text>
				<text class="greet-sub">{{ todayText }} · 今天也要加油哦 ！</text>
			</view>
			<image class="greet-avatar-img" src="/static/logo-deer.png" mode="aspectFit" @click="goProfile" />
		</view>

		<!-- 今日进度环 -->
		<view class="ring-card">
			<view class="ring-wrap">
				<canvas canvas-id="ringCanvas" id="ringCanvas" class="ring-canvas"></canvas>
				<view class="ring-center">
					<text class="ring-pct">{{ todayProgress }}%</text>
					<text class="ring-label">今日进度</text>
				</view>
			</view>
			<view class="ring-stats">
				<view class="stat">
					<text class="stat-num">{{ todayStats.done }}</text>
					<text class="stat-label">完成题目</text>
				</view>
				<view class="stat-divider"></view>
				<view class="stat">
					<text class="stat-num">{{ todayStats.accuracy }}%</text>
					<text class="stat-label">正确率</text>
				</view>
				<view class="stat-divider"></view>
				<view class="stat">
					<text class="stat-num">{{ todayStats.minutes }}</text>
					<text class="stat-label">学习分钟</text>
				</view>
			</view>
		</view>

		<!-- 摸底测试入口（仅未完成时显示） -->
		<view v-if="showAssessmentEntry" class="assessment-entry" @click="goAssessment">
			<view class="assessment-left">
				<image class="assessment-icon-img" src="/static/task-assessment.png" mode="aspectFit" />
				<view class="assessment-text">
					<text class="assessment-title">摸底小测</text>
					<text class="assessment-desc">5 道数学题，测一测孩子的掌握情况</text>
				</view>
			</view>
			<text class="assessment-arrow">›</text>
		</view>

		<!-- 今日任务：学 → 练 → 错题 -->
		<view class="section">
			<view class="section-head">
				<text class="section-title">今日任务</text>
				<text class="section-more" @click="goPractice">去练习 →</text>
			</view>
			<view class="task-flow">
				<view v-for="(task, i) in tasks" :key="task.key" class="task-step" :class="task.status" @click="onTaskTap(task)">
					<view class="task-dot">
						<image class="task-icon-img" :src="task.iconImg" mode="aspectFit" />
						<view v-if="i < tasks.length - 1" class="task-line" :class="task.status"></view>
					</view>
					<text class="task-name">{{ task.name }}</text>
					<text class="task-state">{{ task.stateText }}</text>
				</view>
			</view>
		</view>

		<!-- 今日任务详情卡（当前步骤） -->
		<view class="task-detail" :class="currentTask.status">
			<view class="detail-left">
				<text class="detail-step">{{ currentTask.stepText }}</text>
				<text class="detail-title">{{ currentTask.title }}</text>
				<text class="detail-desc">{{ currentTask.desc }}</text>
			</view>
			<view class="detail-btn" @click="onTaskTap(currentTask)">{{ currentTask.btnText }}</view>
		</view>

		<!-- 快捷入口 -->
		<view class="quick-grid">
			<view class="quick-item" @click="goHomework">
				<image class="quick-icon-img" src="/static/quick-homework.png" mode="aspectFit" />
				<text class="quick-name">今日家作</text>
				<text class="quick-sub" :class="{'hw-sub-active': hwPending > 0}">{{ hwPending > 0 ? hwPending + '项待完成' : '已完成' }}</text>
			</view>
			<view class="quick-item" @click="goHomeworkCheck">
				<image class="quick-icon-img" src="/static/quick-homework-check.png" mode="aspectFit" />
				<text class="quick-name">家作检查</text>
				<text class="quick-sub">家长查看</text>
			</view>
			<view class="quick-item" @click="goChat">
				<image class="quick-icon-img" src="/static/quick-chat.png" mode="aspectFit" />
				<view class="quick-name-row">
					<text class="quick-name-text">问</text>
					<image src="/static/logo-text.png" mode="aspectFit" class="quick-logo" />
				</view>
				<text class="quick-sub">AI 对话辅导</text>
			</view>
			<view class="quick-item" @click="goMistakes">
				<image class="quick-icon-img" src="/static/quick-mistakes.png" mode="aspectFit" />
				<text class="quick-name">错题本</text>
				<text class="quick-sub">举一反三</text>
			</view>
			<view class="quick-item" @click="goAiProfile">
				<image class="quick-icon-img" src="/static/quick-ai-profile.png" mode="aspectFit" />
				<text class="quick-name">学习画像</text>
				<text class="quick-sub">了解孩子</text>
			</view>
			<view class="quick-item" @click="goProfile">
				<image class="quick-icon-img" src="/static/quick-stats.png" mode="aspectFit" />
				<text class="quick-name">学习统计</text>
				<text class="quick-sub">掌握情况</text>
			</view>
		</view>
	</view>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import { onShow } from '@dcloudio/uni-app'
import { useUserStore } from '@/stores/user'
import { getAssessmentStatus, getTodayStats, getMistakeStats, getTodayHomework } from '@/api/index'

const userStore = useUserStore()
const nickname = computed(() => userStore.name || '同学')

// ========== 摸底测试状态 ==========
const assessmentStatus = ref('none')

async function loadAssessmentStatus() {
	// 优先读缓存
	const cached = uni.getStorageSync('cachedAssessmentStatus')
	if (cached) {
		assessmentStatus.value = cached
		return
	}
	// 缓存不存在时才调接口
	try {
		const res = await getAssessmentStatus()
		if (res.code === 0 && res.data) {
			assessmentStatus.value = res.data.status || 'none'
			uni.setStorageSync('cachedAssessmentStatus', res.data.status || 'none')
		}
	} catch (e) {
		console.log('获取测试状态失败')
	}
}

const showAssessmentEntry = computed(() => {
	return assessmentStatus.value === 'none' || assessmentStatus.value === 'pending' || assessmentStatus.value === 'in_progress'
})

function goAssessment() {
	uni.navigateTo({ url: '/pages/assessment/assessment' })
}

// ========== 今日数据（接后端 /api/today） ==========
const todayStats = ref({ done: 0, accuracy: 100, minutes: 0, todayMistakes: 0 })
const hwPending = ref(0)
const todayProgress = computed(() => {
	const t = todayStats.value
	// 完成率 = 完成题数 / (完成题数 + 待订正错题) * 100
	const total = t.done + (t.todayMistakes || 0)
	return total === 0 ? 0 : Math.round(t.done / total * 100)
})

const tasks = ref([
	{ key: 'learn', iconImg: '/static/task-learn.png', name: '学', stateText: '已完成', status: 'done',
		stepText: '第 1 步', title: '知识点微课', desc: '两步四则运算 · 混合运算顺序', btnText: '再学一遍' },
	{ key: 'practice', iconImg: '/static/task-practice.png', name: '练', stateText: '进行中', status: 'active',
		stepText: '第 2 步', title: '巩固练习', desc: '4 道题，做完提交自动批改', btnText: '开始练习' },
	{ key: 'mistake', iconImg: '/static/task-mistake.png', name: '错题', stateText: '待开始', status: 'todo',
		stepText: '第 3 步', title: '错题订正', desc: '2 道错题待订正，举一反三', btnText: '去订正' }
])
const currentTask = computed(() => tasks.value.find(t => t.status === 'active') || tasks.value[0])

const greetText = computed(() => {
	const h = new Date().getHours()
	if (h < 6) return '夜深了'
	if (h < 12) return '早上好'
	if (h < 14) return '中午好'
	if (h < 18) return '下午好'
	return '晚上好'
})
const todayText = computed(() => {
	const d = new Date()
	const week = ['日', '一', '二', '三', '四', '五', '六'][d.getDay()]
	return `${d.getMonth() + 1}月${d.getDate()}日 周${week}`
})

// ========== 进度环（canvas 双端兼容） ==========
function drawRing() {
	const ctx = uni.createCanvasContext('ringCanvas')
	const size = 200 // rpx 画布逻辑尺寸，用 px 画（canvas 尺寸 180x180px）
	const cx = 90, cy = 90, r = 74, lineW = 14
	const pct = todayProgress.value / 100

	// 背景环
	ctx.setLineWidth(lineW)
	ctx.setStrokeStyle('#eef0f3')
	ctx.setLineCap('round')
	ctx.beginPath()
	ctx.arc(cx, cy, r, 0, Math.PI * 2)
	ctx.stroke()

	// 进度弧
	const start = -Math.PI / 2
	const end = start + Math.PI * 2 * pct
	ctx.setStrokeStyle('#f0a000')
	ctx.beginPath()
	ctx.arc(cx, cy, r, start, end)
	ctx.stroke()

	ctx.draw()
}

onMounted(() => {
	setTimeout(drawRing, 300)
})

async function loadTodayStats() {
	try {
		const res = await getTodayStats()
		if (res.code === 0 && res.data) {
			todayStats.value = res.data
		}
	} catch (e) {
		console.log('获取今日统计失败')
	}
}

// ========== 每日任务动态数据 ==========
const mistakeCount = ref(0)
async function loadMistakeCount() {
	try {
		const res = await getMistakeStats()
		if (res.code === 0 && res.data) {
			mistakeCount.value = res.data.pending || 0
			// 动态更新错题任务描述
			const mistakeTask = tasks.value.find(t => t.key === 'mistake')
			if (mistakeTask) {
				mistakeTask.desc = mistakeCount.value > 0 ? `${mistakeCount.value} 道错题待订正，举一反三` : '暂无错题，继续保持！'
				mistakeTask.status = mistakeCount.value > 0 ? 'active' : 'done'
				mistakeTask.stateText = mistakeCount.value > 0 ? '待订正' : '已完成'
			}
		}
	} catch (e) {
		console.log('获取错题统计失败')
	}
}

async function loadHwPending() {
	try {
		const res = await getTodayHomework()
		if (res.code === 0 && res.data) {
			const items = res.data.items || []
			hwPending.value = items.filter(i => i.status === 'pending').length
		}
	} catch (e) {
		console.log('loadHwPending err', e)
	}
}

onShow(() => {
	loadAssessmentStatus()
	loadTodayStats()
	loadMistakeCount()
	loadHwPending()
})

// ========== 导航 ==========
function goChat() { uni.switchTab({ url: '/pages/chat/chat' }) }
function goMistakes() { uni.switchTab({ url: '/pages/mistakes/mistakes' }) }
function goPractice() { uni.navigateTo({ url: '/pages/practice/practice' }) }
function goProfile() { uni.switchTab({ url: '/pages/profile/profile' }) }
function goAiProfile() { uni.navigateTo({ url: '/pages/ai-profile/ai-profile' }) }
function goHomework() { uni.navigateTo({ url: '/pages/homework/homework' }) }
function goHomeworkCheck() { uni.navigateTo({ url: '/pages/homework-check/homework-check' }) }

function onTaskTap(task) {
	// 练 → 跳练习页；其余（学/测/错题）→ 跳对话或错题本
	if (task.key === 'practice') {
		uni.navigateTo({ url: '/pages/practice/practice' })
	} else if (task.key === 'mistake') {
		goMistakes()
	} else {
		goChat()
	}
}
</script>

<style>
.home-page {
	min-height: 100vh;
	background: #f7f8fa;
	padding: 24rpx 32rpx calc(40rpx + env(safe-area-inset-bottom));
	box-sizing: border-box;
}

/* 摸底测试入口 */
.assessment-entry {
	background: linear-gradient(135deg, #fff4dc, #ffe8b8);
	border-radius: 24rpx;
	padding: 28rpx 32rpx;
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 24rpx;
	box-shadow: 0 4rpx 16rpx rgba(240, 160, 0, 0.12);
}

.assessment-left {
	display: flex;
	align-items: center;
	gap: 20rpx;
}

.assessment-icon-img {
	width: 64rpx;
	height: 64rpx;
	flex-shrink: 0;
}

.assessment-text {
	display: flex;
	flex-direction: column;
}

.assessment-title {
	font-size: 30rpx;
	font-weight: 600;
	color: #1f2937;
}

.assessment-desc {
	font-size: 22rpx;
	color: #92400e;
	margin-top: 4rpx;
}

.assessment-arrow {
	font-size: 40rpx;
	color: #f0a000;
}

/* 问候 */
.greet {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 24rpx;
}

.greet-hi {
	display: block;
	font-size: 40rpx;
	font-weight: 700;
	color: #1f2937;
}

.greet-sub {
	display: block;
	font-size: 24rpx;
	color: #6b7280;
	margin-top: 6rpx;
}

.greet-avatar-img {
	width: 88rpx;
	height: 88rpx;
}

/* 进度环卡 */
.ring-card {
	background: #ffffff;
	border-radius: 28rpx;
	padding: 32rpx;
	display: flex;
	align-items: center;
	gap: 36rpx;
	box-shadow: 0 2rpx 12rpx rgba(31, 41, 55, 0.04);
	margin-bottom: 28rpx;
}

.ring-wrap {
	position: relative;
	width: 180rpx;
	height: 180rpx;
	flex-shrink: 0;
}

.ring-canvas {
	width: 180rpx;
	height: 180rpx;
}

.ring-center {
	position: absolute;
	top: 0;
	left: 0;
	width: 180rpx;
	height: 180rpx;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.ring-pct {
	font-size: 44rpx;
	font-weight: 700;
	color: #1f2937;
}

.ring-label {
	font-size: 22rpx;
	color: #9ca3af;
	margin-top: 4rpx;
}

.ring-stats {
	flex: 1;
	display: flex;
	align-items: center;
	justify-content: space-around;
}

.stat {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.stat-num {
	font-size: 36rpx;
	font-weight: 700;
	color: #1f2937;
}

.stat-label {
	font-size: 22rpx;
	color: #9ca3af;
	margin-top: 6rpx;
}

.stat-divider {
	width: 2rpx;
	height: 56rpx;
	background: #eef0f3;
}

/* 任务流程 */
.section {
	margin-bottom: 24rpx;
}

.section-head {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20rpx;
}

.section-title {
	font-size: 32rpx;
	font-weight: 600;
	color: #1f2937;
}

.section-more {
	font-size: 24rpx;
	color: #f0a000;
}

.task-flow {
	display: flex;
	justify-content: space-between;
}

.task-step {
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 25%;
	position: relative;
}

.task-dot {
	position: relative;
	width: 88rpx;
	height: 88rpx;
	display: flex;
	align-items: center;
	justify-content: center;
	margin-bottom: 12rpx;
	z-index: 1;
}

.task-step.done .task-dot {
}

.task-step.active .task-dot {
}

.task-icon {
	font-size: 38rpx;
}

.task-icon-img {
	border-radius: 50%;
	overflow: hidden;
}

.task-line {
	position: absolute;
	top: 50%;
	left: 100%;
	width: 60rpx;
	height: 4rpx;
	background: #e3e7ee;
	z-index: 0;
}

.task-step.done .task-line {
	background: #f0a000;
}

.task-name {
	font-size: 26rpx;
	font-weight: 600;
	color: #1f2937;
}

.task-state {
	font-size: 20rpx;
	color: #9ca3af;
	margin-top: 4rpx;
}

.task-step.active .task-name {
	color: #f0a000;
}

.task-step.active .task-state {
	color: #f0a000;
}

/* 任务详情卡 */
.task-detail {
	background: #ffffff;
	border-radius: 24rpx;
	padding: 28rpx;
	display: flex;
	align-items: center;
	justify-content: space-between;
	box-shadow: 0 2rpx 12rpx rgba(31, 41, 55, 0.04);
	margin-bottom: 28rpx;
	border-left: 8rpx solid #f0a000;
}

.detail-step {
	font-size: 22rpx;
	color: #f0a000;
	font-weight: 600;
}

.detail-title {
	display: block;
	font-size: 32rpx;
	font-weight: 600;
	color: #1f2937;
	margin: 6rpx 0;
}

.detail-desc {
	display: block;
	font-size: 24rpx;
	color: #6b7280;
}

.detail-btn {
	background: #f0a000;
	color: #ffffff;
	font-size: 26rpx;
	font-weight: 600;
	padding: 16rpx 32rpx;
	border-radius: 999rpx;
	flex-shrink: 0;
}

/* 快捷入口 */
.quick-grid {
	display: flex;
	flex-wrap: wrap;
	gap: 20rpx;
}

.quick-item {
	width: calc(50% - 10rpx);
	background: #ffffff;
	border-radius: 24rpx;
	padding: 28rpx;
	box-sizing: border-box;
	box-shadow: 0 2rpx 12rpx rgba(31, 41, 55, 0.04);
	display: flex;
	flex-direction: column;
	align-items: center;
}

.quick-icon-img {
	width: 64rpx;
	height: 64rpx;
	margin-bottom: 12rpx;
}

.quick-name-row {
	display: flex;
	align-items: center;
	gap: 4rpx;
}

.quick-name-text {
	font-size: 28rpx;
	font-weight: 600;
	color: #1f2937;
}


.quick-name {
	font-size: 28rpx;
	font-weight: 600;
	color: #1f2937;
}
.quick-logo {
	width: 48rpx;
	height: 24rpx;
}

.quick-sub {
	font-size: 22rpx;
	color: #9ca3af;
	margin-top: 4rpx;
}
.hw-sub-active {
	color: #f0a000 !important;
	font-weight: 600;
}
</style>

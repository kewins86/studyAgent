<template>
	<view class="hc-page">
		<!-- 顶部栏 -->
		<view class="nav-bar">
			<view class="nav-left" @click="goBack">
				<text class="nav-back">‹</text>
			</view>
			<text class="nav-title">家作检查</text>
			<view class="nav-right"></view>
		</view>

		<!-- 日期切换 -->
		<view class="hc-date-bar">
			<view class="hc-date-arrow" @click="changeDate(-1)">
				<text class="hc-arrow-icon">‹</text>
			</view>
			<view class="hc-date-center" @click="showDatePicker">
				<text class="hc-date-text">{{ displayDate }}</text>
				<text class="hc-date-sub">{{ dateStatusText }}</text>
			</view>
			<view class="hc-date-arrow" @click="changeDate(1)" :class="{'hc-arrow-disabled': isToday}">
				<text class="hc-arrow-icon">›</text>
			</view>
		</view>

		<!-- 概览卡片 -->
		<view v-if="detail" class="hc-overview">
			<view class="hc-ov-item">
				<text class="hc-ov-num">{{ totalCount }}</text>
				<text class="hc-ov-label">总条目</text>
			</view>
			<view class="hc-ov-divider"></view>
			<view class="hc-ov-item">
				<text class="hc-ov-num hc-ov-done">{{ doneCount }}</text>
				<text class="hc-ov-label">已完成</text>
			</view>
			<view class="hc-ov-divider"></view>
			<view class="hc-ov-item">
				<text class="hc-ov-num hc-ov-pending">{{ pendingCount }}</text>
				<text class="hc-ov-label">待完成</text>
			</view>
			<view class="hc-ov-divider"></view>
			<view class="hc-ov-item">
				<text class="hc-ov-num hc-ov-rate">{{ doneRate }}%</text>
				<text class="hc-ov-label">完成率</text>
			</view>
		</view>

		<!-- 进度条 -->
		<view v-if="detail" class="hc-progress-bar">
			<view class="hc-progress-fill" :style="{width: doneRate + '%'}"></view>
		</view>

		<!-- 作业列表 -->
		<view v-if="detail && detail.items.length > 0" class="hc-list">
			<view v-for="item in detail.items" :key="item.id" class="hc-card" :class="{'hc-card-done': item.status === 'done'}">
				<view class="hc-card-top">
					<text class="hc-subject-tag" :class="'tag-' + item.subject">{{ item.subject }}</text>
					<text class="hc-type-tag">{{ typeLabel(item.itemType) }}</text>
					<text class="hc-status-tag" :class="{'st-done': item.status === 'done'}">
						{{ item.status === 'done' ? '✅ 已完成' : '⏳ 待完成' }}
					</text>
				</view>
				<text class="hc-content">{{ item.content }}</text>

				<!-- 完成时间 -->
				<text v-if="item.status === 'done' && item.checkedAt" class="hc-checked-time">
					完成于 {{ formatTime(item.checkedAt) }}
				</text>

				<!-- 完成照片 -->
				<view v-if="item.doneImage" class="hc-imgs">
					<image v-for="(img, i) in item.doneImage.split(',')" :key="i"
						:src="img" mode="widthFix" class="hc-img"
						@click="previewImg(img, item.doneImage.split(','))" />
				</view>

				<!-- 录音标识 -->
				<view v-if="item.doneAudio" class="hc-audio">
					🔊 录音已完成
				</view>

				<!-- 待完成提示 + 确认完成 -->
				<view v-if="item.status !== 'done'" class="hc-pending-hint">
					<text class="hc-pending-text">{{ hasSubmission(item) ? '作业已提交，请确认完成' : '孩仔尚未提交此项作业' }}</text>
					<button v-if="hasSubmission(item)" class="hc-confirm-btn" size="mini" @click="confirmDone(item)">✅ 确认完成</button>
				</view>

				<!-- AI 检查结果 -->
				<view v-if="item.aiCheckResult" class="hc-ai-result">
					<text class="hc-ai-label">🤖 AI 检查结果</text>
					<text class="hc-ai-text">{{ item.aiCheckResult }}</text>
				</view>
			</view>
		</view>

		<!-- 空状态 -->
		<view v-if="detail && detail.items.length === 0" class="hc-empty">
			<text class="hc-empty-icon">📋</text>
			<text class="hc-empty-text">{{ isToday ? '今天还没有家作记录' : '当天无家作记录' }}</text>
		</view>

		<!-- 加载中 -->
		<view v-if="!detail" class="hc-loading">
			<text class="hc-loading-text">加载中…</text>
		</view>
	</view>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import { onShow } from '@dcloudio/uni-app'
import { getHomeworkByDate, markHomeworkItemDone } from '@/api/index'

const detail = ref(null)
const currentDate = ref(new Date())

const isToday = computed(() => {
	const t = new Date()
	return currentDate.value.getFullYear() === t.getFullYear() &&
		currentDate.value.getMonth() === t.getMonth() &&
		currentDate.value.getDate() === t.getDate()
})

const dateStr = computed(() => {
	const d = currentDate.value
	const y = d.getFullYear()
	const m = String(d.getMonth() + 1).padStart(2, '0')
	const day = String(d.getDate()).padStart(2, '0')
	return `${y}-${m}-${day}`
})

const displayDate = computed(() => {
	const d = currentDate.value
	if (isToday.value) return '今天'
	const t = new Date()
	t.setHours(0, 0, 0, 0)
	d.setHours(0, 0, 0, 0)
	const diff = Math.round((t - d) / 86400000)
	if (diff === 1) return '昨天'
	if (diff === -1) return '明天'
	return `${d.getMonth() + 1}月${d.getDate()}日`
})

const dateStatusText = computed(() => {
	if (!detail.value) return ''
	const hw = detail.value.homework
	if (!hw) return ''
	return hw.status === 'completed' ? '全部完成' : '部分待完成'
})

const totalCount = computed(() => detail.value?.items?.length || 0)
const doneCount = computed(() => detail.value?.items?.filter(i => i.status === 'done').length || 0)
const pendingCount = computed(() => totalCount.value - doneCount.value)
const doneRate = computed(() => {
	if (totalCount.value === 0) return 0
	return Math.round(doneCount.value / totalCount.value * 100)
})

async function loadData() {
	detail.value = null
	try {
		const res = await getHomeworkByDate(dateStr.value)
		if (res.code === 0 && res.data) {
			detail.value = res.data
		}
	} catch (e) {
		console.log('loadData err', e)
		detail.value = { homework: null, items: [] }
	}
}

function changeDate(delta) {
	if (delta > 0 && isToday.value) return
	const d = new Date(currentDate.value)
	d.setDate(d.getDate() + delta)
	// 不能超过今天
	const today = new Date()
	today.setHours(23, 59, 59)
	if (d > today) return
	currentDate.value = d
	loadData()
}

function showDatePicker() {
	const d = currentDate.value
	uni.showModal({
		title: '选择日期',
		editable: true,
		placeholderText: 'YYYY-MM-DD',
		content: dateStr.value,
		success: (res) => {
			if (res.confirm && res.content) {
				const parts = res.content.trim().split('-')
				if (parts.length === 3) {
					const nd = new Date(parseInt(parts[0]), parseInt(parts[1]) - 1, parseInt(parts[2]))
					if (!isNaN(nd.getTime())) {
						const today = new Date()
						today.setHours(23, 59, 59)
						if (nd <= today) {
							currentDate.value = nd
							loadData()
						}
					}
				}
			}
		}
	})
}

function hasSubmission(item) {
	return !!(item.doneImage || item.doneAudio)
}

async function confirmDone(item) {
	try {
		const res = await markHomeworkItemDone(item.id)
		if (res.code === 0) {
			uni.showToast({ title: '已确认完成', icon: 'success' })
			loadData()
		}
	} catch (e) {
		uni.showToast({ title: '操作失败', icon: 'none' })
	}
}

function typeLabel(t) {
	return { written: '书面', reading: '朗读', dictation: '默写' }[t] || '书面'
}

function formatTime(ts) {
	if (!ts) return ''
	// ts 格式: 2026-09-10T01:57:20 或 2026-09-10T01:57:20.168045
	const parts = ts.split('T')
	if (parts.length < 2) return ts
	const time = parts[1].split('.')[0].split(':')
	return `${time[0]}:${time[1]}`
}

function previewImg(current, urls) {
	uni.previewImage({ current, urls })
}

function goBack() {
	uni.navigateBack({ delta: 1 })
}

onShow(() => { loadData() })
onMounted(() => { loadData() })
</script>

<style scoped>
.hc-page {
	min-height: 100vh;
	background: #f7f8fa;
	box-sizing: border-box;
	padding-bottom: 40rpx;
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

/* 日期切换栏 */
.hc-date-bar {
	display: flex;
	align-items: center;
	justify-content: space-between;
	background: #fff;
	border-radius: 16rpx;
	margin: 20rpx 32rpx 24rpx;
	padding: 20rpx 32rpx;
	margin-bottom: 24rpx;
}
.hc-date-arrow {
	width: 64rpx;
	height: 64rpx;
	display: flex;
	align-items: center;
	justify-content: center;
}
.hc-arrow-icon {
	font-size: 48rpx;
	color: #1a1a1a;
	line-height: 1;
}
.hc-arrow-disabled {
	opacity: 0.3;
}
.hc-date-center {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 4rpx;
}
.hc-date-text {
	font-size: 32rpx;
	font-weight: 600;
	color: #1a1a1a;
}
.hc-date-sub {
	font-size: 22rpx;
	color: #9ca3af;
}

/* 概览卡片 */
.hc-overview {
	display: flex;
	align-items: center;
	justify-content: space-around;
	background: #fff;
	border-radius: 16rpx;
	padding: 28rpx 0;
	margin: 0 32rpx 16rpx;
}
.hc-ov-item {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 8rpx;
}
.hc-ov-num {
	font-size: 40rpx;
	font-weight: 700;
	color: #1a1a1a;
}
.hc-ov-done { color: #10b981; }
.hc-ov-pending { color: #f0a000; }
.hc-ov-rate { color: #3b82f6; }
.hc-ov-label {
	font-size: 22rpx;
	color: #9ca3af;
}
.hc-ov-divider {
	width: 1px;
	height: 60rpx;
	background: #e5e7eb;
}

/* 进度条 */
.hc-progress-bar {
	margin: 0 32rpx 24rpx;
	height: 8rpx;
	background: #e5e7eb;
	border-radius: 4rpx;
	margin-bottom: 24rpx;
	overflow: hidden;
}
.hc-progress-fill {
	height: 100%;
	background: linear-gradient(90deg, #10b981, #34d399);
	border-radius: 4rpx;
	transition: width 0.3s ease;
}

/* 作业卡片 */
.hc-list {
	display: flex;
	flex-direction: column;
	gap: 20rpx;
	padding: 0 32rpx;
}
.hc-card {
	background: #fff;
	border-radius: 20rpx;
	padding: 28rpx;
}
.hc-card-done {
	border-left: 6rpx solid #10b981;
}
.hc-card-top {
	display: flex;
	align-items: center;
	gap: 12rpx;
	margin-bottom: 16rpx;
}
.hc-subject-tag {
	font-size: 22rpx;
	padding: 4rpx 16rpx;
	border-radius: 8rpx;
	color: #fff;
}
.tag-语文 { background: #ef4444; }
.tag-数学 { background: #3b82f6; }
.tag-英语 { background: #10b981; }
.hc-type-tag {
	font-size: 22rpx;
	color: #9ca3af;
}
.hc-status-tag {
	margin-left: auto;
	font-size: 24rpx;
	color: #f0a000;
}
.hc-status-tag.st-done {
	color: #10b981;
}
.hc-content {
	font-size: 28rpx;
	color: #374151;
	line-height: 1.5;
}
.hc-checked-time {
	display: block;
	font-size: 22rpx;
	color: #9ca3af;
	margin-top: 8rpx;
}
.hc-imgs {
	margin-top: 16rpx;
	display: flex;
	flex-wrap: wrap;
	gap: 12rpx;
}
.hc-img {
	width: 200rpx;
	border-radius: 12rpx;
}
.hc-audio {
	margin-top: 12rpx;
	font-size: 24rpx;
	color: #3b82f6;
	background: #eff6ff;
	padding: 8rpx 16rpx;
	border-radius: 8rpx;
	display: inline-block;
}
.hc-pending-hint {
	margin-top: 12rpx;
	padding: 12rpx 16rpx;
	background: #fff7ed;
	border-radius: 8rpx;
}
.hc-pending-text {
	font-size: 24rpx;
	color: #c2410c;
}
.hc-confirm-btn {
	margin-top: 12rpx;
	background: #10b981;
	color: #fff;
	border-radius: 8rpx;
	font-size: 24rpx;
	line-height: 2.2;
}
.hc-ai-result {
	margin-top: 12rpx;
	padding: 16rpx;
	background: #fef3c7;
	border-radius: 12rpx;
}
.hc-ai-label {
	font-size: 22rpx;
	color: #92400e;
	font-weight: 600;
}
.hc-ai-text {
	display: block;
	font-size: 26rpx;
	color: #78350f;
	margin-top: 8rpx;
}

/* 空状态 */
.hc-empty {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 20rpx;
	padding: 120rpx 0;
}
.hc-empty-icon {
	font-size: 80rpx;
}
.hc-empty-text {
	font-size: 28rpx;
	color: #9ca3af;
}

/* 加载中 */
.hc-loading {
	display: flex;
	justify-content: center;
	padding: 80rpx 0;
}
.hc-loading-text {
	font-size: 28rpx;
	color: #9ca3af;
}
</style>

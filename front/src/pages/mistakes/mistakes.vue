<template>
	<view class="mistakes-page">
		<!-- 顶部统计 -->
		<view class="stat-card">
			<view class="stat-item">
				<text class="stat-num">{{ stats.total }}</text>
				<text class="stat-label">错题总数</text>
			</view>
			<view class="stat-divider"></view>
			<view class="stat-item">
				<text class="stat-num">{{ stats.weekNew }}</text>
				<text class="stat-label">本周新增</text>
			</view>
			<view class="stat-divider"></view>
			<view class="stat-item">
				<text class="stat-num">{{ stats.masteredRate }}%</text>
				<text class="stat-label">掌握率</text>
			</view>
			<view class="stat-divider"></view>
			<view class="stat-item">
				<text class="stat-num">{{ stats.pending }}</text>
				<text class="stat-label">待订正</text>
			</view>
		</view>

		<!-- 筛选标签 -->
		<view class="filter-bar">
			<view
				v-for="f in filters"
				:key="f.key"
				class="filter-tag"
				:class="{ active: activeFilter === f.key }"
				@click="onFilterChange(f.key)"
			>{{ f.name }}</view>
		</view>

		<!-- 错题列表 -->
		<view class="mistake-list">
			<view v-for="m in mistakes" :key="m.id" class="mistake-card" @click="openDetail(m)">
				<view class="mistake-head">
					<text class="subject-tag" :class="m.subject">{{ m.subject }}</text>
					<text class="mistake-date">{{ formatDate(m.createdAt) }}</text>
				</view>
				<text class="mistake-question">{{ m.question }}</text>
				<view class="mistake-foot">
					<view class="knowledge-tag" v-if="m.knowledge">{{ m.knowledge }}</view>
					<view class="mistake-status" :class="m.status">{{ m.status === 'pending' ? '待订正' : '已掌握' }}</view>
				</view>
			</view>

			<view v-if="mistakes.length === 0" class="empty">
				<text class="empty-icon">🎉</text>
				<text class="empty-text">太棒了，没有{{ activeFilter === 'pending' ? '待订正' : '' }}错题！</text>
			</view>
		</view>

		<!-- 举一反三横幅 -->
		<view class="analogy-banner" @click="startAnalogy">
			<view class="analogy-text">
				<text class="analogy-title">🔁 举一反三</text>
				<text class="analogy-sub">针对薄弱知识点，AI 出同类题巩固</text>
			</view>
			<view class="analogy-btn">去练习</view>
		</view>
	</view>
</template>

<script setup>
import { ref } from 'vue'
import { onShow } from '@dcloudio/uni-app'
import { getMistakes, getMistakeStats, markMistakeMastered } from '@/api/index'

const stats = ref({ total: 0, weekNew: 0, masteredRate: 0, pending: 0 })

const filters = [
	{ key: 'all', name: '全部' },
	{ key: 'pending', name: '待订正' },
	{ key: 'mastered', name: '已掌握' }
]
const activeFilter = ref('all')
const mistakes = ref([])

async function loadData() {
	try {
		const [statsRes, listRes] = await Promise.all([
			getMistakeStats(),
			getMistakes(activeFilter.value)
		])
		if (statsRes.code === 0 && statsRes.data) {
			stats.value = statsRes.data
		}
		if (listRes.code === 0 && listRes.data) {
			mistakes.value = listRes.data
		}
	} catch (e) {
		console.log('错题本加载失败', e)
	}
}

function onFilterChange(key) {
	activeFilter.value = key
	loadData()
}

function formatDate(dt) {
	if (!dt) return ''
	const d = new Date(dt)
	return `${(d.getMonth() + 1).toString().padStart(2, '0')}-${d.getDate().toString().padStart(2, '0')}`
}

function openDetail(m) {
	const actions = m.status === 'pending'
		? [
			{ text: '标记已掌握' },
			{ text: '取消' }
		]
		: [{ text: '知道了' }]

	uni.showModal({
		title: m.question,
		content: m.myAnswer ? `你的答案：${m.myAnswer}\n正确答案：${m.rightAnswer || ''}\n错因：${m.reason || ''}` : (m.reason || '暂无解析'),
		confirmText: m.status === 'pending' ? '标记已掌握' : '知道了',
		cancelText: '关闭',
		success: async (res) => {
			if (res.confirm && m.status === 'pending') {
				try {
					const r = await markMistakeMastered(m.id)
					if (r.code === 0) {
						uni.showToast({ title: '已标记掌握', icon: 'success' })
						loadData()
					}
				} catch (e) {
					uni.showToast({ title: '操作失败', icon: 'none' })
				}
			}
		}
	})
}

function startAnalogy() {
	uni.switchTab({ url: '/pages/chat/chat' })
}

onShow(() => {
	loadData()
})
</script>

<style>
.mistakes-page {
	min-height: 100vh;
	background: #f7f8fa;
	padding: 24rpx 32rpx calc(40rpx + env(safe-area-inset-bottom));
	box-sizing: border-box;
}

.stat-card {
	background: #ffffff;
	border-radius: 28rpx;
	padding: 32rpx 16rpx;
	display: flex;
	align-items: center;
	justify-content: space-around;
	box-shadow: 0 2rpx 12rpx rgba(31, 41, 55, 0.04);
	margin-bottom: 24rpx;
}

.stat-item {
	display: flex;
	flex-direction: column;
	align-items: center;
	flex: 1;
}

.stat-num {
	font-size: 40rpx;
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

.filter-bar {
	display: flex;
	gap: 16rpx;
	margin-bottom: 24rpx;
}

.filter-tag {
	padding: 12rpx 30rpx;
	border-radius: 999rpx;
	background: #ffffff;
	color: #6b7280;
	font-size: 25rpx;
	border: 2rpx solid #e3e7ee;
}

.filter-tag.active {
	background: #fff4dc;
	color: #f0a000;
	border-color: #f0a000;
	font-weight: 600;
}

.mistake-list {
	display: flex;
	flex-direction: column;
	gap: 20rpx;
	margin-bottom: 24rpx;
}

.mistake-card {
	background: #ffffff;
	border-radius: 24rpx;
	padding: 28rpx;
	box-shadow: 0 2rpx 12rpx rgba(31, 41, 55, 0.04);
}

.mistake-head {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 14rpx;
}

.subject-tag {
	font-size: 22rpx;
	padding: 4rpx 16rpx;
	border-radius: 8rpx;
	background: rgba(240, 160, 0, 0.1);
	color: #f0a000;
}

.subject-tag.语文 {
	background: rgba(251, 176, 64, 0.12);
	color: #e8960c;
}

.mistake-date {
	font-size: 22rpx;
	color: #9ca3af;
}

.mistake-question {
	display: block;
	font-size: 28rpx;
	color: #1f2937;
	line-height: 1.6;
	margin-bottom: 16rpx;
}

.mistake-foot {
	display: flex;
	align-items: center;
	flex-wrap: wrap;
	gap: 12rpx;
}

.knowledge-tag {
	font-size: 22rpx;
	color: #6b7280;
	background: #f3f4f6;
	padding: 6rpx 16rpx;
	border-radius: 8rpx;
}

.mistake-status {
	margin-left: auto;
	font-size: 22rpx;
	padding: 6rpx 16rpx;
	border-radius: 999rpx;
}

.mistake-status.pending {
	background: #fef3e2;
	color: #e8960c;
}

.mistake-status.mastered {
	background: #e6f7ec;
	color: #22a55e;
}

.empty {
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 80rpx 0;
}

.empty-icon {
	font-size: 72rpx;
	margin-bottom: 16rpx;
}

.empty-text {
	font-size: 26rpx;
	color: #9ca3af;
}

.analogy-banner {
	background: linear-gradient(135deg, #f0a000, #ffc64d);
	border-radius: 24rpx;
	padding: 28rpx 32rpx;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.analogy-title {
	display: block;
	font-size: 30rpx;
	font-weight: 600;
	color: #ffffff;
}

.analogy-sub {
	display: block;
	font-size: 22rpx;
	color: rgba(255, 255, 255, 0.85);
	margin-top: 6rpx;
}

.analogy-btn {
	background: #ffffff;
	color: #f0a000;
	font-size: 26rpx;
	font-weight: 600;
	padding: 14rpx 30rpx;
	border-radius: 999rpx;
	flex-shrink: 0;
}
</style>

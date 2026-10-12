<template>
	<view class="ai-profile-page">
		<!-- 顶部安全区 + 标题栏 -->
		<view class="topbar" :style="{ paddingTop: statusBarHeight + 'px' }">
			<view class="topbar-inner">
				<text class="topbar-back" @click="goBack">‹</text>
				<text class="topbar-title">我的画像</text>
				<text class="topbar-placeholder"></text>
			</view>
		</view>

		<!-- 画像内容 -->
		<view class="content">
			<view v-if="aiSummary" class="ai-card">
				<text class="ai-card-text">{{ aiSummary }}</text>
			</view>
			<view v-else class="empty">
				<text class="empty-icon">🦌</text>
				<text class="empty-text">还没有 AI 画像，请先完成学习问卷</text>
				<view class="empty-btn" @click="goQuestionnaire">去填写问卷</view>
			</view>
		</view>
	</view>
</template>

<script setup>
import { ref } from 'vue'
import { onLoad } from '@dcloudio/uni-app'

const aiSummary = ref('')
const statusBarHeight = ref(0)

onLoad(() => {
	// 从 storage 读取（profile.vue 加载时已缓存，不重新调接口）
	aiSummary.value = uni.getStorageSync('aiSummary') || ''

	// 获取状态栏高度
	const sysInfo = uni.getSystemInfoSync()
	statusBarHeight.value = sysInfo.statusBarHeight || 0
})

function goBack() {
	uni.navigateBack({ delta: 1 })
}

function goQuestionnaire() {
	uni.redirectTo({ url: '/pages/questionnaire/questionnaire' })
}
</script>

<style>
.ai-profile-page {
	min-height: 100vh;
	background: #f7f8fa;
}

/* 顶部栏 */
.topbar {
	background: linear-gradient(135deg, #f0a000, #ffc64d);
}

.topbar-inner {
	display: flex;
	align-items: center;
	justify-content: space-between;
	height: 88rpx;
	padding: 0 24rpx;
}

.topbar-back {
	font-size: 48rpx;
	color: #ffffff;
	width: 60rpx;
	text-align: center;
}

.topbar-title {
	font-size: 34rpx;
	font-weight: 600;
	color: #ffffff;
}

.topbar-placeholder {
	width: 60rpx;
}

/* 内容区 */
.content {
	padding: 32rpx;
}

.ai-card {
	background: linear-gradient(135deg, #FFF8E7 0%, #FFFDF8 100%);
	border-radius: 24rpx;
	padding: 36rpx 32rpx;
	border-left: 8rpx solid #F0A000;
	box-shadow: 0 4rpx 16rpx rgba(240, 160, 0, 0.1);
}

.ai-card-text {
	font-size: 28rpx;
	color: #4b5563;
	line-height: 1.9;
	white-space: pre-wrap;
}

/* 空态 */
.empty {
	display: flex;
	flex-direction: column;
	align-items: center;
	padding-top: 160rpx;
}

.empty-icon {
	font-size: 80rpx;
	margin-bottom: 24rpx;
}

.empty-text {
	font-size: 28rpx;
	color: #9ca3af;
	margin-bottom: 40rpx;
}

.empty-btn {
	background: #f0a000;
	color: #ffffff;
	font-size: 28rpx;
	padding: 18rpx 56rpx;
	border-radius: 999rpx;
}
</style>

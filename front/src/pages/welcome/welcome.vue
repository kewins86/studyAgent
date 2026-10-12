<template>
	<view class="welcome-page">
		<!-- 主标题区 -->
		<view class="hero">
			<view class="logo">
				<image src="/static/logo-deer.png" mode="aspectFit" class="deer-logo" />
				<image src="/static/logo-text.png" mode="aspectFit" class="brand-logo" />
			</view>
			<view class="subtitle">先了解孩子，才能教得好</view>
			<view class="desc">
				<view>花 5-8 分钟回答几个小问题</view>
				<view>AI 老师将为孩子定制专属学习方案</view>
			</view>
		</view>

		
		<!-- 底部按钮 -->
		<view class="footer">
			<button class="start-btn" @click="goToQuestionnaire">开始填写</button>
		</view>
		<!-- 隐私声明 -->
		<view class="privacy-box">
			<image class="privacy-icon" src="/static/shield.png" mode="aspectFit" />
			<view class="privacy-text">
				信息仅用于为孩子定制学习内容，不会对外分享，不采集姓名、学校与家庭住址。
			</view>
		</view>

	</view>
</template>

<script setup>
import { onLoad } from '@dcloudio/uni-app'
import { useUserStore } from '@/stores/user'
import { getProfile } from '@/api/index'

const userStore = useUserStore()

onLoad(async () => {
	// 如果从登录页跳来，login 已调过 profile，跳过重复调用
	if (uni.getStorageSync('_profileChecked')) {
		uni.removeStorageSync('_profileChecked')
		return
	}
	// 优先查后端画像状态，不依赖本地 storage（换设备/清缓存后 storage 会丢）
	const studentId = userStore.id
	if (!studentId) {
		// 未登录，回登录页
		uni.reLaunch({ url: '/pages/login/login' })
		return
	}
	try {
		const res = await getProfile(studentId)
		if (res && res.code === 0 && res.data && res.data.extra) {
			// 已提交画像，直接跳首页
			uni.reLaunch({ url: '/pages/index/index' })
			return
		}
		// 后端无画像记录，再查本地 storage（草稿场景）
		const hasProfile = uni.getStorageSync('hasProfile')
		if (hasProfile) {
			uni.reLaunch({ url: '/pages/index/index' })
		}
		// 否则停留在欢迎页
	} catch (e) {
		console.error('[welcome] 查询画像失败', e)
		// 接口失败时降级查本地 storage
		const hasProfile = uni.getStorageSync('hasProfile')
		if (hasProfile) {
			uni.reLaunch({ url: '/pages/index/index' })
		}
	}
})

function goToQuestionnaire() {
	uni.navigateTo({ url: '/pages/questionnaire/questionnaire' })
}
</script>

<style scoped>
.welcome-page {
	min-height: 100vh;
	background: linear-gradient(180deg, #FFF8E8 0%, #FFFDF5 50%, #FFFFFF 100%);
	display: flex;
	flex-direction: column;
	padding: 0 48rpx;
	box-sizing: border-box;
}

/* 主标题区 */
.hero {
	flex: 1;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.logo {
	display: flex;
	align-items: center;
	gap: 12rpx;
	margin: 60rpx 0;
}

.deer-logo {
	width: 50rpx;
	height: 50rpx;
}

.brand-logo {
	width: 80rpx;
	height: 40rpx;
}

.subtitle {
	font-size: 40rpx;
	font-weight: 600;
	color: #1F2937;
	margin-bottom: 32rpx;
}

.desc {
	text-align: center;
	font-size: 28rpx;
	color: #6B7280;
	line-height: 1.8;
}

/* 隐私声明 */
.privacy-box {
	margin: 28rpx 0;
	border-radius: 20rpx;
	display: flex;
    justify-content: center;
	gap: 16rpx;
	align-items: flex-start;
}

.privacy-icon {
	width: 32rpx;
	height: 32rpx;
	flex-shrink: 0;
}

.privacy-text {
	font-size: 26rpx;
	color: #4B5563;
	line-height: 1.6;
}

/* 底部 */
.footer {
	display: flex;
	flex-direction: column;
	align-items: center;
}


.start-btn {
	width: 100%;
	height: 96rpx;
	line-height: 96rpx;
	background: linear-gradient(135deg, #F0A000, #FFC64D);
	color: #FFFFFF;
	font-size: 32rpx;
	font-weight: 600;
	border-radius: 48rpx;
	border: none;
	box-shadow: 0 8rpx 24rpx rgba(240, 160, 0, 0.35);
}

.start-btn::after {
	border: none;
}

.start-btn:active {
	transform: scale(0.98);
}
</style>

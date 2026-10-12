<template>
	<view class="login-page">
		<!-- 顶部品牌区 -->
		<view class="brand">
			<image src="/static/logo-deer.png" mode="aspectFit" class="logo-img" />
			<view class="brand-name-row">
			<image src="/static/logo-text.png" mode="aspectFit" class="brand-text-logo" />
			<text class="brand-suffix">· 智能学伴</text>
		</view>
			<view class="brand-slogan">测一测，学一学，练一练，错题不再犯</view>
		</view>

		<!-- 表单卡片 -->
		<view class="card">
			<!-- 登录/注册切换 -->
			<view class="tabs">
				<view class="tab" :class="{ active: mode === 'login' }" @click="switchMode('login')">登录</view>
				<view class="tab" :class="{ active: mode === 'register' }" @click="switchMode('register')">注册</view>
			</view>

			<view class="form">
				<view class="field">
					<text class="label">手机号</text>
					<input class="input" type="number" maxlength="11" v-model="phone" placeholder="请输入11位手机号"
						placeholder-class="ph" />
				</view>
				<view class="field">
					<text class="label">密码</text>
					<input class="input" :password="!showPwd" v-model="password" placeholder="至少6位"
						placeholder-class="ph" />
					<text class="pwd-toggle" @click="showPwd = !showPwd">{{ showPwd ? '隐藏' : '显示' }}</text>
				</view>
			</view>

			<button class="submit" :loading="loading" :disabled="loading" @click="submit">{{ loading ? (loadingText || '处理中…') : (mode === 'login' ? '登 录' : '注册并登录') }}</button>

			<view class="tip" v-if="mode === 'login'">还没有账号？<text class="link" @click="switchMode('register')">立即注册</text></view>
			<view class="tip" v-else>已有账号？<text class="link" @click="switchMode('login')">去登录</text></view>
		</view>

		<view class="footer">登录即代表同意《用户协议》与《隐私政策》</view>
	</view>
</template>

<script setup>
import { ref } from 'vue'
import { onLoad } from '@dcloudio/uni-app'
import { useUserStore } from '@/stores/user'
import { login, register, getProfile, getAssessmentStatus } from '@/api/index'

const userStore = useUserStore()

// 已登录用户直接进首页
onLoad(() => {
	if (uni.getStorageSync('token')) {
		uni.reLaunch({ url: '/pages/index/index' })
	}
})

const mode = ref('login')
const phone = ref('')
const password = ref('')
const showPwd = ref(false)
const loading = ref(false)
const loadingText = ref('')

function switchMode(m) {
	mode.value = m
	loading.value = false
}

function validate() {
	if (!/^1\d{10}$/.test(phone.value)) {
		uni.showToast({ title: '请输入正确的11位手机号', icon: 'none' })
		return false
	}
	if (!password.value || password.value.length < 6) {
		uni.showToast({ title: '密码至少6位', icon: 'none' })
		return false
	}
	return true
}

async function submit() {
	if (loading.value || !validate()) return
	loading.value = true
	loadingText.value = mode.value === 'login' ? '登录中…' : '注册中…'
	uni.showLoading({ title: loadingText.value, mask: true })
	try {
		const api = mode.value === 'login' ? login : register
		const data = { phone: phone.value, password: password.value }
		const res = await api(data)
		if (res && res.code === 0) {
			userStore.setLogin(res.data)

			// 保持登录页，继续调 /profile 决定跳转
			loadingText.value = '登录中…'
			uni.showLoading({ title: '登录中…', mask: true })
			try {
				const studentId = res.data && res.data.student && res.data.student.id
				const profileRes = await getProfile(studentId)
				// code 5000：画像不存在等业务错误，停留登录页提示 message
				if (profileRes && profileRes.code === 5000) {
					uni.hideLoading()
					uni.showToast({ title: profileRes.message || '查询画像失败', icon: 'none' })
					loading.value = false
					loadingText.value = ''
					return
				}
				const profile = profileRes && profileRes.data
				// 缓存 profile 数据，后续页面直接读缓存不调接口
				if (profile) {
					uni.setStorageSync('cachedProfile', profile)
				}
				// 缓存 assessment status
				try {
					const aRes = await getAssessmentStatus()
					if (aRes && aRes.code === 0 && aRes.data) {
						uni.setStorageSync('cachedAssessmentStatus', aRes.data.status || 'none')
					}
				} catch (e) { /* 摸底状态查询失败不阻塞登录 */ }
				if (profile && profile.extra) {
					// 有问卷答案，跳首页
					uni.hideLoading()
					uni.showToast({ title: '登录成功', icon: 'success' })
					setTimeout(() => uni.reLaunch({ url: '/pages/index/index' }), 500)
				} else {
					// 无问卷答案，跳欢迎页
					uni.hideLoading()
					uni.showToast({ title: '登录成功', icon: 'success' })
					uni.setStorageSync('_profileChecked', true)
					setTimeout(() => uni.reLaunch({ url: '/pages/welcome/welcome' }), 500)
				}
			} catch (profileErr) {
				console.error('画像查询失败', profileErr)
				uni.hideLoading()
				uni.showToast({ title: '登录失败，请重试', icon: 'none' })
				loading.value = false
				loadingText.value = ''
			}
		} else {
			uni.showToast({ title: (res && res.message) || '操作失败', icon: 'none' })
			uni.hideLoading()
			loading.value = false
			loadingText.value = ''
		}
	} catch (e) {
		console.error('登录失败', e)
		uni.hideLoading()
		uni.showToast({ title: '网络异常，请稍后再试', icon: 'none' })
		loading.value = false
		loadingText.value = ''
	}
}
</script>

<style scoped>
.login-page {
	min-height: 100vh;
	background: linear-gradient(180deg, #FFF6E0 0%, #FFFDF7 45%, #FFF4DC 100%);
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 0 48rpx;
	box-sizing: border-box;
}

.brand {
	display: flex;
	flex-direction: column;
	align-items: center;
	padding-top: 140rpx;
	padding-bottom: 60rpx;
}

.logo-img {
	width: 160rpx;
	height: 160rpx;
}

.brand-name-row {
	display: flex;
	align-items: center;
	gap: 12rpx;
	margin-top: 32rpx;
}

.brand-text-logo {
	width: 110rpx;
	height: 55rpx;
	margin-top: -6rpx;
}

.brand-suffix {
	font-size: 40rpx;
	font-weight: 700;
	color: #703820;
}

.brand-slogan {
	margin-top: 12rpx;
	font-size: 24rpx;
	color: #9CA3AF;
}

.card {
	width: 100%;
	background: #FFFFFF;
	border-radius: 32rpx;
	padding: 48rpx 40rpx 40rpx;
	box-sizing: border-box;
	box-shadow: 0 8rpx 32rpx rgba(31, 41, 55, 0.06);
}

.tabs {
	display: flex;
	background: #FFF4DC;
	border-radius: 20rpx;
	padding: 6rpx;
	margin-bottom: 40rpx;
}

.tab {
	flex: 1;
	text-align: center;
	padding: 16rpx 0;
	border-radius: 16rpx;
	font-size: 30rpx;
	color: #9CA3AF;
	transition: all 0.2s;
}

.tab.active {
	background: #F0A000;
	color: #FFFFFF;
	font-weight: 600;
	box-shadow: 0 4rpx 12rpx rgba(240, 160, 0, 0.3);
}

.field {
	position: relative;
	margin-bottom: 28rpx;
}

.label {
	font-size: 24rpx;
	color: #6B7280;
	display: block;
	margin-bottom: 10rpx;
}

.input {
	height: 88rpx;
	background: #F7F8FA;
	border-radius: 16rpx;
	padding: 0 24rpx;
	font-size: 30rpx;
	color: #1F2937;
}

.ph {
	color: #C4C9D1;
}

.pwd-toggle {
	position: absolute;
	right: 24rpx;
	bottom: 28rpx;
	font-size: 24rpx;
	color: #F0A000;
}

.submit {
	margin-top: 16rpx;
	height: 92rpx;
	line-height: 92rpx;
	background: linear-gradient(135deg, #F0A000, #FFC64D);
	color: #FFFFFF;
	font-size: 32rpx;
	font-weight: 600;
	border-radius: 46rpx;
	border: none;
	box-shadow: 0 8rpx 24rpx rgba(240, 160, 0, 0.35);
}

.submit::after {
	border: none;
}

.submit[disabled] {
	opacity: 0.7;
}

.tip {
	margin-top: 32rpx;
	text-align: center;
	font-size: 26rpx;
	color: #9CA3AF;
}

.link {
	color: #F0A000;
	font-weight: 600;
}

.footer {
	margin-top: 48rpx;
	font-size: 22rpx;
	color: #C4C9D1;
}
</style>

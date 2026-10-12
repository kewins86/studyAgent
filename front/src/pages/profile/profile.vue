<template>
	<view class="profile-page">
		<!-- 用户信息卡 -->
		<view class="user-card">
			<image class="avatar-img" src="/static/logo-deer.png" mode="aspectFit" />
			<view class="user-info">
				<text class="user-name">{{ userStore.name || '小鹿同学' }}</text>
				<text class="user-grade">{{ gradeText }}</text>
			</view>
			<view class="edit-btn" @click="editUser">编辑</view>
		</view>

		<!-- 画像速览（只展示标签） -->
		<view class="section">
			<view class="section-head">
				<text class="section-title">学习画像</text>
				<text v-if="profileAction === 'questionnaire'" class="section-more" @click="goQuestionnaire">完善问卷 →</text>
			<text v-else-if="profileAction === 'assessment'" class="section-more" @click="goAssessment">测 →</text>
			</view>
			<view class="profile-card" @click="goQuestionnaire">
				<!-- 标签云 -->
				<view v-if="profileTags.length > 0" class="tag-cloud">
					<view class="tag" v-for="t in profileTags" :key="t">{{ t }}</view>
				</view>
				<text v-if="profileTags.length === 0" class="profile-empty">还没填写基础问卷，完成 21 题了解孩子学习特点</text>
			</view>
		</view>

		<!-- 功能入口 -->
		<view class="menu-card">
			<view class="menu-item" @click="goAiProfile">
				<image class="menu-icon-img" src="/static/profile-ai.png" mode="aspectFit" />
				<view class="menu-body">
					<text class="menu-name">我的画像</text>
					<text class="menu-sub">AI 生成 · 学习特点描述</text>
				</view>
				<text class="menu-arrow">›</text>
			</view>
			<view class="menu-divider"></view>
			<view class="menu-item" @click="goStats">
				<image class="menu-icon-img" src="/static/profile-stats.png" mode="aspectFit" />
				<view class="menu-body">
					<text class="menu-name">学习统计</text>
					<text class="menu-sub">掌握度 · 正确率 · 学习时长</text>
				</view>
				<text class="menu-arrow">›</text>
			</view>
			<view class="menu-divider"></view>
			<view class="menu-item" @click="goSettings">
				<image class="menu-icon-img" src="/static/profile-settings.png" mode="aspectFit" />
				<view class="menu-body">
					<text class="menu-name">设置</text>
					<text class="menu-sub">个人信息 · 通知 · 关于</text>
				</view>
				<text class="menu-arrow">›</text>
			</view>
			<view class="menu-divider"></view>
			<view class="menu-item" @click="logout">
				<image class="menu-icon-img" src="/static/profile-logout.png" mode="aspectFit" />
				<view class="menu-body">
					<text class="menu-name">退出登录</text>
					<text class="menu-sub">切换账号</text>
				</view>
				<text class="menu-arrow">›</text>
			</view>
		</view>

		<!-- 版本 -->
		<text class="version">k9智能学伴 v0.1.0</text>
	</view>
</template>

<script setup>
import { computed, ref } from 'vue'
import { onShow } from '@dcloudio/uni-app'
import { useUserStore } from '@/stores/user'
import { logout as apiLogout, getProfile, saveProfile, getAssessmentStatus } from '@/api/index'

const userStore = useUserStore()

// 画像状态：'submitted' 已提交 | 'draft' 有草稿 | 'none' 无数据
const profileStatus = ref('none')
// 摸底测试状态
const assessmentStatus = ref('none')
const profileTags = ref([])
const aiSummary = ref('')  // 仅缓存到 storage，不在「我的」页展示

// 从缓存加载画像（不调接口），缓存不存在时才调接口
async function loadProfile() {
	const studentId = userStore.id
	if (!studentId) return

	// 优先读缓存
	const cached = uni.getStorageSync('cachedProfile')
	if (cached) {
		parseProfileData(cached)
	}

	// 优先读摸底测试缓存
	const cachedStatus = uni.getStorageSync('cachedAssessmentStatus')
	if (cachedStatus) {
		assessmentStatus.value = cachedStatus
	}

	// 缓存都没有时才调接口（首次登录缓存已在 login 里写好）
	if (!cached && !cachedStatus) {
		await fetchProfileFromServer(studentId)
	}
}

// 从服务端拉取画像（仅缓存缺失时调用）
async function fetchProfileFromServer(studentId) {
	try {
		const res = await getProfile(studentId)
		if (res.code === 0 && res.data) {
			parseProfileData(res.data)
			uni.setStorageSync('cachedProfile', res.data)
		} else {
			profileStatus.value = 'none'
		}
		// 拉摸底状态
		try {
			const aRes = await getAssessmentStatus()
			if (aRes.code === 0 && aRes.data) {
				assessmentStatus.value = aRes.data.status || 'none'
				uni.setStorageSync('cachedAssessmentStatus', aRes.data.status || 'none')
			}
		} catch (e) {
			console.log('获取测试状态失败')
		}
	} catch (e) {
		console.log('暂无画像数据')
		profileStatus.value = 'none'
	}
}

// 解析画像数据并更新 UI 状态
function parseProfileData(data) {
	const tags = []
	let hasDraftAnswers = false
	if (data.extra) {
		try {
			const extra = JSON.parse(data.extra)
			hasDraftAnswers = Object.keys(extra).length > 0
			if (extra[3]) {
				userStore.setName(extra[3])
			}
		} catch (e) {
			console.error('解析画像失败:', e)
		}
	}
	if (data.aiTags) {
		const aiTagsList = data.aiTags.split('|').filter(t => t.trim())
		const merged = [...aiTagsList]
		for (const t of tags) {
			if (!merged.includes(t)) merged.push(t)
		}
		profileTags.value = merged
	} else {
		profileTags.value = tags
	}
	aiSummary.value = data.aiSummary || ''
	if (aiSummary.value) {
		uni.setStorageSync('aiSummary', aiSummary.value)
	} else {
		uni.removeStorageSync('aiSummary')
	}
	if (data.academicLevel) {
		profileStatus.value = 'submitted'
	} else if (hasDraftAnswers) {
		profileStatus.value = 'draft'
	} else {
		profileStatus.value = 'none'
	}
}

onShow(() => {
	loadProfile()
})

const gradeText = computed(() => {
	const g = userStore.grade
	return g ? `${g} · 沪教版数学` : '三年级 · 沪教版数学'
})

// 右侧入口：未问卷→完善问卷，已问卷未测→测，都完成→不显示
const profileAction = computed(() => {
	if (profileStatus.value !== 'submitted') return 'questionnaire'
	if (assessmentStatus.value !== 'completed') return 'assessment'
	return 'done'
})

// 是否已提交画像（有标签）

function goAssessment() {
	uni.navigateTo({ url: '/pages/assessment/assessment' })
}

function editUser() {
	uni.showModal({
		title: '编辑孩子称呼',
		editable: true,
		placeholderText: '孩子昵称（如：乐乐）',
		confirmColor: '#F0A000',
		success: async res => {
			if (res.confirm && res.content) {
				userStore.setName(res.content)
				// 同步写入后端问卷 Q3
				try {
					const profileRes = await getProfile(userStore.id)
					let extra = {}
					if (profileRes.code === 0 && profileRes.data?.extra) {
						extra = JSON.parse(profileRes.data.extra)
					}
					extra[3] = res.content
					await saveProfile(userStore.id, { extra: JSON.stringify(extra) })
					// 更新缓存
					const cached = uni.getStorageSync('cachedProfile')
					if (cached) {
						cached.extra = JSON.stringify(extra)
						uni.setStorageSync('cachedProfile', cached)
					}
				} catch (e) {
					console.error('同步称呼到后端失败:', e)
				}
				uni.showToast({ title: '已保存', icon: 'success' })
			}
		}
	})
}

function logout() {
	uni.showModal({
		title: '退出登录',
		content: '确定要退出当前账号吗？',
		success: res => {
			if (!res.confirm) return
			apiLogout().catch(() => {}) // 后端登出失败也照常清理本地态
			userStore.clearLogin()
			// 清理所有本地缓存
			uni.clearStorageSync()
			uni.reLaunch({ url: '/pages/login/login' })
		}
	})
}

function goQuestionnaire() {
	if (profileStatus.value === 'none') {
		// 没有任何问卷数据，跳转欢迎页
		uni.navigateTo({ url: '/pages/welcome/welcome' })
	} else {
		// 有草稿或已提交，跳转问卷页
		uni.navigateTo({ url: '/pages/questionnaire/questionnaire' })
	}
}

function goAiProfile() {
	if (!aiSummary.value) {
		uni.showToast({ title: '请先完成问卷', icon: 'none' })
		return
	}
	// aiSummary 已存 storage，直接跳转（不重新调接口）
	uni.navigateTo({ url: '/pages/ai-profile/ai-profile' })
}

function goStats() {
	uni.showToast({ title: '统计页开发中', icon: 'none' })
}

function goSettings() {
	uni.showToast({ title: '设置页开发中', icon: 'none' })
}
</script>

<style>
.profile-page {
	min-height: 100vh;
	background: #f7f8fa;
	padding: 24rpx 32rpx calc(40rpx + env(safe-area-inset-bottom));
	box-sizing: border-box;
}

/* 用户卡 */
.user-card {
	background: linear-gradient(135deg, #f0a000, #ffc64d);
	border-radius: 28rpx;
	padding: 36rpx 32rpx;
	display: flex;
	align-items: center;
	gap: 24rpx;
	margin-bottom: 28rpx;
	box-shadow: 0 8rpx 24rpx rgba(240, 160, 0, 0.25);
}

.avatar-img {
	width: 100rpx;
	height: 100rpx;
	border-radius: 50%;
	background-color:white;
}

.user-info {
	flex: 1;
}

.user-name {
	display: block;
	font-size: 36rpx;
	font-weight: 700;
	color: #ffffff;
}

.user-grade {
	display: block;
	font-size: 24rpx;
	color: rgba(255, 255, 255, 0.85);
	margin-top: 6rpx;
}

.edit-btn {
	background: rgba(255, 255, 255, 0.25);
	color: #ffffff;
	font-size: 24rpx;
	padding: 10rpx 26rpx;
	border-radius: 999rpx;
}

/* 区块 */
.section {
	margin-bottom: 28rpx;
}

.section-head {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 16rpx;
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

/* 画像卡 */
.profile-card {
	background: #ffffff;
	border-radius: 24rpx;
	padding: 28rpx;
	box-shadow: 0 2rpx 12rpx rgba(31, 41, 55, 0.04);
}

.tag-cloud {
	display: flex;
	flex-wrap: wrap;
	gap: 16rpx;
}

.tag {
	background: #fff4dc;
	color: #f0a000;
	font-size: 24rpx;
	padding: 10rpx 24rpx;
	border-radius: 999rpx;
}

.profile-empty {
	font-size: 26rpx;
	color: #9ca3af;
	line-height: 1.6;
}

/* 菜单 */
.menu-card {
	background: #ffffff;
	border-radius: 24rpx;
	box-shadow: 0 2rpx 12rpx rgba(31, 41, 55, 0.04);
	margin-bottom: 28rpx;
	overflow: hidden;
}

.menu-item {
	display: flex;
	align-items: center;
	padding: 30rpx 28rpx;
}

.menu-icon-img {
	width: 72rpx;
	height: 72rpx;
	margin-right: 24rpx;
	flex-shrink: 0;
}

.menu-body {
	flex: 1;
}

.menu-name {
	display: block;
	font-size: 29rpx;
	font-weight: 600;
	color: #1f2937;
}

.menu-sub {
	display: block;
	font-size: 22rpx;
	color: #9ca3af;
	margin-top: 4rpx;
}

.menu-arrow {
	font-size: 40rpx;
	color: #c4c9d1;
}

.menu-divider {
	height: 2rpx;
	background: #f3f4f6;
	margin-left: 92rpx;
}

.version {
	display: block;
	text-align: center;
	font-size: 22rpx;
	color: #c4c9d1;
	padding: 20rpx 0;
}
</style>

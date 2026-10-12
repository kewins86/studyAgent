<template>
	<view class="questionnaire-page">
		<!-- 顶部栏：首页图标 + 保存按钮 -->
		<view class="top-bar">
			<view class="home-icon" @click="goHome">
				<image class="home-icon-img" src="/static/tabbar/home_active.png" mode="aspectFit" />
			</view>
			<view class="save-btn" @click="saveDraft">
				<text class="save-text">保存</text>
			</view>
		</view>
		
		<!-- 标题区 -->
		<view class="header">
			<view class="section-title">先认识一下孩子</view>
			<view class="section-desc">这部分信息用于定制学习内容</view>
			<view class="stats-row">
				<view class="stats-tag">
					已完成必答题 {{ completedRequired }}/{{ requiredQuestions.length }}
				</view>
				<view class="quick-actions">
					<text class="action-link" @click="expandAll">全部展开</text>
					<text class="action-divider">|</text>
					<text class="action-link" @click="collapseAll">全部收起</text>
				</view>
			</view>
		</view>

		<!-- 模块列表 -->
		<view class="modules-list">
			<!-- A 基本信息 -->
			<view class="module" :class="{ expanded: expanded.A }">
				<view class="module-header" @click="toggleModule('A')">
					<view class="module-title">
						<text class="module-label">A</text>
						<text class="module-name">基本信息</text>
					</view>
					<view class="module-status">
						<text v-if="!expanded.A" class="fill-count">
							已填 {{ getModuleFilled('A') }}/{{ getModuleTotal('A') }} 题
						</text>
						<text class="arrow" :class="{ up: expanded.A }"></text>
					</view>
				</view>
				<view v-if="expanded.A" class="module-content">
					<view class="question-item" v-for="(q, idx) in moduleAQuestions" :key="q.id" :id="'q-' + q.id">
						<view class="question-header">
							<view class="q-tag">Q{{ q.id }}</view>
							<view class="q-title">{{ q.title }}</view>
							<view class="q-required" :class="{ required: q.required }">
								{{ q.required ? '必答' : '选答' }}
							</view>
						</view>
						<view class="q-desc" v-if="q.desc">{{ q.desc }}</view>
						
						<!-- 单选 -->
						<view v-if="q.type === 'radio'" class="options-list">
							<view 
								class="option" 
								v-for="(opt, oidx) in q.options" 
								:key="oidx"
								:class="{ active: answers[q.id] === oidx }"
								@click="selectOption(q.id, oidx)"
							>
								<text class="option-text">{{ opt.text || opt }}</text>
							</view>
						</view>

						<!-- 填空 -->
						<view v-if="q.type === 'text'" class="text-wrap">
							<input 
								class="text-input" 
								v-model="answers[q.id]" 
								:placeholder="q.placeholder"
								placeholder-class="ph"
							/>
						</view>
					</view>
				</view>
			</view>

			<!-- B 学习情况 -->
			<view class="module" :class="{ expanded: expanded.B }">
				<view class="module-header" @click="toggleModule('B')">
					<view class="module-title">
						<text class="module-label">B</text>
						<text class="module-name">学习情况</text>
					</view>
					<view class="module-status">
						<text v-if="!expanded.B" class="fill-count">
							已填 {{ getModuleFilled('B') }}/{{ getModuleTotal('B') }} 题
						</text>
						<text class="arrow" :class="{ up: expanded.B }"></text>
					</view>
				</view>
				<view v-if="expanded.B" class="module-content">
					<view class="question-item" v-for="q in moduleBQuestions" :key="q.id" :id="'q-' + q.id">
						<view class="question-header">
							<view class="q-tag">Q{{ q.id }}</view>
							<view class="q-title">{{ q.title }}</view>
							<view class="q-required" :class="{ required: q.required }">
								{{ q.required ? '必答' : '选答' }}
							</view>
						</view>
						<view class="q-desc" v-if="q.desc">{{ q.desc }}</view>
						
						<view v-if="q.type === 'radio'" class="options-list">
							<view 
								class="option" 
								v-for="(opt, oidx) in q.options" 
								:key="oidx"
								:class="{ active: answers[q.id] === oidx }"
								@click="selectOption(q.id, oidx)"
							>
								<text class="option-text">{{ opt.text || opt }}</text>
							</view>
						</view>
					</view>
				</view>
			</view>

			<!-- C 态度与性格 -->
			<view class="module" :class="{ expanded: expanded.C }">
				<view class="module-header" @click="toggleModule('C')">
					<view class="module-title">
						<text class="module-label">C</text>
						<text class="module-name">态度与性格</text>
					</view>
					<view class="module-status">
						<text v-if="!expanded.C" class="fill-count">
							已填 {{ getModuleFilled('C') }}/{{ getModuleTotal('C') }} 题
						</text>
						<text class="arrow" :class="{ up: expanded.C }"></text>
					</view>
				</view>
				<view v-if="expanded.C" class="module-content">
					<view class="question-item" v-for="q in moduleCQuestions" :key="q.id" :id="'q-' + q.id">
						<view class="question-header">
							<view class="q-tag">Q{{ q.id }}</view>
							<view class="q-title">{{ q.title }}</view>
							<view class="q-required required">必答</view>
						</view>
						<!-- 滑动条式李克特量表 -->
						<view class="slider-scale">
							<view class="slider-labels">
								<text class="slider-label">非常不符合</text>
								<text class="slider-label">非常符合</text>
							</view>
							<view class="slider-track-wrap">
								<view class="slider-track">
									<view 
										class="slider-fill" 
										:style="{ width: getSliderWidth(q.id) }"
									></view>
								</view>
								<view class="slider-points">
									<view 
										v-for="i in 5" 
										:key="i"
										class="slider-point"
										:class="{ active: getLikertVal(q.id) >= (i-1) }"
										@click="selectOption(q.id, i-1)"
									>
										<view class="point-inner" v-if="answers[q.id] === i-1"></view>
									</view>
								</view>
							</view>
						</view>
					</view>
				</view>
			</view>

			<!-- D 内容偏好 -->
			<view class="module" :class="{ expanded: expanded.D }">
				<view class="module-header" @click="toggleModule('D')">
					<view class="module-title">
						<text class="module-label">D</text>
						<text class="module-name">内容偏好</text>
					</view>
					<view class="module-status">
						<text v-if="!expanded.D" class="fill-count">
							已填 {{ getModuleFilled('D') }}/{{ getModuleTotal('D') }} 题
						</text>
						<text class="arrow" :class="{ up: expanded.D }"></text>
					</view>
				</view>
				<view v-if="expanded.D" class="module-content">
					<view class="question-item" v-for="q in moduleDQuestions" :key="q.id" :id="'q-' + q.id">
						<view class="question-header">
							<view class="q-tag">Q{{ q.id }}</view>
							<view class="q-title">{{ q.title }}</view>
							<view class="q-required" :class="{ required: q.required }">
								{{ q.required ? '必答' : '选答' }}
							</view>
						</view>
						<view class="q-desc" v-if="q.desc">{{ q.desc }}</view>
						
						<!-- 多选 -->
						<view v-if="q.type === 'multi'" class="options-list">
							<view 
								class="option" 
								v-for="(opt, oidx) in q.options" 
								:key="oidx"
								:class="{ active: (answers[q.id] || []).includes(oidx) }"
								@click="toggleMulti(q.id, oidx, q.max)"
							>
								<text class="option-text">{{ opt }}</text>
							</view>
							<view class="multi-hint">最多选 {{ q.max }} 项</view>
						</view>

						<!-- 单选 -->
						<view v-if="q.type === 'radio'" class="options-list">
							<view 
								class="option" 
								v-for="(opt, oidx) in q.options" 
								:key="oidx"
								:class="{ active: answers[q.id] === oidx }"
								@click="selectOption(q.id, oidx)"
							>
								<text class="option-text">{{ opt.text || opt }}</text>
							</view>
						</view>
					</view>
				</view>
			</view>

			<!-- E 使用预期 -->
			<view class="module" :class="{ expanded: expanded.E }">
				<view class="module-header" @click="toggleModule('E')">
					<view class="module-title">
						<text class="module-label">E</text>
						<text class="module-name">使用预期</text>
					</view>
					<view class="module-status">
						<text v-if="!expanded.E" class="fill-count">
							已填 {{ getModuleFilled('E') }}/{{ getModuleTotal('E') }} 题
						</text>
						<text class="arrow" :class="{ up: expanded.E }"></text>
					</view>
				</view>
				<view v-if="expanded.E" class="module-content">
					<view class="question-item" v-for="q in moduleEQuestions" :key="q.id" :id="'q-' + q.id">
						<view class="question-header">
							<view class="q-tag">Q{{ q.id }}</view>
							<view class="q-title">{{ q.title }}</view>
							<view class="q-required">选答</view>
						</view>
						
						<view v-if="q.type === 'multi'" class="options-list">
							<view 
								class="option" 
								v-for="(opt, oidx) in q.options" 
								:key="oidx"
								:class="{ active: (answers[q.id] || []).includes(oidx) }"
								@click="toggleMulti(q.id, oidx, q.max)"
							>
								<text class="option-text">{{ opt }}</text>
							</view>
							<view class="multi-hint">最多选 {{ q.max }} 项</view>
						</view>

						<view v-if="q.type === 'radio'" class="options-list">
							<view 
								class="option" 
								v-for="(opt, oidx) in q.options" 
								:key="oidx"
								:class="{ active: answers[q.id] === oidx }"
								@click="selectOption(q.id, oidx)"
							>
								<text class="option-text">{{ opt }}</text>
							</view>
						</view>
					</view>
				</view>
			</view>
		</view>

		<!-- 底部占位，给固定按钮留空间（加大防止遮挡） -->
		<view class="footer-spacer"></view>

		<!-- 底部固定区 -->
		<view class="footer-fixed">
			<!-- 未完成提示 -->
			<view v-if="unfinishedRequired.length > 0" class="unfinished-box">
				<view class="unfinished-title">
					<text class="warning-icon">⚠️</text>
					还有 {{ unfinishedRequired.length }} 道必答题未完成
				</view>
				<view class="unfinished-list">
					<text 
						class="unfinished-item" 
						v-for="qid in unfinishedRequired.slice(0, 5)" 
						:key="qid"
						@click="jumpToQuestion(qid)"
					>
						Q{{ qid }}
					</text>
					<text v-if="unfinishedRequired.length > 5" class="unfinished-more">...</text>
				</view>
			</view>

			<!-- 提交按钮 -->
			<button 
				class="submit-btn" 
				:disabled="!canSubmit"
				:class="{ disabled: !canSubmit }"
				@click="submit"
			>
				{{ canSubmit ? '提交问卷' : `还差 ${unfinishedRequired.length} 道必答题` }}
			</button>

			<!-- 合规声明 -->
			<view class="compliance">
				<image class="compliance-icon" src="/static/shield.png" mode="aspectFit" />
				<text class="compliance-text">信息仅用于为孩子定制学习内容，不会对外分享</text>
			</view>
		</view>

		<!-- 回首页确认弹窗 -->
		<view v-if="showHomeModal" class="modal-mask" @click="showHomeModal = false">
			<view class="modal-box" @click.stop>
				<view class="modal-title">提示</view>
				<view class="modal-desc">您已选的题目选项会保存，下次进入问卷页时可以继续答题。</view>
				<view class="modal-btns">
					<view class="modal-btn modal-cancel" @click="showHomeModal = false">取消</view>
					<view class="modal-btn modal-confirm" @click="confirmGoHome">确定</view>
				</view>
			</view>
		</view>
	</view>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import { request } from '@/utils/request'
import { saveProfile } from '@/api/index'

// ========== 题目数据（按文档） ==========
const moduleAQuestions = ref([
	{ id: 1, title: '今年9月，孩子升几年级？', type: 'radio', required: true, options: ['一年级', '二年级', '三年级', '四年级', '五年级', '六年级'] },
	{ id: 2, title: '您觉得孩子目前的数学水平大致是？', type: 'radio', required: true, options: [
		{ text: '优秀，学得轻松', score: 5 },
		{ text: '良好，跟得上', score: 4 },
		{ text: '中等，偶尔吃力', score: 3 },
		{ text: '偏弱，比较吃力', score: 2 },
		{ text: '说不清，没太关注', score: 0 }
	]},
	{ id: 3, title: '怎么称呼孩子？', type: 'text', required: false, placeholder: '请输入孩子昵称', desc: '用于对话中称呼，如「乐乐」；不填则用「同学」' }
])

const moduleBQuestions = ref([
	{ id: 4, title: '平时数学作业主要谁辅导？', type: 'radio', required: true, options: ['孩子独立完成', '家长辅导', '祖辈/其他人', '校外老师辅导', '无人管'] },
	{ id: 5, title: '遇到不会做的数学题，孩子通常会？', type: 'radio', required: true, options: ['自己再想想', '马上问人', '先放着，等家长回来', '直接跳过'] },
	{ id: 6, title: '孩子的数学成绩最近半年大致是？', type: 'radio', required: true, options: ['稳定', '时好时坏', '有点下滑', '在进步', '不清楚'] },
	{ id: 7, title: '平时（或暑假）每天能安排多少时间学数学？', type: 'radio', required: true, options: ['15分钟以内', '15-30分钟', '30-60分钟', '60分钟以上'] },
	{ id: 8, title: '之前上过数学辅导班或网课吗？', type: 'radio', required: false, options: ['正在上', '上过，停了', '从没上过'] }
])

const moduleCQuestions = ref([
	{ id: 9, title: '孩子对数学有兴趣，愿意主动做数学题。', type: 'likert', required: true },
	{ id: 10, title: '遇到难题能坚持思考，不轻易放弃。', type: 'likert', required: true },
	{ id: 11, title: '孩子喜欢被表扬，表扬后学习劲头更足。', type: 'likert', required: true },
	{ id: 12, title: '孩子坐得住，能连续专注 15 分钟以上。', type: 'likert', required: true },
	{ id: 13, title: '孩子比较粗心，容易看错题或算错数。', type: 'likert', required: true },
	{ id: 14, title: '孩子喜欢挑战难题，觉得简单题没意思。', type: 'likert', required: true }
])

const moduleDQuestions = ref([
	{ id: 15, title: '孩子更喜欢哪种学习方式？', type: 'multi', required: true, max: 2, options: ['图文讲解', '闯关游戏', '听故事/情境', '直接做题', '挑战难题'] },
	{ id: 16, title: '讲解时，孩子更适合哪种节奏？', type: 'radio', required: false, options: ['一步一步慢慢讲，讲透为止', '先自己想，再听讲解对照', '讲关键步骤，其他自己推'] },
	{ id: 17, title: '孩子对「错题」的态度是？', type: 'radio', required: false, options: ['害怕，不想面对', '无所谓', '愿意订正', '会主动分析错因'] },
	{ id: 18, title: '孩子喜欢哪些情境主题？', type: 'multi', required: false, max: 3, options: ['动物', '运动', '美食', '太空/科技', '交通', '校园生活'] }
])

const moduleEQuestions = ref([
	{ id: 19, title: '希望产品主要帮孩子解决什么？', type: 'multi', required: false, max: 2, options: ['暑假预学下学期内容', '巩固本学期', '补基础（计算等）', '提优拔高'] },
	{ id: 20, title: '希望多久收到一次学习反馈？', type: 'radio', required: false, options: ['每天', '每周', '有重要情况再通知', '不需要'] },
	{ id: 21, title: '孩子每天使用电子设备有没有时长限制？', type: 'radio', required: false, options: ['有，很严格', '有，比较宽松', '没有限制'] }
])

// ========== 折叠状态（用独立 ref 避免响应性问题） ==========
const expandedA = ref(true)
const expandedB = ref(false)
const expandedC = ref(false)
const expandedD = ref(false)
const expandedE = ref(false)

const expanded = computed(() => ({
	A: expandedA.value,
	B: expandedB.value,
	C: expandedC.value,
	D: expandedD.value,
	E: expandedE.value
}))

function toggleModule(key) {
	if (key === 'A') expandedA.value = !expandedA.value
	else if (key === 'B') expandedB.value = !expandedB.value
	else if (key === 'C') expandedC.value = !expandedC.value
	else if (key === 'D') expandedD.value = !expandedD.value
	else if (key === 'E') expandedE.value = !expandedE.value
}

function expandAll() {
	expandedA.value = true
	expandedB.value = true
	expandedC.value = true
	expandedD.value = true
	expandedE.value = true
}

function collapseAll() {
	expandedA.value = false
	expandedB.value = false
	expandedC.value = false
	expandedD.value = false
	expandedE.value = false
}

// ========== 回首页弹窗 ==========
const showHomeModal = ref(false)

function goHome() {
	showHomeModal.value = true
}

async function confirmGoHome() {
	showHomeModal.value = false
	// 保存到后端（与 saveDraft 相同逻辑）
	await saveToBackend()
	uni.reLaunch({ url: '/pages/index/index' })
}

// ========== 答题状态 ==========
const answers = ref({})

function selectOption(qid, idx) {
	answers.value[qid] = idx
}

function toggleMulti(qid, idx, max) {
	const current = answers.value[qid] || []
	if (current.includes(idx)) {
		answers.value[qid] = current.filter(i => i !== idx)
	} else if (current.length < max) {
		answers.value[qid] = [...current, idx]
	}
}

// 滑动条宽度计算
function getSliderWidth(qid) {
	const val = answers.value[qid]
	if (val === undefined || val === null) return '0%'
	return ((val / 4) * 100) + '%'
}

// 李克特量表当前值（避免 0 被 falsy 吞掉）
function getLikertVal(qid) {
	const val = answers.value[qid]
	return (val !== undefined && val !== null) ? val : -1
}

// ========== 后端保存/加载 ==========
function getStudentId() {
	const user = uni.getStorageSync('user')
	return user?.id || null
}

async function saveToBackend() {
	const studentId = getStudentId()
	if (!studentId) {
		// 未登录，存本地
		uni.setStorageSync('questionnaireDraft', { answers: answers.value, savedAt: new Date().toISOString() })
		return
	}

	try {
		await request({
			url: `/api/students/${studentId}/profile`,
			method: 'POST',
			data: {
				extra: JSON.stringify(answers.value)
			}
		})
		// 同步更新 cachedProfile 缓存
		const cached = uni.getStorageSync('cachedProfile')
		if (cached) {
			cached.extra = JSON.stringify(answers.value)
			uni.setStorageSync('cachedProfile', cached)
		}
		// 同时存本地备份
		uni.setStorageSync('questionnaireDraft', { answers: answers.value, savedAt: new Date().toISOString() })
	} catch (e) {
		console.error('[问卷] 保存失败，存本地', e)
		uni.setStorageSync('questionnaireDraft', { answers: answers.value, savedAt: new Date().toISOString() })
	}
}

async function loadFromBackend() {
	const studentId = getStudentId()
	if (!studentId) return

	// 优先读缓存，不调接口
	const cached = uni.getStorageSync('cachedProfile')
	if (cached && cached.extra) {
		try {
			const saved = JSON.parse(cached.extra)
			Object.keys(saved).forEach(k => {
				answers.value[k] = saved[k]
			})
			console.log('[问卷] 从缓存恢复答案')
			return
		} catch (e) {
			console.error('[问卷] 缓存解析失败', e)
		}
	}

	// 缓存不存在或无 extra，不调接口，选项留空
}

// ========== 保存草稿 ==========
async function saveDraft() {
	uni.showLoading({ title: '保存中...' })
	await saveToBackend()
	setTimeout(() => {
		uni.hideLoading()
		uni.showToast({ title: '已保存', icon: 'success' })
	}, 300)
}

// ========== 统计 ==========
const allQuestions = [
	...moduleAQuestions.value, ...moduleBQuestions.value,
	...moduleCQuestions.value, ...moduleDQuestions.value, ...moduleEQuestions.value
]

const requiredQuestions = allQuestions.filter(q => q.required)

const completedRequired = computed(() => {
	return requiredQuestions.filter(q => {
		const ans = answers.value[q.id]
		if (q.type === 'multi') return ans && ans.length > 0
		return ans !== undefined && ans !== ''
	}).length
})

const unfinishedRequired = computed(() => {
	return requiredQuestions.filter(q => {
		const ans = answers.value[q.id]
		if (q.type === 'multi') return !ans || ans.length === 0
		return ans === undefined || ans === ''
	}).map(q => q.id)
})

const canSubmit = computed(() => unfinishedRequired.value.length === 0)

function getModuleFilled(key) {
	const list = { A: moduleAQuestions.value, B: moduleBQuestions.value, C: moduleCQuestions.value, D: moduleDQuestions.value, E: moduleEQuestions.value }[key]
	return list.filter(q => {
		const ans = answers.value[q.id]
		if (q.type === 'multi') return ans && ans.length > 0
		return ans !== undefined && ans !== ''
	}).length
}

function getModuleTotal(key) {
	const list = { A: moduleAQuestions.value, B: moduleBQuestions.value, C: moduleCQuestions.value, D: moduleDQuestions.value, E: moduleEQuestions.value }[key]
	return list.length
}

// ========== 跳转 ==========
function jumpToQuestion(qid) {
	let module = 'A'
	if (qid >= 4 && qid <= 8) module = 'B'
	else if (qid >= 9 && qid <= 14) module = 'C'
	else if (qid >= 15 && qid <= 18) module = 'D'
	else if (qid >= 19) module = 'E'
	
	toggleModule(module)
	if (module !== 'A') {
		// 确保目标模块展开
		if (module === 'B') expandedB.value = true
		else if (module === 'C') expandedC.value = true
		else if (module === 'D') expandedD.value = true
		else if (module === 'E') expandedE.value = true
	} else {
		expandedA.value = true
	}
	
	setTimeout(() => {
		uni.createSelectorQuery().select('#q-' + qid).boundingClientRect(rect => {
			if (rect) {
				uni.pageScrollTo({ scrollTop: rect.top - 200, duration: 300 })
			}
		}).exec()
	}, 150)
}

// ========== 提交 ==========
async function submit() {
	if (!canSubmit.value) return
	
	uni.showLoading({ title: '保存中...' })
	
	await saveToBackend()
	
	let saved = false
	// 真正提交画像到后端
	const studentId = getStudentId()
	if (studentId) {
		try {
			const profile = buildProfile()
			const res = await saveProfile(studentId, profile)
			if (res.code === 0) saved = true
			// 提交后更新缓存
			if (saved) {
				uni.setStorageSync('cachedProfile', { ...profile, ...res.data })
				// 重新拉摸底状态缓存
				try {
					const { getAssessmentStatus } = await import('@/api/index')
					const aRes = await getAssessmentStatus()
					if (aRes && aRes.code === 0 && aRes.data) {
						uni.setStorageSync('cachedAssessmentStatus', aRes.data.status || 'none')
					}
				} catch (e) { /* ignore */ }
			}
			console.log('画像已保存到后端:', profile, 'res:', res)
		} catch (e) {
			console.error('画像保存失败:', e)
		}
	}
	
	setTimeout(() => {
		uni.hideLoading()
		if (saved) {
			uni.setStorageSync('hasProfile', true)
			uni.showToast({ title: '问卷已保存', icon: 'success' })
		} else {
			uni.showToast({ title: '保存失败，请重试', icon: 'none' })
		}
		setTimeout(() => {
			if (saved) uni.reLaunch({ url: '/pages/index/index' })
		}, 800)
	}, 500)
}

function buildProfile() {
	const a = answers.value
	return {
		gradeSep: a[1] !== undefined ? a[1] + 1 : null,
		nickname: a[3] || null,
		academicLevel: a[2] !== undefined ? ['E','D','C','B','A'][a[2]] : null,
		// 扩展字段存完整答案
		extra: JSON.stringify(answers.value)
	}
}

// ========== 页面加载时恢复草稿 ==========
onMounted(() => {
	loadFromBackend()
})
</script>

<style scoped>
.questionnaire-page {
	min-height: 100vh;
	background: linear-gradient(180deg, #FFFDF8 0%, #FFFEFB 100%);
	padding-bottom: 40rpx;
	position: relative;
}

/* 顶部栏 */
.top-bar {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	z-index: 100;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 20rpx 32rpx;
	background: #FFFFFF;
}

.home-icon {
	width: 64rpx;
	height: 64rpx;
	display: flex;
	align-items: center;
	justify-content: center;
}

.home-icon-img {
	width: 36rpx;
	height: 36rpx;
}

.save-btn {
	padding: 9rpx 28rpx 12rpx 28rpx;
	background: #F0A000;
	border-radius: 28rpx;
}

.save-text {
	font-size: 26rpx;
	color: #FFFFFF;
	font-weight: 500;
}

/* 标题区 */
.header {
	padding: 100rpx 32rpx 24rpx;
}

.section-title {
	font-size: 40rpx;
	font-weight: 700;
	color: #1F2937;
	margin-bottom: 12rpx;
}

.section-desc {
	font-size: 26rpx;
	color: #6B7280;
	margin-bottom: 24rpx;
}

.stats-row {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.stats-tag {
	font-size: 24rpx;
	color: #F0A000;
	font-weight: 500;
	background: #FFF4DC;
	padding: 10rpx 20rpx;
	border-radius: 24rpx;
}

.quick-actions {
	display: flex;
	align-items: center;
	gap: 16rpx;
	font-size: 24rpx;
}

.action-link {
	color: #F0A000;
}

.action-divider {
	color: #D1D5DB;
}

/* 模块列表 */
.modules-list {
	padding: 0 24rpx;
}

.module {
	margin-bottom: 20rpx;
	background: #FFFFFF;
	border-radius: 20rpx;
	overflow: hidden;
	box-shadow: 0 2rpx 12rpx rgba(0,0,0,0.04);
}

.module-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 28rpx 32rpx;
	background: #FFF4DC;
}

.module-title {
	display: flex;
	align-items: center;
	gap: 16rpx;
}

.module-label {
	width: 44rpx;
	height: 44rpx;
	background: #F0A000;
	color: #FFFFFF;
	font-size: 24rpx;
	font-weight: 600;
	border-radius: 12rpx;
	display: flex;
	align-items: center;
	justify-content: center;
}

.module-name {
	font-size: 30rpx;
	font-weight: 600;
	color: #1F2937;
}

.module-status {
	display: flex;
	align-items: center;
	gap: 16rpx;
}

.fill-count {
	font-size: 24rpx;
	color: #F0A000;
}

.arrow {
	width: 0;
	height: 0;
	border-left: 10rpx solid transparent;
	border-right: 10rpx solid transparent;
	border-top: 10rpx solid #F0A000;
	transition: transform 0.3s;
}

.arrow.up {
	transform: rotate(180deg);
}

.module-content {
	padding: 8rpx 0;
}

/* 题目 */
.question-item {
	padding: 28rpx 32rpx;
	border-bottom: 1rpx solid #F3F4F6;
}

.question-item:last-child {
	border-bottom: none;
}

.question-header {
	display: flex;
	align-items: flex-start;
	gap: 16rpx;
	margin-bottom: 20rpx;
}

.q-tag {
	width: 56rpx;
	height: 36rpx;
	background: #FFF4DC;
	color: #F0A000;
	font-size: 22rpx;
	font-weight: 600;
	border-radius: 8rpx;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-shrink: 0;
}

.q-title {
	flex: 1;
	font-size: 30rpx;
	font-weight: 500;
	color: #1F2937;
	line-height: 1.4;
}

.q-required {
	font-size: 22rpx;
	color: #9CA3AF;
	background: #F3F4F6;
	padding: 6rpx 14rpx;
	border-radius: 8rpx;
	flex-shrink: 0;
}

.q-required.required {
	color: #F0A000;
	background: #FFF4DC;
}

.q-desc {
	font-size: 24rpx;
	color: #9CA3AF;
	margin: -12rpx 0 20rpx 72rpx;
}

/* 选项列表 */
.options-list {
	display: flex;
	flex-direction: column;
	gap: 16rpx;
}

.option {
	padding: 24rpx 28rpx;
	background: #F9FAFB;
	border-radius: 12rpx;
	border: 2rpx solid transparent;
	transition: all 0.2s;
}

.option.active {
	background: #FFF4DC;
	border-color: #F0A000;
}

.option-text {
	font-size: 28rpx;
	color: #374151;
}

.option.active .option-text {
	color: #1F2937;
	font-weight: 500;
}

.multi-hint {
	font-size: 22rpx;
	color: #9CA3AF;
	margin-top: 8rpx;
}

/* 填空 */
.text-wrap {
	padding-left: 72rpx;
}

.text-input {
	height: 88rpx;
	background: #F9FAFB;
	border-radius: 12rpx;
	padding: 0 24rpx;
	font-size: 28rpx;
	color: #1F2937;
	border: 2rpx solid transparent;
}

.text-input:focus {
	border-color: #F0A000;
}

.ph {
	color: #C4C9D1;
}

/* 滑动条式李克特量表 */
.slider-scale {
	padding-left: 72rpx;
	padding-right: 16rpx;
}

.slider-labels {
	display: flex;
	justify-content: space-between;
	margin-bottom: 16rpx;
}

.slider-label {
	font-size: 22rpx;
	color: #9CA3AF;
}

.slider-track-wrap {
	position: relative;
	height: 60rpx;
	display: flex;
	align-items: center;
}

.slider-track {
	position: absolute;
	left: 20rpx;
	right: 20rpx;
	height: 16rpx;
	background: #F3F4F6;
	border-radius: 8rpx;
	overflow: hidden;
}

.slider-fill {
	height: 100%;
	background: linear-gradient(90deg, #FFC64D 0%, #F0A000 100%);
	border-radius: 8rpx;
	transition: width 0.3s ease;
}

.slider-points {
	position: relative;
	display: flex;
	justify-content: space-between;
	width: 100%;
	padding: 0 10rpx;
}

.slider-point {
	width: 40rpx;
	height: 40rpx;
	background: #FFFFFF;
	border: 4rpx solid #E5E7EB;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	z-index: 1;
	transition: all 0.2s;
}

.slider-point.active {
	border-color: #F0A000;
}

.slider-point.active .point-inner {
	width: 20rpx;
	height: 20rpx;
	background: #F0A000;
	border-radius: 50%;
}

/* 底部占位 */
.footer-spacer {
	height: 300rpx;
}

/* 底部固定区 */
.footer-fixed {
	position: fixed;
	left: 0;
	right: 0;
	bottom: 0;
	background: #FFFFFF;
	padding: 24rpx 32rpx;
	padding-bottom: calc(24rpx + env(safe-area-inset-bottom));
	box-shadow: 0 -4rpx 20rpx rgba(0,0,0,0.06);
	z-index: 100;
}

.unfinished-box {
	background: #FFF4DC;
	border-radius: 16rpx;
	padding: 20rpx 24rpx;
	margin-bottom: 20rpx;
}

.unfinished-title {
	font-size: 26rpx;
	color: #1F2937;
	font-weight: 500;
	display: flex;
	align-items: center;
	gap: 8rpx;
	margin-bottom: 12rpx;
}

.warning-icon {
	font-size: 28rpx;
}

.unfinished-list {
	display: flex;
	flex-wrap: wrap;
	gap: 12rpx;
}

.unfinished-item {
	font-size: 24rpx;
	color: #F0A000;
	background: #FFFFFF;
	padding: 8rpx 20rpx;
	border-radius: 8rpx;
	border: 1rpx solid #F0A000;
}

.unfinished-more {
	font-size: 24rpx;
	color: #9CA3AF;
}

.submit-btn {
	width: 100%;
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

.submit-btn::after {
	border: none;
}

.submit-btn.disabled {
	opacity: 0.6;
	background: #E5E7EB;
	color: #9CA3AF;
	box-shadow: none;
}

.compliance {
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 22rpx;
	color: #9CA3AF;
	margin-top: 16rpx;
}

.compliance-icon {
	width: 24rpx;
	height: 24rpx;
	margin-right: 6rpx;
}

/* 回首页确认弹窗 */
.modal-mask {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background: rgba(0, 0, 0, 0.5);
	z-index: 200;
	display: flex;
	align-items: center;
	justify-content: center;
}

.modal-box {
	width: 560rpx;
	background: #FFFFFF;
	border-radius: 24rpx;
	padding: 40rpx;
}

.modal-title {
	font-size: 34rpx;
	font-weight: 600;
	color: #1F2937;
	margin-bottom: 20rpx;
	text-align: center;
}

.modal-desc {
	font-size: 28rpx;
	color: #6B7280;
	line-height: 1.6;
	text-align: center;
	margin-bottom: 36rpx;
}

.modal-btns {
	display: flex;
	gap: 24rpx;
}

.modal-btn {
	flex: 1;
	height: 80rpx;
	line-height: 80rpx;
	text-align: center;
	border-radius: 40rpx;
	font-size: 30rpx;
	font-weight: 500;
}

.modal-cancel {
	background: #F3F4F6;
	color: #6B7280;
}

.modal-confirm {
	background: #F0A000;
	color: #FFFFFF;
}
</style>

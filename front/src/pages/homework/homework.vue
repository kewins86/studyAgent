<template>
	<view class="hw-page">
		<!-- 顶部栏 -->
		<view class="nav-bar">
			<view class="nav-left" @click="goBack">
				<text class="nav-back">‹</text>
			</view>
			<text class="nav-title">今日家作</text>
			<view class="nav-right"></view>
		</view>
		<text class="hw-date">{{ todayStr }}</text>

		<!-- 家作列表 -->
		<view v-if="items.length > 0" class="hw-list">
			<view v-for="item in items" :key="item.id" class="hw-card" :class="{'hw-card-done': isSubmitted(item)}">
				<view class="hw-card-top">
					<text class="hw-subject-tag" :class="'tag-' + item.subject">{{ item.subject }}</text>
					<text class="hw-type">{{ typeLabel(item.itemType) }}</text>
					<text class="hw-status" :class="{'st-done': isSubmitted(item)}">
						{{ isSubmitted(item) ? '✅ 已提交' : '📤 待提交' }}
					</text>
				</view>
				<text class="hw-content">{{ item.content }}</text>

				<!-- 已提交成果 -->
				<view v-if="item.doneImage" class="hw-done-imgs">
					<image v-for="(img, i) in item.doneImage.split(',')" :key="i"
						:src="img" mode="widthFix" class="hw-done-img" @click="previewImg(img, item.doneImage.split(','))" />
				</view>

				<view v-if="item.doneAudio" class="hw-audio-tag">
					🔊 录音已提交
				</view>

				<!-- 提交作业按钮 -->
				<view class="hw-actions">
					<!-- 书面作业：拍照 / 上传图片 -->
					<template v-if="item.itemType === 'written'">
						<button size="mini" @click="onPhotoDone(item, 'camera')">📷 拍照提交</button>
						<button size="mini" @click="onPhotoDone(item, 'album')">🖼 上传图片</button>
					</template>
					<!-- 朗读作业：语音 -->
					<button v-if="item.itemType === 'reading'" size="mini" @click="onAudioDone(item)">🎙️ 语音提交</button>
					<!-- 默写作业：拍照 + 语音 -->
					<template v-if="item.itemType === 'dictation'">
						<button size="mini" @click="onPhotoDone(item, 'camera')">📷 拍照提交</button>
						<button size="mini" @click="onAudioDone(item)">🎙️ 语音提交</button>
					</template>
				</view>
			</view>
		</view>

		<!-- 空状态 -->
		<view v-else class="hw-empty">
			<text class="hw-empty-icon">📝</text>
			<text class="hw-empty-text">还没有录入今天的家作</text>
			<button class="hw-empty-btn" @click="showAdd = true">录入家作</button>
		</view>

		<!-- 录入弹窗：拍照/录音/语音识别（底部工具栏，样式参考 chat 页） -->
		<view v-if="showAdd" class="hw-add-mask">
			<view class="hw-add-sheet">
				<view class="hw-add-header">
					<text class="hw-add-title">录入今日家作</text>
					<text class="hw-add-close" @click="closeAdd">✕</text>
				</view>

				<!-- 识别中 -->
				<view v-if="recognizing" class="hw-recognizing">
					<text class="hw-spin">⏳ AI 识别中...</text>
				</view>

				<!-- 识别结果（可编辑） -->
				<view v-if="recognized.length" class="hw-recognized">
					<view v-for="(row, i) in recognized" :key="i" class="hw-add-row">
						<picker class="hw-add-subject" :range="subjectOptions" @change="row.subject = subjectOptions[$event.detail.value]">
							<view class="hw-picker-display">{{ row.subject }}</view>
						</picker>
						<picker class="hw-add-type" :range="typeOptions" :range-key="'label'" @change="row.itemType = typeOptions[$event.detail.value].value">
							<view class="hw-picker-display">{{ typeLabel(row.itemType) }}</view>
						</picker>
						<input v-if="!((recordStatus === 'recording' || recordStatus === 'transcribing') && recordingRowIdx === i)" class="hw-add-content" v-model="row.content" placeholder="作业内容" />
						<view v-else-if="recordStatus === 'recording'" class="hw-add-content hw-transcribing">录音中……</view>
						<view v-else class="hw-add-content hw-transcribing">识别中……</view>
						<view class="hw-row-mic" :class="{recording: recordingRowIdx === i}" @click.stop="onRowMic(i)">
							<image src="/static/icon-mic.png" class="hw-row-mic-icon" mode="aspectFit" />
						</view>
						<text class="hw-add-del" @click="recognized.splice(i, 1)">✕</text>
					</view>
					<button size="mini" @click="recognized.push({ subject: '语文', itemType: 'written', content: '' })">+ 添加一项</button>
					<view class="hw-add-actions">
						<button class="hw-add-submit" @click="submitRecognized">✅ 确认提交</button>
						<button class="hw-add-retry" @click="resetRecognize">重新识别</button>
					</view>
				</view>

				<!-- 录入方式工具栏：语音 / 拍照 / 照片（与 chat 页一致） -->
				<view v-if="!recognized.length && !recognizing" class="hw-toolbar">
					<view class="hw-tool-item"
						:class="{ recording: toolRecordStatus === 'recording' }"
						@click="onRecognizeAudio"
					>
						<image src="/static/icon-mic.png" class="hw-tool-icon" mode="aspectFit" />
						<text class="hw-tool-label">{{ toolRecordStatus === 'recording' ? '停止' : toolRecordStatus === 'transcribing' ? '识别中…' : '语音' }}</text>
					</view>
					<view class="hw-tool-item" @click="onRecognizeCamera">
						<image src="/static/icon-camera.png" class="hw-tool-icon" mode="aspectFit" />
						<text class="hw-tool-label">拍照</text>
					</view>
					<view class="hw-tool-item" @click="onRecognizeAlbum">
						<image src="/static/icon-photo.png" class="hw-tool-icon" mode="aspectFit" />
						<text class="hw-tool-label">照片</text>
					</view>
				</view>

				<!-- 隐藏：手写识别（手动录入）— 暂时隐藏，代码保留不删
				<view v-if="manualMode && !recognized.length && !recognizing" class="hw-manual">
					<view v-for="(row, i) in addRows" :key="i" class="hw-add-row">
						<picker class="hw-add-subject" :range="subjectOptions" @change="row.subject = subjectOptions[$event.detail.value]">
							<view class="hw-picker-display">{{ row.subject }}</view>
						</picker>
						<picker class="hw-add-type" :range="typeOptions" :range-key="'label'" @change="row.itemType = typeOptions[$event.detail.value].value">
							<view class="hw-picker-display">{{ typeLabel(row.itemType) }}</view>
						</picker>
						<input class="hw-add-content" v-model="row.content" placeholder="作业内容" />
						<text class="hw-add-del" @click="addRows.splice(i, 1)">✕</text>
					</view>
					<button size="mini" @click="addRows.push({ subject: '语文', itemType: 'written', content: '' })">+ 添加一项</button>
					<button class="hw-add-submit" @click="submitItems">提交</button>
				</view>
				-->
			</view>
		</view>
	</view>
	<CropOverlay :visible="cropVisible" :src="cropSrc" @confirm="onCropConfirm" @cancel="onCropCancel" />
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import { onShow } from '@dcloudio/uni-app'
import CropOverlay from '@/components/CropOverlay.vue'
import { getTodayHomework, submitHomeworkItems, submitHomeworkResult, recognizeHomework, getAsrSignature } from '@/api/index'

const items = ref([])
const showAdd = ref(false)
const recognized = ref([])
const recognizing = ref(false)

const subjectOptions = ['语文', '数学', '英语']
const typeOptions = [
	{ label: '书面', value: 'written' },
	{ label: '朗读', value: 'reading' },
	{ label: '默写', value: 'dictation' }
]

const todayStr = computed(() => {
	const d = new Date()
	return `${d.getFullYear()}年${d.getMonth() + 1}月${d.getDate()}日`
})

// 判断某条作业是否已提交成果（今日家作页不再用 status 判断完成）
function isSubmitted(item) {
	if (!item) return false
	if (item.itemType === 'reading') return !!item.doneAudio
	if (item.itemType === 'dictation') return !!(item.doneImage && item.doneAudio)
	return !!item.doneImage // written 及其他
}

function typeLabel(t) {
	const found = typeOptions.find(o => o.value === t)
	return found ? found.label : '书面'
}

async function loadData() {
	try {
		const res = await getTodayHomework()
		// request() resolve 出的直接是 JSON 对象，不是 res.data
		if (res.code === 0 && res.data) {
			items.value = res.data.items || []
		}
	} catch (e) {
		console.log('loadHw err', e)
	}
}

function closeAdd() {
	// 录音中（正在采集）不允许关闭；识别中（转写/图片识别）允许关闭并取消识别
	if (recordStatus.value === 'recording' || toolRecordStatus.value === 'recording') return
	showAdd.value = false
	cancelRecognition()
	resetRecognize()
}

// 取消进行中的识别（语音转写 / 图片识别），丢弃其结果
function cancelRecognition() {
	if (recognizing.value) imageRecogCanceled = true
	asrAborted = true
	// #ifdef H5
	h5StreamOnResult = null
	h5StreamOnDone = null
	// #endif
	toolRecordStatus.value = ''
	toolRecording.value = false
	recognizing.value = false
}

function resetRecognize() {
	recognized.value = []
	recognizing.value = false
	cancelRowRecording()
	// 隐藏：手写识别
	// manualMode.value = false
}

// 取消行内录音/转写（「重新识别」「关闭弹窗」时清理，避免行内状态残留影响下次录音）
function cancelRowRecording() {
	// #ifdef H5
	if (rowMediaStream) rowMediaStream.getTracks().forEach(t => t.stop())
	if (rowScriptProcessor) rowScriptProcessor.disconnect()
	if (rowAudioContext) rowAudioContext.close()
	rowMediaStream = null
	rowScriptProcessor = null
	rowAudioContext = null
	rowPcmChunks = []
	// #endif
	// #ifndef H5
	if (recorderManager && recordStatus.value === 'recording') {
		rowCancelRequested = true
		recorderManager.stop()
	}
	// #endif
	recordStatus.value = ''
	isRecording.value = false
	recordingRowIdx.value = null
	recordTarget.value = null
}

// ============ 图片框选裁剪（复用 CropOverlay 组件） ============
const cropVisible = ref(false)
const cropSrc = ref('')
const cropTarget = ref(null)  // 'recognize' | { type: 'photo', item }

function onCropConfirm(base64, dataUrl) {
	cropVisible.value = false
	const target = cropTarget.value
	cropSrc.value = ''
	cropTarget.value = null
	if (target === 'recognize') {
		doRecognizeImageDataUrl(dataUrl)
	} else if (target && target.type === 'photo') {
		markPhotoDone(target.item, dataUrl)
	}
}

function onCropCancel() {
	cropVisible.value = false
	cropSrc.value = ''
	cropTarget.value = null
}

// 处理裁剪后的图片（dataUrl），二次缩放到最长边 1024 后识别
async function doRecognizeImageDataUrl(dataUrl) {
	imageRecogCanceled = false
	recognizing.value = true
	try {
		let base64 = dataUrl
		// #ifdef H5
		base64 = await new Promise((resolve, reject) => {
			const img = new Image()
			img.onload = () => {
				const maxSide = 1024
				const scale = Math.min(1, maxSide / Math.max(img.width, img.height))
				const w = Math.round(img.width * scale)
				const h = Math.round(img.height * scale)
				const canvas = document.createElement('canvas')
				canvas.width = w
				canvas.height = h
				canvas.getContext('2d').drawImage(img, 0, 0, w, h)
				resolve(canvas.toDataURL('image/jpeg', 0.75).split(',')[1])
				URL.revokeObjectURL(img.src)
			}
			img.onerror = () => reject(new Error('图片解码失败'))
			img.src = dataUrl
		})
		// #endif
		// #ifndef H5
		base64 = dataUrl.split(',')[1]
		// #endif
		const res = await recognizeHomework({ image: base64 })
		if (imageRecogCanceled) return
		if (res.code === 0 && res.data && res.data.length > 0) {
			recognized.value = res.data.map(d => ({
				subject: d.subject || '语文',
				itemType: d.itemType || 'written',
				content: d.content || ''
			}))
		} else if (res.code === 0 && (!res.data || res.data.length === 0)) {
			uni.showToast({ title: '未识别到家作内容', icon: 'none' })
		} else {
			uni.showToast({ title: res.message || '识别失败', icon: 'none' })
		}
	} catch (e) {
		console.log('recognize err', e)
		uni.showToast({ title: '识别失败，请重试或手动录入', icon: 'none' })
	} finally {
		recognizing.value = false
	}
}

// 裁剪后提交作业照片（只上传成果，不标记完成）
async function markPhotoDone(item, dataUrl) {
	try {
		const res = await submitHomeworkResult(item.id, { doneImage: dataUrl })
		if (res.code === 0) {
			uni.showToast({ title: '已提交', icon: 'success' })
			loadData()
		}
	} catch (e) {
		uni.showToast({ title: '操作失败', icon: 'none' })
	}
}

// ============ 家作图片识别（拍照 / 相册共用）============
async function doRecognizeImage(filePath) {
	imageRecogCanceled = false
	recognizing.value = true
	try {
		// #ifdef H5
		// 对齐 chat 页读取方式；H5 下 uni.compressImage 不可用，需自行用 canvas 缩放压缩，否则原图过大超出模型上下文窗口
		const base64 = await new Promise((resolve, reject) => {
			const xhr = new XMLHttpRequest()
			xhr.open('GET', filePath, true)
			xhr.responseType = 'blob'
			xhr.onload = () => {
				const blob = xhr.response
				const img = new Image()
				img.onload = () => {
					const maxSide = 1024
					const scale = Math.min(1, maxSide / Math.max(img.width, img.height))
					const w = Math.round(img.width * scale)
					const h = Math.round(img.height * scale)
					const canvas = document.createElement('canvas')
					canvas.width = w
					canvas.height = h
					canvas.getContext('2d').drawImage(img, 0, 0, w, h)
					const dataUrl = canvas.toDataURL('image/jpeg', 0.75)
					resolve(dataUrl.split(',')[1])
					URL.revokeObjectURL(img.src)
				}
				img.onerror = () => reject(new Error('图片解码失败'))
				img.src = URL.createObjectURL(blob)
			}
			xhr.onerror = () => reject(new Error('图片读取失败'))
			xhr.send()
		})
		const res = await recognizeHomework({ image: base64 })
		// #endif
		// #ifndef H5
		const r = await new Promise((resolve, reject) => {
			uni.getFileSystemManager().readFile({
				filePath,
				encoding: 'base64',
				success: resolve,
				fail: reject
			})
		})
		const res = await recognizeHomework({ image: r.data })
		// #endif
		if (imageRecogCanceled) return
		if (res.code === 0 && res.data && res.data.length > 0) {
			recognized.value = res.data.map(d => ({
				subject: d.subject || '语文',
				itemType: d.itemType || 'written',
				content: d.content || ''
			}))
		} else if (res.code === 0 && (!res.data || res.data.length === 0)) {
			uni.showToast({ title: '未识别到家作内容', icon: 'none' })
		} else {
			uni.showToast({ title: res.message || '识别失败', icon: 'none' })
		}
	} catch (e) {
		console.log('recognize err', e)
		uni.showToast({ title: '识别失败，请重试或手动录入', icon: 'none' })
	} finally {
		recognizing.value = false
	}
}

function onRecognizeCamera() {
	if (recordStatus.value || toolRecordStatus.value) return
	uni.chooseImage({
		count: 1,
		sizeType: ['original'],
		sourceType: ['camera'],
		success: (res) => {
			cropSrc.value = res.tempFilePaths[0]
			cropTarget.value = 'recognize'
			cropVisible.value = true
		}
	})
}

function onRecognizeAlbum() {
	if (recordStatus.value || toolRecordStatus.value) return
	uni.chooseImage({
		count: 1,
		sizeType: ['compressed'],
		sourceType: ['album'],
		success: (res) => {
			cropSrc.value = res.tempFilePaths[0]
			cropTarget.value = 'recognize'
			cropVisible.value = true
		}
	})
}

// ============ 语音录入 ASR（与 chat 页实现一致）============
const isRecording = ref(false)          // 行内语音（H5）录音标志
const recordStatus = ref('')            // 行内语音 '' | 'recording' | 'transcribing'
const recordingRowIdx = ref(null)       // 当前正在录音/转写的行索引（行内语音），null 表示未在行内语音
const recordTarget = ref(null)          // null | { kind: 'toolbar' } | { kind: 'row', idx: number }，分派非H5 recorderManager.onStop 目标
const toolRecording = ref(false)        // 工具栏「语音」H5 录音标志（与行内语音独立）
const toolRecordStatus = ref('')        // 工具栏「语音」 '' | 'recording' | 'transcribing'（与行内语音独立）
let asrAborted = false                  // 语音转写取消标志（关闭弹窗时丢弃转写结果）
let imageRecogCanceled = false          // 图片识别取消标志（关闭弹窗时丢弃识别结果）
// #ifndef H5
let rowCancelRequested = false          // 行内录音被「重新识别」取消时，阻止 onStop 误转写
// #endif

// #ifndef H5
const recorderManager = uni.getRecorderManager ? uni.getRecorderManager() : null
if (recorderManager) recorderManager.onStop((res) => {
	if (rowCancelRequested) {
		rowCancelRequested = false
		recordStatus.value = ''
		isRecording.value = false
		recordingRowIdx.value = null
		recordTarget.value = null
		return
	}
	if (res.duration < 500) {
		recordStatus.value = ''
		isRecording.value = false
		recordingRowIdx.value = null
		recordTarget.value = null
		return
	}
	recordStatus.value = 'transcribing'
	const target = recordTarget.value
	recordTarget.value = null
	if (target && target.kind === 'row') {
		const idx = target.idx
		transcribeAudio(res.tempFilePath, (text) => {
			if (recognized.value[idx]) {
				recognized.value[idx].content = text
			}
			recordingRowIdx.value = null
		}, 'row')
	} else {
		transcribeAudio(res.tempFilePath)
	}
})
if (recorderManager) recorderManager.onError((err) => {
	console.error('[录音] 错误', err)
	uni.showToast({ title: '录音失败', icon: 'none' })
	if (recordTarget.value && recordTarget.value.kind === 'toolbar') {
		toolRecordStatus.value = ''
		toolRecording.value = false
	} else {
		recordStatus.value = ''
		isRecording.value = false
		recordingRowIdx.value = null
	}
	recordTarget.value = null
})
// #endif

// #ifdef H5
let h5AudioContext = null
let h5MediaStream = null
let h5ScriptProcessor = null
let h5PcmChunks = []
let h5RecordStartTime = 0
let h5StreamSigPromise = null
let h5StreamOnResult = null
let h5StreamOnDone = null

function pcmToBase64(pcmData) {
	const bytes = new Uint8Array(pcmData.buffer)
	let binary = ''
	for (let i = 0; i < bytes.byteLength; i++) {
		binary += String.fromCharCode(bytes[i])
	}
	return btoa(binary)
}

async function startH5Recording(onResult, onDone) {
	function getUserMediaCompat(constraints) {
		if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
			return navigator.mediaDevices.getUserMedia(constraints)
		}
		if (navigator.webkitGetUserMedia) {
			return new Promise((resolve, reject) => {
				navigator.webkitGetUserMedia(constraints, resolve, reject)
			})
		}
		return Promise.reject(new Error('getUserMedia not supported'))
	}

	h5StreamOnResult = onResult || null
	h5StreamOnDone = onDone || null
	h5PcmChunks = []
	h5RecordStartTime = Date.now()

	h5StreamSigPromise = getAsrSignature().then(sigRes => {
		if (!sigRes || sigRes.code !== 0) {
			console.error('[ASR] 获取签名失败')
			return null
		}
		const sig = sigRes.data
		uni.setStorageSync('xfAppId', sig.appId || '')
		const wsUrl = 'wss://' + sig.host + sig.path + '?authorization=' + sig.authorization + '&date=' + sig.date + '&host=' + sig.host
		return new Promise((resolve) => {
			try {
				const ws = new WebSocket(wsUrl)
				ws.onopen = () => { resolve(ws) }
				ws.onmessage = (event) => {
					try {
						const data = JSON.parse(event.data)
						if (data.code !== 0 && data.code !== undefined) return
						const result = data.data && data.data.result
						if (result && result.ws) {
							let text = ''
							for (const w of result.ws) {
								if (w.cw) for (const c of w.cw) text += c.w
							}
							if (text && h5StreamOnResult) h5StreamOnResult(text)
						}
					} catch (e) {}
				}
				ws.onerror = () => { resolve(null) }
				ws.onclose = () => {
					if (h5StreamOnDone) {
						h5StreamOnDone()
						h5StreamOnDone = null
					}
				}
			} catch (e) {
				resolve(null)
			}
		})
	}).catch(() => null)

	try {
		const stream = await getUserMediaCompat({ audio: true })
		const audioContext = new (window.AudioContext || window.webkitAudioContext)({ sampleRate: 16000 })
		const source = audioContext.createMediaStreamSource(stream)
		const processor = audioContext.createScriptProcessor(4096, 1, 1)
		processor.onaudioprocess = (e) => {
			const inputData = e.inputBuffer.getChannelData(0)
			const pcmData = new Int16Array(inputData.length)
			for (let i = 0; i < inputData.length; i++) {
				pcmData[i] = Math.max(-1, Math.min(1, inputData[i])) * 0x7FFF
			}
			h5PcmChunks.push(pcmData)
		}
		source.connect(processor)
		processor.connect(audioContext.destination)
		h5AudioContext = audioContext
		h5MediaStream = stream
		h5ScriptProcessor = processor
		toolRecording.value = true
		toolRecordStatus.value = 'recording'
	} catch (err) {
		uni.showToast({ title: '无法访问麦克风，请检查权限', icon: 'none' })
		h5StreamOnResult = null
		h5StreamOnDone = null
	}
}

function stopH5Recording() {
	if (h5MediaStream) { h5MediaStream.getTracks().forEach(track => track.stop()) }
	if (h5ScriptProcessor) { h5ScriptProcessor.disconnect() }
	if (h5AudioContext) { h5AudioContext.close() }

	const duration = Date.now() - h5RecordStartTime
	if (duration < 500) {
		toolRecordStatus.value = ''
		toolRecording.value = false
		h5StreamOnDone = null
		h5StreamOnResult = null
		return
	}

	toolRecordStatus.value = 'transcribing'
	toolRecording.value = false

	const totalLength = h5PcmChunks.reduce((sum, chunk) => sum + chunk.length, 0)
	if (totalLength === 0) {
		toolRecordStatus.value = ''
		return
	}
	const mergedPcm = new Int16Array(totalLength)
	let offset = 0
	for (const chunk of h5PcmChunks) {
		mergedPcm.set(chunk, offset)
		offset += chunk.length
	}
	const pcmBase64 = pcmToBase64(mergedPcm)

	h5StreamSigPromise.then(ws => {
		if (ws && ws.readyState === 1) {
			const chunkSize = 12288
			let sentFirst = false
			for (let i = 0; i < pcmBase64.length; i += chunkSize) {
				const chunk = pcmBase64.slice(i, i + chunkSize)
				const frame = {
					data: {
						status: sentFirst ? 1 : 0,
						format: 'audio/L16;rate=16000',
						encoding: 'raw',
						audio: chunk
					}
				}
				if (!sentFirst) {
					frame.common = { app_id: uni.getStorageSync('xfAppId') || '' }
					frame.business = { domain: 'iat', language: 'zh_cn', accent: 'mandarin', vad_eos: 2000, dwa: 'wpgs' }
					sentFirst = true
				}
				ws.send(JSON.stringify(frame))
			}
			ws.send(JSON.stringify({ data: { status: 2, format: 'audio/L16;rate=16000', encoding: 'raw', audio: '' } }))
		} else {
			console.warn('[ASR] WS 未就绪，降级全量发送')
			transcribeAudio(pcmBase64)
		}
	})
}
// #endif

// 读取文件为 base64（兼容 H5/App）
function readFileToBase64(filePath) {
	return new Promise((resolve, reject) => {
		// #ifdef H5
		fetch(filePath)
			.then(res => res.blob())
			.then(blob => {
				const reader = new FileReader()
				reader.onload = () => resolve(reader.result.split(',')[1])
				reader.onerror = reject
				reader.readAsDataURL(blob)
			})
			.catch(reject)
		// #endif
		// #ifndef H5
		uni.getFileSystemManager().readFile({
			filePath,
			encoding: 'base64',
			success: res => resolve(res.data),
			fail: reject
		})
		// #endif
	})
}

async function transcribeAudio(audioSource, onTextReady, target = 'toolbar') {
	asrAborted = false
	const clearRecStatus = () => {
		if (target === 'row') recordStatus.value = ''
		else toolRecordStatus.value = ''
	}
	try {
		const sigRes = await getAsrSignature()
		if (!sigRes || sigRes.code !== 0) throw new Error('获取签名失败')
		const sig = sigRes.data

		let audioBase64
		if (typeof audioSource === 'string' && (audioSource.startsWith('/') || audioSource.startsWith('http'))) {
			audioBase64 = await readFileToBase64(audioSource)
		} else {
			audioBase64 = audioSource
		}

		const wsUrl = `wss://${sig.host}${sig.path}?authorization=${encodeURIComponent(sig.authorization)}&date=${encodeURIComponent(sig.date)}&host=${encodeURIComponent(sig.host)}`
		let ws
		let resultText = ''

		// #ifdef H5
		ws = new WebSocket(wsUrl)
		ws.onopen = () => {
			const firstFrame = {
				common: { app_id: sig.appId },
				business: { domain: 'iat', language: 'zh_cn', accent: 'mandarin', vad_eos: 2000, dwa: 'wpgs' },
				data: { status: 0, format: 'audio/L16;rate=16000', encoding: 'raw', audio: audioBase64.substring(0, Math.min(audioBase64.length, 12288)) }
			}
			ws.send(JSON.stringify(firstFrame))
			let offset = 12288
			const chunkSize = 12288
			while (offset < audioBase64.length) {
				const chunk = audioBase64.substring(offset, offset + chunkSize)
				const isLast = offset + chunkSize >= audioBase64.length
				ws.send(JSON.stringify({ data: { status: isLast ? 2 : 1, format: 'audio/L16;rate=16000', encoding: 'raw', audio: chunk } }))
				offset += chunkSize
			}
			if (audioBase64.length <= 12288) {
				ws.send(JSON.stringify({ data: { status: 2, format: 'audio/L16;rate=16000', encoding: 'raw', audio: '' } }))
			}
		}
		ws.onmessage = (event) => {
			const data = JSON.parse(event.data)
			if (data.code && data.code !== 0) return
			if (data.data && data.data.result && data.data.result.ws) {
				let text = ''
				data.data.result.ws.forEach(cw => { cw.cw.forEach(w => { text += w.w }) })
				resultText = text
			}
		}
		ws.onerror = () => {
			clearRecStatus()
			uni.showToast({ title: '语音识别失败', icon: 'none' })
		}
		ws.onclose = () => {
			clearRecStatus()
			if (asrAborted) { asrAborted = false; return }
			if (resultText.trim()) {
				if (onTextReady) onTextReady(resultText.trim())
				else doRecognizeText(resultText.trim())
			} else {
				uni.showToast({ title: '没听清，请重试', icon: 'none' })
			}
		}
		// #endif

		// #ifndef H5
		ws = uni.connectSocket({ url: wsUrl, protocols: ['binary'] })
		ws.onOpen(() => {
			const firstFrame = {
				common: { app_id: sig.appId },
				business: { domain: 'iat', language: 'zh_cn', accent: 'mandarin', vad_eos: 2000, dwa: 'wpgs' },
				data: { status: 0, format: 'audio/L16;rate=16000', encoding: 'raw', audio: audioBase64.substring(0, Math.min(audioBase64.length, 12288)) }
			}
			ws.send({ data: JSON.stringify(firstFrame) })
			let offset = 12288
			const chunkSize = 12288
			while (offset < audioBase64.length) {
				const chunk = audioBase64.substring(offset, offset + chunkSize)
				const isLast = offset + chunkSize >= audioBase64.length
				ws.send({ data: JSON.stringify({ data: { status: isLast ? 2 : 1, format: 'audio/L16;rate=16000', encoding: 'raw', audio: chunk } }) })
				offset += chunkSize
			}
			if (audioBase64.length <= 12288) {
				ws.send({ data: JSON.stringify({ data: { status: 2, format: 'audio/L16;rate=16000', encoding: 'raw', audio: '' } }) })
			}
		})
		ws.onMessage((res) => {
			const data = JSON.parse(res.data)
			if (data.code && data.code !== 0) return
			if (data.data && data.data.result && data.data.result.ws) {
				let text = ''
				data.data.result.ws.forEach(cw => { cw.cw.forEach(w => { text += w.w }) })
				resultText = text
			}
			if (data.data && data.data.status === 2) ws.close()
		})
		ws.onError(() => {
			clearRecStatus()
			uni.showToast({ title: '语音识别失败', icon: 'none' })
		})
		ws.onClose(() => {
			clearRecStatus()
			if (asrAborted) { asrAborted = false; return }
			if (resultText.trim()) {
				if (onTextReady) onTextReady(resultText.trim())
				else doRecognizeText(resultText.trim())
			} else {
				uni.showToast({ title: '没听清，请重试', icon: 'none' })
			}
		})
		// #endif
	} catch (e) {
		console.error('[ASR] 转写失败', e)
		clearRecStatus()
		uni.showToast({ title: '语音识别失败', icon: 'none' })
	}
}

function onRecognizeAudio() {
	if (toolRecordStatus.value === 'transcribing') return
	if (recordStatus.value === 'recording' || recordStatus.value === 'transcribing') {
		uni.showToast({ title: '请先完成当前项的录音', icon: 'none' })
		return
	}
	// #ifdef H5
	if (toolRecording.value) {
		stopH5Recording()
	} else {
		let accumulated = ''
		startH5Recording(
			(text) => { accumulated += text },
			() => {
				toolRecordStatus.value = ''
				toolRecording.value = false
				if (accumulated.trim()) {
					doRecognizeText(accumulated.trim())
				} else {
					uni.showToast({ title: '没听清，请重试', icon: 'none' })
				}
			}
		)
	}
	// #endif
	// #ifndef H5
	if (!recorderManager) {
		uni.showToast({ title: '当前环境不支持录音', icon: 'none' })
		return
	}
	if (toolRecording.value) {
		toolRecording.value = false
		recorderManager.stop()
	} else {
		toolRecording.value = true
		toolRecordStatus.value = 'recording'
		recordTarget.value = { kind: 'toolbar' }
		recorderManager.start({ format: 'aac', sampleRate: 16000, numberOfChannels: 1, encodeBitRate: 32000 })
	}
	// #endif
}

// 行内语音：每项输入框后的语音图标，复用前面的语音能力（图标/录音/ASR），识别结果直接填入该项 content
function onRowMic(i) {
	if (recordStatus.value === 'transcribing') return
	if (toolRecordStatus.value === 'recording' || toolRecordStatus.value === 'transcribing') {
		uni.showToast({ title: '请先完成上方语音录入', icon: 'none' })
		return
	}
	if (recordStatus.value === 'recording') {
		if (recordingRowIdx.value === i) {
			stopRowRecord()
		} else {
			uni.showToast({ title: '请先完成当前录音', icon: 'none' })
		}
		return
	}
	startRowRecord(i)
}

function startRowRecord(i) {
	// #ifdef H5
	recordingRowIdx.value = i
	startH5RowRecording()
	// #endif
	// #ifndef H5
	if (!recorderManager) {
		uni.showToast({ title: '当前环境不支持录音', icon: 'none' })
		return
	}
	recordingRowIdx.value = i
	isRecording.value = true
	recordStatus.value = 'recording'
	recordTarget.value = { kind: 'row', idx: i }
	recorderManager.start({ format: 'aac', sampleRate: 16000, numberOfChannels: 1, encodeBitRate: 32000 })
	// #endif
}

function stopRowRecord() {
	// #ifdef H5
	const idx = recordingRowIdx.value
	stopH5RowRecording(idx)
	// #endif
	// #ifndef H5
	if (recorderManager) recorderManager.stop()
	// #endif
}

// #ifdef H5
// 行内语音专用（H5）：只采集 PCM，点击停止后才建 WS 做全量转写，避免录音期间 WS 空闲被讯飞提前断开导致“录音自动结束”
let rowAudioContext = null
let rowMediaStream = null
let rowScriptProcessor = null
let rowPcmChunks = []
let rowRecordStartTime = 0

async function startH5RowRecording() {
	function getUserMediaCompat(constraints) {
		if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
			return navigator.mediaDevices.getUserMedia(constraints)
		}
		if (navigator.webkitGetUserMedia) {
			return new Promise((resolve, reject) => {
				navigator.webkitGetUserMedia(constraints, resolve, reject)
			})
		}
		return Promise.reject(new Error('getUserMedia not supported'))
	}
	rowPcmChunks = []
	rowRecordStartTime = Date.now()
	try {
		const stream = await getUserMediaCompat({ audio: true })
		const audioContext = new (window.AudioContext || window.webkitAudioContext)({ sampleRate: 16000 })
		const source = audioContext.createMediaStreamSource(stream)
		const processor = audioContext.createScriptProcessor(4096, 1, 1)
		processor.onaudioprocess = (e) => {
			const inputData = e.inputBuffer.getChannelData(0)
			const pcmData = new Int16Array(inputData.length)
			for (let i = 0; i < inputData.length; i++) {
				pcmData[i] = Math.max(-1, Math.min(1, inputData[i])) * 0x7FFF
			}
			rowPcmChunks.push(pcmData)
		}
		source.connect(processor)
		processor.connect(audioContext.destination)
		rowAudioContext = audioContext
		rowMediaStream = stream
		rowScriptProcessor = processor
		isRecording.value = true
		recordStatus.value = 'recording'
	} catch (err) {
		uni.showToast({ title: '无法访问麦克风，请检查权限', icon: 'none' })
		recordStatus.value = ''
		recordingRowIdx.value = null
	}
}

function stopH5RowRecording(idx) {
	if (rowMediaStream) rowMediaStream.getTracks().forEach(t => t.stop())
	if (rowScriptProcessor) rowScriptProcessor.disconnect()
	if (rowAudioContext) rowAudioContext.close()
	rowMediaStream = null
	rowScriptProcessor = null
	rowAudioContext = null

	const duration = Date.now() - rowRecordStartTime
	if (duration < 500) {
		recordStatus.value = ''
		isRecording.value = false
		recordingRowIdx.value = null
		uni.showToast({ title: '录音太短', icon: 'none' })
		return
	}

	recordStatus.value = 'transcribing'
	isRecording.value = false

	const totalLength = rowPcmChunks.reduce((s, c) => s + c.length, 0)
	if (totalLength === 0) {
		recordStatus.value = ''
		recordingRowIdx.value = null
		return
	}
	const merged = new Int16Array(totalLength)
	let off = 0
	for (const c of rowPcmChunks) { merged.set(c, off); off += c.length }
	const b64 = pcmToBase64(merged)
	const targetIdx = idx
	// 转写期间保持 recordingRowIdx 指向当前行（供模板显示“识别中……”），成功后清空
	transcribeAudio(b64, (text) => {
		recordingRowIdx.value = null
		if (recognized.value[targetIdx] && text) {
			recognized.value[targetIdx].content = text
		}
	}, 'row')
}
// #endif

// 语音转写结果 → 调后端文字识别家作
async function doRecognizeText(text) {
	recognizing.value = true
	try {
		const res = await recognizeHomework({ text })
		if (res.code === 0 && res.data && res.data.length > 0) {
			recognized.value = res.data.map(d => ({
				subject: d.subject || '语文',
				itemType: d.itemType || 'written',
				content: d.content || ''
			}))
		} else if (res.code === 0 && (!res.data || res.data.length === 0)) {
			uni.showToast({ title: '未识别到家作内容', icon: 'none' })
		} else {
			uni.showToast({ title: res.message || '识别失败', icon: 'none' })
		}
	} catch (e) {
		console.log('recognize text err', e)
		uni.showToast({ title: '识别失败，请重试或手动录入', icon: 'none' })
	} finally {
		recognizing.value = false
		recordStatus.value = ''
		isRecording.value = false
	}
}

async function submitRecognized() {
	const valid = recognized.value.filter(r => r.content && r.content.trim())
	if (!valid.length) {
		uni.showToast({ title: '请填写作业内容', icon: 'none' })
		return
	}
	try {
		const res = await submitHomeworkItems(valid)
		if (res.code === 0) {
			uni.showToast({ title: '录入成功' })
			showAdd.value = false
			recognized.value = []
			loadData()
		} else {
			uni.showToast({ title: res.message || '录入失败', icon: 'none' })
		}
	} catch (e) {
		uni.showToast({ title: '录入失败', icon: 'none' })
	}
}

// ============ 以下为隐藏的手写识别（手动录入）代码 — 暂时隐藏，不删除 ============
// const manualMode = ref(false)
// const addRows = ref([{ subject: '语文', itemType: 'written', content: '' }])
//
// function enterManualMode() {
// 	manualMode.value = true
// }
//
// async function submitItems() {
// 	const valid = addRows.value.filter(r => r.content.trim())
// 	if (!valid.length) {
// 		uni.showToast({ title: '请填写作业内容', icon: 'none' })
// 		return
// 	}
// 	try {
// 		const res = await submitHomeworkItems(valid)
// 		if (res.code === 0) {
// 			uni.showToast({ title: '录入成功' })
// 			showAdd.value = false
// 			addRows.value = [{ subject: '语文', itemType: 'written', content: '' }]
// 			manualMode.value = false
// 			loadData()
// 		} else {
// 			uni.showToast({ title: res.message || '录入失败', icon: 'none' })
// 		}
// 	} catch (e) {
// 		uni.showToast({ title: '录入失败', icon: 'none' })
// 	}
// }
// ============ 手写识别代码结束 ============

async function onPhotoDone(item, source = 'camera') {
	uni.chooseImage({
		count: 1,
		sizeType: ['compressed'],
		sourceType: [source],
		success: (res) => {
			cropSrc.value = res.tempFilePaths[0]
			cropTarget.value = { type: 'photo', item }
			cropVisible.value = true
		}
	})
}

async function onAudioDone(item) {
	// #ifdef H5
	try {
		const stream = await navigator.mediaDevices.getUserMedia({ audio: true })
		const recorder = new MediaRecorder(stream)
		const chunks = []
		recorder.ondataavailable = e => chunks.push(e.data)
		recorder.onstop = async () => {
			const blob = new Blob(chunks, { type: 'audio/webm' })
			const reader = new FileReader()
			reader.onload = async () => {
				const dataUrl = reader.result
				try {
					const res = await submitHomeworkResult(item.id, { doneAudio: dataUrl })
					if (res.code === 0) {
						uni.showToast({ title: '录音已提交', icon: 'success' })
						loadData()
					}
				} catch (e) {
					uni.showToast({ title: '操作失败', icon: 'none' })
				}
			}
			reader.readAsDataURL(blob)
			stream.getTracks().forEach(t => t.stop())
		}
		uni.showModal({
			title: '录音',
			content: '点击确定开始录音，再次点击停止',
			success: (r) => {
				if (r.confirm) {
					recorder.start()
					uni.showModal({
						title: '停止录音',
						content: '录音中... 点击确定停止',
						success: () => recorder.stop()
					})
				}
			}
		})
	} catch (e) {
		uni.showToast({ title: '麦克风不可用', icon: 'none' })
	}
	// #endif
	// #ifndef H5
	const rm = uni.getRecorderManager()
	rm.onStop = async (res) => {
		try {
			const r = await new Promise((resolve, reject) => {
				uni.getFileSystemManager().readFile({
					filePath: res.tempFilePath,
					encoding: 'base64',
					success: resolve,
					fail: reject
				})
			})
			const b64 = 'data:audio/aac;base64,' + r.data
			const apiRes = await submitHomeworkResult(item.id, { doneAudio: b64 })
			if (apiRes.code === 0) {
				uni.showToast({ title: '录音已提交', icon: 'success' })
				loadData()
			}
		} catch (e) {
			uni.showToast({ title: '操作失败', icon: 'none' })
		}
	}
	uni.showModal({
		title: '录音',
		content: '点击确定开始录音',
		success: (r) => {
			if (r.confirm) {
				rm.start({ format: 'aac', sampleRate: 16000 })
				uni.showModal({
					title: '停止录音',
					content: '录音中... 点击确定停止',
					success: () => rm.stop()
				})
			}
		}
	})
	// #endif
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
.hw-page {
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
.hw-date {
	display: block;
	font-size: 26rpx;
	color: #9ca3af;
	margin: 20rpx 32rpx 24rpx;
}
.hw-list {
	display: flex;
	flex-direction: column;
	gap: 20rpx;
	padding: 0 32rpx;
}
.hw-card {
	background: #fff;
	border-radius: 20rpx;
	padding: 28rpx;
}
.hw-card-done {
	opacity: 0.65;
}
.hw-card-top {
	display: flex;
	align-items: center;
	gap: 12rpx;
	margin-bottom: 16rpx;
}
.hw-subject-tag {
	font-size: 22rpx;
	padding: 4rpx 16rpx;
	border-radius: 8rpx;
	color: #fff;
}
.tag-语文 { background: #ef4444; }
.tag-数学 { background: #3b82f6; }
.tag-英语 { background: #10b981; }
.hw-type {
	font-size: 22rpx;
	color: #9ca3af;
}
.hw-status {
	margin-left: auto;
	font-size: 24rpx;
	color: #f0a000;
}
.st-done {
	color: #10b981;
}
.hw-content {
	font-size: 30rpx;
	color: #1a1a1a;
	line-height: 1.6;
}
.hw-done-imgs {
	margin-top: 16rpx;
	display: flex;
	flex-wrap: wrap;
	gap: 12rpx;
}
.hw-done-img {
	width: 200rpx;
	border-radius: 12rpx;
}
.hw-audio-tag {
	margin-top: 12rpx;
	font-size: 24rpx;
	color: #3b82f6;
}
.hw-actions {
	margin-top: 20rpx;
	display: flex;
	gap: 16rpx;
	flex-wrap: wrap;
}
.hw-all-done {
	text-align: center;
	padding: 40rpx;
	font-size: 32rpx;
	color: #10b981;
}
.hw-empty {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 20rpx;
	padding: 120rpx 0;
}
.hw-empty-icon {
	font-size: 80rpx;
}
.hw-empty-text {
	font-size: 28rpx;
	color: #9ca3af;
}
.hw-empty-btn {
	background: #f0a000;
	color: #fff;
	border: none;
	border-radius: 40rpx;
	padding: 0 48rpx;
	font-size: 28rpx;
}
.hw-add-mask {
	position: fixed;
	top: 0; left: 0; right: 0; bottom: 0;
	background: rgba(0,0,0,0.4);
	z-index: 999;
	display: flex;
	align-items: flex-end;
}
.hw-add-sheet {
	width: 100%;
	background: #fff;
	border-radius: 32rpx 32rpx 0 0;
	padding: 32rpx;
	max-height: 80vh;
	overflow-y: auto;
}
.hw-add-header {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 24rpx;
}
.hw-add-title {
	font-size: 34rpx;
	font-weight: 700;
}
.hw-add-close {
	font-size: 40rpx;
	color: #9ca3af;
	padding: 8rpx;
}
.hw-add-row {
	display: flex;
	gap: 12rpx;
	align-items: center;
	margin-bottom: 16rpx;
}
.hw-add-subject {
	width: 120rpx;
}
.hw-add-type {
	width: 120rpx;
}
.hw-picker-display {
	height: 60rpx;
	line-height: 60rpx;
	text-align: center;
	border: 1px solid #e5e7eb;
	border-radius: 8rpx;
	font-size: 26rpx;
	color: #374151;
}
.hw-add-content {
	flex: 1;
	border: 1px solid #e5e7eb;
	border-radius: 8rpx;
	padding: 12rpx;
	font-size: 26rpx;
}
.hw-add-content.hw-transcribing {
	color: #9ca3af;
	line-height: 34rpx;
}
.hw-add-del {
	color: #ef4444;
	font-size: 32rpx;
	padding: 8rpx;
}
.hw-row-mic {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 56rpx;
	height: 56rpx;
	border-radius: 12rpx;
}
.hw-row-mic.recording {
	background: rgba(240, 160, 0, 0.15);
	animation: hw-pulse 1.2s infinite;
}
.hw-row-mic-icon {
	width: 36rpx;
	height: 36rpx;
}
.hw-add-submit {
	margin-top: 24rpx;
	background: #f0a000;
	color: #fff;
	border: none;
	border-radius: 40rpx;
}
.hw-recognizing {
	display: flex;
	justify-content: center;
	padding: 60rpx 0;
}
.hw-spin {
	font-size: 30rpx;
	color: #9ca3af;
}
.hw-recognized {
	padding: 16rpx 0;
}
.hw-recognized .hw-add-row {
	margin-bottom: 16rpx;
}
.hw-add-actions {
	display: flex;
	gap: 16rpx;
	margin-top: 24rpx;
}
.hw-add-retry {
	background: #e5e7eb;
	color: #374151;
	border: none !important;
	border-radius: 40rpx !important;
	flex: 1;
}
.hw-recognized .hw-add-submit {
	flex: 1;
	margin-top: 0;
}

/* 录入方式工具栏：语音 / 拍照 / 照片（与 chat 页一致） */
.hw-toolbar {
	display: flex;
	justify-content: space-around;
	padding: 20rpx 0 10rpx;
}
.hw-tool-item {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 12rpx;
	padding: 8rpx 16rpx;
	border-radius: 16rpx;
}
.hw-tool-item.recording {
	background: rgba(240, 160, 0, 0.1);
	border-radius: 16rpx;
	animation: hw-pulse 1.2s infinite;
}
.hw-tool-icon {
	width: 56rpx;
	height: 56rpx;
}
.hw-tool-label {
	font-size: 24rpx;
	color: #666666;
}
.hw-tool-item.recording .hw-tool-label {
	color: #f0a000;
}
@keyframes hw-pulse {
	0% { transform: scale(1); }
	50% { transform: scale(1.08); }
	100% { transform: scale(1); }
}

/* 隐藏：手写识别（手动录入）样式 — 暂时隐藏，代码保留不删
.hw-manual {
	padding: 16rpx 0;
}
.hw-input-mode {
	display: flex;
	gap: 20rpx;
	padding: 20rpx 0;
}
.hw-mode-btn {
	background: #f0a000;
	color: #fff;
	border: none !important;
	border-radius: 40rpx !important;
	font-size: 30rpx;
	padding: 5rpx;
}
.hw-mode-manual {
	background: #e5e7eb !important;
	color: #374151 !important;
}
*/
</style>

<template>
	<view class="chat-page">
		<!-- 消息列表 -->
		<scroll-view scroll-y class="msg-list" :scroll-into-view="scrollInto">
			<view class="welcome-hint" v-if="messages.length <= 1">
				<image src="/static/logo-deer.png" mode="aspectFit" class="deer-logo" />
				<view class="hint-title-row">
					<text class="hint-title-text">我是</text>
					<image src="/static/logo-text.png" mode="aspectFit" class="hint-logo" />
				</view>
				<text class="hint-sub">数学、语文、英语、科学…有问题尽管问，我会一步步引导你思考</text>
				<view class="hint-tags">
					<view class="hint-tag" v-for="t in suggestTags" :key="t" @click="quickAsk(t)">{{ t }}</view>
				</view>
			</view>
			<view v-for="(msg, i) in messages" :key="i" class="msg-row" :class="msg.role">
				<view class="bubble">
					<view v-if="msg.subject" class="subject-tag">{{ msg.subject }}</view>
					<image v-if="msg.image" :src="msg.image" mode="widthFix" class="msg-image" />
					<template v-if="msg.steps && msg.steps.length">
						<view v-for="(step, si) in msg.steps" :key="si" v-show="si <= msg.visibleStep" class="step-block">
							<text class="step-title">第{{ si + 1 }}步</text>
							<view class="step-question-row"><text class="step-question">{{ step.question }}</text><image src="/static/icon-mic.png" class="speak-btn-icon" mode="aspectFit" @click="speakText(step.question)" /></view>
							<view v-if="step.solved" class="step-answer">
								<view class="step-answer-row"><text class="step-answer-label">✓ 答案：</text><text class="msg-text" user-select>{{ step.answer }}</text><image src="/static/icon-mic.png" class="speak-btn-icon" mode="aspectFit" @click="speakText(step.answer)" /></view>
							</view>
							<view v-else-if="si === msg.visibleStep" class="step-voice-area">
								<view v-if="step.voiceText" class="step-voice-text">🗣️ {{ step.voiceText }}</view>
								<view v-if="step.hint" class="step-hint">💡 {{ step.hint }}<image src="/static/icon-mic.png" class="speak-btn-icon" mode="aspectFit" @click="speakText(step.hint)" /></view>
								<view class="step-voice-btn-row">
									<view class="step-voice-btn" :class="{ recording: step.recording, checking: step.checking }" @click="toggleStepVoice(i, si)">
										<image v-if="!step.recording && !step.checking" src="/static/icon-mic.png" class="step-voice-icon" mode="aspectFit" />
										<text v-if="step.recording" class="step-voice-label">⏹ 停止</text>
										<text v-else-if="step.checking" class="step-voice-label">判断中…</text>
										<text v-else class="step-voice-label">点击说话</text>
									</view>
								</view>
							</view>
						</view>
						<view v-if="msg.steps.every(s => s.solved)" class="step-done">
						<text class="step-done-title">🎉 全部完成！</text>
						<view v-if="msg.summaryLoading" class="step-summary-loading">📋 正在生成总结…</view>
						<view v-else-if="msg.summary" class="step-summary">
							<view class="summary-item"><text class="summary-icon">🎯</text><text class="summary-label">考点</text><text class="summary-text">{{ msg.summary.points }}</text></view>
							<view v-if="msg.summary.knowledge" class="summary-item"><text class="summary-icon">📚</text><text class="summary-label">知识点</text><text class="summary-text">{{ msg.summary.knowledge }}</text></view>
							<view v-if="msg.summary.tips" class="summary-item"><text class="summary-icon">💡</text><text class="summary-label">注意</text><text class="summary-text">{{ msg.summary.tips }}</text></view>
							<view class="summary-speak-row"><image src="/static/icon-mic.png" class="speak-btn-icon" mode="aspectFit" @click="speakText('考点：' + (msg.summary.points || '') + '。知识点：' + (msg.summary.knowledge || '') + '。注意事项：' + (msg.summary.tips || ''))" /><text class="speak-btn-text">播放总结</text></view>
						</view>
					</view>
					</template>
					<text v-else-if="msg.content" class="msg-text" user-select>{{ msg.content }}<text v-if="msg.streaming" class="stream-cursor">|</text></text>
				</view>
			</view>
			<view v-if="loading" class="msg-row assistant">
				<view class="bubble">
					<text class="msg-text">{{ loadingText }}</text>
				</view>
			</view>
			<view id="bottom-anchor"></view>
		</scroll-view>

		<!-- 底部输入区 -->
		<view class="bottom-area">
			<view class="input-bar">
				<input
					v-model="question"
					class="input"
					placeholder="输入你的学习问题…"
					confirm-type="send"
					:disabled="loading"
					@confirm="send"
				/>
				<image src="/static/icon-more.png" class="tool-trigger" @click="toggleTools" />
				<button class="send-btn" size="mini" :disabled="loading || !question.trim()" @click="send">发送</button>
			</view>
		</view>
		
		<!-- 全屏底部工具弹层（覆盖 tabBar） -->
		<view class="popup-wrapper" :class="{ active: showTools }">
			<view class="popup-backdrop" @click="closeTools"></view>
			<view class="tool-popup">
								<view class="tool-item"
					:class="{ recording: recordStatus === 'recording' }"
					@click="onVoiceClick"
				>
					<image src="/static/icon-mic.png" class="tool-icon-img" mode="aspectFit" />
					<text class="tool-label">{{ recordStatus === 'recording' ? '停止' : recordStatus === 'transcribing' ? '识别中…' : '语音' }}</text>
				</view>
				<view class="tool-item" @click="onCamera">
					<image src="/static/icon-camera.png" class="tool-icon-img" mode="aspectFit" />
					<text class="tool-label">拍照</text>
				</view>
				<view class="tool-item" @click="onPhoto">
					<image src="/static/icon-photo.png" class="tool-icon-img" mode="aspectFit" />
					<text class="tool-label">照片</text>
				</view>
			</view>
		</view>

		<!-- 图片框选裁剪蒙层 -->
		<CropOverlay :visible="cropVisible" :src="cropSrc" @confirm="onCropConfirm" @cancel="onCropCancel" />
	</view>
</template>

<script setup>
import { ref, nextTick } from 'vue'
import CropOverlay from '@/components/CropOverlay.vue'
import { chat, chatWithImage, getAsrSignature, chatCheck as apiChatCheck, chatSummary as apiChatSummary, tts as apiTts } from '@/api/index'

const question = ref('')
const loading = ref(false)
const loadingText = ref("正在分析题目…")
let loadingTimer = null
function startLoadingText() {
	loadingText.value = "正在分析题目…"
	let step = 0
	clearInterval(loadingTimer)
	loadingTimer = setInterval(() => {
		step++
		if (step === 1) loadingText.value = "正在准备引导问题…"
		else if (step === 2) loadingText.value = "马上就好…"
	}, 2000)
}
function stopLoadingText() {
	clearInterval(loadingTimer)
	loadingTimer = null
}
const sessionId = ref(uni.getStorageSync('chatSessionId') || null)
const messages = ref([
	{ role: 'assistant', content: '你好呀！我是问知晓鹿，今天想学点什么？' }
])
const scrollInto = ref('')
const showTools = ref(false)

// ========== 语音播放（TTS）==========
let currentAudio = null  // 当前播放的音频上下文
let currentPlayingText = ''  // 当前正在播放的文本（用于 toggle 判断）

/** 把文字转成语音播放（后端 edge-tts → mp3 → 播放） */
async function speakText(text) {
	// 如果正在播放，先停止（toggle 行为）
	if (currentAudio) {
		currentAudio.stop()
		currentAudio = null
		if (currentPlayingText === text) {
			currentPlayingText = ''
			return  // 点的是正在播放的，停止即可
		}
		currentPlayingText = ''
	}

	uni.showLoading({ title: '语音合成中…' })
	try {
		const res = await apiTts(text)
		const d = res && res.data ? res.data : res
		if (!d || !d.audio) {
			uni.showToast({ title: '语音合成失败', icon: 'none' })
			return
		}

		// base64 → 临时文件 → 播放（全端兼容）
		const audioPath = `${uni.getSystemInfoSync().platform === 'ios' ? '' : ''}data:audio/mp3;base64,${d.audio}`

		currentAudio = uni.createInnerAudioContext()
		// #ifdef H5
		currentAudio.src = audioPath
		// #endif
		// #ifndef H5
		// App/小程序：写临时文件再播放
		const fs = uni.getFileSystemManager ? uni.getFileSystemManager() : null
		if (fs) {
			const tmpPath = `${wx.env.USER_DATA_PATH || ''}/tts_${Date.now()}.mp3`
			fs.writeFileSync(tmpPath, uni.base64ToArrayBuffer(d.audio), 'binary')
			currentAudio.src = tmpPath
		} else {
			currentAudio.src = audioPath
		}
		// #endif

		currentPlayingText = text
		currentAudio.onEnded(() => {
			currentAudio = null
			currentPlayingText = ''
		})
		currentAudio.onError((err) => {
			console.error('[TTS] 播放错误:', err)
			currentAudio = null
			currentPlayingText = ''
			uni.showToast({ title: '播放失败', icon: 'none' })
		})
		currentAudio.play()
	} catch (e) {
		console.error('[TTS] 请求失败:', e)
		uni.showToast({ title: '语音服务暂不可用', icon: 'none' })
	} finally {
		uni.hideLoading()
	}
}

// ========== 交互式分步解题 ==========

/** 把 LLM 返回的 JSON 数组解析成步骤数组 */
function parseSteps(text) {
		if (!text) return null
		try {
		let cleaned = text.trim()
		// 剥掉可能的 ```json 代码块包裹
		cleaned = cleaned.replace(/^```json\s*/, '').replace(/\s*```$/, '').trim()
		const parsed = JSON.parse(cleaned)
		// 兼容两种格式：直接数组 [{...}] 或 {steps: [...]}
		const arr = Array.isArray(parsed) ? parsed : (parsed.steps || parsed.data || null)
		if (!Array.isArray(arr) || arr.length === 0) return null
		// 校验每步必须有 question 和 answer
		const steps = arr.map(s => ({
			question: s.question || '',
			answer: s.answer || '',
			voiceText: '',
			recording: false,
			checking: false,
			hint: '',
			solved: false
		}))
		return steps
	} catch (e) {
		console.log('[chat] parseSteps: 非 JSON 格式，降级普通文本')
		return null
	}
}

/** 提交某一步的学生答案，调后端判断对错 */
// ========== 引导步骤语音输入 ==========
// 当前正在录音的步骤位置
const stepRecordingPos = ref(null) // {msgIndex, stepIndex}

function toggleStepVoice(msgIndex, stepIndex) {
		const msg = messages.value[msgIndex]
		if (!msg || !msg.steps || !msg.steps[stepIndex]) return
		const step = msg.steps[stepIndex]
		if (step.checking) return

		if (step.recording) {
			// 停止录音
			stopStepRecording(msgIndex, stepIndex)
		} else {
			// 开始录音
			startStepRecording(msgIndex, stepIndex)
		}
}

function startStepRecording(msgIndex, stepIndex) {
		const msg = messages.value[msgIndex]
		const step = msg.steps[stepIndex]
		step.recording = true
		step.voiceText = ''
		step.hint = ''
		stepRecordingPos.value = { msgIndex, stepIndex }

		// #ifdef H5
		let stepAccumulated = ''
		startH5Recording(
			(text) => {
				stepAccumulated += text
				step.voiceText = stepAccumulated
			},
			() => {
				// WS 关闭后自动提交
				if (step.voiceText && step.voiceText.trim()) {
					submitStepAnswer(msgIndex, stepIndex)
				} else {
					step.checking = false
					step.voiceText = ''
					uni.showToast({ title: '没听清，请重试', icon: 'none' })
				}
			}
		)
		// #endif

		// #ifndef H5
		if (!recorderManager) {
			uni.showToast({ title: '当前环境不支持录音', icon: 'none' })
			step.recording = false
			return
		}
		recorderManager.start({
			format: 'aac',
			sampleRate: 16000,
			numberOfChannels: 1,
			encodeBitRate: 32000
		})
		// #endif
}

function stopStepRecording(msgIndex, stepIndex) {
		const msg = messages.value[msgIndex]
		const step = msg.steps[stepIndex]
		step.recording = false

		// #ifdef H5
		stopH5RecordingForStep(msgIndex, stepIndex)
		// #endif

		// #ifndef H5
		if (recorderManager) {
			recorderManager.stop()
		}
		// #endif
}

// H5 停止录音后转写（复用 PCM 逻辑，但结果导向步骤而非 question 输入框）
// #ifdef H5
function stopH5RecordingForStep(msgIndex, stepIndex) {
		if (h5MediaStream) { h5MediaStream.getTracks().forEach(track => track.stop()) }
		if (h5ScriptProcessor) { h5ScriptProcessor.disconnect() }
		if (h5AudioContext) { h5AudioContext.close() }

		const duration = Date.now() - h5RecordStartTime
		if (duration < 500) {
			stepRecordingPos.value = null
			h5StreamOnDone = null
			h5StreamOnResult = null
			return
		}

		const msg = messages.value[msgIndex]
		const step = msg.steps[stepIndex]
		step.checking = true

		// 合并全量 PCM
		const totalLength = h5PcmChunks.reduce((sum, chunk) => sum + chunk.length, 0)
		if (totalLength === 0) {
			step.checking = false
			stepRecordingPos.value = null
			return
		}
		const mergedPcm = new Int16Array(totalLength)
		let offset = 0
		for (const chunk of h5PcmChunks) {
			mergedPcm.set(chunk, offset)
			offset += chunk.length
		}
		const pcmBase64 = pcmToBase64(mergedPcm)

		// 等 WS 就绪后快速分帧发送
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
						frame.business = {
							domain: 'iat',
							language: 'zh_cn',
							accent: 'mandarin',
							vad_eos: 2000,
							dwa: 'wpgs'
						}
						sentFirst = true
					}
					ws.send(JSON.stringify(frame))
				}
				ws.send(JSON.stringify({
					data: { status: 2, format: 'audio/L16;rate=16000', encoding: 'raw', audio: '' }
				}))
			} else {
				console.warn('[ASR] WS 未就绪，降级全量发送')
				transcribeAudioForStep(pcmBase64, msgIndex, stepIndex)
			}
		})
}
// #endif

// 非H5录音结束回调
function onStepRecorderStop(filePath) {
		if (!stepRecordingPos.value) return
		const { msgIndex, stepIndex } = stepRecordingPos.value
		const msg = messages.value[msgIndex]
		const step = msg.steps[stepIndex]
		step.checking = true
		stepRecordingPos.value = null
		transcribeAudioForStep(filePath, msgIndex, stepIndex)
}

// 讯飞 ASR 转写，结果写入步骤并自动提交
async function transcribeAudioForStep(audioSource, msgIndex, stepIndex) {
		const msg = messages.value[msgIndex]
		const step = msg.steps[stepIndex]
		try {
			const sigRes = await getAsrSignature()
			if (!sigRes || sigRes.code !== 0) {
				throw new Error('获取签名失败')
			}
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
					business: {
						domain: 'iat',
						language: 'zh_cn',
						accent: 'mandarin',
						vad_eos: 2000,
						dwa: 'wpgs'
					},
					data: {
						status: 0,
						format: 'audio/L16;rate=16000',
						encoding: 'raw',
						audio: audioBase64.substring(0, Math.min(audioBase64.length, 12288))
					}
				}
				ws.send(JSON.stringify(firstFrame))

				let offset = 12288
				const chunkSize = 12288
				while (offset < audioBase64.length) {
					const chunk = audioBase64.substring(offset, offset + chunkSize)
					const isLast = offset + chunkSize >= audioBase64.length
					ws.send(JSON.stringify({
						data: {
							status: isLast ? 2 : 1,
							format: 'audio/L16;rate=16000',
							encoding: 'raw',
							audio: chunk
						}
					}))
					offset += chunkSize
				}
				if (audioBase64.length <= 12288) {
					ws.send(JSON.stringify({
						data: {
							status: 2,
							format: 'audio/L16;rate=16000',
							encoding: 'raw',
							audio: ''
						}
					}))
				}
			}
			ws.onmessage = (event) => {
				const data = JSON.parse(event.data)
				if (data.code && data.code !== 0) {
					console.error('[ASR-Step] 讯飞错误码:', data.code, data.message)
					return
				}
				if (data.data && data.data.result) {
					const wsResult = data.data.result
					if (wsResult.ws) {
						let text = ''
						wsResult.ws.forEach(cw => {
							cw.cw.forEach(w => {
								text += w.w
							})
						})
						resultText = text
					}
				}
			}
			ws.onerror = (err) => {
				console.error('[ASR-Step] WebSocket 错误', err)
				step.checking = false
				uni.showToast({ title: '语音识别失败', icon: 'none' })
			}
			ws.onclose = () => {
				console.log('[ASR-Step] WebSocket 关闭，结果：', resultText)
				if (resultText.trim()) {
					step.voiceText = resultText.trim()
					// 自动提交判断
					submitStepAnswer(msgIndex, stepIndex)
				} else {
					step.checking = false
					uni.showToast({ title: '没听清，请重试', icon: 'none' })
				}
			}
			// #endif

			// #ifndef H5
			ws = uni.connectSocket({
				url: wsUrl,
				protocols: ['binary']
			})

			ws.onOpen(() => {
				const firstFrame = {
					common: { app_id: sig.appId },
					business: {
						domain: 'iat',
						language: 'zh_cn',
						accent: 'mandarin',
						vad_eos: 2000,
						dwa: 'wpgs'
					},
					data: {
						status: 0,
						format: 'audio/L16;rate=16000',
						encoding: 'raw',
						audio: audioBase64.substring(0, Math.min(audioBase64.length, 12288))
					}
				}
				ws.send({ data: JSON.stringify(firstFrame) })

				let offset = 12288
				const chunkSize = 12288
				while (offset < audioBase64.length) {
					const chunk = audioBase64.substring(offset, offset + chunkSize)
					const isLast = offset + chunkSize >= audioBase64.length
					ws.send({ data: JSON.stringify({
						data: {
							status: isLast ? 2 : 1,
							format: 'audio/L16;rate=16000',
							encoding: 'raw',
							audio: chunk
						}
					}) })
					offset += chunkSize
				}
				if (audioBase64.length <= 12288) {
					ws.send({ data: JSON.stringify({
						data: {
							status: 2,
							format: 'audio/L16;rate=16000',
							encoding: 'raw',
							audio: ''
						}
					}) })
				}
			})

			ws.onMessage((res) => {
				const data = JSON.parse(res.data)
				if (data.code && data.code !== 0) {
					console.error('[ASR-Step] 讯飞错误码:', data.code, data.message)
					return
				}
				if (data.data && data.data.result) {
					const wsResult = data.data.result
					if (wsResult.ws) {
						let text = ''
						wsResult.ws.forEach(cw => {
							cw.cw.forEach(w => {
								text += w.w
							})
						})
						resultText = text
					}
				}
				if (data.data && data.data.status === 2) {
					ws.close()
				}
			})

			ws.onError((err) => {
				console.error('[ASR-Step] WebSocket 错误', err)
				step.checking = false
				uni.showToast({ title: '语音识别失败', icon: 'none' })
			})

			ws.onClose(() => {
				console.log('[ASR-Step] WebSocket 关闭，结果：', resultText)
				if (resultText.trim()) {
					step.voiceText = resultText.trim()
					submitStepAnswer(msgIndex, stepIndex)
				} else {
					step.checking = false
					uni.showToast({ title: '没听清，请重试', icon: 'none' })
				}
			})
			// #endif

		} catch (e) {
			console.error('[ASR-Step] 转写失败', e)
			step.checking = false
			uni.showToast({ title: '语音识别失败', icon: 'none' })
		}
}

async function submitStepAnswer(msgIndex, stepIndex) {
		const msg = messages.value[msgIndex]
		if (!msg || !msg.steps || !msg.steps[stepIndex]) return
		const step = msg.steps[stepIndex]
		if (!step.voiceText) return
		step.checking = true
		step.hint = ''
		try {
		const res = await apiChatCheck(step.question, step.answer, step.voiceText)
		const d = res && res.data ? res.data : res
		if (d.correct) {
			// 标记当前步已答对
			step.solved = true
			// 如果还有下一步，前进一步
			if (msg.visibleStep < msg.steps.length - 1) {
				msg.visibleStep++
			} else {
				// 全部完成！调后端生成总结
				fetchStepSummary(msgIndex)
			}
			step.hint = ''
		} else {
			step.hint = d.hint || '回答不太对哦，再想想？'
		}
		scrollToBottom()
	} catch (e) {
		step.hint = '判断服务暂时不可用，请重试'
	} finally {
		step.checking = false
	}
}

/** 全部步骤答完后，调后端生成考点/知识点/注意事项总结 */
async function fetchStepSummary(msgIndex) {
	const msg = messages.value[msgIndex]
	if (!msg || !msg.steps) return
	msg.summaryLoading = true
	msg.summary = null
	try {
		// 构造步骤数据
		const stepsData = msg.steps.map(s => ({ question: s.question, answer: s.answer }))
		const res = await apiChatSummary(msg.originalQuestion || '', stepsData)
		const d = res && res.data ? res.data : res
		if (d) {
			msg.summary = {
				points: d.points || '',
				knowledge: d.knowledge || '',
				tips: d.tips || ''
			}
		}
	} catch (e) {
		console.error('[chat] 总结生成失败:', e)
		msg.summary = { points: '总结生成失败，可稍后重试', knowledge: '', tips: '' }
	} finally {
		msg.summaryLoading = false
		scrollToBottom()
	}
}

// ========== 图片框选裁剪（复用 CropOverlay 组件） ==========
const cropVisible = ref(false)
const cropSrc = ref('')
// cropping 复用为「图片处理中」标志（sendImage 使用）
const cropping = ref(false)

function onCropConfirm(base64, dataUrl) {
	cropVisible.value = false
	cropSrc.value = ''
	sendImage(dataUrl, base64)
}

function onCropCancel() {
	cropVisible.value = false
	cropSrc.value = ''
}

// ========== 语音录音状态 ==========
const isRecording = ref(false)
const recordStatus = ref('') // 'recording' | 'transcribing' | ''

// #ifndef H5
const recorderManager = uni.getRecorderManager ? uni.getRecorderManager() : null

// 录音完成回调
if (recorderManager) recorderManager.onStop((res) => {
		console.log('[录音] 结束', res.tempFilePath, '时长', res.duration)
		if (res.duration < 500) {
		// 小于500ms视为误触
		recordStatus.value = ''
		isRecording.value = false
		showTools.value = false
		return
	}
		// 判断是引导步骤录音还是底部语音输入
		if (stepRecordingPos.value) {
			onStepRecorderStop(res.tempFilePath)
		} else {
			recordStatus.value = 'transcribing'
			transcribeAudio(res.tempFilePath)
		}
})

if (recorderManager) recorderManager.onError((err) => {
		console.error('[录音] 错误', err)
		uni.showToast({ title: '录音失败：' + err.errMsg, icon: 'none' })
		recordStatus.value = ''
		isRecording.value = false
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
// #endif

const suggestTags = ['4×6÷3 怎么算？', '两位数乘法', '周长怎么求？']

function toggleTools() {
		if (recordStatus.value === 'recording' || recordStatus.value === 'transcribing') return
		showTools.value = !showTools.value
}

function closeTools() {
		if (recordStatus.value === 'recording' || recordStatus.value === 'transcribing') return
		showTools.value = false
}

// ========== 语音点击切换逻辑 ==========
// #ifdef H5
async function startH5Recording(onResult, onDone) {
	console.log('[ASR] 方案 A（讯飞预连 WS + 录完快发）')
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

	if (!navigator.mediaDevices && !navigator.webkitGetUserMedia) {
		uni.showToast({ title: '当前浏览器不支持录音', icon: 'none' })
		return
	}

	// 方案A：录音开始时并行预连 WS + 取麦克风，录音期间只累积 PCM 不发送
	h5StreamOnResult = onResult || null
	h5StreamOnDone = onDone || null
	h5PcmChunks = []
	h5RecordStartTime = Date.now()

	// 并行任务1：拿签名 + 建 WS（不传音频）
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
				ws.onopen = () => {
					console.log('[ASR] 预连 WS 已就绪')
					resolve(ws)
				}
				ws.onmessage = (event) => {
					try {
						const data = JSON.parse(event.data)
						if (data.code !== 0 && data.code !== undefined) {
							console.warn('[ASR] 错误码', data.code, data.message)
							return
						}
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
				ws.onerror = (e) => {
					console.error('[ASR] WS 错误', e)
					resolve(null)
				}
				ws.onclose = () => {
					console.log('[ASR] WS 关闭')
					if (h5StreamOnDone) {
						h5StreamOnDone()
						h5StreamOnDone = null
					}
				}
			} catch (e) {
				console.error('[ASR] WS 创建失败', e)
				resolve(null)
			}
		})
	}).catch(() => null)

	// 并行任务2：获取麦克风，开始录音
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
			// 不发送，只累积
		}

		source.connect(processor)
		processor.connect(audioContext.destination)

		h5AudioContext = audioContext
		h5MediaStream = stream
		h5ScriptProcessor = processor

		isRecording.value = true
		recordStatus.value = 'recording'
		console.log('[录音] H5 录音开始（方案A：预连WS + 累积PCM）')
	} catch (err) {
		console.error('[录音] H5 权限失败', err)
		uni.showToast({ title: '无法访问麦克风，请检查权限', icon: 'none' })
		h5StreamOnResult = null
		h5StreamOnDone = null
	}
}

function stopH5Recording() {
		console.log('[录音] H5 停止录音（方案A）')
		if (h5MediaStream) { h5MediaStream.getTracks().forEach(track => track.stop()) }
		if (h5ScriptProcessor) { h5ScriptProcessor.disconnect() }
		if (h5AudioContext) { h5AudioContext.close() }

		const duration = Date.now() - h5RecordStartTime
		if (duration < 500) {
			recordStatus.value = ''
			isRecording.value = false
			showTools.value = false
			h5StreamOnDone = null
			h5StreamOnResult = null
			return
		}

		recordStatus.value = 'transcribing'
		isRecording.value = false

		// 合并全量 PCM
		const totalLength = h5PcmChunks.reduce((sum, chunk) => sum + chunk.length, 0)
		if (totalLength === 0) {
			recordStatus.value = ''
			showTools.value = false
			return
		}
		const mergedPcm = new Int16Array(totalLength)
		let offset = 0
		for (const chunk of h5PcmChunks) {
			mergedPcm.set(chunk, offset)
			offset += chunk.length
		}
		const pcmBase64 = pcmToBase64(mergedPcm)

		// 等 WS 就绪后快速分帧发送
		h5StreamSigPromise.then(ws => {
			if (ws && ws.readyState === 1) {
				// WS 已就绪，分帧快速发送
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
						frame.business = {
							domain: 'iat',
							language: 'zh_cn',
							accent: 'mandarin',
							vad_eos: 2000,
							dwa: 'wpgs'
						}
						sentFirst = true
					}
					ws.send(JSON.stringify(frame))
				}
				// 末帧
				ws.send(JSON.stringify({
					data: { status: 2, format: 'audio/L16;rate=16000', encoding: 'raw', audio: '' }
				}))
				// WS onclose 会触发 h5StreamOnDone
			} else {
				// WS 未就绪，降级走旧全量发送
				console.warn('[ASR] WS 未就绪，降级全量发送')
				transcribeAudio(pcmBase64)
			}
		})
}
// #endif

function onVoiceClick() {
		if (recordStatus.value === 'transcribing') return
	// #ifdef H5
		if (isRecording.value) {
		stopH5Recording()
	} else {
		// 底部语音：实时结果填入输入框，WS 关闭后自动 send
		let accumulated = ''
		startH5Recording(
			(text) => { accumulated += text; question.value = accumulated },
			() => {
				recordStatus.value = ''
				isRecording.value = false
				showTools.value = false
				if (question.value.trim()) {
					send()
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
		if (isRecording.value) {
		isRecording.value = false
		recorderManager.stop()
		console.log('[录音] 停止')
	} else {
		isRecording.value = true
		recordStatus.value = 'recording'
		recorderManager.start({
			format: 'aac',
			sampleRate: 16000,
			numberOfChannels: 1,
			encodeBitRate: 32000
		})
		console.log('[录音] 开始')
	}
	// #endif
}

// ========== 讯飞 ASR 转写 ==========
async function transcribeAudio(audioSource) {
		try {
		// 1. 从后端拿签名
		const sigRes = await getAsrSignature()
		console.log('[ASR] 签名结果:', sigRes);
		if (!sigRes || sigRes.code !== 0) {
			throw new Error('获取签名失败')
		}
		const sig = sigRes.data

		// 2. 读取音频为 base64
		let audioBase64
		if (typeof audioSource === 'string' && (audioSource.startsWith('/') || audioSource.startsWith('http'))) {
			// App/小程序：文件路径
			audioBase64 = await readFileToBase64(audioSource)
		} else {
			// H5：直接传入 base64 PCM
			audioBase64 = audioSource
		}

		// 3. 连讯飞 WebSocket（H5 用原生 WebSocket，uni.connectSocket 在 H5 端 SocketTask 方法不可靠）
		const wsUrl = `wss://${sig.host}${sig.path}?authorization=${encodeURIComponent(sig.authorization)}&date=${encodeURIComponent(sig.date)}&host=${encodeURIComponent(sig.host)}`

		let ws
		let resultText = ''

		// #ifdef H5
		ws = new WebSocket(wsUrl)
		ws.onopen = () => {
			console.log('[ASR] WebSocket 已连接')
			const firstFrame = {
				common: { app_id: sig.appId },
				business: {
					domain: 'iat',
					language: 'zh_cn',
					accent: 'mandarin',
					vad_eos: 2000,
					dwa: 'wpgs'
				},
				data: {
					status: 0,
					format: 'audio/L16;rate=16000',
					encoding: 'raw',
					audio: audioBase64.substring(0, Math.min(audioBase64.length, 12288))
				}
			}
			ws.send(JSON.stringify(firstFrame))

			// 如果音频超过 12KB，继续发送剩余部分
			let offset = 12288
			const chunkSize = 12288
			while (offset < audioBase64.length) {
				const chunk = audioBase64.substring(offset, offset + chunkSize)
				const isLast = offset + chunkSize >= audioBase64.length
				ws.send(JSON.stringify({
					data: {
						status: isLast ? 2 : 1,
						format: 'audio/L16;rate=16000',
						encoding: 'raw',
						audio: chunk
					}
				}))
				offset += chunkSize
			}
			// 如果音频 ≤ 12KB，首帧就是最后一帧
			if (audioBase64.length <= 12288) {
				ws.send(JSON.stringify({
					data: {
						status: 2,
						format: 'audio/L16;rate=16000',
						encoding: 'raw',
						audio: ''
					}
				}))
			}
		}
		ws.onmessage = (event) => {
			const data = JSON.parse(event.data)
			console.log('[ASR] 消息', data)
			if (data.code && data.code !== 0) {
				console.error('[ASR] 讯飞错误码:', data.code, data.message)
				return
			}
			if (data.data && data.data.result) {
				const wsResult = data.data.result
				if (wsResult.ws) {
					let text = ''
					wsResult.ws.forEach(cw => {
						cw.cw.forEach(w => {
							text += w.w
						})
					})
					resultText = text
				}
			}
		}
		ws.onerror = (err) => {
			console.error('[ASR] WebSocket 错误', err)
			recordStatus.value = ''
			showTools.value = false
			uni.showToast({ title: '语音识别失败', icon: 'none' })
		}
		ws.onclose = () => {
			console.log('[ASR] WebSocket 关闭，结果：', resultText)
			recordStatus.value = ''
			showTools.value = false
			if (resultText.trim()) {
				question.value = resultText.trim()
				send()
			} else {
				uni.showToast({ title: '没听清，请重试', icon: 'none' })
			}
		}
		// #endif

		// #ifndef H5
		ws = uni.connectSocket({
			url: wsUrl,
			protocols: ['binary']
		})

		ws.onOpen(() => {
			console.log('[ASR] WebSocket 已连接')
			const firstFrame = {
				common: { app_id: sig.appId },
				business: {
					domain: 'iat',
					language: 'zh_cn',
					accent: 'mandarin',
					vad_eos: 2000,
					dwa: 'wpgs'
				},
				data: {
					status: 0,
					format: 'audio/L16;rate=16000',
					encoding: 'raw',
					audio: audioBase64.substring(0, Math.min(audioBase64.length, 12288))
				}
			}
			ws.send({ data: JSON.stringify(firstFrame) })
		})

		ws.onMessage((res) => {
			const data = JSON.parse(res.data)
			console.log('[ASR] 消息', data)
			if (data.code && data.code !== 0) {
				console.error('[ASR] 讯飞错误码:', data.code, data.message)
				return
			}
			if (data.data && data.data.result) {
				const wsResult = data.data.result
				if (wsResult.ws) {
					let text = ''
					wsResult.ws.forEach(cw => {
						cw.cw.forEach(w => {
							text += w.w
						})
					})
					resultText = text
				}
			}
			if (data.data && data.data.status === 2) {
				ws.close()
			}
		})

		ws.onError((err) => {
			console.error('[ASR] WebSocket 错误', err)
			recordStatus.value = ''
			showTools.value = false
			uni.showToast({ title: '语音识别失败', icon: 'none' })
		})

		ws.onClose(() => {
			console.log('[ASR] WebSocket 关闭，结果：', resultText)
			recordStatus.value = ''
			showTools.value = false
			if (resultText.trim()) {
				question.value = resultText.trim()
				send()
			} else {
				uni.showToast({ title: '没听清，请重试', icon: 'none' })
			}
		})
		// #endif

	} catch (e) {
		console.error('[ASR] 转写失败', e)
		recordStatus.value = ''
		showTools.value = false
		uni.showToast({ title: '语音识别失败', icon: 'none' })
	}
}

// 读取文件为 base64（兼容 H5/App）
function readFileToBase64(filePath) {
		return new Promise((resolve, reject) => {
		// #ifdef H5
		fetch(filePath)
			.then(res => res.blob())
			.then(blob => {
				const reader = new FileReader()
				reader.onload = () => {
					const base64 = reader.result.split(',')[1]
					resolve(base64)
				}
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

function onCamera() {
		if (recordStatus.value) return
		showTools.value = false
		uni.chooseImage({
		count: 1,
		sizeType: ['original'],
		sourceType: ['camera'],
		success: (res) => {
			cropSrc.value = res.tempFilePaths[0]
			cropVisible.value = true
		},
		fail: () => {
			// 用户取消拍照
		}
	})
}

function onPhoto() {
		if (recordStatus.value) return
		showTools.value = false
		uni.chooseImage({
		count: 1,
		sizeType: ['compressed'],
		sourceType: ['album', 'camera'],
		success: (res) => {
			cropSrc.value = res.tempFilePaths[0]
			cropVisible.value = true
		},
		fail: () => {
			// 用户取消选择，不做处理
		}
	})
}

async function sendImage(dataUrl, base64) {
		console.log('[chat] sendImage 调用', { hasDataUrl: !!dataUrl, hasBase64: !!base64, loading: loading.value })
		if (loading.value) return
	// 直接发送图片+默认问题，不填输入框
		messages.value.push({
		role: 'user',
		content: '',
		image: dataUrl
	})
		loading.value = true; startLoadingText()
		cropping.value = true
		scrollToBottom()
		try {
		const res = await chatWithImage('请识别这张图片中的题目，提取题目内容。然后把解题过程分成多个交互步骤，输出JSON数组格式：[{"question":"引导问题","answer":"答案和解析"}]。每步先出一个问题让学生回答，不要直接给答案。至少3步。如果图片中没有明确的题目，请描述图片内容。', base64, sessionId.value)
		console.log('[chat] 图片返回', res)
		const d = res && res.data ? res.data : res
		if (d.sessionId) {
			sessionId.value = d.sessionId
			uni.setStorageSync('chatSessionId', d.sessionId)
		}
		const imgSteps = parseSteps(d.answer)
		if (imgSteps) {
			messages.value.push({ role: 'assistant', subject: d.subject, content: d.answer, steps: imgSteps, visibleStep: 0, originalQuestion: q })
		} else {
			messages.value.push({ role: 'assistant', subject: d.subject, content: d.answer || '（AI 返回了空内容）' })
		}
	} catch (e) {
		console.error('[chat] 图片异常', e)
		messages.value.push({ role: 'assistant', content: '抱歉，图片识别服务暂时不可用，请稍后再试。（' + (e && e.errMsg ? e.errMsg : (e && e.message ? e.message : '未知错误')) + '）' })
	} finally {
		loading.value = false; stopLoadingText()
		cropping.value = false
		scrollToBottom()
	}
}

function quickAsk(t) {
		question.value = t
		send()
}

async function send() {
		const q = question.value.trim()
		if (!q || loading.value) return
		showTools.value = false

		messages.value.push({ role: 'user', content: q })
		question.value = ''
		loading.value = true; startLoadingText()
		scrollToBottom()

	// 流式输出：先创建一个临时消息逐字显示，完成后尝试解析步骤
		const streamMsg = { role: 'assistant', subject: '', content: '', streaming: true }
		messages.value.push(streamMsg)
		scrollToBottom()

	// 检测 fetch + ReadableStream 是否可用（微信内置浏览器/旧 WebView 可能不支持）
		const canStream = typeof fetch === 'function' && typeof globalThis !== 'undefined' && typeof globalThis.ReadableStream !== 'undefined'

		if (!canStream) {
		// 不支持流式，直接走普通接口
		try {
			const res = await chat(q, sessionId.value)
			const d = res && res.data ? res.data : res
			if (d.sessionId) {
				sessionId.value = d.sessionId
				uni.setStorageSync('chatSessionId', d.sessionId)
			}
			streamMsg.streaming = false
			streamMsg.subject = d.subject || ''
			const steps = parseSteps(d.answer)
			if (steps) {
				streamMsg.steps = steps; streamMsg.visibleStep = 0; streamMsg.content = ''; streamMsg.originalQuestion = q
			} else {
				streamMsg.content = d.answer || '（AI 返回了空内容）'
			}
		} catch (e2) {
			streamMsg.streaming = false
			streamMsg.content = '抱歉，AI 服务暂时不可用，请稍后再试。'
		} finally {
			loading.value = false; stopLoadingText()
			scrollToBottom()
		}
		return
	}

		try {
		const token = uni.getStorageSync('token') || ''
		const baseURL = 'http://192.168.71.202:8080'
		const resp = await fetch(baseURL + '/api/chat/stream', {
			method: 'POST',
			headers: { 'Content-Type': 'application/json', 'satoken': token },
			body: JSON.stringify({ question: q, sessionId: sessionId.value })
		})

		const reader = resp.body.getReader()
		const decoder = new TextDecoder()
		let buffer = ''
		let fullText = ''
		let subject = ''

		while (true) {
			const { done, value } = await reader.read()
			if (done) break
			buffer += decoder.decode(value, { stream: true })
			const lines = buffer.split('\n')
			buffer = lines.pop() || ''

			let currentEvent = ''
			let dataBuffer = ''
			for (const line of lines) {
				if (line.startsWith('event:')) {
					currentEvent = line.substring(6).trim()
					dataBuffer = ''
				} else if (line.startsWith('data:')) {
					if (dataBuffer) dataBuffer += '\n'
					dataBuffer += line.substring(5)
				} else if (line === '' && currentEvent) {
					const data = dataBuffer
					if (currentEvent === 'subject') {
						subject = data
						streamMsg.subject = subject
					} else if (currentEvent === 'delta') {
						fullText += data
						// 不显示原始 JSON，只显示加载提示
						streamMsg.content = '🤔 知鹿老师正在思考…'
						scrollToBottom()
					} else if (currentEvent === 'done') {
						if (data) fullText = data
					} else if (currentEvent === 'error') {
						throw new Error(data)
					}
					currentEvent = ''
					dataBuffer = ''
				}
			}
		}
		// 流式结束：尝试解析步骤 JSON
		streamMsg.streaming = false
		streamMsg.content = ''
		const steps = parseSteps(fullText)
		if (steps) {
			streamMsg.steps = steps
			streamMsg.visibleStep = 0
			streamMsg.originalQuestion = q
		} else {
			streamMsg.content = fullText || '（AI 返回了空内容）'
		}

	} catch (e) {
		console.error('[chat] 流式异常，降级普通接口', e)
		streamMsg.streaming = false
		streamMsg.content = '网络异常，尝试普通模式…'
		// 降级：调用普通接口
		try {
			const res = await chat(q, sessionId.value)
			const d = res && res.data ? res.data : res
			if (d.sessionId) {
				sessionId.value = d.sessionId
				uni.setStorageSync('chatSessionId', d.sessionId)
			}
			const steps = parseSteps(d.answer)
			if (steps) {
				streamMsg.steps = steps; streamMsg.visibleStep = 0; streamMsg.content = ''; streamMsg.subject = d.subject
			} else {
				streamMsg.content = d.answer || '（AI 返回了空内容）'
				streamMsg.subject = d.subject
			}
		} catch (e2) {
			streamMsg.content = '抱歉，AI 服务暂时不可用，请稍后再试。'
		}
	} finally {
		loading.value = false; stopLoadingText()
		scrollToBottom()
	}
}

function scrollToBottom() {
		nextTick(() => {
		scrollInto.value = 'bottom-anchor'
	})
}
</script>

<style>
.chat-page {
		background: #f5f6f8;
}

.msg-list {
		height: calc(100vh - 100rpx - 104rpx - env(safe-area-inset-bottom)); /* 视口 - tabBar - 输入栏 - 安全区 */
		padding: 20rpx 20rpx 0 20rpx;
		box-sizing: border-box;
}

#bottom-anchor {
		height: 20rpx;
}

.welcome-hint {
		padding: 60rpx 40rpx 40rpx;
		display: flex;
		flex-direction: column;
		align-items: center;
}

.deer-logo {
		width: 120rpx;
		height: 120rpx;
		margin-bottom: 24rpx;
}

.hint-title-row {
		display: flex;
		flex-wrap: wrap;
    justify-content: center;
		gap: 8rpx;
		margin-bottom: 12rpx;
}

.hint-title-text {
		font-size: 34rpx;
		font-weight: 600;
		color: #703820;
}

.hint-logo {
		width: 96rpx;
		height: auto;
		margin-top: -6rpx;
}

.hint-sub {
		font-size: 26rpx;
		color: #6b7280;
		text-align: center;
		line-height: 1.6;
		margin-bottom: 30rpx;
}

.hint-tags {
		display: flex;
		flex-wrap: wrap;
		justify-content: center;
		gap: 16rpx;
}

.hint-tag {
		background: #ffffff;
		border: 2rpx solid #e3e7ee;
		border-radius: 999rpx;
		padding: 12rpx 26rpx;
		font-size: 25rpx;
		color: #e08e00;
}

.msg-row {
		display: flex;
		margin-bottom: 24rpx;
}

.msg-row.user {
		justify-content: flex-end;
}

.bubble {
		max-width: 80%;
		padding: 20rpx 24rpx;
		border-radius: 16rpx;
		background: #ffffff;
		box-shadow: 0 2rpx 8rpx rgba(0, 0, 0, 0.04);
}

.msg-row.user .bubble {
		background: #f0a000;
}

.msg-row.user .msg-text {
		color: #ffffff;
}

.subject-tag {
		display: inline-block;
		font-size: 22rpx;
		color: #f0a000;
		background: rgba(240, 160, 0, 0.1);
		border-radius: 8rpx;
		padding: 4rpx 12rpx;
		margin-bottom: 10rpx;
}

.step-block {
		margin-bottom: 20rpx;
		padding: 16rpx;
		background: rgba(240, 160, 0, 0.04);
		border-radius: 12rpx;
}

.step-title {
		display: block;
		font-size: 24rpx;
		font-weight: bold;
		color: #f0a000;
		margin-bottom: 8rpx;
}

.step-question-row {
		display: flex;
		align-items: flex-start;
		margin-bottom: 12rpx;
}

.step-question {
		flex: 1;
		font-size: 28rpx;
		color: #333;
}

.speak-btn-icon {
		width: 36rpx;
		height: 36rpx;
		flex-shrink: 0;
		cursor: pointer;
		margin-bottom: -8rpx;
}

.step-answer-row {
		display: flex;
		align-items: flex-start;
		flex-wrap: wrap;
}

.step-answer-row .msg-text {
		flex: 1;
}

.step-answer-row .speak-btn-icon {
		margin-left: 8rpx;
}

.speak-btn-text {
		font-size: 24rpx;
		color: #f0a000;
		margin-left: 6rpx;
}

/* step-question 样式已在上方定义 */

.step-answer {
		background: rgba(76, 175, 80, 0.08);
		border-radius: 8rpx;
		padding: 12rpx;
		margin-top: 8rpx;
}

.step-answer-label {
		font-size: 24rpx;
		color: #4caf50;
		font-weight: bold;
}

.step-voice-area {
		display: flex;
		flex-direction: column;
		margin-top: 12rpx;
}

.step-voice-text {
		font-size: 28rpx;
		color: #1565c0;
		background: rgba(33, 150, 243, 0.08);
		border-radius: 8rpx;
		padding: 12rpx 16rpx;
		margin-bottom: 8rpx;
		line-height: 1.5;
}

.step-voice-btn-row {
		display: flex;
		justify-content: center;
		margin-top: 4rpx;
}

.step-voice-btn {
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		width: 120rpx;
		height: 120rpx;
		border-radius: 50%;
		background: rgba(240, 160, 0, 0.12);
		border: 3rpx solid #f0a000;
}

.step-voice-btn.recording {
		background: rgba(244, 67, 54, 0.15);
		border-color: #f44336;
		animation: pulse 1.2s infinite;
}

.step-voice-btn.checking {
		opacity: 0.6;
}

.step-voice-icon {
		width: 48rpx;
		height: 48rpx;
}

.step-voice-label {
		font-size: 20rpx;
		color: #f0a000;
		margin-top: 4rpx;
		white-space: nowrap;
}

.step-voice-btn.recording .step-voice-label {
		color: #f44336;
}

@keyframes pulse {
		0% { transform: scale(1); }
		50% { transform: scale(1.08); }
		100% { transform: scale(1); }
}

.step-hint {
		font-size: 24rpx;
		color: #ff9800;
		margin-top: 8rpx;
}

.step-done {
		font-size: 26rpx;
		color: #4caf50;
		margin-top: 12rpx;
		font-weight: bold;
}

	.step-done-title {
		display: block;
		margin-bottom: 8rpx;
	}

	.step-summary-loading {
		color: #999;
		font-size: 24rpx;
		font-weight: normal;
	}

	.step-summary {
		background: #f0f7ff;
		border-radius: 16rpx;
		padding: 20rpx;
		margin-top: 12rpx;
		border: 1rpx solid #d0e3fa;
	}

	.summary-item {
		display: flex;
		align-items: flex-start;
		margin-bottom: 12rpx;
	}

	.summary-item:last-child {
		margin-bottom: 0;
	}

	.summary-icon {
		font-size: 28rpx;
		margin-right: 8rpx;
		flex-shrink: 0;
		line-height: 1.6;
	}

	.summary-label {
		font-size: 24rpx;
		color: #1976d2;
		font-weight: bold;
		margin-right: 8rpx;
		flex-shrink: 0;
		line-height: 1.6;
	}

	.summary-text {
		font-size: 24rpx;
		color: #555;
		line-height: 1.6;
		flex: 1;
	}

	.summary-speak-row {
		margin-top: 8rpx;
		padding-top: 8rpx;
		border-top: 1rpx dashed #d0e3fa;
		display: flex;
	}

	.summary-speak-row .speak-btn-icon {
		width: 32rpx;
		height: 32rpx;
	}

	.summary-speak-row .speak-btn-text {
		font-size: 24rpx;
		color: #f0a000;
		line-height: 32rpx;
	}

.msg-text {
		font-size: 28rpx;
		line-height: 1.6;
		color: #333333;
		word-break: break-all;
		white-space: pre-wrap;
}

.bottom-area {
		position: fixed;
		bottom: 0;
		left: 0;
		right: 0;
		z-index: 100;
	/* H5 端 tabBar 高度约 50px(100rpx)，加安全区 */
		padding-bottom: calc(100rpx + env(safe-area-inset-bottom));
		background: #ffffff;
}

.popup-wrapper {
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		z-index: 1000;
		pointer-events: none;
		opacity: 0;
		transition: opacity 0.3s;
}

.popup-wrapper.active {
		pointer-events: auto;
		opacity: 1;
}

.popup-backdrop {
		position: absolute;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		background: rgba(0, 0, 0, 0.4);
}

.tool-popup {
		position: absolute;
		bottom: 0;
		left: 0;
		right: 0;
		background: #ffffff;
		border-radius: 24rpx 24rpx 0 0;
		padding: 40rpx 20rpx 60rpx;
		display: flex;
		justify-content: space-around;
		transform: translateY(100%);
		transition: transform 0.3s ease;
}

.popup-wrapper.active .tool-popup {
		transform: translateY(0);
}

.tool-item {
		display: flex;
		flex-direction: column;
		align-items: center;
		gap: 12rpx;
}

.tool-item.recording {
		background: rgba(240, 160, 0, 0.1);
		border-radius: 16rpx;
		padding: 8rpx 16rpx;
}

.tool-icon-img {
		width: 56rpx;
		height: 56rpx;
}

.tool-label {
		font-size: 24rpx;
		color: #666666;
}

.input-bar {
		display: flex;
		align-items: center;
		padding: 16rpx 20rpx;
		background: #ffffff;
		border-top: 1rpx solid #eeeeee;
		padding-bottom: calc(16rpx + env(safe-area-inset-bottom));
		box-sizing: border-box;
}

.tool-trigger {
		width: 60rpx;
		height: 60rpx;
		margin-right: 16rpx;
		flex-shrink: 0;
}

.input {
		flex: 1;
		height: 72rpx;
		background: #f5f6f8;
		border-radius: 36rpx;
		padding: 0 28rpx;
		font-size: 28rpx;
		margin-right: 16rpx;
}

.send-btn {
		background: #f0a000 !important;
		color: #ffffff !important;
}

/* ========== 消息内图片 ========== */
.msg-image {
		max-width: 400rpx;
		border-radius: 8rpx;
		margin-bottom: 8rpx;
}




.stream-cursor {
		display: inline-block;
		color: #f0a000;
		animation: blink 0.8s infinite;
		font-weight: bold;
}
@keyframes blink {
	0%, 50% { opacity: 1; }
	51%, 100% { opacity: 0; }
}
</style>
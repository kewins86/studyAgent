<template>
	<view v-if="visible" class="crop-overlay">
		<image :src="src" mode="widthFix" class="crop-image" @load="onCropImageLoad" />
		<view class="crop-box" :style="cropBoxStyle"
			@touchstart="onCropBoxTouchStart" @touchmove="onCropBoxTouchMove" @touchend="onCropTouchEnd">
			<view class="crop-handle crop-handle-tl"></view>
			<view class="crop-handle crop-handle-tr"></view>
			<view class="crop-handle crop-handle-bl"></view>
			<view class="crop-handle crop-handle-br"></view>
		</view>
		<view class="crop-hint">拖动框选题目区域，拖四角调整大小</view>
		<view class="crop-actions">
			<button class="crop-btn crop-cancel" @click="cancelCrop">取消</button>
			<button class="crop-btn crop-confirm" @click="confirmCrop" :disabled="cropping">{{ cropping ? '处理中…' : '确认' }}</button>
		</view>
	</view>
</template>

<script setup>
import { ref, nextTick, watch } from 'vue'

const props = defineProps({
	visible: { type: Boolean, default: false },
	src: { type: String, default: '' }
})
const emit = defineEmits(['confirm', 'cancel'])

const cropping = ref(false)
// 框选框位置（px，相对于屏幕）
const cropBox = ref({ x: 50, y: 200, w: 250, h: 200 })
// 图片实际渲染尺寸和偏移
const cropImgLayout = ref({ x: 0, y: 0, w: 0, h: 0, natW: 0, natH: 0 })
const cropBoxStyle = ref('')
// cropTouchStart: { px, py, boxX, boxY, boxW, boxH, mode: 'move'|'tl'|'tr'|'bl'|'br' }
let cropTouchStart = null
const HANDLE_SIZE = 30

watch(() => props.visible, (v) => {
	if (!v) {
		cropping.value = false
		cropTouchStart = null
	}
})

function updateCropBoxStyle() {
	cropBoxStyle.value = `left:${cropBox.value.x}px;top:${cropBox.value.y}px;width:${cropBox.value.w}px;height:${cropBox.value.h}px;`
}

function onCropImageLoad() {
	nextTick(() => {
		// uni-app <image> 在 H5 渲染为 <uni-image>，需取内部真实 <img>
		let imageEl = document.querySelector('.crop-image img')
		if (!imageEl) {
			const uniImg = document.querySelector('.crop-image')
			if (uniImg && uniImg.querySelector) imageEl = uniImg.querySelector('img')
		}
		if (!imageEl) imageEl = document.querySelector('.crop-image')
		if (imageEl) {
			const rect = imageEl.getBoundingClientRect()
			const natW = imageEl.naturalWidth || rect.width
			const natH = imageEl.naturalHeight || rect.height
			cropImgLayout.value = { x: rect.left, y: rect.top, w: rect.width, h: rect.height, natW, natH }
			cropBox.value = {
				x: rect.left + rect.width * 0.1,
				y: rect.top + rect.height * 0.15,
				w: rect.width * 0.8,
				h: rect.height * 0.55
			}
			updateCropBoxStyle()
		} else {
			cropBox.value = { x: 30, y: 150, w: window.innerWidth - 60, h: 300 }
			updateCropBoxStyle()
		}
	})
}

function onCropBoxTouchStart(e) {
	const touch = e.touches[0]
	const px = touch.clientX
	const py = touch.clientY
	const box = cropBox.value
	let mode = 'move'
	if (Math.abs(px - box.x) < HANDLE_SIZE && Math.abs(py - box.y) < HANDLE_SIZE) mode = 'tl'
	else if (Math.abs(px - (box.x + box.w)) < HANDLE_SIZE && Math.abs(py - box.y) < HANDLE_SIZE) mode = 'tr'
	else if (Math.abs(px - box.x) < HANDLE_SIZE && Math.abs(py - (box.y + box.h)) < HANDLE_SIZE) mode = 'bl'
	else if (Math.abs(px - (box.x + box.w)) < HANDLE_SIZE && Math.abs(py - (box.y + box.h)) < HANDLE_SIZE) mode = 'br'
	cropTouchStart = { px, py, boxX: box.x, boxY: box.y, boxW: box.w, boxH: box.h, mode }
}

function onCropBoxTouchMove(e) {
	if (!cropTouchStart) return
	e.preventDefault && e.preventDefault()
	const touch = e.touches[0]
	const dx = touch.clientX - cropTouchStart.px
	const dy = touch.clientY - cropTouchStart.py
	const img = cropImgLayout.value
	const minSize = 50
	const maxBottom = window.innerHeight - 120
	let { boxX, boxY, boxW, boxH, mode } = cropTouchStart
	let newX = boxX, newY = boxY, newW = boxW, newH = boxH

	if (mode === 'move') {
		newX = boxX + dx
		newY = boxY + dy
		newX = Math.max(img.x, Math.min(newX, img.x + img.w - boxW))
		newY = Math.max(img.y, Math.min(newY, maxBottom - boxH))
	} else if (mode === 'tl') {
		newX = Math.max(img.x, Math.min(boxX + dx, boxX + boxW - minSize))
		newY = Math.max(img.y, Math.min(boxY + dy, boxY + boxH - minSize))
		newW = boxX + boxW - newX
		newH = boxY + boxH - newY
	} else if (mode === 'tr') {
		newY = Math.max(img.y, Math.min(boxY + dy, boxY + boxH - minSize))
		newW = Math.max(minSize, Math.min(boxW + dx, img.x + img.w - boxX))
		newH = boxY + boxH - newY
	} else if (mode === 'bl') {
		newX = Math.max(img.x, Math.min(boxX + dx, boxX + boxW - minSize))
		newW = boxX + boxW - newX
		newH = Math.max(minSize, Math.min(boxH + dy, maxBottom - boxY))
	} else if (mode === 'br') {
		newW = Math.max(minSize, Math.min(boxW + dx, img.x + img.w - boxX))
		newH = Math.max(minSize, Math.min(boxH + dy, maxBottom - boxY))
	}

	cropBox.value = { x: newX, y: newY, w: newW, h: newH }
	updateCropBoxStyle()
}

function onCropTouchEnd() {
	cropTouchStart = null
}

function cancelCrop() {
	cropping.value = false
	emit('cancel')
}

function confirmCrop() {
	if (cropping.value) return
	cropping.value = true
	const img = cropImgLayout.value
	const box = cropBox.value
	// 计算框选区域相对于图片的比例
	const sx = (box.x - img.x) / img.w
	const sy = (box.y - img.y) / img.h
	const sw = box.w / img.w
	const sh = box.h / img.h

	try {
		let imageEl = document.querySelector('.crop-image img')
		if (!imageEl) {
			const uniImg = document.querySelector('.crop-image')
			if (uniImg && uniImg.querySelector) imageEl = uniImg.querySelector('img')
		}
		if (!imageEl) imageEl = document.querySelector('.crop-image')
		if (imageEl && imageEl.naturalWidth) {
			const natW = imageEl.naturalWidth
			const natH = imageEl.naturalHeight
			const canvas = document.createElement('canvas')
			canvas.width = Math.round(natW * sw)
			canvas.height = Math.round(natH * sh)
			const ctx = canvas.getContext('2d')
			ctx.drawImage(imageEl, natW * sx, natH * sy, natW * sw, natH * sh, 0, 0, canvas.width, canvas.height)
			const dataUrl = canvas.toDataURL('image/jpeg', 0.85)
			const base64 = dataUrl.split(',')[1]
			cropping.value = false
			emit('confirm', base64, dataUrl)
			return
		}
	} catch (e) {
		console.error('[CropOverlay] H5 canvas 裁剪失败', e)
	}
	cropping.value = false
	uni.showToast({ title: '图片裁剪失败，请重试', icon: 'none' })
}
</script>

<style>
/* ========== 图片框选裁剪（全局，覆盖在页面之上） ========== */
.crop-overlay {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	z-index: 3000;
	background: #000000;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.crop-image {
	width: 100vw;
	height: auto;
}

.crop-box {
	position: fixed;
	border: 4rpx solid #f0a000;
	background: transparent;
	box-shadow: 0 0 0 9999rpx rgba(0, 0, 0, 0.5);
	z-index: 3001;
}

.crop-handle {
	position: absolute;
	width: 40rpx;
	height: 40rpx;
	background: #f0a000;
	border-radius: 6rpx;
}

.crop-handle-tl { top: -8rpx; left: -8rpx; }
.crop-handle-tr { top: -8rpx; right: -8rpx; }
.crop-handle-bl { bottom: -8rpx; left: -8rpx; }
.crop-handle-br { bottom: -8rpx; right: -8rpx; }

.crop-hint {
	position: fixed;
	bottom: 180rpx;
	left: 0;
	right: 0;
	text-align: center;
	color: #ffffff;
	font-size: 28rpx;
	z-index: 3002;
}

.crop-actions {
	position: fixed;
	bottom: 60rpx;
	left: 0;
	right: 0;
	display: flex;
	justify-content: center;
	gap: 40rpx;
	z-index: 3002;
	padding-bottom: env(safe-area-inset-bottom);
}

.crop-btn {
	min-width: 200rpx;
	height: 80rpx;
	line-height: 80rpx;
	border-radius: 40rpx;
	font-size: 30rpx;
	text-align: center;
}

.crop-cancel {
	background: #333333 !important;
	color: #ffffff !important;
}

.crop-confirm {
	background: #f0a000 !important;
	color: #ffffff !important;
}
</style>

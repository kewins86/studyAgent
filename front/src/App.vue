<script>
import { getMe } from '@/api/index'
export default {
  onLaunch: function () {
    console.log('App Launch')
    // 已有 token：后台校验有效性（无效则清登录态回登录页）
    const token = uni.getStorageSync('token')
    if (token) {
      getMe().then(res => {
        if (res && res.code !== 0) {
          uni.removeStorageSync('token')
          uni.removeStorageSync('user')
          uni.reLaunch({ url: '/pages/login/login' })
        }
      }).catch(() => {
        // 网络异常：保留本地登录态，不强制登出（避免后端未启动时反复跳登录）
        console.log('[auth] 网络异常，保留本地登录态')
      })
    }
  },
  onShow: function () {
    console.log('App Show')
  },
  onHide: function () {
    console.log('App Hide')
  },
}
</script>

<style>
/*每个页面公共css */

/* === 修复 uni-app H5 页面不能滚动 === */
/* uni-page-wrapper 默认 height:100% + overflow:visible,
   内容溢出后依赖 body 的 overflow-y:auto 滚动，
   但在某些布局下不可靠。直接在 page-wrapper 上开启 overflow-y:auto。 */
uni-page-wrapper {
	overflow-y: auto !important;
	overflow-x: hidden !important;
}

/* === 全局弹框样式覆盖（H5） === */
/* uni-app showModal 标题/内容/按钮字体缩小 */
.uni-modal {
  border-radius: 24rpx !important;
}
.uni-modal__title {
	font-size: 16px !important;
}
.uni-modal__bd {
	font-size: 14px !important;
}
.uni-modal__btn {
	font-size: 15px !important;
}
/* 输入框背景色 */
.uni-modal__textarea {
	background-color: #FFF4DC !important;
  font-size: 13px !important;
}
/* Toast 字体缩小 */
.uni-toast__content {
	font-size: 13px !important;
}
</style>

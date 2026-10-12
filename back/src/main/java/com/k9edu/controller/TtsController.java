package com.k9edu.controller;

import com.k9edu.common.Result;
import com.k9edu.service.TtsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * TTS 语音合成接口
 * 前端调用 → 后端调 edge-tts 生成 mp3 → 返回 base64 音频数据
 */
@RestController
@RequestMapping("/api/tts")
public class TtsController {

	private static final Logger log = LoggerFactory.getLogger(TtsController.class);

	@Autowired
	private TtsService ttsService;

	/**
	 * 文字转语音
	 * POST /api/tts
	 * Body: { "text": "要播放的文字" }
	 * Response: { code: 0, data: { audio: "base64mp3..." } }
	 */
	@PostMapping
	public Result<Map<String, String>> synthesize(@RequestBody Map<String, String> body) {
		String text = body.get("text");
		if (text == null || text.trim().isEmpty()) {
			return Result.fail(1001, "text 不能为空");
		}

		// 可选：自定义语音/语速/语调
		String voice = body.get("voice");   // 默认 zh-CN-XiaoxiaoNeural
		String rate = body.get("rate");     // 默认 -10%
		String pitch = body.get("pitch");   // 默认 +10%

		String base64Audio = ttsService.synthesize(text, voice, rate, pitch);
		if (base64Audio == null) {
			return Result.fail(5001, "语音合成失败，请稍后重试");
		}

		return Result.ok(Map.of("audio", base64Audio));
	}
}

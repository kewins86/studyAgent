package com.k9edu.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Base64;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * TTS 语音合成服务
 * 使用 edge-tts（微软 Edge Neural TTS，免费）生成 mp3 音频
 * 需要系统已安装 Python3 + edge-tts（pip install edge-tts）
 *
 * 可选中文语音：
 * - zh-CN-XiaoxiaoNeural: 女声·温暖（默认，适合教育场景）
 * - zh-CN-XiaoyiNeural: 女声·活泼
 * - zh-CN-YunxiNeural: 男声·阳光
 * - zh-CN-YunyangNeural: 男声·专业
 */
@Service
public class TtsService {

	private static final Logger log = LoggerFactory.getLogger(TtsService.class);

	/** edge-tts CLI 路径 */
	private static final String EDGE_TTS_CMD = "edge-tts";

	/** 临时文件目录 */
	private static final String TMP_DIR = System.getProperty("java.io.tmpdir");

	/** 默认语音（温暖女声，适合小学生） */
	private static final String DEFAULT_VOICE = "zh-CN-XiaoxiaoNeural";

	/** 语速（+0% 正常，-10% 稍慢适合孩子） */
	private static final String DEFAULT_RATE = "-10%";

	/** 语调（+0Hz 正常，+10Hz 略高更亲切） */
	private static final String DEFAULT_PITCH = "+10Hz";

	/**
	 * 把文字转成语音，返回 base64 编码的 mp3
	 *
	 * @param text 要合成的文字（≤500字）
	 * @return base64 mp3 数据（可直接用于 data:audio/mp3;base64,xxx）
	 */
	public String synthesize(String text) {
		return synthesize(text, DEFAULT_VOICE, DEFAULT_RATE, DEFAULT_PITCH);
	}

	/**
	 * 把文字转成语音，返回 base64 编码的 mp3
	 *
	 * @param text  要合成的文字
	 * @param voice 语音名称（如 zh-CN-XiaoxiaoNeural）
	 * @param rate  语速（如 "-10%"）
	 * @param pitch 语调（如 "+10%"）
	 * @return base64 mp3 数据
	 */
	public String synthesize(String text, String voice, String rate, String pitch) {
		if (text == null || text.trim().isEmpty()) {
			return null;
		}

		// 限制长度（edge-tts 单次合成限制）
		if (text.length() > 500) {
			text = text.substring(0, 500);
		}

		String filename = "tts_" + UUID.randomUUID().toString().replace("-", "") + ".mp3";
		File outputFile = new File(TMP_DIR, filename);

		try {
			ProcessBuilder pb = new ProcessBuilder(
					EDGE_TTS_CMD,
					"--voice", voice != null ? voice : DEFAULT_VOICE,
					"--text", text,
					"--rate", rate != null ? rate : DEFAULT_RATE,
					"--pitch", pitch != null ? pitch : DEFAULT_PITCH,
					"--write-media", outputFile.getAbsolutePath()
			);
			pb.redirectErrorStream(true);
			Process process = pb.start();

			// 等待完成（超时 30 秒）
			boolean finished = process.waitFor(30, TimeUnit.SECONDS);
			if (!finished) {
				process.destroyForcibly();
				log.error("TTS 合成超时: text='{}'", text.substring(0, Math.min(50, text.length())));
				return null;
			}

			int exitCode = process.exitValue();
			if (exitCode != 0) {
				String error = new String(process.getInputStream().readAllBytes());
				log.error("TTS 合成失败 (exit={}): {}", exitCode, error);
				return null;
			}

			if (!outputFile.exists() || outputFile.length() == 0) {
				log.error("TTS 输出文件为空");
				return null;
			}

			// 读取 mp3 文件并转 base64
			byte[] audioBytes = Files.readAllBytes(outputFile.toPath());
			String base64 = Base64.getEncoder().encodeToString(audioBytes);

			log.info("TTS 合成成功: text='{}', size={}bytes, base64={}chars",
					text.substring(0, Math.min(30, text.length())), audioBytes.length, base64.length());

			return base64;

		} catch (IOException e) {
			log.error("TTS IO 异常: {}", e.getMessage());
			return null;
		} catch (InterruptedException e) {
			Thread.currentThread().interrupt();
			log.error("TTS 被中断");
			return null;
		} finally {
			// 清理临时文件
			if (outputFile.exists()) {
				outputFile.delete();
			}
		}
	}
}

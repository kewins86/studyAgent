package com.k9edu.common;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestClient;

import java.util.List;
import java.util.Map;

/**
 * LLM 客户端（DeepSeek，OpenAI 兼容接口）
 * <p>
 * 统一封装所有大模型调用，业务代码不直接碰 HTTP。
 * 对应前端思维的 lib/llm.ts —— 就是一个 fetch 封装。
 */
@Slf4j
@Component
public class LlmClient {

    private final RestClient restClient;
    private final ObjectMapper objectMapper = new ObjectMapper();

    @Value("${llm.base-url}")
    private String baseUrl;

    @Value("${llm.api-key}")
    private String apiKey;

    @Value("${llm.model}")
    private String model;

    @Value("${llm.vision-model:gpt-5.4-mini-2}")
    private String visionModel;

    @Value("${llm.timeout-seconds}")
    private int timeoutSeconds;

    public LlmClient() {
        SimpleClientHttpRequestFactory factory = new SimpleClientHttpRequestFactory();
        factory.setConnectTimeout(10_000);
        factory.setReadTimeout(60_000);
        this.restClient = RestClient.builder()
                .requestFactory(factory)
                .build();
    }

    /**
     * 普通对话
     *
     * @param systemPrompt 系统提示词（分学科专属提示词从这里传入）
     * @param userMessage  用户消息
     * @return 模型回复文本
     */
    public String chat(String systemPrompt, String userMessage) {
        return chatInternal(List.of(
                Map.of("role", "system", "content", systemPrompt),
                Map.of("role", "user", "content", userMessage)
        ), false);
    }

    /**
     * 多轮对话（带历史上下文）
     *
     * @param systemPrompt 系统提示词
     * @param history      历史消息 [{role: user/assistant, content}]
     * @param userMessage  当前用户消息
     * @return 模型回复文本
     */
    public String chatWithHistory(String systemPrompt, List<Map<String, Object>> history, String userMessage) {
        return chatWithHistory(systemPrompt, history, userMessage, false);
    }

    /**
     * 多轮对话（带历史上下文，可选 JSON mode）
     */
    public String chatWithHistory(String systemPrompt, List<Map<String, Object>> history, String userMessage, boolean jsonMode) {
        List<Map<String, Object>> messages = new java.util.ArrayList<>();
        messages.add(Map.of("role", "system", "content", systemPrompt));
        if (history != null) {
            messages.addAll(history);
        }
        messages.add(Map.of("role", "user", "content", userMessage));
        return chatInternal(messages, jsonMode);
    }

    /**
     * 图片识别对话（Vision）
     *
     * @param systemPrompt 系统提示词
     * @param history      历史消息
     * @param userMessage  用户文字问题
     * @param imageBase64  图片 base64（不含 data: 前缀）
     * @return 模型回复文本
     */
    public String chatWithImage(String systemPrompt, List<Map<String, Object>> history, String userMessage, String imageBase64) {
        return chatWithImage(systemPrompt, history, userMessage, imageBase64, false);
    }

    public String chatWithImage(String systemPrompt, List<Map<String, Object>> history, String userMessage, String imageBase64, boolean jsonMode) {
        List<Map<String, Object>> messages = new java.util.ArrayList<>();
        messages.add(Map.of("role", "system", "content", systemPrompt));
        if (history != null) {
            messages.addAll(history);
        }
        // OpenAI Vision 格式：content 是数组，含 text + image_url
        List<Map<String, Object>> contentParts = new java.util.ArrayList<>();
        contentParts.add(Map.of("type", "text", "text", userMessage));
        contentParts.add(Map.of("type", "image_url", "image_url",
                Map.of("url", "data:image/jpeg;base64," + imageBase64)));
        messages.add(Map.of("role", "user", "content", contentParts));
        return chatInternal(messages, jsonMode, visionModel);
    }

    /**
     * 图片中题目区域检测（Vision + JSON）
     * 返回 JSON：{"x":0.1, "y":0.2, "w":0.6, "h":0.3}（归一化 0-1）
     *
     * @param imageBase64 图片 base64（不含 data: 前缀）
     * @return 解析后的坐标 JSON；失败返回 null
     */
    public JsonNode detectQuestionArea(String imageBase64) {
        String systemPrompt = "你是一个题目区域检测助手。分析图片，找到其中题目所在的区域。" +
                "返回 JSON 格式：{\"x\": 归一化左上角x, \"y\": 归一化左上角y, \"w\": 归一化宽度, \"h\": 归一化高度}。" +
                "坐标均为 0-1 的归一化值（相对于图片宽高）。" +
                "如果图片中有多道题目，框选所有题目的整体区域。" +
                "如果图片中没有题目，返回 {\"x\":0, \"y\":0, \"w\":1, \"h\":1}。";
        String userMessage = "请检测这张图片中题目所在的区域，返回归一化坐标 JSON。";

        List<Map<String, Object>> messages = new java.util.ArrayList<>();
        messages.add(Map.of("role", "system", "content", systemPrompt));
        List<Map<String, Object>> contentParts = new java.util.ArrayList<>();
        contentParts.add(Map.of("type", "text", "text", userMessage));
        contentParts.add(Map.of("type", "image_url", "image_url",
                Map.of("url", "data:image/jpeg;base64," + imageBase64)));
        messages.add(Map.of("role", "user", "content", contentParts));

        String raw = chatInternal(messages, true, visionModel);
        try {
            return objectMapper.readTree(raw);
        } catch (Exception e) {
            log.error("题目区域检测返回非 JSON，raw={}", raw, e);
            return null;
        }
    }

    /**
     * 结构化 JSON 输出（要求模型返回 JSON，如学科分类、学习计划）
     *
     * @param systemPrompt 系统提示词
     * @param userMessage  用户消息
     * @return 解析后的 JSON 节点；解析失败返回 null（调用方走兜底逻辑）
     */
    public JsonNode chatJson(String systemPrompt, String userMessage) {
        String raw = chatInternal(List.of(
                Map.of("role", "system", "content", systemPrompt),
                Map.of("role", "user", "content", userMessage)
        ), true);
        try {
            return objectMapper.readTree(raw);
        } catch (Exception e) {
            log.error("LLM 返回非 JSON，raw={}", raw, e);
            return null;
        }
    }

    private String chatInternal(List<Map<String, Object>> messages, boolean jsonMode) {
        return chatInternal(messages, jsonMode, model);
    }

    private String chatInternal(List<Map<String, Object>> messages, boolean jsonMode, String useModel) {
        Map<String, Object> body = new java.util.HashMap<>();
        body.put("model", useModel);
        body.put("messages", messages);
        body.put("temperature", 0.5);
        body.put("max_tokens", 1500);
        if (jsonMode) {
            body.put("response_format", Map.of("type", "json_object"));
        }

        try {
            String url = baseUrl + "/chat/completions";
            Map<?, ?> resp = restClient.post()
                    .uri(url)
                    .header("Authorization", "Bearer " + apiKey)
                    .header("Content-Type", "application/json")
                    .body(body)
                    .retrieve()
                    .body(Map.class);

            if (resp == null) {
                throw new RuntimeException("LLM 返回为空");
            }
            List<?> choices = (List<?>) resp.get("choices");
            if (choices == null || choices.isEmpty()) {
                throw new RuntimeException("LLM 返回无 choices: " + resp);
            }
            Map<?, ?> first = (Map<?, ?>) choices.get(0);
            Map<?, ?> message = (Map<?, ?>) first.get("message");
            String content = (String) message.get("content");
            if (jsonMode) {
                // DeepSeek 可能在 JSON 外包 ```json 代码块，剥掉
                content = content.replaceAll("^```json\\s*", "").replaceAll("\\s*```$", "").trim();
            }
            return content;
        } catch (Exception e) {
            log.error("LLM 调用失败: {}", e.getMessage());
            throw new RuntimeException("AI 服务暂时不可用，请稍后再试", e);
        }
    }

    /**
     * 流式对话（SSE）逐块返回 content delta
     * 调用方传入 Consumer<String> 接收每个文本片段
     */
    public void chatStream(String systemPrompt, List<Map<String, Object>> history, String userMessage,
                           java.util.function.Consumer<String> onDelta, java.util.function.Consumer<String> onComplete) {
        List<Map<String, Object>> messages = new java.util.ArrayList<>();
        messages.add(Map.of("role", "system", "content", systemPrompt));
        if (history != null) messages.addAll(history);
        messages.add(Map.of("role", "user", "content", userMessage));

        Map<String, Object> body = new java.util.HashMap<>();
        body.put("model", model);
        body.put("messages", messages);
        body.put("temperature", 0.5);
        body.put("max_tokens", 1500);
        body.put("stream", true);

        try {
            java.net.URL url = new java.net.URL(baseUrl + "/chat/completions");
            java.net.HttpURLConnection conn = (java.net.HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "Bearer " + apiKey);
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setDoOutput(true);
            conn.setConnectTimeout(15_000);
            conn.setReadTimeout(120_000);

            objectMapper.writeValue(conn.getOutputStream(), body);

            StringBuilder full = new StringBuilder();
            try (java.io.BufferedReader reader = new java.io.BufferedReader(
                    new java.io.InputStreamReader(conn.getInputStream(), java.nio.charset.StandardCharsets.UTF_8))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    if (!line.startsWith("data: ")) continue;
                    String data = line.substring(6).trim();
                    if ("[DONE]".equals(data)) break;
                    try {
                        JsonNode chunk = objectMapper.readTree(data);
                        JsonNode delta = chunk.path("choices").get(0).path("delta").path("content");
                        if (!delta.isMissingNode() && !delta.isNull()) {
                            String text = delta.asText();
                            full.append(text);
                            onDelta.accept(text);
                        }
                    } catch (Exception ignored) {}
                }
            }
            onComplete.accept(full.toString());
            conn.disconnect();
        } catch (Exception e) {
            log.error("LLM 流式调用失败: {}", e.getMessage());
            throw new RuntimeException("AI 流式服务不可用", e);
        }
    }
}

package com.k9edu.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.k9edu.common.LlmClient;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * AI 画像生成服务
 * <p>
 * 问卷提交后，调用 LLM 根据 21 题答案生成个性化画像描述。
 * 输出：一段自然语言总结 + 一组特征标签。
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class ProfileAiService {

    private final LlmClient llmClient;
    private final ObjectMapper objectMapper = new ObjectMapper();

    /** AI 画像生成结果 */
    public record ProfileAiResult(String summary, List<String> tags) {}

    /**
     * 根据问卷答案生成 AI 画像
     *
     * @param extraJson 问卷完整答案 JSON（如 {"1":2,"2":1,"3":"小明",...}）
     * @return 画像结果（summary + tags），失败返回 null
     */
    public ProfileAiResult generate(String extraJson) {
        if (extraJson == null || extraJson.isBlank()) {
            return null;
        }

        String systemPrompt = """
            你是一位资深的小学教育专家和儿童心理顾问。家长刚完成了一份关于孩子的学习问卷，
            请根据问卷答案，为这个孩子生成一份个性化学习画像。

            要求：
            1. 用温暖、专业但易懂的语言，写一段 150-200 字的画像描述
            2. 描述应包含：孩子的学习特点、性格倾向、适合的教学方式
            3. 基于「主动性×学业水平」四象限给出对话策略建议（挑战模式/鼓励支架/趣味驱动/陪伴模式）
            4. 最后给 3-5 个简短的特征标签（如"自主型学习者"、"需鼓励驱动"等）

            输出格式（JSON）：
            {
              "summary": "画像描述正文",
              "strategy": "对话策略建议",
              "tags": ["标签1", "标签2", "标签3"]
            }
            """;

        String userMessage = "问卷答案如下（JSON 格式，key 是题号，value 是选项索引或文本）：\n" + extraJson
                + "\n\n题目参考：\n"
                + "Q1 今年9月升几年级（0-5对应一至六年级）\n"
                + "Q2 数学水平（0优秀 1良好 2中等 3偏弱 4待观察）\n"
                + "Q3 孩子昵称\n"
                + "Q4 平时谁辅导（0独立 1家长 2祖辈 3校外 4无人管）\n"
                + "Q5 遇难题反应（0自己想 1马上问 2等家长 3跳过）\n"
                + "Q6 成绩趋势（0稳定 1时好时坏 2下滑 3进步 4不清楚）\n"
                + "Q7 每天学数学时长（0<15min 1 15-30min 2 30-60min 3>60min）\n"
                + "Q8 暑假辅导班（选答）\n"
                + "Q9-14 李克特5级（0非常不符合→4非常符合）：兴趣/坚持/表扬敏感/专注/粗心(反向)/挑战\n"
                + "Q15 学习方式偏好（多选：0图文 1闯关 2故事 3做题 4挑战）\n"
                + "Q16 讲解节奏（0支架型 1对照型 2留白型）\n"
                + "Q17 错题态度（选答）\n"
                + "Q18 情境主题（多选，选答）\n"
                + "Q19-21 使用预期（选答）";

        try {
            JsonNode result = llmClient.chatJson(systemPrompt, userMessage);
            if (result == null) {
                log.warn("AI 画像生成返回 null，extra={}", extraJson);
                return null;
            }

            String summary = result.has("summary") ? result.get("summary").asText() : "";
            String strategy = result.has("strategy") ? result.get("strategy").asText() : "";

            // 拼接 summary + strategy 作为完整画像描述
            StringBuilder fullSummary = new StringBuilder(summary);
            if (!strategy.isBlank()) {
                fullSummary.append("\n\n💡 教学策略：").append(strategy);
            }

            // 标签单独提取
            List<String> tags = new ArrayList<>();
            if (result.has("tags") && result.get("tags").isArray()) {
                for (JsonNode tag : result.get("tags")) {
                    tags.add(tag.asText());
                }
            }

            return new ProfileAiResult(fullSummary.toString(), tags);

        } catch (Exception e) {
            log.error("AI 画像生成失败，extra={}", extraJson, e);
            return null;
        }
    }
}

package com.k9edu.controller;

import cn.dev33.satoken.stp.StpUtil;
import com.k9edu.common.LlmClient;
import com.k9edu.common.Result;
import com.k9edu.service.ChatService;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * 智能答疑接口（功能2+3）
 * <p>
 * POST /api/chat  学科识别 → 专属提示词 → LLM 回答
 * <p>
 * 学生身份从登录态获取（Sa-Token），前端无需传 studentId。
 */
@RestController
@RequestMapping("/api/chat")
@RequiredArgsConstructor
public class ChatController {

    private final ChatService chatService;
    private final LlmClient llmClient;
    private final com.k9edu.service.SubjectRouterService subjectRouterService;

    @PostMapping
    public Result<ChatResp> chat(@RequestBody ChatReq req) {
        Long studentId = StpUtil.getLoginIdAsLong();
        ChatService.ChatResult r = chatService.answer(studentId, req.getSessionId(), req.getQuestion());
        ChatResp resp = new ChatResp();
        resp.setSubject(r.subject);
        resp.setAnswer(r.answer);
        resp.setSessionId(r.sessionId);
        return Result.ok(resp);
    }

    /** 图片答疑：上传图片 + 文字问题 → Vision LLM 识别解析 */
    @PostMapping("/image")
    public Result<ChatResp> chatWithImage(@RequestBody ImageChatReq req) {
        Long studentId = StpUtil.getLoginIdAsLong();
        ChatService.ChatResult r = chatService.answerWithImage(
                studentId, req.getSessionId(), req.getQuestion(), req.getImage());
        ChatResp resp = new ChatResp();
        resp.setSubject(r.subject);
        resp.setAnswer(r.answer);
        resp.setSessionId(r.sessionId);
        return Result.ok(resp);
    }

    /** 题目区域检测：上传图片 → Vision LLM 返回题目所在区域坐标 */
    @PostMapping("/detect")
    public Result<DetectResp> detect(@RequestBody DetectReq req) {
        StpUtil.getLoginIdAsLong(); // 验证登录
        com.fasterxml.jackson.databind.JsonNode coords = llmClient.detectQuestionArea(req.getImage());
        DetectResp resp = new DetectResp();
        if (coords != null && coords.has("x")) {
            resp.setX(coords.get("x").asDouble());
            resp.setY(coords.get("y").asDouble());
            resp.setW(coords.get("w").asDouble());
            resp.setH(coords.get("h").asDouble());
        } else {
            // 降级：返回默认全图 80%
            resp.setX(0.1);
            resp.setY(0.1);
            resp.setW(0.8);
            resp.setH(0.8);
        }
        return Result.ok(resp);
    }

    /** 判断学生回答是否正确 */
    @PostMapping("/check")
    public Result<CheckResp> checkAnswer(@RequestBody CheckReq req) {
        StpUtil.getLoginIdAsLong();
        CheckResp resp = new CheckResp();
        try {
            String prompt = "你是「知鹿老师」，一位温暖耐心的小学辅导老师。判断学生的回答是否正确。\n" +
                    "引导问题：" + req.getQuestion() + "\n" +
                    "标准答案：" + req.getAnswer() + "\n" +
                    "学生回答：" + req.getStudentAnswer() + "\n" +
                    "只返回JSON：{\"correct\":true/false,\"hint\":\"如果不正确，给一句温暖的提示引导孩子再想想，但不直接给答案。语气要亲切，像大哥哥大姐姐在鼓励小朋友。\"}";
            com.fasterxml.jackson.databind.JsonNode node = llmClient.chatJson("你是温暖耐心的小学辅导老师", prompt);
            if (node != null) {
                resp.setCorrect(node.has("correct") && node.get("correct").asBoolean());
                resp.setHint(node.has("hint") ? node.get("hint").asText() : "");
            } else {
                resp.setCorrect(false);
                resp.setHint("判断失败，请重试");
            }
        } catch (Exception e) {
            resp.setCorrect(false);
            resp.setHint("服务暂时不可用");
        }
        return Result.ok(resp);
    }

    @Data
    public static class CheckReq {
        @NotBlank(message = "问题不能为空")
        private String question;
        @NotBlank(message = "标准答案不能为空")
        private String answer;
        @NotBlank(message = "学生回答不能为空")
        private String studentAnswer;
    }

    /** 题目解析总结：全部步骤答完后，生成考点/知识点/注意事项 */
    @PostMapping("/summary")
    public Result<SummaryResp> summary(@RequestBody SummaryReq req) {
        StpUtil.getLoginIdAsLong();
        SummaryResp resp = new SummaryResp();
        try {
            // 拼接所有步骤的 Q&A
            StringBuilder stepsText = new StringBuilder();
            if (req.getSteps() != null) {
                for (int i = 0; i < req.getSteps().size(); i++) {
                    var s = req.getSteps().get(i);
                    stepsText.append("步骤" + (i + 1) + "：").append(s.get("question")).append(" → ").append(s.get("answer")).append("\n");
                }
            }
            String prompt = "你是「知鹿老师」，一位温暖耐心的小学辅导老师。" +
                    "学生刚刚完成了一道题的分步引导练习，请根据题目和解答过程，生成一段简短的总结。\n\n" +
                    "题目：" + req.getQuestion() + "\n" +
                    "解答过程：\n" + stepsText.toString() + "\n" +
                    "请返回JSON，格式如下：\n" +
                    "{\n" +
                    "  \"points\": \"这道题的核心考点（1-2句话，用孩子能理解的语言）\",\n" +
                    "  \"knowledge\": \"涉及的知识点（具体列出1-3个知识点，用顿号分隔）\",\n" +
                    "  \"tips\": \"注意事项或易错点（1-2句话，提醒孩子下次注意什么）\",\n" +
                    "}\n" +
                    "语气要亲切温暖，像大哥哥大姐姐在跟小朋友聊天。";
            com.fasterxml.jackson.databind.JsonNode node = llmClient.chatJson("你是温暖耐心的小学辅导老师", prompt);
            if (node != null) {
                resp.setPoints(node.has("points") ? node.get("points").asText() : "");
                resp.setKnowledge(node.has("knowledge") ? node.get("knowledge").asText() : "");
                resp.setTips(node.has("tips") ? node.get("tips").asText() : "");
            } else {
                resp.setPoints("总结生成失败，请重试");
            }
        } catch (Exception e) {
            resp.setPoints("服务暂时不可用");
        }
        return Result.ok(resp);
    }

    @Data
    public static class SummaryReq {
        @NotBlank(message = "问题不能为空")
        private String question;
        /** 步骤列表，每步含 question 和 answer */
        private java.util.List<java.util.Map<String, String>> steps;
    }

    @Data
    public static class SummaryResp {
        private String points;     // 考点
        private String knowledge;  // 知识点
        private String tips;       // 注意事项
    }

    @Data
    public static class CheckResp {
        private boolean correct;
        private String hint;
    }

    @Data
    public static class ChatReq {
        /** 会话ID，可空（不传则后端自动定位/新建会话） */
        private Long sessionId;
        @NotBlank(message = "问题不能为空")
        private String question;
    }

    @Data
    public static class ChatResp {
        private String subject;
        private String answer;
        private Long sessionId;
    }

    @Data
    public static class ImageChatReq {
        private Long sessionId;
        @NotBlank(message = "问题不能为空")
        private String question;
        @NotBlank(message = "图片不能为空")
        private String image; // base64（不含 data: 前缀）
    }

    @Data
    public static class DetectReq {
        @NotBlank(message = "图片不能为空")
        private String image; // base64（不含 data: 前缀）
    }

    @Data
    public static class DetectResp {
        private double x; // 归一化左上角 x (0-1)
        private double y; // 归一化左上角 y (0-1)
        private double w; // 归一化宽度 (0-1)
        private double h; // 归一化高度 (0-1)
    }

    /** 流式答疑（SSE）：逐字返回，前端实时显示 */
    @PostMapping(value = "/stream", produces = org.springframework.http.MediaType.TEXT_EVENT_STREAM_VALUE)
    public org.springframework.web.servlet.mvc.method.annotation.SseEmitter chatStream(@RequestBody ChatReq req) {
        Long studentId = StpUtil.getLoginIdAsLong();
        org.springframework.web.servlet.mvc.method.annotation.SseEmitter emitter = new org.springframework.web.servlet.mvc.method.annotation.SseEmitter(120_000L);

        new Thread(() -> {
            try {
                // 关键词分类
                String subject = subjectRouterService.classifyByKeyword(req.getQuestion());
                if (subject == null) subject = "综合";
                String prompt = subjectRouterService.getSubjectPrompt(subject);

                // 发送学科标签
                emitter.send(org.springframework.web.servlet.mvc.method.annotation.SseEmitter.event().name("subject").data(subject));

                // 流式 LLM
                StringBuilder full = new StringBuilder();
                llmClient.chatStream(prompt, null, req.getQuestion(), delta -> {
                    try {
                        emitter.send(org.springframework.web.servlet.mvc.method.annotation.SseEmitter.event().name("delta").data(delta));
                    } catch (Exception ignored) {}
                }, complete -> {
                    try {
                        emitter.send(org.springframework.web.servlet.mvc.method.annotation.SseEmitter.event().name("done").data(complete));
                        emitter.complete();
                    } catch (Exception ignored) {}
                });
            } catch (Exception e) {
                try {
                    emitter.send(org.springframework.web.servlet.mvc.method.annotation.SseEmitter.event().name("error").data(e.getMessage()));
                    emitter.complete();
                } catch (Exception ignored) {}
            }
        }).start();

        return emitter;
    }
}

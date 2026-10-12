package com.k9edu.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.k9edu.common.LlmClient;
import com.k9edu.entity.ChatMessage;
import com.k9edu.entity.ChatSession;
import com.k9edu.mapper.ChatMessageMapper;
import com.k9edu.mapper.ChatSessionMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * 智能答疑编排服务（核心链路）
 * <p>
 * 流程：意图识别（学科）→ 匹配学科专属提示词 → LLM 回答 → 落库（会话+消息）
 * 后续增强点：
 * - 苏格拉底引导模式（多轮追问）
 * - 命中知识点 → 关联错题/微课推送
 * - 会话历史作为上下文
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class ChatService {

    public final SubjectRouterService subjectRouterService;
    private final LlmClient llmClient;
    private final ChatSessionMapper chatSessionMapper;
    private final ChatMessageMapper chatMessageMapper;

    /**
     * 智能答疑（带上下文）
     * <p>
     * 会话定位优先级：前端传 sessionId > 按 studentId 找最近会话 > 新建会话
     * 历史消息（最近 20 条）随请求一起发给 LLM，实现多轮上下文
     *
     * @param studentId 学生ID（可空，匿名对话）
     * @param sessionId 会话ID（可空，不传则自动定位/新建）
     * @param question  学生问题
     * @return 包含学科、回答与会话ID的结果
     */
    /**
     * 定位会话：前端传 sessionId 优先，否则按学生最近会话，否则新建
     */
    private ChatSession locateSession(Long studentId, Long sessionId, String subject) {
        ChatSession session = null;
        if (sessionId != null) {
            session = chatSessionMapper.selectById(sessionId);
        }
        if (session == null && studentId != null) {
            session = chatSessionMapper.selectOne(new QueryWrapper<ChatSession>()
                    .eq("student_id", studentId)
                    .orderByDesc("id")
                    .last("LIMIT 1"));
        }
        if (session == null) {
            session = new ChatSession();
            session.setStudentId(studentId != null ? studentId : 0L);
            session.setSubject(subject);
            chatSessionMapper.insert(session);
        }
        return session;
    }

    /**
     * 读取最近 20 条历史消息（正序），作为 LLM 上下文
     */
    private List<Map<String, Object>> getRecentHistory(Long sessionId) {
        List<Map<String, Object>> history = new ArrayList<>();
        List<ChatMessage> recent = chatMessageMapper.selectList(new QueryWrapper<ChatMessage>()
                .eq("session_id", sessionId)
                .orderByDesc("id")
                .last("LIMIT 20"));
        Collections.reverse(recent);
        for (ChatMessage m : recent) {
            history.add(Map.of("role", m.getRole(), "content", m.getContent()));
        }
        return history;
    }

    /**
     * 落库：用户消息 + AI 消息
     */
    private void saveMessages(Long sessionId, String userContent, String aiContent) {
        ChatMessage userMsg = new ChatMessage();
        userMsg.setSessionId(sessionId);
        userMsg.setRole("user");
        userMsg.setContent(userContent);
        chatMessageMapper.insert(userMsg);

        ChatMessage aiMsg = new ChatMessage();
        aiMsg.setSessionId(sessionId);
        aiMsg.setRole("assistant");
        aiMsg.setContent(aiContent);
        chatMessageMapper.insert(aiMsg);
    }

    /**
     * 从 LLM 返回中解析学科（JSON mode 下返回 {subject: "...", steps: [...]}）
     */
    private String extractSubject(String answer, String defaultSubject) {
        try {
            com.fasterxml.jackson.databind.JsonNode node = new com.fasterxml.jackson.databind.ObjectMapper().readTree(answer);
            if (node.has("subject")) {
                return node.get("subject").asText();
            }
        } catch (Exception ignored) {}
        return defaultSubject;
    }

    @Transactional
    public ChatResult answer(Long studentId, Long sessionId, String question) {
        // 1. 意图识别：先关键词快速命中，未命中则合并分类+解题为一次 LLM 调用
        String subject = subjectRouterService.classifyByKeyword(question);
        String prompt;
        String answer;

        if (subject != null) {
            // 关键词命中：直接用学科 prompt 解题（省掉分类调用）
            prompt = subjectRouterService.getSubjectPrompt(subject);
        } else {
            // 关键词未命中：用通用 prompt + 分类指令合并
            subject = "综合";
            prompt = subjectRouterService.getSubjectPrompt("综合")
                    + "\n\n额外要求：先判断这道题属于哪个学科（语文/数学/英语/物理/化学/生物/历史/地理/政治），"
                    + "在 JSON 中增加一个 \"subject\" 字段。例如：{\"subject\":\"数学\",\"steps\":[...]}";
        }

        // 2. 定位会话 + 读取历史
        ChatSession session = locateSession(studentId, sessionId, subject);
        List<Map<String, Object>> history = getRecentHistory(session.getId());

        // 5. 调用 LLM（带历史上下文，JSON mode 确保返回步骤数组）
        answer = llmClient.chatWithHistory(prompt, history, question, true);

        // 3. 从 LLM 返回中解析学科（关键词未命中时）
        if (subject.equals("综合")) {
            subject = extractSubject(answer, subject);
        }

        // 4. 落库
        saveMessages(session.getId(), question, answer);

        ChatResult result = new ChatResult();
        result.subject = subject;
        result.answer = answer;
        result.sessionId = session.getId();
        return result;
    }

    /**
     * 图片答疑（带上下文）
     * <p>
     * 用户上传图片 + 文字问题 → Vision LLM 识别解析 → 落库
     *
     * @param studentId  学生ID
     * @param sessionId  会话ID
     * @param question   用户文字问题
     * @param imageBase64 图片 base64（不含 data: 前缀）
     * @return 答疑结果
     */
    @Transactional
    public ChatResult answerWithImage(Long studentId, Long sessionId, String question, String imageBase64) {
        // 图片答疑：一次 Vision LLM 调用同时完成学科分类 + 分步解题
        String subject = "综合";
        String prompt = subjectRouterService.getSubjectPrompt("综合")
                + "\n\n额外要求：先判断这道题属于哪个学科（语文/数学/英语/物理/化学/生物/历史/地理/政治），"
                + "在 JSON 中增加一个 \"subject\" 字段。例如：{\"subject\":\"数学\",\"steps\":[...]}";

        // 定位会话 + 读取历史
        ChatSession session = locateSession(studentId, sessionId, subject);
        List<Map<String, Object>> history = getRecentHistory(session.getId());

        // 调用 Vision LLM（一次完成分类+解题）
        String answer = llmClient.chatWithImage(prompt, history, question, imageBase64, true);

        // 从 LLM 返回中解析学科
        subject = extractSubject(answer, subject);

        // 落库（用户消息记录文字问题 + [图片] 标记）
        saveMessages(session.getId(), question + " [图片]", answer);

        ChatResult result = new ChatResult();
        result.subject = subject;
        result.answer = answer;
        result.sessionId = session.getId();
        return result;
    }

    /** 答疑结果 */
    public static class ChatResult {
        public String subject;
        public String answer;
        public Long sessionId;
    }
}

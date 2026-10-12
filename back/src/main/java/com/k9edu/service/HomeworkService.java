package com.k9edu.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.k9edu.common.LlmClient;
import com.k9edu.entity.Homework;
import com.k9edu.entity.HomeworkItem;
import com.k9edu.entity.HomeworkRecord;
import com.k9edu.mapper.HomeworkItemMapper;
import com.k9edu.mapper.HomeworkMapper;
import com.k9edu.mapper.HomeworkRecordMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 家作 Service
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class HomeworkService {

    private final HomeworkMapper homeworkMapper;
    private final HomeworkItemMapper itemMapper;
    private final HomeworkRecordMapper recordMapper;
    private final ObjectMapper objectMapper;
    private final LlmClient llmClient;

    /**
     * AI 识别家作（拍照模式）
     * Vision LLM 识别图片中的作业内容，返回结构化条目
     */
    public List<HomeworkItemDTO> recognizeFromImage(String imageBase64) {
        String systemPrompt = "你是一个小学作业内容识别助手。" +
                "学生会拍家作本/备忘录的照片，你需要识别出其中的作业条目。" +
                "每条作业包含：学科(subject, 只能是'语文'/'数学'/'英语')、作业类型(itemType, 只能是'written'书面/'reading'朗读/'dictation'默写)、内容(content, 简洁描述)。" +
                "\n返回 JSON 数组，格式：[{\"subject\":\"语文\",\"itemType\":\"written\",\"content\":\"抄写生词表1-10各两遍\"}]" +
                "\n如果图片中没有作业内容，返回空数组 []" +
                "\n注意：content 要简洁明了，不要加多余的修饰词。itemType 判断规则：朗读/背诵→reading，默写/听写→dictation，其他(抄写/计算/练习/作文等)→written。";

        String userMessage = "请识别这张图片中的家作内容，返回结构化 JSON。";

        try {
            String raw = llmClient.chatWithImage(systemPrompt, null, userMessage, imageBase64, false);
            log.info("recognizeFromImage raw(前500)={}", raw != null && raw.length() > 500 ? raw.substring(0, 500) : raw);
            return parseHomeworkJson(raw);
        } catch (Exception e) {
            log.error("图片识别家作失败: {}", e.getMessage());
            throw new RuntimeException("图片识别失败，请重试或手动录入", e);
        }
    }

    /**
     * AI 识别家作（文字模式）
     * 学生录音转文字后，LLM 解析成结构化条目
     */
    public List<HomeworkItemDTO> recognizeFromText(String text) {
        String systemPrompt = "你是一个小学作业内容解析助手。" +
                "学生会口述今天的家作内容，你需要解析成结构化条目。" +
                "每条作业包含：学科(subject, 只能是'语文'/'数学'/'英语')、作业类型(itemType, 只能是'written'书面/'reading'朗读/'dictation'默写)、内容(content, 简洁描述)。" +
                "\n返回 JSON 对象，格式：{\"items\":[{\"subject\":\"语文\",\"itemType\":\"written\",\"content\":\"抄写生词表1-10各两遍\"}]}" +
                "\n如果文字中没有作业内容，返回 {\"items\":[]}" +
                "\n注意：content 要简洁明了。itemType 判断规则：朗读/背诵→reading，默写/听写→dictation，其他→written。";

        try {
            JsonNode node = llmClient.chatJson(systemPrompt, text);
            if (node != null && node.has("items") && node.get("items").isArray()) {
                return parseHomeworkJson(node.get("items").toString());
            }
            return List.of();
        } catch (Exception e) {
            log.error("文字解析家作失败: {}", e.getMessage());
            throw new RuntimeException("解析失败，请重试或手动录入", e);
        }
    }

    /**
     * 解析 LLM 返回的 JSON 为 HomeworkItemDTO 列表
     */
    private List<HomeworkItemDTO> parseHomeworkJson(String raw) {
        try {
            // 剥掉可能的 ```json 代码块
            String json = raw.replaceAll("^```json\\s*", "").replaceAll("\\s*```$", "").trim();
            JsonNode root = objectMapper.readTree(json);
            // 兼容两种格式：{"items":[...]} 或直接 [...]
            JsonNode arr = root.isArray() ? root : (root.has("items") ? root.get("items") : null);
            if (arr == null || !arr.isArray()) return List.of();

            List<HomeworkItemDTO> result = new ArrayList<>();
            for (JsonNode item : arr) {
                HomeworkItemDTO dto = new HomeworkItemDTO();
                String subject = item.path("subject").asText("");
                String itemType = item.path("itemType").asText("written");
                String content = item.path("content").asText("");

                // 校验 subject
                if (!subject.equals("语文") && !subject.equals("数学") && !subject.equals("英语")) {
                    subject = "语文"; // 默认
                }
                // 校验 itemType
                if (!itemType.equals("written") && !itemType.equals("reading") && !itemType.equals("dictation")) {
                    itemType = "written";
                }
                if (content.isBlank()) continue;

                dto.setSubject(subject);
                dto.setItemType(itemType);
                dto.setContent(content);
                result.add(dto);
            }
            return result;
        } catch (Exception e) {
            log.error("解析家作 JSON 失败, raw={}", raw, e);
            return List.of();
        }
    }

    /**
     * 获取今日家作（不存在则返回空壳）
     */
    public HomeworkDetail getToday(Long studentId) {
        LocalDate today = LocalDate.now();
        Homework hw = getOrCreateHomework(studentId, today);
        List<HomeworkItem> items = listItems(hw.getId());
        return new HomeworkDetail(hw, items);
    }

    /**
     * 获取指定日期家作
     */
    public HomeworkDetail getByDate(Long studentId, LocalDate date) {
        Homework hw = getOrCreateHomework(studentId, date);
        List<HomeworkItem> items = listItems(hw.getId());
        return new HomeworkDetail(hw, items);
    }

    /**
     * 录入家作条目（批量）
     */
    @Transactional
    public List<HomeworkItem> submitItems(Long studentId, List<HomeworkItemDTO> dtos) {
        LocalDate today = LocalDate.now();
        Homework hw = getOrCreateHomework(studentId, today);

        // 删除今日已有条目（重新录入）
        itemMapper.delete(new LambdaQueryWrapper<HomeworkItem>()
                .eq(HomeworkItem::getHomeworkId, hw.getId()));

        List<HomeworkItem> items = new ArrayList<>();
        int sort = 0;
        for (HomeworkItemDTO dto : dtos) {
            HomeworkItem item = new HomeworkItem();
            item.setHomeworkId(hw.getId());
            item.setStudentId(studentId);
            item.setSubject(dto.getSubject());
            item.setContent(dto.getContent());
            item.setItemType(dto.getItemType() != null ? dto.getItemType() : "written");
            item.setStatus("pending");
            item.setSortOrder(sort++);
            itemMapper.insert(item);
            items.add(item);
        }

        // 记录操作
        logRecord(hw.getId(), studentId, null, "submit",
                Map.of("count", dtos.size(), "date", today.toString()));

        return items;
    }

    /**
     * 提交作业成果（照片/录音）
     * 仅保存成果，不标记完成（完成由家长在检查家作里确认）
     */
    @Transactional
    public HomeworkItem submitResult(Long studentId, Long itemId, String doneImage, String doneAudio) {
        HomeworkItem item = itemMapper.selectById(itemId);
        if (item == null || !item.getStudentId().equals(studentId)) {
            throw new RuntimeException("条目不存在");
        }
        if (doneImage != null) item.setDoneImage(doneImage);
        if (doneAudio != null) item.setDoneAudio(doneAudio);
        itemMapper.updateById(item);

        logRecord(item.getHomeworkId(), studentId, itemId, "submit",
                Map.of("itemType", item.getItemType()));

        return item;
    }

    /**
     * 标记条目完成
     */
    @Transactional
    public HomeworkItem markDone(Long studentId, Long itemId, String doneImage, String doneAudio) {
        HomeworkItem item = itemMapper.selectById(itemId);
        if (item == null || !item.getStudentId().equals(studentId)) {
            throw new RuntimeException("条目不存在");
        }
        item.setStatus("done");
        if (doneImage != null) item.setDoneImage(doneImage);
        if (doneAudio != null) item.setDoneAudio(doneAudio);
        item.setCheckedAt(LocalDateTime.now());
        itemMapper.updateById(item);

        // 检查是否全部完成
        checkHomeworkCompletion(item.getHomeworkId(), studentId);

        // 记录操作
        logRecord(item.getHomeworkId(), studentId, itemId, "done",
                Map.of("itemType", item.getItemType()));

        return item;
    }

    /**
     * 更新 AI 检查结果
     */
    @Transactional
    public void updateAiCheck(Long studentId, Long itemId, String aiResult) {
        HomeworkItem item = itemMapper.selectById(itemId);
        if (item == null || !item.getStudentId().equals(studentId)) {
            throw new RuntimeException("条目不存在");
        }
        item.setAiCheckResult(aiResult);
        itemMapper.updateById(item);

        logRecord(item.getHomeworkId(), studentId, itemId, "ai_check",
                Map.of("result", aiResult != null && aiResult.length() > 200 ? aiResult.substring(0, 200) : aiResult));
    }

    /**
     * 获取家作历史（家长检查用）
     */
    public List<HomeworkDetail> getHistory(Long studentId, int days) {
        LocalDate end = LocalDate.now();
        LocalDate start = end.minusDays(days - 1);
        List<Homework> hws = homeworkMapper.selectList(new LambdaQueryWrapper<Homework>()
                .eq(Homework::getStudentId, studentId)
                .between(Homework::getHomeworkDate, start, end)
                .orderByDesc(Homework::getHomeworkDate));

        return hws.stream().map(hw -> {
            List<HomeworkItem> items = listItems(hw.getId());
            return new HomeworkDetail(hw, items);
        }).collect(Collectors.toList());
    }

    // ========== 内部方法 ==========

    private Homework getOrCreateHomework(Long studentId, LocalDate date) {
        Homework hw = homeworkMapper.selectOne(new LambdaQueryWrapper<Homework>()
                .eq(Homework::getStudentId, studentId)
                .eq(Homework::getHomeworkDate, date));
        if (hw == null) {
            hw = new Homework();
            hw.setStudentId(studentId);
            hw.setHomeworkDate(date);
            hw.setStatus("incomplete");
            homeworkMapper.insert(hw);
            logRecord(hw.getId(), studentId, null, "create", Map.of("date", date.toString()));
        }
        return hw;
    }

    private List<HomeworkItem> listItems(Long homeworkId) {
        return itemMapper.selectList(new LambdaQueryWrapper<HomeworkItem>()
                .eq(HomeworkItem::getHomeworkId, homeworkId)
                .orderByAsc(HomeworkItem::getSortOrder));
    }

    private void checkHomeworkCompletion(Long homeworkId, Long studentId) {
        List<HomeworkItem> items = listItems(homeworkId);
        if (items.isEmpty()) return;
        boolean allDone = items.stream().allMatch(i -> "done".equals(i.getStatus()));
        if (allDone) {
            Homework hw = homeworkMapper.selectById(homeworkId);
            hw.setStatus("completed");
            homeworkMapper.updateById(hw);
            logRecord(homeworkId, studentId, null, "check", Map.of("status", "completed"));
        }
    }

    private void logRecord(Long homeworkId, Long studentId, Long itemId, String action, Map<String, Object> detail) {
        try {
            HomeworkRecord rec = new HomeworkRecord();
            rec.setHomeworkId(homeworkId);
            rec.setStudentId(studentId);
            rec.setItemId(itemId);
            rec.setAction(action);
            rec.setDetail(objectMapper.writeValueAsString(detail));
            recordMapper.insert(rec);
        } catch (Exception e) {
            log.warn("记录家作操作日志失败: {}", e.getMessage());
        }
    }

    // ========== DTO / VO ==========

    @lombok.Data
    public static class HomeworkDetail {
        public Homework homework;
        public List<HomeworkItem> items;

        public HomeworkDetail(Homework hw, List<HomeworkItem> items) {
            this.homework = hw;
            this.items = items;
        }
    }

    @lombok.Data
    public static class HomeworkItemDTO {
        public String subject;
        public String content;
        public String itemType;
    }

    @lombok.Data
    public static class Stats {
        public int total;
        public int done;
        public int pending;
        public String status;
    }
}

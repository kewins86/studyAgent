package com.k9edu.service;

import com.k9edu.entity.Student;
import com.k9edu.entity.StudentProfile;
import com.k9edu.mapper.StudentMapper;
import com.k9edu.mapper.StudentProfileMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 学生与画像服务（功能1）
 * <p>
 * 画像数据来源：基础问卷（家长填写）+ 行为修正（学习记录反哺）
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class StudentService {

    private final StudentMapper studentMapper;
    private final StudentProfileMapper studentProfileMapper;
    private final ProfileAiService profileAiService;

    /** 创建学生（首次进入 App 时） */
    @Transactional
    public Student create(String name, String grade, String track) {
        Student s = new Student();
        s.setName(name);
        s.setGrade(grade);
        s.setTrack(track);
        studentMapper.insert(s);
        return s;
    }

    /** 查询学生 */
    public Student get(Long id) {
        return studentMapper.selectById(id);
    }

    /** 保存/更新画像（问卷提交） */
    @Transactional
    public StudentProfile saveProfile(Long studentId, StudentProfile profile) {
        profile.setStudentId(studentId);
        StudentProfile existing = studentProfileMapper.selectOne(
                new com.baomidou.mybatisplus.core.conditions.query.QueryWrapper<StudentProfile>()
                        .eq("student_id", studentId));
        if (existing != null) {
            profile.setId(existing.getId());
            // 已有记录：用 UpdateWrapper，但只 set 非空字段，避免部分更新（如仅改昵称）把其他字段覆盖成 NULL
            com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper<StudentProfile> uw =
                new com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper<>();
            uw.eq("student_id", studentId);
            if (profile.getPersonality() != null) uw.set("personality", profile.getPersonality());
            if (profile.getDiligence() != null) uw.set("diligence", profile.getDiligence());
            if (profile.getLearningStyle() != null) uw.set("learning_style", profile.getLearningStyle());
            if (profile.getGradeSep() != null) uw.set("grade_sep", profile.getGradeSep());
            if (profile.getNickname() != null) uw.set("nickname", profile.getNickname());
            if (profile.getAcademicLevel() != null) uw.set("academic_level", profile.getAcademicLevel());
            if (profile.getExtra() != null) uw.set("extra", profile.getExtra());
            studentProfileMapper.update(null, uw);
        } else {
            studentProfileMapper.insert(profile);
        }

        // 问卷正式提交（有 academicLevel）时，调用 LLM 生成 AI 画像
        if (profile.getAcademicLevel() != null && !profile.getAcademicLevel().isBlank()) {
            try {
                ProfileAiService.ProfileAiResult aiResult = profileAiService.generate(profile.getExtra());
                if (aiResult != null) {
                    String tagsJoined = String.join("|", aiResult.tags());
                    com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper<StudentProfile> uw2 =
                        new com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper<>();
                    uw2.eq("student_id", studentId);
                    uw2.set("ai_summary", aiResult.summary());
                    uw2.set("ai_tags", tagsJoined);
                    studentProfileMapper.update(null, uw2);
                    log.info("AI 画像已生成，studentId={}, tags={}", studentId, tagsJoined);
                }
            } catch (Exception e) {
                log.warn("AI 画像生成失败，不影响问卷保存：{}", e.getMessage());
            }
        }

        return studentProfileMapper.selectOne(
                new com.baomidou.mybatisplus.core.conditions.query.QueryWrapper<StudentProfile>()
                        .eq("student_id", studentId));
    }

    /** 查询画像 */
    public StudentProfile getProfile(Long studentId) {
        return studentProfileMapper.selectOne(
                new com.baomidou.mybatisplus.core.conditions.query.QueryWrapper<StudentProfile>()
                        .eq("student_id", studentId));
    }
}

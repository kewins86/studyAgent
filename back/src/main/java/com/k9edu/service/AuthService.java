package com.k9edu.service;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.crypto.digest.BCrypt;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.k9edu.common.BizException;
import com.k9edu.entity.Student;
import com.k9edu.mapper.StudentMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * 登录认证（手机号 + 密码，BCrypt 加密）
 * <p>
 * V1 简化方案：一个账号 = 一个学生，直接在 students 表上挂 phone/password_hash。
 * 后续多孩/家长账号体系再拆独立 users 表。
 */
@Service
@RequiredArgsConstructor
public class AuthService {

    private final StudentMapper studentMapper;

    /** 注册：手机号 + 密码（昵称/年级后续在画像问卷中补充） */
    public Student register(String phone, String password) {
        if (phone == null || !phone.matches("^1\\d{10}$")) {
            throw new BizException("请输入正确的11位手机号");
        }
        if (password == null || password.length() < 6) {
            throw new BizException("密码至少6位");
        }
        Long exist = studentMapper.selectCount(
                new LambdaQueryWrapper<Student>().eq(Student::getPhone, phone));
        if (exist != null && exist > 0) {
            throw new BizException("该手机号已注册，请直接登录");
        }
        Student s = new Student();
        s.setPhone(phone);
        s.setPasswordHash(BCrypt.hashpw(password));
        s.setName("同学" + phone.substring(7));
        s.setGrade("三年级");
        studentMapper.insert(s);
        return s;
    }

    /** 登录：校验密码 → Sa-Token 签发 token */
    public Student login(String phone, String password) {
        if (phone == null || password == null) {
            throw new BizException("请输入手机号和密码");
        }
        Student s = studentMapper.selectOne(
                new LambdaQueryWrapper<Student>().eq(Student::getPhone, phone));
        if (s == null || s.getPasswordHash() == null
                || !BCrypt.checkpw(password, s.getPasswordHash())) {
            throw new BizException("手机号或密码错误");
        }
        StpUtil.login(s.getId());
        return s;
    }

    /** 当前登录学生（未登录抛 NotLoginException） */
    public Student current() {
        Long id = StpUtil.getLoginIdAsLong();
        return studentMapper.selectById(id);
    }

    /** 登出 */
    public void logout() {
        StpUtil.logout();
    }
}

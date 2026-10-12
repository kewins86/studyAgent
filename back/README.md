# k9-edu-back — K9 教育智能体后端

Spring Boot 3 + MyBatis-Plus + H2/MySQL + Flyway + Sa-Token + LLM(DeepSeek)

## 技术栈
| 组件 | 选型 | 说明 |
|---|---|---|
| JDK | 21 LTS | 已装 ~/Library/Java/JavaVirtualMachines/ |
| 框架 | Spring Boot 3.3.5 | |
| ORM | MyBatis-Plus 3.5.7 | 分页插件已配 |
| 数据库 | H2（开发）/ MySQL 8（上线） | Flyway 管表结构，切换只改 application.yml 一行 |
| 认证 | Sa-Token | 已引入，V2 家长端启用 |
| LLM | DeepSeek（OpenAI 兼容） | LlmClient 统一封装，Key 走环境变量 |

## 快速启动
```bash
export JAVA_HOME=$(/usr/libexec/java_home -v 21)
export PATH="$HOME/tools/apache-maven-3.9.16/bin:$PATH"
cd ~/Documents/studyAgent/back
mvn spring-boot:run
```
访问 http://localhost:8080 ，H2 控制台 http://localhost:8080/h2-console

> ⚠️ 答疑/计划接口需要配置 LLM Key：
> `echo 'export DEEPSEEK_API_KEY="sk-xxx"' >> ~/.zshrc`

## 接口一览
| 方法 | 路径 | 说明 |
|---|---|---|
| GET | /api/health | 健康检查 |
| POST | /api/chat | 智能答疑（学科识别→专属提示词→LLM） |
| GET | /api/classify?question=xxx | 学科识别测试 |
| POST | /api/students | 创建学生 |
| GET | /api/students/{id} | 查询学生 |
| POST | /api/students/{id}/profile | 提交画像问卷 |
| GET | /api/students/{id}/profile | 查询画像 |
| POST | /api/students/{id}/plan | 生成学习计划（LLM） |
| GET | /api/students/{id}/plan/latest | 最近计划 |
| GET | /api/knowledge/tree?subject=数学&grade=三年级 | 知识点树 |
| GET | /api/knowledge/{id}/children | 子节点 |

## 目录结构
```
src/main/java/com/k9edu/
├── K9EduApplication.java      # 启动类
├── common/                    # Result 统一返回 / 全局异常 / LlmClient
├── config/                    # 跨域 / MyBatis-Plus 分页
├── controller/                # 6 个 REST 接口
├── entity/                    # 12 张表实体
├── mapper/                    # 12 个 MyBatis-Plus Mapper
└── service/                   # 答疑编排 / 学科路由 / 画像 / 计划 / 掌握度
src/main/resources/
├── application.yml            # H2 开发配置（上线改 MySQL）
└── db/migration/V1__init.sql  # 12 张表（Flyway 自动执行）
```

## 12 张表
students / student_profiles / knowledge_nodes / questions / papers / paper_questions / test_records / knowledge_mastery / learning_records / study_plans / chat_sessions / chat_messages

## 约束（V1 红线）
- LLM Key 只存服务端环境变量，绝不放浏览器
- 题库人工预置，LLM 不现出题（仅学科分类/计划生成/答疑/讲解）
- 掌握度四级简单映射（weak/pass/good/master），不做贝叶斯/IRT

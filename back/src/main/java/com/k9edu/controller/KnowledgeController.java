package com.k9edu.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.k9edu.common.Result;
import com.k9edu.entity.KnowledgeNode;
import com.k9edu.mapper.KnowledgeNodeMapper;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 知识点树接口（静态章节树，V1 核心）
 * <p>
 * GET /api/knowledge/tree?subject=数学&grade=三年级   整棵章节树（树形结构）
 * GET /api/knowledge/{id}/children                    某节点子节点
 */
@RestController
@RequestMapping("/api/knowledge")
@RequiredArgsConstructor
public class KnowledgeController {

    private final KnowledgeNodeMapper knowledgeNodeMapper;

    /** 学科+年级的知识点树（树形结构，按 sort_order 排序） */
    @GetMapping("/tree")
    public Result<List<TreeNode>> tree(
            @RequestParam(required = false) String subject,
            @RequestParam(required = false) String grade) {
        QueryWrapper<KnowledgeNode> qw = new QueryWrapper<KnowledgeNode>()
                .orderByAsc("sort_order");
        if (subject != null) qw.eq("subject", subject);
        if (grade != null) qw.eq("grade", grade);
        List<KnowledgeNode> nodes = knowledgeNodeMapper.selectList(qw);

        // 组装树形
        Map<Long, List<TreeNode>> byParent = nodes.stream()
                .map(this::toTreeNode)
                .collect(Collectors.groupingBy(t -> t.getParentId() == null ? 0L : t.getParentId()));

        List<TreeNode> roots = byParent.getOrDefault(0L, new ArrayList<>());
        fillChildren(roots, byParent);
        return Result.ok(roots);
    }

    /** 某节点下的子节点 */
    @GetMapping("/{id}/children")
    public Result<List<KnowledgeNode>> children(@PathVariable Long id) {
        return Result.ok(knowledgeNodeMapper.selectList(
                new QueryWrapper<KnowledgeNode>().eq("parent_id", id).orderByAsc("sort_order")));
    }

    private TreeNode toTreeNode(KnowledgeNode n) {
        TreeNode t = new TreeNode();
        t.setId(n.getId());
        t.setParentId(n.getParentId() == null ? 0L : n.getParentId());
        t.setSubject(n.getSubject());
        t.setGrade(n.getGrade());
        t.setChapter(n.getChapter());
        t.setName(n.getName());
        t.setLevel(n.getLevel());
        t.setSortOrder(n.getSortOrder());
        t.setChildren(new ArrayList<>());
        return t;
    }

    private void fillChildren(List<TreeNode> parents, Map<Long, List<TreeNode>> byParent) {
        for (TreeNode p : parents) {
            List<TreeNode> children = byParent.get(p.getId());
            if (children != null) {
                p.setChildren(children);
                fillChildren(children, byParent);
            }
        }
    }

    @Data
    public static class TreeNode {
        private Long id;
        private Long parentId;
        private String subject;
        private String grade;
        private String chapter;
        private String name;
        private Integer level;
        private Integer sortOrder;
        private List<TreeNode> children;
    }
}

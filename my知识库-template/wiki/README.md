# Wiki 写作规范

这里规定 `wiki/` 下面的知识页怎么写。目标是让人和 Agent（智能体）都能快速检索、更新和复用。

## 一页解决一个主题

每篇 wiki 页只解决一个明确主题。不要把多个大主题塞进一页。页面太长时，拆成总览页和专项页。

## 命名要求

- wiki 文件名、页面标题、source 主题目录，尽量使用中文命名，方便用户直接看懂。
- 英文专有名词可以保留，例如 Codex、Claude Code、QAC、DevOps。
- 外部系统 ID、文档 ID、脚本必须使用的路径名可以保留英文或机器标识，但应放在中文主题目录下面。

## Wiki 页不是原始记录

- `sources/` 保存原始资料、失败过程、完整命令、截图、脚本。
- `wiki/` 保存提炼后的结论、流程、排查清单和链接。

如果 wiki 中的结论没有来源，要么补 `source_refs`，要么标注“待验证”。

## 标准页面结构

新建 wiki 页时优先复制 `templates/wiki-template.md`。

必须保留：

```md
---
title:
category:
type: wiki
updated_at:
source_refs:
sensitivity:
status:
---
```

推荐保留：

```md
## 适用场景
## 快速结论
## 标准流程
## 常见问题
## 排查清单
## 相关来源
## 后续可改进
## 白话总结
```

## 更新规则

每次更新 wiki 后：

1. 更新页面 `updated_at`。
2. 检查 `source_refs` 是否准确。
3. 更新所属分类的 `index.md`。
4. 必要时更新根目录 `index.md`。
5. 在 `维护/log.md` 记录做了什么。

## 白话总结

Wiki 页就是“整理后的答案”，source 是“原始证据”。Agent 要先看索引和 wiki，只有需要确认细节时才回到 source。

# 02 Create Loop

这是创建/实现 Loop（循环）。

适合目标已经基本明确后使用：创建项目、修改代码、写文档、整理产物。它不替代旧的 loop1/2/3，而是把旧模板当执行引擎。

## 什么时候用

- research Loop 已经输出 requirements（需求）和 Done（完成）标准。
- 用户已经明确要做一个功能、页面、脚本、文档或项目。
- 需要执行、记录、交付。

## 文件夹

| 文件夹 | 用途 |
| --- | --- |
| `00-inputs/` | 来自 research Loop 或用户的需求输入 |
| `01-plan/` | 实现计划 |
| `02-worklog/` | 每轮做了什么 |
| `03-outputs/` | 产物和交付说明 |
| `04-handoff-to-test/` | 交给 test Loop 的说明 |
| `engines/` | 指向旧 loop1/2/3 的执行引擎说明 |
| `99-skills/` | 本 Loop 推荐使用的 skill（技能） |

## 推荐执行引擎

- 默认：`../ai-loop-mini2`
- 更自由：`../ai-loop-mini`
- 需要脚本控轮次：`../ai-loop-mini3`

## 白话总结

这个 Loop 负责“做出来”，但具体怎么跑可以复用旧的 1/2/3。

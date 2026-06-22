# Git Backup Log

这里记录本 Loop 项目自身的 git（版本控制）状态和重要备份点。

## 设计目的

- 记录 Loop 模板如何变化
- 方便回退到上一版
- 方便对比 AI 修改前后的差异
- 让问题返回给人时有清楚版本依据

## 规则

- 本项目使用本地 git 仓库，不默认推送远端。
- 重要改动后可以本地 commit（提交）一次。
- 修改目标项目时，不在这里替目标项目做 git 决策。
- 需要推送、部署、删除、安装依赖时，仍按 `07-boundaries/handoff-rules.md` 返回给人。

## 记录

- 2026-06-11：迁移到 `/Users/ycl/Desktop/myloop/ai-loop-mini2` 后，准备初始化本地 git 仓库，作为模板版本记录。
- 2026-06-11：补充当前模板与 `myloop` skill（技能）的兼容说明，增加母模板/任务特化入口，要求真实任务优先按 `/Users/ycl/Desktop/myloop/task-initializer.md` 初始化到目标项目下。
- 2026-06-11：新增 `00-alignment/` 占位文件，让任务特化初始化的初始理解、用户确认和最终对齐有明确落点。
- 2026-06-11：新增中文 `修改记录.md` 总账，并要求任务专用 Loop 初始化独立本地 git；保持 `myloop` skill 默认入口不变。

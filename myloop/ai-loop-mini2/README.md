# AI Loop Mini 2

这是一个 human-guided deep loop（人引导的深度循环）模板。

它也是当前 `myloop` skill（技能）的默认模板。skill 会读取：

- `/Users/ycl/Desktop/myloop/ai-loop-mini2/README.md`
- `/Users/ycl/Desktop/myloop/ai-loop-mini2/loop.md`

所以未来流程升级优先改 `/Users/ycl/Desktop/myloop` 里的文件，不需要改 `/Users/ycl/Desktop/myskill/myloop/SKILL.md`。

核心不是全自动跑很多轮，而是模仿一个会用 AI 的人：

- 每轮交互尽量少
- 每轮上下文尽量足
- 每轮思考尽量深
- 最多三轮
- 没有明显推进就先反思，再决定搜索、补上下文、测试或问人
- 简单问题 AI 自己推进
- 复杂判断返回给人
- 显式留下记忆、测试和评价
- 本文件夹本身使用本地 git（版本控制）记录模板变更，便于回退和排查；不自动推送。
- `00-alignment/` 放任务特化初始化时的人机对齐材料。
- `修改记录.md` 是中文修改总账，记录改前、改后、原因、隐患和 git（版本控制）联动。

## 使用方式

1. 在 `10-target/target.md` 写目标。
2. 在 `02-context-pack/` 放背景、资料、现状和约束。
3. 对 AI 说：读取 `loop.md`，按这个流程跑一轮。
4. AI 深度探索后写总结、评价、下一步建议。
5. 人决定是否进入下一轮。

每轮必须判断有没有“质的提升”。如果没有，先写入 `04-reflection/reflection.md`，不要盲目进入下一轮。

## 作为母模板使用

真实任务不建议直接写进本模板。优先参考 `/Users/ycl/Desktop/myloop/task-initializer.md`，在目标项目下生成任务专用 Loop（循环）。

初始化时先让 AI 读取目标项目、现有 Markdown（文档）、记录和可访问的会话/记忆线索，生成 `00-alignment/initial-understanding.md` 给人确认；人补充目标、限制、测试和偏好后，再特化 Loop 并开始第 1 轮。

如果修改本模板本身，要同步更新：

- `/Users/ycl/Desktop/myloop/00-change-log/change-log.md`
- `修改记录.md`
- `06-git-backups/git-backup-log.md`
- 本模板的本地 git（版本控制）提交

第一次可以直接使用：

```text
读取 /Users/ycl/Desktop/myloop/ai-loop-mini2/loop.md，
按 human-guided deep loop 跑第 1 轮。
目标是检查这个 Loop 工作区本身是否清楚、可执行，并更新记录。
```

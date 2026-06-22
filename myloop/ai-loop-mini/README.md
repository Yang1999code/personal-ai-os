# AI Loop Mini

这是一个轻脚手架、信任优先的文档驱动 Loop（循环）模板。

核心想法：

- `loop.md` 是主流程
- `00-alignment/` 放任务特化初始化时的人机对齐材料
- `修改记录.md` 是中文修改总账，记录改前、改后、原因、隐患和 git（版本控制）联动
- `01-state/` 记录当前状态
- `01-state/decisions.md` 记录影响后续判断的重要决策
- `01-state/open-questions.md` 记录未解决问题
- `03-history/` 记录每轮发生了什么
- `04-optimization/` 记录 AI 对 Loop（循环）的自我改进
- `06-boundaries/` 只放少量硬边界
- `07-outputs/` 放每轮报告
- `08-agents/` 放 Maker（生产者）和 Tester（测试者）角色模板
- `09-target/` 放要优化的目标地址或目标对象
- `00-human-docs/` 放只给人看的架构图和说明
- 本文件夹本身使用本地 git（版本控制）记录模板变更，便于回退和排查；不自动推送。

使用方式：

1. 打开 `01-state/loop-state.md` 写目标
2. 如果要围绕某个项目或文件夹优化，把地址写进 `09-target/target.md`
3. 如果需要验证，把验证想法写进 `09-target/verification.md`，也可以让 AI 第一轮自己生成
4. 选择运行模式：自由模式、协作模式或自动模式
5. 对 AI 说：读取 `loop.md`，按它跑一轮
6. 让 AI 自主推进、验证、记录
7. 复杂任务时让 AI 使用 maker-checker（生产者-检查者）模式
8. 稳定后再接 Automation（自动化）或脚本触发

这个模板不是为了限制 AI，而是给 AI 一个可持续循环的工作台。

## 作为母模板使用

真实任务不建议直接写进本模板。优先参考 `$HOME/Desktop/myloop/task-initializer.md`，在目标项目下生成任务专用 Loop（循环），再把本模板的规则特化进去。

如果修改本模板本身，要同步更新：

- `$HOME/Desktop/myloop/00-change-log/change-log.md`
- `修改记录.md`
- `05-git-backups/git-backup-log.md`
- 本模板的本地 git（版本控制）提交

运行模式：

- 自由模式：AI 自主判断继续、停止和下一步
- 协作模式：AI 每轮建议继续/停止，人确认
- 自动模式：按最大轮次、Done（完成）条件和停止条件自动推进

第一次试跑可以这样说：

```text
读取 $HOME/Desktop/myloop/ai-loop-mini/loop.md，
按这个 Loop 跑一轮。
本轮目标是检查这个 Loop 工作区本身是否清楚、可执行，并更新状态、历史和输出记录。
```

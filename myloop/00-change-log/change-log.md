# myloop Change Log

这个文件记录 `$HOME/Desktop/myloop` 的重要修改，方便人和 Agent（智能体）复盘。

未来每次修改都要追加一条记录，尽量包含：

- 修改时间。
- 修改范围。
- 改前是什么。
- 改后是什么。
- 为什么改。
- 有什么隐患。
- 怎么验证。
- 本地 git（版本控制）提交号。
- 是否影响 `$HOME/Desktop/myskill/myloop/SKILL.md` 的稳定入口。

## 记录模板

```text
## YYYY-MM-DD HH:mm - 标题

- 范围：
- 改前：
- 改后：
- 原因：
- 隐患：
- 验证：
- git：
- skill 兼容：
```

## git 联动说明

git commit（提交）哈希由文件内容计算出来，所以一个提交无法在自己的文件内容里稳定写入“自己的最终哈希”。本日志采用以下方式联动：

- 修改前先在本日志写清改前、改后、原因、隐患和验证计划。
- 修改后提交本地 git。
- 如果已经知道相关提交号，就写入本日志。
- 如果是本日志所在提交本身，用 `git log --oneline -- 00-change-log/change-log.md` 查看对应提交。
- 模板内部变更优先记录模板仓库提交号；根目录治理变更优先记录根仓库提交号。

## 2026-06-11 - 迁移 loop1/loop2 到 myloop

- 范围：`ai-loop-mini`、`ai-loop-mini2`。
- 改前：两个 Loop（循环）模板在桌面独立存在，路径分散。
- 改后：统一放入 `$HOME/Desktop/myloop/`，形成模板集合。
- 原因：让 `myloop` 成为统一入口，方便 skill（技能）和人都从一个位置读取。
- 隐患：旧绝对路径可能失效，需要同步更新知识库和提示词。
- 验证：后续已检查并更新相关 Markdown（文档）里的路径引用。
- git：模板内分别初始化后提交，见各模板 git log（提交日志）；后续任务特化指针提交为 loop1 `4f92dc8`、loop2 `e8275c4`、loop3 `fa819aa`。
- skill 兼容：兼容；skill 读取的是 `$HOME/Desktop/myloop`。

## 2026-06-11 - 为 loop1/loop2 初始化本地 git

- 范围：`ai-loop-mini/.git`、`ai-loop-mini2/.git`。
- 改前：模板变更只能靠文件内容和人工记忆追踪。
- 改后：每个模板有独立本地 git（版本控制）仓库。
- 原因：方便回退、对比、复盘“AI 改了什么”。
- 隐患：多个嵌套 git 仓库不能被根目录仓库直接粗暴追踪，否则容易变成 submodule（子模块）语义。
- 验证：`git status --short` 可查看每个模板状态。
- git：`ai-loop-mini` commit `45cf4c4`；`ai-loop-mini2` commit `0dc41f4` 和 `8a20f50`；任务特化指针提交为 loop1 `4f92dc8`、loop2 `e8275c4`。
- skill 兼容：兼容；未改变默认模板入口。

## 2026-06-11 - 新增 loop3 while 脚本版本

- 范围：`ai-loop-mini3`。
- 改前：`ai-loop-mini2` 主要靠 Markdown（文档）和人工/AI 自觉执行轮次。
- 改后：新增 `ai-loop-mini3`，增加 `02-runtime/run-loop.sh`、`03-exchange/`、`tmp + rename`、`locks/` 和稳定 `status:` 字段。
- 原因：探索“脚本控轮次 + AI 深度思考 + 多终端文件交换”的版本。
- 隐患：脚本只能控制节奏，不能保证 AI 真的理解任务；多终端协作仍需要人确认输出质量。
- 验证：`bash -n 02-runtime/run-loop.sh` 语法检查通过；路径引用检查通过。
- git：`ai-loop-mini3` commit `ed381a0`；任务特化指针提交为 `fa819aa`。
- skill 兼容：兼容；默认模板仍是 `ai-loop-mini2`，loop3 只是可选模板。

## 2026-06-11 - 更新本地知识库记录 loop3

- 范围：`$HOME/Desktop/my知识库/wiki/codex/AI Loop工作流设计经验.md`、分类索引、根索引、`log.md`。
- 改前：知识库主要记录 loop1 和 loop2。
- 改后：知识库加入 loop3 的定位、结构、经验和路径。
- 原因：让后续 AI 或人能从知识库理解三个版本的区别。
- 隐患：知识库是总结性材料，可能落后于模板最新细节；执行仍以 `$HOME/Desktop/myloop` 为准。
- 验证：已读取知识库页面和索引，确认出现 `ai-loop-mini3`。
- git：知识库当前未在本记录中提交；以知识库自身维护规则为准。
- skill 兼容：兼容；不影响 skill。

## 2026-06-11 - 增加 myloop 根目录治理层和任务初始化协议

- 范围：根目录 `README.md`、`task-initializer.md`、`.gitignore`、`00-change-log/change-log.md`，以及默认模板 `ai-loop-mini2` 的入口指针。
- 改前：`myloop` 根目录没有总说明、任务特化初始化规则和统一变更复盘日志。
- 改后：根目录成为模板集合的治理入口；新增任务特化流程；新增变更复盘日志；根级 git 只追踪治理文档，忽略三个模板仓库。
- 原因：满足“每次修改都要可复盘”和“myloop skill 不升级也能读取更新后流程”的要求。
- 隐患：根级 git 不追踪模板内部内容，模板内部变更仍要进入各自模板 git；需要 Agent 自觉同时写根日志和模板日志。
- 验证：已检查 `ai-loop-mini2/loop.md` 和 `README.md` 仍存在；`bash -n ai-loop-mini3/02-runtime/run-loop.sh` 通过；未发现旧桌面散落路径残留；根仓库和三个模板仓库状态干净；知识库已同步记录但未单独建 git。
- git：模板侧已提交：loop1 `4f92dc8`、loop2 `e8275c4`、loop3 `fa819aa`；根目录治理文档初始提交 `fb5c3d8`，本日志补充规则见后续根目录 git log。
- skill 兼容：兼容；保留 `$HOME/Desktop/myloop/ai-loop-mini2/loop.md`。

## 2026-06-11 - 同步知识库和最终验证记录

- 范围：`$HOME/Desktop/my知识库/wiki/codex/AI Loop工作流设计经验.md`、`wiki/codex/index.md`、根 `index.md`、`log.md`，以及本日志验证结果。
- 改前：知识库记录了 loop1/loop2/loop3，但还没有根目录治理层、任务特化初始化和两层 git 设计。
- 改后：知识库补充 `$HOME/Desktop/myloop` 根目录治理层、`task-initializer.md`、`00-change-log/change-log.md` 和 Git submodule（子模块）设计依据。
- 原因：让后续人或 Agent（智能体）从知识库也能理解当前最新 Loop 架构。
- 隐患：知识库是说明材料，未来仍可能落后于 `$HOME/Desktop/myloop`；执行时以 `myloop` 目录为准。
- 验证：已用 `rg` 检查知识库出现 `task-initializer`、`00-change-log` 和默认 skill 入口说明；经验库目录本身当前没有 `.git`。
- git：根目录本日志记录本次验证；知识库无本地 git 提交。
- skill 兼容：兼容；未修改 `$HOME/Desktop/myskill/myloop/SKILL.md`。

## 2026-06-11 - 补齐三个模板的 alignment 占位结构

- 范围：`ai-loop-mini/00-alignment/`、`ai-loop-mini2/00-alignment/`、`ai-loop-mini3/00-alignment/`，以及三个模板的 `README.md`、`loop.md`、git 记录文件。
- 改前：`task-initializer.md` 和 loop2 主流程提到 `00-alignment/initial-understanding.md`、`user-confirmation.md`、`final-alignment.md`，但母模板没有这些占位文件。
- 改后：三个模板都新增 `00-alignment/` 占位目录，包含 `README.md`、`initial-understanding.md`、`user-confirmation.md`、`final-alignment.md`。
- 原因：让任务特化初始化有明确落点，也让路径引用检查更干净。
- 隐患：占位文件不能替代真实任务对齐；真实任务仍应在目标项目的任务专用 Loop 目录中填写。
- 验证：待最终路径检查确认三个模板 `loop.md` 无缺失引用。
- git：loop1 `64b667c`、loop2 `a6a4890`、loop3 `7c33f25`。
- skill 兼容：兼容；默认入口 `$HOME/Desktop/myloop/ai-loop-mini2/loop.md` 未改变。

## 2026-06-11 - 新增中文修改总账和任务 Loop 独立 git 规则

- 范围：`ai-loop-mini/修改记录.md`、`ai-loop-mini2/修改记录.md`、`ai-loop-mini3/修改记录.md`、三个模板的 `README.md`/`loop.md`/git 记录文件、根目录 `README.md` 和 `task-initializer.md`。
- 改前：模板已有英文/技术向 git 记录和根目录总账，但没有每个模板内的中文 `修改记录.md`，任务专用 Loop 的独立本地 git 规则也不够显式。
- 改后：三个模板都新增中文 `修改记录.md`，每次修改必须写改前、改后、原因、隐患和 git 联动；任务专用 Loop 初始化后必须 `git init` 并提交 `Initial task loop`。
- 原因：让人和 Agent（智能体）更容易复盘每个任务 Loop 的演进，不只依赖根目录总账。
- 隐患：需要执行者自觉维护；如果任务 Loop 放在已有项目仓库里，必须避免把任务 Loop git 和目标项目 git 搞混。
- 验证：待最终检查确认 `$HOME/Desktop/myloop/ai-loop-mini2/loop.md` 仍为默认入口，三个模板都存在 `修改记录.md`。
- git：模板侧已提交：loop1 `5d2e194`、loop2 `4ddecb5`、loop3 `90d86c1`；根目录治理文档待提交。
- skill 兼容：兼容；未修改 `$HOME/Desktop/myskill/myloop/SKILL.md`，只更新 `$HOME/Desktop/myloop`。

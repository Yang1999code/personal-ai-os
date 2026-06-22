# myloop Change Log

这个文件记录 `/Users/ycl/Desktop/myloop` 的重要修改，方便人和 Agent（智能体）复盘。

未来每次修改都要追加一条记录，尽量包含：

- 修改时间。
- 修改范围。
- 改前是什么。
- 改后是什么。
- 为什么改。
- 有什么隐患。
- 怎么验证。
- 本地 git（版本控制）提交号。
- 是否影响 `/Users/ycl/Desktop/myskill/myloop/SKILL.md` 的稳定入口。

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

## 2026-06-22 00:10 - 新增简单 loop 顶层说明

- 范围：`简单loop.md`、`00-change-log/change-log.md`。
- 改前：`myloop` 中已有多个模板和场景 Loop，但没有一个只做补资料、整理上下文、运行保障和展示的最小辅助型说明文件。
- 改后：新增顶层 `简单loop.md`，记录最小辅助 Loop（循环）的原则、适用场景、流程、读取顺序、输出格式、可视化展示边界、AI 行为边界，以及其他项目如何引用。
- 原因：用户希望其他任务能直接读取一个顶层 Markdown（文档）文件，自行配置最简单的 Loop，不默认增加复杂实体。
- 隐患：这是说明文件，不是完整可执行模板；如果未来频繁使用，再考虑是否升级为独立目录或集成到 `ai-loop-mini2` 的轻量模式。
- 验证：确认 `简单loop.md` 已存在，并包含 `my知识库`、`如无必要，无增实体`、`待你决策`、`可视化展示` 等关键规则。
- git：未提交；如需要可后续在 `/Users/ycl/Desktop/myloop` 根仓库提交。
- skill 兼容：兼容；未修改 `/Users/ycl/Desktop/myskill/myloop/SKILL.md`，稳定入口不变。

## 2026-06-18 22:00 - 新增根目录 AGENTS.md

- 范围：`AGENTS.md`、`00-change-log/change-log.md`。
- 改前：`/Users/ycl/Desktop/myloop` 根目录没有单独的 `AGENTS.md`，本目录规则主要散在 README 和各 loop 文件中。
- 改后：新增根目录 `AGENTS.md`，写入用户指定的中文回答、白话总结、SDD/TDD（规格驱动开发/测试驱动开发）、skill（技能）/插件优先级、失败处理顺序、个人 AI 操作系统三层分工、my知识库沉淀规则和长期目标。
- 原因：用户说明前面的规则位置搞错，需要移动到 `/Users/ycl/Desktop/myloop`。
- 隐患：当前根仓库已有其他未提交改动，本次只追加新文件和本日志，不处理既有改动。
- 验证：确认 `AGENTS.md` 已存在，且可检索到 `白话总结`、`个人 AI 操作系统`、`超级个体` 等关键规则。
- git：未提交；如需要可后续在 `/Users/ycl/Desktop/myloop` 根仓库提交。
- skill 兼容：兼容；未修改 `/Users/ycl/Desktop/myskill/myloop/SKILL.md`，默认入口仍由 skill 读取 `/Users/ycl/Desktop/myloop` 下的最新工作流文件。

## 2026-06-18 15:15 - 新增 Codex Claude 配合 Loop

- 范围：`codexclaude配合loop/README.md`、`codexclaude配合loop/loop.md`、`codexclaude配合loop/修改记录.md`、根目录 `README.md`。
- 改前：`myloop` 中没有专门描述“Codex 总控 + Claude Code 项目内开发执行”的双 Agent（双智能体）协作 Loop。
- 改后：新增 `codexclaude配合loop`，明确 Codex 负责计划、电脑控制、Git 检查、风险判断和人类汇报；Claude Code 只负责项目内开发、自检和 `messages.jsonl` 追加交接。
- 原因：用户希望把“Codex 检查和计划，Claude Code 完成开发任务并自检，通过 Git 和 messages.jsonl 交互”的方法沉淀成可复用 Loop。
- 隐患：这是流程模板，不会自动启动 Claude Code；真实项目仍需要在目标项目内初始化 `docs/ai-collaboration/plan.md` 和 `messages.jsonl`。
- 验证：已检查新增文件存在、根 README 入口存在，且 `Codex 是核心总控`、`Claude Code`、`messages.jsonl` 等关键规则可检索。
- git：未提交；如需要可后续在 `/Users/ycl/Desktop/myloop` 根仓库提交。
- skill 兼容：兼容；未修改 `/Users/ycl/Desktop/myskill/myloop/SKILL.md`，默认入口仍是 `/Users/ycl/Desktop/myloop/ai-loop-mini2/loop.md`。

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
- 改后：统一放入 `/Users/ycl/Desktop/myloop/`，形成模板集合。
- 原因：让 `myloop` 成为统一入口，方便 skill（技能）和人都从一个位置读取。
- 隐患：旧绝对路径可能失效，需要同步更新知识库和提示词。
- 验证：后续已检查并更新相关 Markdown（文档）里的路径引用。
- git：模板内分别初始化后提交，见各模板 git log（提交日志）；后续任务特化指针提交为 loop1 `4f92dc8`、loop2 `e8275c4`、loop3 `fa819aa`。
- skill 兼容：兼容；skill 读取的是 `/Users/ycl/Desktop/myloop`。

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

- 范围：`/Users/ycl/Desktop/my知识库/wiki/codex/AI Loop工作流设计经验.md`、分类索引、根索引、`log.md`。
- 改前：知识库主要记录 loop1 和 loop2。
- 改后：知识库加入 loop3 的定位、结构、经验和路径。
- 原因：让后续 AI 或人能从知识库理解三个版本的区别。
- 隐患：知识库是总结性材料，可能落后于模板最新细节；执行仍以 `/Users/ycl/Desktop/myloop` 为准。
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
- skill 兼容：兼容；保留 `/Users/ycl/Desktop/myloop/ai-loop-mini2/loop.md`。

## 2026-06-11 - 同步知识库和最终验证记录

- 范围：`/Users/ycl/Desktop/my知识库/wiki/codex/AI Loop工作流设计经验.md`、`wiki/codex/index.md`、根 `index.md`、`log.md`，以及本日志验证结果。
- 改前：知识库记录了 loop1/loop2/loop3，但还没有根目录治理层、任务特化初始化和两层 git 设计。
- 改后：知识库补充 `/Users/ycl/Desktop/myloop` 根目录治理层、`task-initializer.md`、`00-change-log/change-log.md` 和 Git submodule（子模块）设计依据。
- 原因：让后续人或 Agent（智能体）从知识库也能理解当前最新 Loop 架构。
- 隐患：知识库是说明材料，未来仍可能落后于 `/Users/ycl/Desktop/myloop`；执行时以 `myloop` 目录为准。
- 验证：已用 `rg` 检查知识库出现 `task-initializer`、`00-change-log` 和默认 skill 入口说明；经验库目录本身当前没有 `.git`。
- git：根目录本日志记录本次验证；知识库无本地 git 提交。
- skill 兼容：兼容；未修改 `/Users/ycl/Desktop/myskill/myloop/SKILL.md`。

## 2026-06-11 - 补齐三个模板的 alignment 占位结构

- 范围：`ai-loop-mini/00-alignment/`、`ai-loop-mini2/00-alignment/`、`ai-loop-mini3/00-alignment/`，以及三个模板的 `README.md`、`loop.md`、git 记录文件。
- 改前：`task-initializer.md` 和 loop2 主流程提到 `00-alignment/initial-understanding.md`、`user-confirmation.md`、`final-alignment.md`，但母模板没有这些占位文件。
- 改后：三个模板都新增 `00-alignment/` 占位目录，包含 `README.md`、`initial-understanding.md`、`user-confirmation.md`、`final-alignment.md`。
- 原因：让任务特化初始化有明确落点，也让路径引用检查更干净。
- 隐患：占位文件不能替代真实任务对齐；真实任务仍应在目标项目的任务专用 Loop 目录中填写。
- 验证：待最终路径检查确认三个模板 `loop.md` 无缺失引用。
- git：loop1 `64b667c`、loop2 `a6a4890`、loop3 `7c33f25`。
- skill 兼容：兼容；默认入口 `/Users/ycl/Desktop/myloop/ai-loop-mini2/loop.md` 未改变。

## 2026-06-11 - 新增中文修改总账和任务 Loop 独立 git 规则

- 范围：`ai-loop-mini/修改记录.md`、`ai-loop-mini2/修改记录.md`、`ai-loop-mini3/修改记录.md`、三个模板的 `README.md`/`loop.md`/git 记录文件、根目录 `README.md` 和 `task-initializer.md`。
- 改前：模板已有英文/技术向 git 记录和根目录总账，但没有每个模板内的中文 `修改记录.md`，任务专用 Loop 的独立本地 git 规则也不够显式。
- 改后：三个模板都新增中文 `修改记录.md`，每次修改必须写改前、改后、原因、隐患和 git 联动；任务专用 Loop 初始化后必须 `git init` 并提交 `Initial task loop`。
- 原因：让人和 Agent（智能体）更容易复盘每个任务 Loop 的演进，不只依赖根目录总账。
- 隐患：需要执行者自觉维护；如果任务 Loop 放在已有项目仓库里，必须避免把任务 Loop git 和目标项目 git 搞混。
- 验证：待最终检查确认 `/Users/ycl/Desktop/myloop/ai-loop-mini2/loop.md` 仍为默认入口，三个模板都存在 `修改记录.md`。
- git：模板侧已提交：loop1 `5d2e194`、loop2 `4ddecb5`、loop3 `90d86c1`；根目录治理文档待提交。
- skill 兼容：兼容；未修改 `/Users/ycl/Desktop/myskill/myloop/SKILL.md`，只更新 `/Users/ycl/Desktop/myloop`。

## 2026-06-15 - 新增三个场景 Loop

- 范围：`01-research-loop/`、`02-create-loop/`、`03-test-loop/`、根目录 `README.md`。
- 改前：`myloop` 主要有三个执行模板：自由干活、深度干活、while 脚本干活；缺少按任务场景分层的入口。
- 改后：新增三个场景 Loop：查找/需求、创建/实现、测试/验收；旧 `ai-loop-mini/2/3` 不移动、不改名，继续作为执行模板。
- 原因：让使用路径变成“先查清楚、再做出来、最后验明白”，而不是所有任务都直接进入干活模板。
- 隐患：当前只是场景模板和文档骨架，还没有真实任务验证；后续应跑一个小项目试用。
- 验证：待最终检查确认三个新文件夹、`loop.md`、`README.md`、推荐 skill 文档存在。
- git：待提交。
- skill 兼容：兼容；默认入口 `/Users/ycl/Desktop/myloop/ai-loop-mini2/loop.md` 未改变。

## 2026-06-15 - 扩展三个场景 Loop 的精品 skill 推荐

- 范围：`01-research-loop/99-skills/recommended-skills.md`、`02-create-loop/99-skills/recommended-skills.md`、`03-test-loop/99-skills/recommended-skills.md`。
- 改前：每个场景 Loop 只有 1-2 个 skill（技能）推荐，覆盖面偏窄。
- 改后：每个推荐文档分成“核心推荐”和“官方 curated 可选增强”，优先列本地已装/系统内置能力，再列 OpenAI curated（精选）skill；仍然不自动安装。
- 原因：覆盖更多实际情况，同时保持来源可靠，不引入不明第三方 skill。
- 隐患：推荐变多后需要执行者按任务选择，不能一股脑全用；未安装的 curated skill 需要先问人再安装。
- 验证：待最终检查确认推荐文档包含已装状态、用途和使用场景。
- git：待提交。
- skill 兼容：兼容；未修改 `/Users/ycl/Desktop/myskill/myloop/SKILL.md`。

## 2026-06-15 - 增加 Agent 开发优先 skill 组合

- 范围：三个场景 Loop 的 `99-skills/recommended-skills.md` 和知识库总结页。
- 改前：skill 推荐按通用 research/create/test 场景组织，没有突出 Agent（智能体）开发高频组合。
- 改后：新增 Agent 开发优先组合：research 阶段强调 `openai-docs`、`define-goal`、`notion-spec-to-implementation`；create 阶段强调 `openai-docs`、`cli-creator`、`playwright`、`jupyter-notebook`、`gh-address-comments`、`migrate-to-codex`；test 阶段强调 `playwright`、`gh-fix-ci`、`security-best-practices`、`security-threat-model`、`sentry`。
- 原因：用户主要做 Agent 开发，需要把最常用、最相关的 skill 前置，减少选择成本。
- 隐患：这里的“高频可靠”按官方 curated/系统内置和 Agent 开发常见任务判断，不代表实时星数排行；未安装 skill 仍需先问人。
- 验证：待最终检查确认三个推荐文档都出现 Agent 开发优先组合。
- git：待提交。
- skill 兼容：兼容；未修改 `/Users/ycl/Desktop/myskill/myloop/SKILL.md`。

## 2026-06-16 14:50 - 新增 04-meta-loop 元学习场景

- 范围：`04-meta-loop/`、根目录 `README.md`。
- 改前：`myloop` 只有 `research/create/test` 三个场景 Loop，缺少专门学习“人怎么带任务”的学习层 Loop。
- 改后：新增 `04-meta-loop`，采用“总控 + 四个子循环”的结构：回放、意图推断、规则抽象、对齐；并新增 `99-skills/` 作为可参考 skill（技能）目录。
- 原因：把“学人而不是学工具”的需求从 skill 和普通执行 Loop 中独立出来，形成一个专门反哺其他 Loop 的元学习层。
- 隐患：当前是第一版骨架，还没有真实多任务验证；后续要继续补“输入什么算一轮完整任务”“哪些规则进入稳定区”“如何避免过拟合单次会话”。
- 验证：检查 `04-meta-loop/README.md`、`loop.md`、四个子循环 README、`07-outputs/last-report.md`、`99-skills/recommended-skills.md` 存在；检查根目录 `README.md` 已出现 `04-meta-loop`。
- git：待提交。
- skill 兼容：兼容；未修改 `/Users/ycl/Desktop/myskill/myloop/SKILL.md`，默认入口仍是 `/Users/ycl/Desktop/myloop/ai-loop-mini2/loop.md`。

## 2026-06-16 - 新增 Superpowers 可选参考模式

- 范围：`02-create-loop/99-skills/superpowers-usage.md`、`02-create-loop/99-skills/recommended-skills.md`、`02-create-loop/loop.md`。
- 改前：`02-create-loop` 推荐了 Agent 开发常用 skill，但没有说明 Superpowers 这种开发方法插件如何隔离使用。
- 改后：新增 `superpowers-usage.md`，明确不安装、不默认启用；只有用户明确说“启用 Superpowers 模式”时才作为 spec、plan、TDD、code review 和 root-cause debugging 的参考。
- 原因：用户希望必要时参考 Superpowers，但不影响全局 Codex/Claude 行为，也不替代 myloop 的分层。
- 隐患：这是文档级隔离，可靠性高；如果未来改成全局插件安装，则可能影响全局行为，需要重新评估。
- 验证：待最终检查确认 `superpowers-usage.md` 存在，且默认入口 `/Users/ycl/Desktop/myloop/ai-loop-mini2/loop.md` 未改变。
- git：待提交。
- skill 兼容：兼容；未修改 `/Users/ycl/Desktop/myskill/myloop/SKILL.md`。

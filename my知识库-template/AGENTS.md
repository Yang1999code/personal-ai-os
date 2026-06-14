# 经验库 Agent 维护规则

这个目录是一个本地私有 LLM Wiki（大语言模型维基）经验库。目标是把零散经验沉淀成可复用、可追溯、可持续更新的知识。

## 先读顺序

Agent（智能体）进入本目录后，先按这个顺序读取：

1. `index.md`：了解总目录、分类、最新更新时间。
2. `wiki/README.md`：了解 wiki（维基）页面的标准格式。
3. 相关分类索引：例如 `wiki/codex/index.md`。
4. 相关 wiki 页面。
5. 必要时再读 `sources/` 里的原始资料。

不要一上来全文扫描所有资料。先通过索引定位，再读最相关的内容。

## 目录职责

- `sources/`：原始经验、截图、脚本、README 等来源材料。尽量保留原貌。
- `wiki/`：从来源材料提炼出的结构化知识页。
- `templates/`：新增来源、wiki 页、分类索引、故障排查页时使用的格式模板。
- `inbox/`：临时放入的新资料。整理时需要归档到 `sources/` 并更新 wiki。
- `index.md`：经验库总入口。
- `log.md`：维护记录。
- `roadmap.md`：后续改进想法，先记录，不轻易改规则。

## 分类规范

当前固定分类：

- `codex`：Codex Desktop、Codex CLI、Codex 连接服务、浏览器读取等经验。
- `claude-code`：Claude Code、Claude Agent、Claude 相关远程操作经验。
- `daily`：Mac、终端、快捷键、文件路径等日常使用经验。
- `vm`：虚拟机、SSH、远程机器、隧道、连接工具等经验。
- `troubleshooting`：跨分类故障排查、排错清单、常见问题。

如果新经验同时属于多个分类，优先放到最稳定的基础分类。

## 新增资料流程

1. 如果用户给的是临时资料，先放入 `inbox/`。
2. 判断分类和主题名。
3. 在 `sources/<category>/<topic>/` 下创建主题目录。
4. 原始 Markdown 使用 `source.md`，图片和附件尽量放在同一主题目录或子目录。
5. 根据 `templates/source-template.md` 补充来源页元数据。
6. 根据 `templates/wiki-template.md` 新建或更新对应 wiki 页。
7. 更新根目录 `index.md` 和分类 `index.md`。
8. 在 `log.md` 记录本次维护。

## 敏感信息规则

敏感等级：

- `public`：可以公开。
- `private`：个人或本机环境相关，不建议公开。
- `sensitive`：包含内网、令牌、密钥、账号、机器地址、SSH、认证、公司资源等线索。

处理原则：

- 不在 wiki 中复述完整 token（令牌）、key（密钥）、密码、私钥。
- 内网 URL、IP、Host、账号等必要时可以写“存在这类配置”，具体值优先留在 source。
- 如果必须保留具体值，页面 `sensitivity` 标为 `sensitive`。
- 对外分享前必须先做脱敏副本。

## 回答用户时的规则

- 尽量用中文。
- 英文专有名词后加中文说明，例如 LLM Wiki（大语言模型维基）。
- 每次回答后加白话总结。
- 复杂概念可以用 Mermaid（流程图）辅助。
- 涉及本机可验证的问题，优先检查本地状态，再回答。

## 白话总结

先看索引，再看 wiki，必要时才回 source。原始资料是证据，wiki 是答案，log 是维护记录。

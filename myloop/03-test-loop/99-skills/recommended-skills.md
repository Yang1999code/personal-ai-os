# Recommended Skills

本 Loop（循环）是测试/验收场景，推荐 skill（技能）的原则是：优先能产生证据、能复现、能回归的工具。

## 核心推荐

| skill | 状态 | 为什么推荐 | 适合什么时候用 |
| --- | --- | --- | --- |
| `read-baidu-ku` | 已有，本地 skill | 查百度内部代码规范、测试规范、验收标准 | 内部项目或需要百度规范 |
| `my知识库` | 已有，本地 skill | 查你的历史故障、规范、测试经验 | 制定测试策略前 |
| `browser:control-in-app-browser` | 插件内置 | 打开本地页面、截图、检查交互 | 前端/网页项目验收 |

## 官方 curated 可选增强

| skill | 状态 | 为什么推荐 | 适合什么时候用 |
| --- | --- | --- | --- |
| `playwright` | 未安装，官方 curated | 浏览器自动化测试、截图、交互验证 | 前端/网页/管理后台 |
| `playwright-interactive` | 未安装，官方 curated | 交互式浏览器验证，适合边看边测 | UI（用户界面）细节验收 |
| `gh-fix-ci` | 未安装，官方 curated | 面向 GitHub CI（持续集成）失败修复 | GitHub Actions 测试失败 |
| `security-best-practices` | 未安装，官方 curated | 安全检查和最佳实践 | 涉及登录、权限、数据、接口 |
| `security-threat-model` | 未安装，官方 curated | 威胁建模，提前找风险 | 高风险系统、权限系统、外部接口 |
| `sentry` | 未安装，官方 curated | 错误监控和线上问题分析 | 有 Sentry（错误监控）项目 |
| `screenshot` | 未安装，官方 curated | 截图证据和视觉回归材料 | UI 验收、bug 复现 |
| `pdf` | 未安装，官方 curated | 对照 PDF 规范或报告验收 | 测试标准来自 PDF 文档 |

## Agent 开发优先组合

如果主要做 Agent（智能体）开发，test 阶段优先看这些：

1. `playwright`：测 Agent 网页控制、浏览器自动化、前端控制台和端到端流程。
2. `gh-fix-ci`：Agent 项目上 CI（持续集成）后，修失败很常用。
3. `security-best-practices`：Agent 涉及 token（令牌）、工具权限、外部调用时必须看。
4. `security-threat-model`：做工具调用、插件、自动化执行前，先想清楚风险边界。
5. `sentry`：Agent 上线后看异常、错误聚类和真实失败样本。
6. `read-baidu-ku` / `my知识库`：内部规范和你自己的历史测试经验仍然优先。

## 使用顺序

```text
读需求和 Done 标准
-> 查 my知识库 / read-baidu-ku
-> 构造测试集
-> 写测试用例
-> 用 browser / playwright / CI / security / sentry 类 skill 验证
-> 写验收报告
```

## 注意

- 当前只推荐，不自动安装新 skill。
- 安装 curated skill 前先问人。
- 每次测试证据写入 `04-runs/`，失败写入 `05-bug-reports/`。

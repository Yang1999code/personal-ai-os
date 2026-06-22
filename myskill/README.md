# myskill

`myskill` 是 Personal AI OS（个人 AI 操作系统）的 skill（技能）入口层。

它的职责不是保存完整流程，而是给 Agent（智能体）一个稳定入口：

- `/myloop`：跳转到本机 `myloop` 工作流。
- `/my知识库`：跳转到本机 `my知识库` 维护规则。
- `/skill-check`：只读检查 skill 安装和软链接状态。

## 目录结构

```text
myskill/
├── README.md
├── myloop/
│   ├── SKILL.md
│   └── agents/openai.yaml
├── my知识库/
│   ├── SKILL.md
│   └── agents/openai.yaml
└── skill-check/
    ├── SKILL.md
    └── agents/openai.yaml
```

## 设计原则

- skill 只做稳定入口和边界说明。
- 真实流程运行时读取 `$HOME/Desktop/myloop` 或 `$HOME/Desktop/my知识库`。
- 不把知识库正文、项目资料、业务细节复制进 skill。
- 安装时建议用软链接，不要复制多份长期维护。

## 白话总结

`myskill` 是遥控器。遥控器只负责按哪个按钮，不负责把电视机、电路和节目内容都塞进去。

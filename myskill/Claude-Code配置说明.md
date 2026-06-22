# Claude Code 配置说明：安装并使用 myloop / my知识库

本文档用于让 Claude Code（Claude 代码代理）和 Codex（代码智能体）共用桌面 `myskill` 里的本地 skill（技能）：

- `/my知识库`：把刚完成的问题沉淀到本地知识库。
- `/myloop`：从本地 myloop 模板启动多轮深度工作流。
- `/skill-check`：只读检查 Claude Code skill 的软链接、入口文件和触发准备状态。

设计目标：Claude Code 和 Codex 使用同一份 skill 源文件，体验尽量一致；skill 本身只做稳定入口，真实流程仍然从 `$HOME/Desktop/my知识库` 和 `$HOME/Desktop/myloop` 读取最新规则。

## 依据

Claude Code 官方文档说明：

- 个人级 skill 放在 `~/.claude/skills/<skill-name>/SKILL.md`，对所有项目生效。
- skill 可以通过 `/skill-name` 直接调用，也可以由 Claude 根据 `description` 自动触发。
- slash command（斜杠命令）名称来自 skill 目录名，不主要依赖 `SKILL.md` 里的 `name` 字段。
- 修改已存在的 skill 文件通常会被 Claude Code 实时检测；如果顶层 skills 目录是新建的，建议重启 Claude Code。

官方参考：

- https://code.claude.com/docs/en/skills
- https://code.claude.com/docs/en/agent-sdk/slash-commands

## 当前源文件位置

不要复制成两份长期维护。源文件统一放在桌面：

```text
$HOME/Desktop/myskill/
  my知识库/
    SKILL.md
    agents/openai.yaml
  myloop/
    SKILL.md
    agents/openai.yaml
  skill-check/
    SKILL.md
    agents/openai.yaml
```

Claude Code 安装时建议使用软链接，让 Claude Code 读取同一份桌面源文件。

## 一键安装到 Claude Code

在终端执行：

```bash
mkdir -p ~/.claude/skills

if [ -L ~/.claude/skills/my知识库 ]; then
  rm ~/.claude/skills/my知识库
elif [ -e ~/.claude/skills/my知识库 ]; then
  mv ~/.claude/skills/my知识库 ~/.claude/skills/my知识库.backup.$(date +%Y%m%d-%H%M%S)
fi

if [ -L ~/.claude/skills/myloop ]; then
  rm ~/.claude/skills/myloop
elif [ -e ~/.claude/skills/myloop ]; then
  mv ~/.claude/skills/myloop ~/.claude/skills/myloop.backup.$(date +%Y%m%d-%H%M%S)
fi

if [ -L ~/.claude/skills/skill-check ]; then
  rm ~/.claude/skills/skill-check
elif [ -e ~/.claude/skills/skill-check ]; then
  mv ~/.claude/skills/skill-check ~/.claude/skills/skill-check.backup.$(date +%Y%m%d-%H%M%S)
fi

ln -s $HOME/Desktop/myskill/my知识库 ~/.claude/skills/my知识库
ln -s $HOME/Desktop/myskill/myloop ~/.claude/skills/myloop
ln -s $HOME/Desktop/myskill/skill-check ~/.claude/skills/skill-check
```

如果 Claude Code 已经打开，安装后建议重启一次 Claude Code，确保新建的 `~/.claude/skills` 被监听。

## 安装到 Codex

Codex 侧也建议用软链接指向同一份桌面源文件：

```bash
mkdir -p ~/.codex/skills

if [ -L ~/.codex/skills/skill-check ]; then
  rm ~/.codex/skills/skill-check
elif [ -e ~/.codex/skills/skill-check ]; then
  mv ~/.codex/skills/skill-check ~/.codex/skills/skill-check.backup.$(date +%Y%m%d-%H%M%S)
fi

ln -s $HOME/Desktop/myskill/skill-check ~/.codex/skills/skill-check
```

如果以后要让 `my知识库`、`myloop` 也稳定出现在 Codex 里，同样按这个模式把桌面源文件软链接到 `~/.codex/skills/`。

## 验证安装

检查软链接：

```bash
ls -la ~/.claude/skills
```

期望看到类似：

```text
my知识库 -> $HOME/Desktop/myskill/my知识库
myloop -> $HOME/Desktop/myskill/myloop
skill-check -> $HOME/Desktop/myskill/skill-check
```

检查入口文件：

```bash
test -f ~/.claude/skills/my知识库/SKILL.md && echo "my知识库 skill ok"
test -f ~/.claude/skills/myloop/SKILL.md && echo "myloop skill ok"
test -f ~/.claude/skills/skill-check/SKILL.md && echo "skill-check skill ok"
```

进入任意项目后启动 Claude Code：

```bash
claude
```

然后测试直接调用：

```text
/my知识库 只验证你是否能读取 skill，不要写入任何文件。
```

```text
/myloop 目标：只验证你是否能读取 skill。任务地址：/tmp/demo。不要创建真实 run。
```

如果 Claude Code 能说明它会先读取对应 `SKILL.md`，并定位到 `$HOME/Desktop/my知识库` 或 `$HOME/Desktop/myloop`，就算安装成功。

也可以直接跑只读自检：

```text
/skill-check 只读检查我本机的 Claude Code skills 是否安装正确，先查 my知识库 和 myloop，不要改任何文件。
```

期望行为：

1. 读取 `Claude-Code配置说明.md`。
2. 检查 `Desktop/myskill` 源目录和 `~/.claude/skills` 软链接。
3. 输出 pass/fail（通过/失败）矩阵。
4. 不自动改任何文件。

## 使用方式

### 沉淀经验

完成一个问题后，在 Claude Code 里输入：

```text
/my知识库 把刚才解决的问题沉淀进我的本地知识库
```

期望行为：

1. 先读 `$HOME/Desktop/my知识库/AGENTS.md`。
2. 按知识库当前规则判断新增还是更新。
3. 需要分类、敏感信息、目录结构判断时先问人。
4. 写完后报告改了哪些文件。

### 启动 myloop

输入：

```text
/myloop 目标：优化这个方案。任务地址：$HOME/xxx
```

期望行为：

1. 先读 `$HOME/Desktop/myloop/ai-loop-mini2/README.md` 和 `loop.md`。
2. 用你输入的目标和地址启动工作流。
3. 不直接污染模板，优先建立独立 run 工作区。
4. 遇到目标不清、高风险操作、业务判断时先问人。
5. 最后给出本轮结论、证据、风险和下一步建议。

### 自检 skill 安装

输入：

```text
/skill-check 只读检查我本机的 Claude Code skills 是否安装正确，先查 my知识库 和 myloop。
```

期望行为：

1. 检查 `myskill` 下源目录是否存在。
2. 检查 `~/.claude/skills` 里是否有正确软链接。
3. 检查 `SKILL.md` 和 `agents/openai.yaml` 是否可读。
4. 给出最短修复建议，但不自动修。

## 更新方式

以后如果要更新 skill 的入口逻辑，直接改桌面文件：

```text
$HOME/Desktop/myskill/my知识库/SKILL.md
$HOME/Desktop/myskill/myloop/SKILL.md
$HOME/Desktop/myskill/skill-check/SKILL.md
```

因为 Claude Code 和 Codex 都通过软链接读取同一份源文件，所以不需要分别维护两套。

如果只是更新真实流程，优先改这两个地方，而不是改 skill：

```text
$HOME/Desktop/my知识库/AGENTS.md
$HOME/Desktop/myloop/ai-loop-mini2/loop.md
```

这符合当前设计：skill 是遥控器，真实流程在对应文件夹里。

## 重要边界

- 不要把完整流程复制进 skill，否则以后流程更新会出现两份规则冲突。
- `/my知识库` 写入前要遵守知识库敏感信息规则，不直接写 token（令牌）、key（密钥）、密码、私钥、完整内网地址等。
- `/myloop` 不应默认执行安装依赖、部署、删除、覆盖、提交等高风险操作。
- `/skill-check` 默认只做诊断，不自动修软链接、不自动改 skill 文件。
- 如果 Claude Code 自动触发过于积极，可以在对应 `SKILL.md` front matter（头部元数据）里加：

```yaml
disable-model-invocation: true
```

这样就只允许你手动输入 `/my知识库` 或 `/myloop` 触发。

## 排查

如果 `/myloop` 或 `/my知识库` 没出现：

1. 确认软链接存在：

   ```bash
   ls -la ~/.claude/skills
   ```

2. 确认 `SKILL.md` 存在：

   ```bash
   ls -la ~/.claude/skills/myloop/SKILL.md
   ls -la ~/.claude/skills/my知识库/SKILL.md
   ```

3. 重启 Claude Code。

4. 确认命令名来自目录名，所以目录必须叫：

   ```text
   myloop
   my知识库
   skill-check
   ```

5. 如果中文目录名在某个 Claude Code 版本里触发不稳定，保底方案是新增英文别名软链接：

   ```bash
   ln -s $HOME/Desktop/myskill/my知识库 ~/.claude/skills/my-knowledge
   ```

   然后用：

   ```text
   /my-knowledge 把刚才解决的问题沉淀进我的本地知识库
   ```

   但默认先使用 `/my知识库`，保持和 Codex 一致。

## 白话总结

Claude Code 和 Codex 都可以共用桌面 `myskill` 里的这些 skill。安装时不要复制，使用软链接；Claude Code 主要看 `~/.claude/skills/`，Codex 主要看 `~/.codex/skills/`；`/my知识库` 负责沉淀经验，`/myloop` 负责启动深度流程，`/skill-check` 负责先确认这些入口有没有装对；真正流程以后继续改 `my知识库/AGENTS.md` 和 `myloop/ai-loop-mini2/loop.md`，skill 只负责稳定找到并启动它们。

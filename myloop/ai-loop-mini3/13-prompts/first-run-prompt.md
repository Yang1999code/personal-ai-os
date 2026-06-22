# First Run Prompt

配合 `02-runtime/run-loop.sh` 使用。

先在终端 A 运行：

```bash
cd /Users/ycl/Desktop/myloop/ai-loop-mini3
bash 02-runtime/run-loop.sh
```

然后把下面这段发给终端 B 里的 Claude/Codex：

```text
读取 /Users/ycl/Desktop/myloop/ai-loop-mini3/03-exchange/inbox/round-1.request.md，
再读取 /Users/ycl/Desktop/myloop/ai-loop-mini3/loop.md。

请作为 Explorer（探索者）完成第 1 轮。

本轮目标：
检查这个 while-driven deep loop 是否清楚、可执行，尤其检查：
- while 脚本是否只管节奏，不替 AI 思考
- 03-exchange 文件交换是否清楚
- tmp + rename 的写入规则是否能避免半写半读
- status 字段是否足够让脚本判断继续、停止或问人

请把结果写入：
/Users/ycl/Desktop/myloop/ai-loop-mini3/03-exchange/outbox/round-1.explorer.md

输出顶部必须包含：
round: 1
role: explorer
status: continue | done | needs-human | failed
quality_gain: yes | no
next_action: continue | stop | ask-human | search | test
```


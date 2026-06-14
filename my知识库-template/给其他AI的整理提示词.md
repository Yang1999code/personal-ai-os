# 给其他 AI 的整理提示词

把下面这段提示词发给其他 AI（人工智能），它就知道怎么把新的 Markdown（Markdown 文档）整理进这个经验库。

```text
请帮我把新的 Markdown 文档整理进这个本地经验库：

经验库地址：
$HOME/Desktop/my知识库

开始前请先读：
1. $HOME/Desktop/my知识库/AGENTS.md
2. $HOME/Desktop/my知识库/index.md
3. $HOME/Desktop/my知识库/wiki/README.md

整理规则：
1. 不要直接把新 md 放在根目录。
2. 如果只是原始经验记录，放到：
   $HOME/Desktop/my知识库/sources/分类/主题名/source.md
3. 如果已经是整理后的知识页，放到：
   $HOME/Desktop/my知识库/wiki/分类/页面名.md
4. 如果暂时判断不了分类，先放到：
   $HOME/Desktop/my知识库/inbox/
5. 如果 md 有图片、脚本、附件，和 source.md 放在同一个主题目录里。
6. 分类优先从这些里面选：
   codex、claude-code、daily、vm、troubleshooting

放好后请更新：
1. $HOME/Desktop/my知识库/index.md
2. 对应的 wiki/分类/index.md
3. $HOME/Desktop/my知识库/log.md

注意：
- 尽量不要改原始 md 正文。
- 涉及 token、key、密码、SSH、内网、账号、机器信息时，标为 sensitive。
- Wiki 页只写提炼后的结论、流程和排查清单，不要扩散敏感明文。
- 最后告诉我你放到了哪里、更新了哪些索引。
```

## 更短版

```text
请把这个新 md 整理进：
$HOME/Desktop/my知识库

先读 AGENTS.md、index.md、wiki/README.md。
原始经验放 sources/分类/主题名/source.md；
整理后的知识页放 wiki/分类/页面名.md；
不确定分类就先放 inbox/。
分类用 codex、claude-code、daily、vm、troubleshooting。
如果有图片或附件，和 source.md 放同一主题目录。
放好后更新根 index.md、对应 wiki/分类/index.md、log.md。
不要破坏原文；敏感信息标 sensitive，不要扩散到 wiki。
```

## 白话总结

其他 AI 只要先读这个文档，再读 `AGENTS.md`、`index.md`、`wiki/README.md`，就知道新的 md 应该放哪里，以及放完以后要更新哪些索引和日志。

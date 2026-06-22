# 给其他 AI 的整理提示词

把下面这段提示词发给其他 AI（人工智能），它就知道怎么把新的 Markdown（Markdown 文档）整理进这个经验库。

```text
请整理资料到这个本地 LLM Wiki（大语言模型维基）：

1. 先读 AGENTS.md。
2. 再读 index.md。
3. 再读 wiki/README.md。
4. 判断资料属于哪个分类：codex、claude-code、daily、vm、troubleshooting。
5. 原始资料放 sources/<category>/<topic>/source.md。
6. 提炼后的结论放 wiki/<category>/<页面名>.md。
7. 必要时更新 导航/*.md。
8. 更新 维护/log.md。
9. 不要写入真实 token、key、密码、私钥、完整内网地址。
10. 最后报告新增或修改了哪些文件。
```

## 白话总结

其他 AI 只要先读这段，再读本库规则，就知道新资料应该放哪里。

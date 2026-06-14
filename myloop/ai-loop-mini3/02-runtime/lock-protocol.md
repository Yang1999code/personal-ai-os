# Lock Protocol

这个文件说明 `03-exchange/` 的锁和原子写入规则。

## 为什么需要锁

多终端交互时，可能出现：

```text
AI 正在写 round-1.explorer.md
脚本同时读到了半截内容
脚本误判状态
```

所以必须避免半写半读。

## 原子写入规则

写文件时：

1. 创建 lock，例如 `round-1.explorer.lock`
2. 写临时文件，例如 `round-1.explorer.md.tmp`
3. 写完并检查完整性
4. 原子改名到 outbox，例如 `round-1.explorer.md`
5. 删除 lock

脚本只读取：

```text
03-exchange/outbox/*.md
```

脚本不读取：

```text
03-exchange/tmp/*.tmp
```

## 异常处理

如果 lock 超过 `lock_timeout_seconds` 还存在：

- 不继续下一轮
- 写入 `10-outputs/last-report.md`
- 返回给人判断

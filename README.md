# research-workflow

> A Claude Code skill that organizes a research project into a fixed file structure,
> so both you and every fresh agent window know where to read context and where to
> write results. **中文说明在下面。**

用 Agent 协作做科研的项目工作流，做成了 Claude Code skill。

核心想法很简单：**科研项目里人和 Agent 的协作，靠一套固定的文件结构来承载**——
每个文档职责单一，每个新开的 Agent 窗口都知道先读什么、往哪写。

## 安装

```bash
git clone https://github.com/skJack/research-workflow.git ~/.claude/skills/research-workflow
```

Cursor 用户放 `~/.cursor/skills/` 或 `.agents/skills/`。

装完对 Claude 说「开个新坑做 X」，它会问你三个问题（项目名、目标、领域术语），
然后把整套结构建好。

## 文件结构

```
你的项目/
├── AGENTS.md              项目总纲：在做什么、硬规矩 —— 每个新窗口第一个读
├── handoff.md             进度交接 —— 每个窗口结束前更新，下一个窗口靠它接上
├── brainstorm.md          问题和假设的讨论记录，倒序
├── related_work/          文献，每篇 paper.pdf + source/
├── 复现/                   baseline 复现 + 复现报告
├── experiment/
│   ├── results.md         每版实验一行，不覆盖不删
│   └── evaluation.md      标准化测评，防止临时挑指标
└── DataSet/ + dataset.md  数据和处理说明
```

## 两个脚本

**建骨架**（幂等，已有文件不覆盖）：

```bash
bash ~/.claude/skills/research-workflow/scripts/init-project.sh ~/Code/my-paper
```

**抓论文**（PDF + LaTeX 源码都下，源码自动清洗——隔离作者打包进来的旧稿、剥掉注释掉的正文）：

```bash
bash ~/.claude/skills/research-workflow/scripts/fetch-paper.sh 2301.11305 detectgpt
```

## 工作节奏

```
抓文献 → 复现关键 baseline → 提假设 → 跑实验 → （循环）
```

复现放在提假设之前：论文只报平均值和成功配置，
真正的问题往往在自己跑一遍才看得见的地方。

## 内置的几条警示

- 效果突然变好，先查数据泄漏（split 是不是按样本分了）
- verify 中间过程，不只是看代码——小问题都藏在输入输出的处理里
- 每一版实验都命名、都留着，失败的也留
- 测评照 `evaluation.md` 走，不临时挑指标
- 上下文快满就更新 `handoff.md`，别硬撑到被截断

## License

Apache License 2.0

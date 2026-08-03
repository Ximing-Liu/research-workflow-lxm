# research-workflow

> A Claude Code skill for doing research with an AI agent — project scaffolding, paper
> ingestion, baseline reproduction, experiment discipline, and context handoff.
> Built from measurements on 17 papers / 335 pages, not from vibes.
> **中文说明在下面。**

一套用 Agent 协作做科研的工作流，做成了 Claude Code skill。

不是"AI 帮你写论文"，而是**把该自动化的彻底自动化，把注意力省下来投到 AI 接管不了的那一步**——
发现问题和提出假设。

---

## 三个可能和你认知相反的结论

这些不是推测，是实测出来的。方法和局限见
[references/reading-papers.md](references/reading-papers.md)。

### 1. 给 Agent 喂论文，LaTeX 源码**不省 token，反而贵 18%**

网上普遍的说法是"下 LaTeX 源码更省"。我拿 17 篇论文、335 页，两种格式各下一份实测：

| | LaTeX 源码 | PDF 抽文本 | |
|---|---|---|---|
| 17 篇合计 token | 321,984 | 273,043 | **LaTeX 贵 1.18x** |
| LaTeX 更贵的篇数 | | | **12 / 17** |

源码里的 preamble、宏定义、排版命令、`.bbl` 渲染成 PDF 之后就不占篇幅了。

### 2. LaTeX 真正赢的是**结构**，而且差距比想象中大

取 17 篇里所有 `tabular` 的 **287 个「行名 ↔ 数值」配对**，看两者是否还落在同一行
（配对断了，模型只能靠位置猜哪个数字属于哪一行）：

| 格式 | 保住配对 |
|---|---|
| LaTeX 源码 | **100%** |
| `pdftotext -layout` | **26%** |
| `pdftotext` 默认参数 | 6% |

⚠️ **能站住的是 26%，不是 6%。**默认参数那个只说明参数用错了——
如果你必须从 PDF 抽表格，一定要加 `-layout`。

公式的差距 `-layout` 也救不了：

```
PDF 抽出来：      QK T
                  Attention(Q, K, V ) = softmax( √ )V
                  dk

LaTeX 源码：      \mathrm{Attention}(Q,K,V)=\mathrm{softmax}(\frac{QK^T}{\sqrt{d_k}})V
```

**所以结论是两个格式都下，按问题类型路由**：泛读喂 PDF，查表格公式喂 LaTeX，
看图只能喂 PDF（图不在源码里，源码只有 caption）。

### 3. arXiv 源码有 **29–37% 是脏的**

判据：带旧稿目录 / 注释掉的正文超过 30 行 / 自定义宏超过 80 个。

最典型的是 DetectGPT (2301.11305)——tarball 里装着 `v1.tex` `v2.tex`
`v3__chelsea_experiments_.tex` `v4__pre-chris_feedback_revision_.tex` 四个旧版草稿。
**Agent 无差别读 `*.tex` 会同时读进五个版本的论文，引到已经被推翻的数字。**

本 skill 的 `fetch-paper.sh` 会自动处理这三类污染。

---

## 安装

```bash
git clone https://github.com/skJack/research-workflow.git ~/.claude/skills/research-workflow
```

Cursor 用户放 `~/.cursor/skills/` 或 `.agents/skills/`。

装完直接说「开个新坑做 X」「把这几篇 arXiv 弄下来」就会触发。

---

## 用法

**建项目骨架**

```bash
bash ~/.claude/skills/research-workflow/scripts/init-project.sh ~/Code/my-paper
```

幂等——在已有项目里跑也安全，只补缺的文件。

**抓论文（双格式 + 自动清洗）**

```bash
bash ~/.claude/skills/research-workflow/scripts/fetch-paper.sh 2301.11305 detectgpt
```

会下 PDF 和 LaTeX 源码，把作者打包进来的旧稿隔离到 `source/.stale/`（不删），
剥掉注释掉的正文（原文件存 `.orig`），并提示哪几个文件装着自定义宏。

---

## 五个阶段

```
1. related_work/     抓文献             ← 整个交给 Agent
2. 复现/              跑通关键 baseline   ← 整个交给 Agent
3. brainstorm.md     发现问题 + 提假设    ← 人主导，Agent 陪聊
4. experiment/       写代码跑实验        ← Agent 主力，人 verify 关键节点
5. DataSet/          数据处理            ← 整个交给 Agent
```

**阶段 2 在阶段 3 之前，这是反直觉但关键的一点。**

论文只报平均值和成功的配置。它卡在哪、哪个 setting 崩了、报的数字复现不出来——
这些只有自己跑一遍才看得见，而这些正是好问题的来源。

---

## 几条实验纪律

完整版见 [references/experiment-discipline.md](references/experiment-discipline.md)。

- **verify 中间过程，不只是代码结构。**逐块问输入输出怎么处理的，
  再配合代码对一遍。小问题基本都在中间过程里，看最终指标看不出来。
- **上界和随机对照要排进实验设计。**只有 baseline 和最终版的话，
  你不知道最终那个数算不算好。
- **效果突然暴涨，第一反应是查数据泄漏，不是庆祝。**最常见的是
  split 按样本分而不是按来源/类别分。
- **测评标准化写进 `evaluation.md`。**这份文档真正的作用是防止 cherry-pick——
  人看到某个指标特别好时，会不自觉地只报那个。

---

## 目录

```
SKILL.md                          五阶段工作流 + 硬规矩
scripts/init-project.sh           建骨架（幂等）
scripts/fetch-paper.sh            抓论文：双格式 + 自动清洗
references/reading-papers.md      LaTeX vs PDF 路由规则 + 完整实测数据
references/experiment-discipline.md   verify / 版本纪律 / 测评标准化 / 数据泄漏
assets/templates/                 AGENTS / handoff / brainstorm / results / evaluation / dataset
```

---

## 实测的局限（别当成普适结论）

- 主语料 17 篇全是 CV / motion generation，公式密度极高的理论论文可能不同
- 分词器用的 tiktoken cl100k 不是 Claude 的，**倍数可靠，绝对 token 数有偏差**
- PDF 抽取只测了 poppler。换 GROBID / Nougat 这类专门的科学文档解析器，
  表格那一栏大概率会好转
- **验的是「信息有没有被破坏」，不是「模型答没答对」。**后者要做问答 eval，还没做

欢迎在自己的语料上重测，结果不一样的话开 issue 告诉我。

---

## License

Apache License 2.0

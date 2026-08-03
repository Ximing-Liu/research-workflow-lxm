# 喂 PDF 还是喂 LaTeX

结论先放：**两个都下，按你要问什么来选。**下面是支撑这个规则的实测数据，
以及几个和通行说法相反的点——要跟用户解释为什么，或者要判断某个具体场景，看这份。

## 实测

语料：17 篇 2026 年 motion/video generation 论文，335 页，arXiv 源码与 PDF 各一份。
另有 5 篇经典论文（Transformer / GPT-3 / DDPM / ViT / DetectGPT）和 30 篇 cs.CL 最新论文做交叉检验。
分词 tiktoken cl100k（**倍数可靠，绝对 token 数有偏差**），PDF 抽取用 poppler。

### 「LaTeX 省 token」是假的

| | LaTeX 源码 | PDF 抽文本 | 倍数 |
|---|---|---|---|
| 17 篇合计 | 321,984 | 273,043 | **1.18x** |
| 17 篇里 LaTeX 更贵的 | — | — | **12 / 17** |
| 5 篇经典论文 | — | — | 1.54x |

**LaTeX 更贵，不是更省。**源码里的 preamble、宏定义、排版命令、注释、`.bbl`
渲染成 PDF 之后就不占篇幅了。

所以**泛读一篇论文时喂 PDF**——只是想知道它讲了什么、用了什么方法、数据集是哪个，
PDF 抽出来的文本更干净也更便宜。

### LaTeX 真正赢的是结构

取 17 篇论文所有 `tabular` 里的 **287 个**「行名 + 数值」配对，
检查两者在各格式里是否仍落在同一行（配对断了，模型就得靠位置猜哪个数字属于哪一行）：

| 格式 | 保住配对 |
|---|---|
| LaTeX 源码 | **287/287 = 100%**（`&` 结构保证的） |
| `pdftotext -layout` | 76/287 = **26%** |
| `pdftotext` 默认参数 | 16/287 = 6% |

⚠️ **要用 26% 这个数，不是 6%。**默认参数那个只说明参数用错了。
如果因为某种原因必须从 PDF 抽表格，**一定加 `-layout`**。

公式的差距更大，而且 `-layout` 也救不回来：

```
PDF 抽出来：      QK T
                  Attention(Q, K, V ) = softmax( √ )V
                  dk

LaTeX 源码：      \mathrm{Attention}(Q,K,V)=\mathrm{softmax}(\frac{QK^T}{\sqrt{d_k}})V
```

分式塌了、根号里是空的、下标掉到了下一行。

所以**细查时读 LaTeX**——查某张表里的具体数字、看一个公式怎么推的、
对引用关系（`\cite{}` 比 PDF 里的 "[23]" 好追太多）。

### 反过来：图只在 PDF 里

17 篇合计 **192 张插图**，中位每篇 10 张。源码里只有
`\includegraphics{fig3.pdf}` 加一句 caption——**图本身不在源码里**。

问「图 3 那条曲线什么走势」「这个可视化说明了什么」，只能读 PDF 对应页。

## 路由规则

| 问题类型 | 读哪个 |
|---|---|
| 这篇讲了什么 / 用了什么方法 / 什么数据集 | **PDF** |
| 表里那个数是多少 / 公式怎么推 / 引的是哪篇 | **LaTeX** |
| 图里画了什么 / 版面 / 视觉对比 | **PDF** |
| 复现时要抄超参、要对齐实现细节 | **LaTeX**（附录常有 PDF 里排版挤掉的表） |

## 源码是脏的，读之前必须清

抽样统计：**17 篇里 5 篇（29%）**、cs.CL 最新 30 篇里 **11 篇（37%）** 判定为脏。
判据：带旧稿目录 / 注释掉的正文超过 30 行 / 自定义宏超过 80 个。

三类污染，`scripts/fetch-paper.sh` 会自动处理，手动处理时也照这个来：

**1. 旧稿目录** —— 有些作者把 `history/` `old/` `v1/` 一起打包上传。
DetectGPT (2301.11305) 的 tarball 里就装着 `v1.tex` `v2.tex`
`v3__chelsea_experiments_.tex` `v4__pre-chris_feedback_revision_.tex` 四个旧版。
**无差别读 `*.tex` 会同时读进五个版本的论文，引到已经被推翻的数字。**

```bash
mv source/{history,old,backup,draft,previous,archive} source/.stale/ 2>/dev/null
```

**2. 注释掉的正文** —— 作者删了但没删干净的段落。Transformer 那篇 30% 的 token 是
`%` 注释，里面有整段被弃用的描述。读进去会当成论文观点。

```bash
perl -pe 's/(?<!\\)%.*$//' main.tex.orig > main.tex   # 保留 \% 转义
```

顺带一提：注释里偶尔有金子。Transformer 那篇有一行
`%TODO(noam): update results for new models.`，正好解释了正文里 41.0 和表格里
41.8 为什么对不上。**清洗时把原文件留一份 `.orig`**，需要考古时还在。

**3. 自定义宏** —— 超过 80 个就会严重影响可读性（样本里最多的一篇 547 个）。
读正文前先读 `commands.tex` / `macros.tex` / `def.tex` 这类文件，
否则满篇 `\ourmethod` `\tabref` 不知道展开成什么。

## 什么时候没有源码

arXiv 允许 PDF-only 投稿。抽样里 cs.CL 最新 30 篇**全部有源码**，
所以在 CS 领域这基本不是问题，但遇到了就只能读 PDF——记得用 `-layout`。

## 局限

- 主语料 17 篇全是 CV/motion generation，公式密度极高的理论论文可能不同
- 分词器是 tiktoken 不是 Claude 的，**倍数可靠，绝对数有偏差**
- PDF 抽取只测了 poppler。换 GROBID / Nougat 这类专门的科学文档解析器，
  表格那一栏大概率会好转——如果项目里表格提取是刚需，值得试
- **验的是「信息有没有被破坏」，不是「模型答没答对」**。后者要做问答 eval，没做

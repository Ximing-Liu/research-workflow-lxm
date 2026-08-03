# {{项目名}}

{{一句话说清这个项目在做什么}}

**核心主张：{{你的主张——这是整个项目的锚，Agent 靠它判断什么该做什么不该做}}**

目标：{{会议/期刊 + deadline}}

---

## 你（Agent）每次进来先读什么

1. **本文件** —— 知道我们在做什么、每个目录是干什么的
2. **[handoff.md](handoff.md)** —— 上一个窗口做到哪了、下一步是什么
3. 要动实验就再读 [experiment/results.md](experiment/results.md) 和 [experiment/evaluation.md](experiment/evaluation.md)

**不要读完整个仓库再开始。** 上下文很贵，按需读。

---

## 目录

| 路径 | 是什么 | 什么时候看 |
|---|---|---|
| `related_work/` | 相关文献，每篇 `paper.pdf` + `source/` | 要引用、要对比方法时 |
| `复现/` | 重要 baseline 的复现，每个带一份复现报告 | 要确认 baseline 数字时 |
| `brainstorm.md` | 问题和假设是怎么聊出来的 | 想不通为什么这么设计时 |
| `experiment/` | 实验代码 + 每一版结果 | 跑实验 |
| `DataSet/` | 数据集，处理说明见 `dataset.md` | 要动数据时 |
| `handoff.md` | 进度交接 | **每次都读** |

---

## 读论文的规矩

`related_work/` 里每篇都是**两个格式都下**：`paper.pdf` 和 `source/`（arXiv LaTeX 源码）。

**按你要问什么来选，不要图省事只读一个：**

- **泛读**——「这篇大概讲了什么、用了什么方法、什么数据集」→ 读 `paper.pdf`，**更省 token**
- **细查**——「Table 3 那一行是多少」「这个 bound 怎么推的」「他引的是哪篇」
  → 读 `source/*.tex`，**PDF 抽出来表格的行列配对会断，公式会塌**
- **看图**——「图 3 那条曲线什么走势」→ 只能读 `paper.pdf`，**图不在源码里，源码只有 caption**

用 `fetch-paper.sh` 抓的论文，源码已经清洗过了：旧稿被移进 `source/.stale/`（没删），
`%` 注释已剥掉、原文件存为 `.orig`。**手动下的论文记得自己清一遍**，
否则会读到作者三个月前的旧数据。

自定义宏超过 80 个的话，读正文前先读 `commands.tex` / `macros.tex` / `def.tex` 这类文件，
不然满篇 `\ourmethod` `\tabref` 不知道展开成什么。

---

## 硬规矩

1. **不要自己发明术语。**解释你在做什么的时候用论文里已有的词
   （{{列出这个领域的标准术语}}），别造新词。
2. **改实验之前先说你要改什么、为什么。**不要直接动手跑。
3. **每版实验都要有名字。**命名规则见 `experiment/results.md`，不许出现 `test2` `final_v2_new`。
4. **跑完必须走标准化测评。**见 `experiment/evaluation.md`，不要临时挑指标。
5. **窗口快满了跟我说，我让你更新 handoff。**不要硬撑到被截断。

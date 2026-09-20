# 形态计算相关论文 PDF 索引

整理日期：2026-09-19。

范围：前述形态计算、感知、记忆与控制调研中的 Science Robotics 和 Nature Machine Intelligence 论文。以最近两年的4篇条目为核心，另列2篇早期代表作。不声称覆盖两种期刊的全部相关研究。

**实际下载：3篇；待获取：3篇。** 待获取条目没有生成占位PDF，也没有用摘要、网页或学位论文冒充期刊原文。

## 目录

```text
relatedwork/pdf/
├── README.md
├── manifest.json
├── Nature_Machine_Intelligence/  # 3篇已下载PDF
└── Science_Robotics/            # 待获取清单，当前无PDF
```

## 已下载

| 编号 | 论文 | 年份 | 版本 | 页数 | 主题 |
|---|---|---|---|---|---|
| NMI-01 | [Synergy-based robotic quadruped leveraging passivity for natural intelligence and behavioural diversity](Nature_Machine_Intelligence/2025_Stella_PAWS.pdf) | 2025 | 出版社正式版 | 20 | 构型、运动协同、控制 |
| NMI-02 | [Type II mechanoreceptors and cuneate spiking neuronal network enable touch localization on a large-area e-skin](Nature_Machine_Intelligence/2025_daCosta_Type_II_Mechanoreceptors.pdf) | 2025 | 出版社正式版 | 23 | 感知：形变编码与脉冲网络 |
| NMI-03 | [Designing metamaterials with programmable nonlinear responses and geometric constraints in graph space](Nature_Machine_Intelligence/2025_Maurizi_GraphMetaMat_arXiv_preprint.pdf) | 2025 | 作者预印本（2024）；对应期刊论文发表于2025 | 19 | 构型逆向设计；间接相关 |

## 版本和来源

- **NMI-01**：[正式发表记录](https://doi.org/10.1038/s42256-025-00988-x)；[下载来源](https://www.nature.com/articles/s42256-025-00988-x.pdf)。
- **NMI-02**：[正式发表记录](https://doi.org/10.1038/s42256-025-01076-w)；[下载来源](https://www.nature.com/articles/s42256-025-01076-w.pdf)。
- **NMI-03**：[正式发表记录](https://doi.org/10.1038/s42256-025-01067-x)；[下载来源](https://arxiv.org/pdf/2408.06300)。

GraphMetaMat保存的是 arXiv 预印本，PDF标题为 *Inverse designing metamaterials with programmable nonlinear functional responses in graph space*，与期刊标题略有差异；文件名中的2025是期刊发表年份，并非预印本首发年份。阅读和引用时应区分版本。出版社PDF入口本次返回HTML网页，已移除该无效下载。

所有已下载文件均验证了PDF文件头、可解析页数和首页标题，并渲染检查首页。原始PDF未经重排或修改；manifest.json记录下载来源、文件大小及SHA-256，方便后续核查。

## Science Robotics：待获取

### SR-01 · Forces for free: Vision-based contact force estimation with a compliant hand（2025）

- [正式发表记录](https://doi.org/10.1126/scirobotics.adq5046)
- [作者主页或公开文件入口](https://www.eng.yale.edu/grablab/pubs.html)
- 状态：出版社PDF返回403；作者及实验室主页仅链接出版社；开放获取索引未提供公开PDF。

### SR-02 · Mechanical neural networks: Architected materials that learn behaviors（2022）

- [正式发表记录](https://doi.org/10.1126/scirobotics.abq7278)
- [作者主页或公开文件入口](https://flexible.seas.ucla.edu/publications)
- 状态：出版社PDF返回403；作者主页仅链接出版社，ResearchGate显示无全文。UCLA学位论文包含相关章节，但未作为期刊原文替代下载。

### SR-03 · Electronics-free pneumatic circuits for controlling soft-legged robots（2021）

- [正式发表记录](https://doi.org/10.1126/scirobotics.aay2627)
- [作者主页或公开文件入口](https://drive.google.com/file/d/1v2zHAMTT_CxxoZE6EzQ53kfl3O1kPUcG/view)
- 状态：已找到作者公开PDF；Google Drive下载超时，ResearchGate下载返回403。

SR-02、SR-03是早期补充文献，不计入“最近两年”的论文数量。

建议阅读次序：PAWS → 电子皮肤触觉定位 → GraphMetaMat；SR-01关注柔顺形变如何转化为力觉，SR-02关注机械网络学习，SR-03关注物理记忆与控制程序。

## 全文阅读笔记

[三篇PDF的详细总结：构型、算法、实验与证据边界](../morphological-computation-three-pdfs-reading-notes.md)

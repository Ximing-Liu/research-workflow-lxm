# QUAR-VLA: Vision-Language-Action Model for Quadruped Robots

- 年份 / venue：ECCV 2024
- 任务：感知、导航和四足多任务控制
- 输入与输出：视觉 + 语言到 12 维机器人动作 token
- 数据：QUARD，论文报告约 246K 仿真 episode 与 3K 真机 episode
- 论文：[arXiv](https://arxiv.org/abs/2312.14457) / [ECCV PDF](https://www.ecva.net/papers/eccv_2024/papers_ECCV/papers/00808.pdf)

## 一句话贡献

提出面向四足机器人的 VLA 任务定义、QUARD 数据集和 QUART 模型，把视觉、语言和可执行动作放进统一建模框架。

## 方法拆解

- 使用大规模视觉语言模型作为基础。
- 对视觉、指令和动作进行 token 化。
- 以仿真数据为主、少量真机数据为辅进行联合训练。
- 通过动作抽象避免只输出 2D 导航速度，也避免直接承担极高频电机控制。

## 与本方向的关系

这是四足 VLA 的直接起点，适合用来定义任务、数据格式、动作空间和 benchmark。

## 局限

- 数据和评估协议与通用机械臂 VLA 不同，无法直接比较 success rate。
- 大模型和数据管线复现成本较高。
- 必须详细检查真机控制频率、延迟和安全层。

## 复现建议

不要先复现完整大模型。先用较小视觉编码器和 Transformer，在简化仿真任务上验证动作 token 与序列窗口。


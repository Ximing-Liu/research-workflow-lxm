# QUART-Online: Latency-Free Large Multimodal Language Model for Quadruped Robot Learning

- 年份 / venue：ICRA 2025
- 任务：实时四足视觉语言动作预测
- 核心接口：RVQ 压缩的动作序列 token
- 论文：[arXiv](https://arxiv.org/abs/2412.15557)
- 代码：[GitHub](https://github.com/yuan48/Quart-Online)

## 一句话贡献

针对大模型推理慢于机器人控制的问题，用残差向量量化表示动作片段，并让推理与动作执行并行。

## 方法拆解

- 原始轨迹从较高频率下采样到模型可处理的频率。
- RVQ 将连续动作片段压缩为紧凑 token。
- 模型预测未来多步动作，机器人执行时下一轮推理可并行进行。

## 与本方向的关系

它指出了四足 VLA 的核心工程矛盾：VLM 很慢，四足稳定控制很快。动作 chunking 与异步执行可能比扩大模型更重要。

## 局限

- 官方仓库说明实验重点在仿真，真机稳定性仍需单独验证。
- 动作 chunk 太长会降低对突发障碍的响应速度。
- 依赖较高显存，完整复现不适合作为第一项目。

## 复现建议

用小模型比较单步、固定长度 chunk 与 VQ/RVQ 三种动作表示，并注入人工延迟做稳定性测试。


# 重点论文矩阵

优先级解释：`P0` 必读并建议复现，`P1` 必读，`P2` 用于扩展视野。

| 优先级 | 工作 | 方向 | 关键输出/接口 | 真机 | 开源情况 | 新手价值 |
|---|---|---|---|---|---|---|
| P0 | [Learning to Walk in Minutes](https://proceedings.mlr.press/v164/rudin22a.html) | 四足 RL | 低层 locomotion action | ANYmal | [代码](https://github.com/leggedrobotics/legged_gym) | 建立 PPO、并行仿真和 sim-to-real 基线 |
| P0 | [SayTap](https://arxiv.org/abs/2306.07580) | 语言控制 | 速度 + 足接触模式 | 有 | [项目页](https://saytap.github.io/) | 最容易理解的语言与低层控制分层案例 |
| P0 | [WMP](https://arxiv.org/abs/2409.16784) | 世界模型 + locomotion | RSSM 隐状态供策略使用 | Unitree A1 | [代码](https://github.com/bytedance/WMP) | 直接连接四足、视觉与世界模型 |
| P0 | [QUAR-VLA](https://arxiv.org/abs/2312.14457) | 四足 VLA | 12 维动作 token | 有 | 论文/数据路线 | 建立四足 VLA 的任务和动作空间认知 |
| P1 | [Learning Robust Perceptive Locomotion in the Wild](https://www.science.org/doi/10.1126/scirobotics.abk2822) | 视觉 locomotion | 视觉与本体感觉到低层动作 | ANYmal | 论文/项目材料 | 理解 teacher、视觉感知和野外部署 |
| P1 | [QUART-Online](https://arxiv.org/abs/2412.15557) | 实时四足 VLA | RVQ 动作片段 | 以仿真为主 | [代码/权重/数据](https://github.com/yuan48/Quart-Online) | 理解 VLA 推理延迟和动作压缩 |
| P1 | [NaVILA](https://navila-bot.github.io/) | 腿式 VLA 导航 | 高层导航动作 + 低层视觉策略 | Go2/人形 | 项目页/benchmark | 理解 VLA 与 locomotion policy 的分工 |
| P1 | [TD-MPC2](https://www.tdmpc2.com/) | latent world model | 在线规划的连续动作 | 多控制域 | [代码/模型](https://github.com/nicklashansen/tdmpc2) | 学习 decoder-free 世界模型规划 |
| P1 | [DreamerV3](https://www.nature.com/articles/s41586-025-08744-2) | 世界模型 RL | imagined rollout 中学习策略 | 多域 | [代码](https://github.com/danijar/dreamerv3) | 理解 RSSM、重建与 imagination |
| P1 | [V-JEPA 2](https://ai.meta.com/research/vjepa/) | 表征预测世界模型 | latent action-conditioned planning | 机械臂 | [代码/模型](https://github.com/facebookresearch/vjepa2) | 理解不生成像素的世界模型路线 |
| P1 | [OpenVLA](https://openvla.github.io/) | 通用 VLA | 离散动作 token | 多机械臂 | [代码/模型](https://github.com/openvla/openvla) | 开源 VLA 基线与微调入口 |
| P1 | [Octo](https://octo-models.github.io/) | 通用机器人策略 | diffusion continuous actions | 多机械臂 | 代码/权重/Colab | 学习跨 embodiment 微调设计 |
| P2 | [RT-2](https://robotics-transformer2.github.io/) | VLA 奠基工作 | 文本化机器人动作 | 有 | 模型不完全开放 | 理解 VLM 知识迁移到控制 |
| P2 | [π0](https://www.physicalintelligence.company/download/pi0.pdf) | 机器人基础模型 | flow-matching 动作块 | 多机器人 | 权重与代码视版本而定 | 理解连续动作生成的新路线 |
| P2 | [CognitiveDog](https://arxiv.org/abs/2401.09388) | 四足多模态系统 | 高层决策与技能调用 | Unitree Go1 | 数据集 | 系统集成案例，需区分模块拼接与端到端学习 |
| P2 | [UrbanVLA](https://pku-epic.github.io/UrbanVLA-Web/) | 城市移动 VLA | 导航与移动动作 | 四足平台 | 项目页 | 关注长程真实城市部署与社会导航 |

## 关键比较结论

### 动作抽象决定系统难度

- SayTap 输出足接触模式，语言模型不承担高频稳定控制。
- QUAR-VLA/QUART-Online 更接近直接动作建模，因此必须解决动作 token、时序和延迟。
- NaVILA 采用高层导航与低层视觉运动策略的分层路线，部署更容易诊断。

### 数据是四足 VLA 的核心瓶颈

- 通用 VLA 的大规模数据主要来自机械臂，动作空间与四足机器人不同。
- QUAR-VLA 报告以大规模仿真数据加少量真机数据联合训练。
- 人类视频提供语义和场景知识，却没有可直接执行的四足动作标签。

### 世界模型有三种实际用途

1. **状态表示**：WMP 用预测任务学习包含地形信息的 recurrent state。
2. **想象训练**：Dreamer 在模型 rollout 中训练策略与价值函数。
3. **在线规划**：TD-MPC2 和 V-JEPA 2-AC 比较候选动作的 latent 后果。

## 阅读时不要直接比较的指标

- 不同论文的 success rate 可能来自完全不同的任务和试验次数。
- 仿真成功率不能与真机成功率直接比较。
- 单步语义正确率无法代表长程导航成功率。
- 平均控制延迟不能代替最坏延迟，后者对四足稳定性更关键。


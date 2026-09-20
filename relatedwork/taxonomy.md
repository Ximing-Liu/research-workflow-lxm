# 研究地图

## 1. 系统分层

```text
语言目标 / 图像目标
        ↓
高层 VLA 或 VLM 规划器（0.2–5 Hz）
        ↓
航点 / 速度 / 步态 / 技能 token / 短动作片段
        ↓
低层 locomotion policy 或 MPC（50–500 Hz）
        ↓
关节位置、速度或力矩
        ↓
四足机器人与环境
```

世界模型可以处于多个位置：

- 在低层预测本体状态、地形和接触，帮助运动控制。
- 在中层预测技能或动作片段的后果。
- 在高层预测视觉状态或语义状态，用于长程规划。

## 2. 四条相关工作主线

### A. 学习式四足运动控制

核心问题是稳定行走、复杂地形、自恢复与 sim-to-real。典型做法是在 GPU 并行仿真中用 PPO 训练策略，并用 domain randomization 覆盖真机差异。

代表工作：

- [Learning to Walk in Minutes](https://proceedings.mlr.press/v164/rudin22a.html)
- [legged_gym](https://github.com/leggedrobotics/legged_gym)
- [Learning Robust Perceptive Locomotion in the Wild](https://www.science.org/doi/10.1126/scirobotics.abk2822)

### B. 语言到四足技能

核心问题是语言输出什么。直接输出电机命令既不安全也不满足实时性，因此通常选择落足模式、速度、技能或短时动作序列作为接口。

代表工作：

- [SayTap](https://arxiv.org/abs/2306.07580)：语言映射到速度与足接触模式。
- [QUAR-VLA](https://arxiv.org/abs/2312.14457)：视觉和语言映射到四足动作 token。
- [QUART-Online](https://github.com/yuan48/Quart-Online)：用 RVQ 压缩动作序列，针对推理延迟设计。

### C. VLA 导航与具身任务

核心问题是怎样把互联网视觉语言知识、机器人轨迹与低层控制连接起来。

代表工作：

- [RT-2](https://robotics-transformer2.github.io/)：把机器人动作表示成 token，并共同训练 VLM 与机器人数据。
- [OpenVLA](https://openvla.github.io/)：7B 开源 VLA，基于约 97 万条机器人 episode 预训练。
- [Octo](https://octo-models.github.io/)：开源通用策略，使用 diffusion action head，强调新机器人快速微调。
- [π0](https://www.physicalintelligence.company/blog/pi0)：用 flow matching 生成连续动作块。
- [NaVILA](https://navila-bot.github.io/)：VLA 导航与视觉腿式运动策略结合。

### D. 世界模型与预测控制

世界模型学习状态转移 `z_(t+1) = f(z_t, a_t)`，用途包括隐状态估计、imagined rollout、奖励预测和规划。

代表工作：

- [DreamerV3](https://www.nature.com/articles/s41586-025-08744-2)：在学习到的世界模型中训练行为。
- [TD-MPC2](https://www.tdmpc2.com/)：在无解码器 latent world model 中做局部轨迹优化。
- [WMP](https://arxiv.org/abs/2409.16784)：世界模型服务于视觉四足 locomotion。
- [V-JEPA 2](https://ai.meta.com/research/vjepa/)：在表征空间预测视频未来，并通过动作条件后训练用于机器人规划。

## 3. 容易混淆的概念

### VLM、VLA 与分层机器人系统

- **VLM** 输出文本或语义表示，本身不一定能控制机器人。
- **VLA** 训练目标中包含机器人动作，可直接输出动作 token 或连续动作。
- **分层系统** 可以让 VLM/VLA 只负责高层命令，低层控制器保证稳定性。

### 生成式世界模型与 latent world model

- 像素生成模型便于人类观察，但可能花费容量还原无关细节。
- latent world model 预测压缩表征，通常更适合控制和规划。
- 是否“能生成视频”不能单独证明模型理解物理或能控制机器人。

### Model-free 与 Model-based RL

- Model-free policy 直接从状态映射到动作，训练和部署流程通常更简单。
- Model-based 方法显式学习动力学或世界模型，可在模型中规划，但会受到模型误差影响。
- 现实系统常混合两者，例如高层世界模型规划加低层 model-free locomotion policy。

## 4. 四足 VLA 的关键设计轴

| 设计问题 | 常见选择 | 主要权衡 |
|---|---|---|
| 动作输出 | 力矩、关节目标、速度、航点、技能 token | 越低层越灵活，但频率和安全要求越高 |
| 视觉输入 | RGB、深度、LiDAR、局部高度图 | RGB 语义强，深度/激光几何更稳定 |
| 时间建模 | 单帧、历史窗口、RNN、Transformer、RSSM | 历史更长可估计动态，但计算与训练更难 |
| 数据来源 | 仿真、遥操作、真机 autonomous rollout、人类视频 | 数据规模、动作标签和域差异之间权衡 |
| 训练方式 | 行为克隆、RL、离线 RL、世界模型规划 | 稳定性、探索成本与泛化不同 |
| 部署结构 | 端到端、分层、带安全过滤器 | 端到端简洁，分层更可诊断和安全 |


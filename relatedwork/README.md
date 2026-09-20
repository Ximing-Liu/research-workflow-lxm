# 四足机器人 × VLA × World Model 入门调研

> 更新日期：2026-09-18  
> 面向对象：刚进入机器人学习、希望最终研究四足机器人 VLA 与世界模型的初学者。

## 先看结论

四足机器人智能通常不是一个模型直接输出电机力矩，而是分成不同时间尺度：

1. **低层运动控制**：以 50–500 Hz 执行关节或足端控制，重点是稳定、抗扰动和 sim-to-real。
2. **中层技能接口**：把速度、步态、落足模式、航点或短时动作片段交给低层控制器。
3. **高层 VLA**：根据视觉和语言选择技能、航点或动作 token，重点是语义理解与任务泛化。
4. **世界模型**：预测动作会怎样改变机器人和环境，用于状态估计、想象 rollout 或规划。

对新手最稳妥的路线是：

`Isaac Lab 四足 PPO → 加入深度视觉 → SayTap 式语言到技能 → QUAR-VLA/NaVILA → WMP/TD-MPC2/V-JEPA 2`

## 文件导航

| 文件 | 用途 |
|---|---|
| [WORKFLOW.md](WORKFLOW.md) | 本仓库采用的论文调研与更新流程 |
| [taxonomy.md](taxonomy.md) | 领域地图、任务分层和关键区别 |
| [paper-matrix.md](paper-matrix.md) | 重点论文横向对比与阅读优先级 |
| [learning-roadmap.md](learning-roadmap.md) | 24 周入门学习与实践路线 |
| [experiments.md](experiments.md) | 从仿真到 VLA/世界模型的递进实验 |
| [glossary.md](glossary.md) | 初学者术语表 |
| [paper-notes/](paper-notes/) | 重点工作的结构化论文卡片 |
| [learning-to-walk-in-minutes/](learning-to-walk-in-minutes/) | Learning to Walk 论文 PDF 与官方 `legged_gym` 代码 |

## 建议阅读顺序

### 第一阶段：先让四足机器人可靠地走起来

1. `Learning to Walk in Minutes`：理解 Isaac Gym/Isaac Lab、PPO、并行仿真和 curriculum。
2. `Learning Robust Perceptive Locomotion in the Wild`：理解视觉、特权信息与 sim-to-real。
3. `World Model-based Perception`：理解世界模型怎样服务于视觉运动控制。

### 第二阶段：理解语言怎样接入四足机器人

4. `SayTap`：最清楚的分层接口案例，LLM 输出落足模式而不是电机力矩。
5. `QUAR-VLA`：四足机器人专用 VLA、数据集和动作 token 化。
6. `QUART-Online`：理解大模型推理延迟与动作压缩问题。
7. `NaVILA`：理解 VLA 导航与低层 locomotion policy 的分工。

### 第三阶段：补齐通用 VLA 与世界模型

8. `RT-2 / OpenVLA / Octo / π0`：理解通用机器人策略的数据和动作建模方式。
9. `DreamerV3 / TD-MPC2`：理解基于模型的强化学习与 latent planning。
10. `V-JEPA 2`：理解表征空间预测、动作条件世界模型和规划。

## 当前建议的研究切入点

对个人或小团队，以下问题比“从零训练一个通用四足 VLA”更可行：

- 用低频 VLA 输出**航点、步态或技能 token**，由成熟低层策略负责稳定控制。
- 用世界模型预测**短时可通行性、深度或隐状态**，提高视觉 locomotion 的鲁棒性。
- 研究动作 token 的时间尺度，让 VLA 在较低频率运行而不损失实时性。
- 用人类视频、仿真轨迹和少量真机数据研究跨域迁移。
- 建立同时评估语义成功、运动稳定、延迟和安全性的四足 VLA benchmark。

## 重要提醒

- NVIDIA 已把 Isaac Gym 定位为 legacy，新的实验应优先考虑 [Isaac Lab](https://developer.nvidia.com/isaac/lab)。
- OpenVLA、Octo 和 π0 的主战场是机械臂操作，迁移到四足机器人时必须重新设计动作空间和控制频率。
- 语言模型适合高层推理，不适合直接闭环输出高频电机力矩。
- 仿真成功不等于真机成功。需要关注延迟、传感器噪声、动力学差异、跌倒恢复和安全约束。

## 一手资料入口

- [Isaac Lab](https://developer.nvidia.com/isaac/lab)
- [legged_gym](https://github.com/leggedrobotics/legged_gym)
- [SayTap](https://saytap.github.io/)
- [QUAR-VLA](https://arxiv.org/abs/2312.14457)
- [QUART-Online](https://github.com/yuan48/Quart-Online)
- [NaVILA](https://navila-bot.github.io/)
- [WMP](https://wmp-loco.github.io/)
- [TD-MPC2](https://www.tdmpc2.com/)
- [V-JEPA 2](https://ai.meta.com/research/vjepa/)
- [OpenVLA](https://openvla.github.io/)
- [Octo](https://octo-models.github.io/)


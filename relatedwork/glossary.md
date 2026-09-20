# 初学者术语表

| 术语 | 简明解释 |
|---|---|
| VLM | Vision-Language Model，理解图像与文字，通常输出文本或语义表示 |
| VLA | Vision-Language-Action Model，训练目标包含可执行的机器人动作 |
| World Model | 学习环境如何随状态和动作变化的模型 |
| Latent State | 模型内部的压缩状态，不等同于可见像素 |
| Model-free RL | 不显式学习动力学模型，策略直接输出动作 |
| Model-based RL | 学习或使用动力学模型，通过预测后果来学习或规划 |
| RSSM | Recurrent State-Space Model，Dreamer 等方法常用的随机循环状态模型 |
| MPC | Model Predictive Control，滚动预测有限时域并执行第一步动作 |
| PPO | 常用的 on-policy 强化学习算法，四足 locomotion 的经典基线 |
| Behavior Cloning | 用监督学习模仿专家轨迹 |
| Domain Randomization | 在仿真中随机化动力学、外观和噪声，提高真机迁移能力 |
| Sim-to-real | 从仿真训练迁移到真实机器人 |
| Privileged Information | 训练时可见、部署时不可见的地形或动力学信息 |
| Teacher-Student | teacher 使用特权信息，student 用部署时传感器模仿 teacher |
| Proprioception | 机器人自身状态，如关节、IMU、足端接触 |
| Exteroception | 外部环境感知，如 RGB、深度、LiDAR 和高度图 |
| Action Chunking | 一次预测一段连续动作，减少长时任务中的误差与推理频率 |
| Action Tokenization | 把连续动作编码成离散 token，便于 Transformer/LLM 建模 |
| RVQ | Residual Vector Quantization，用多级码本压缩连续向量 |
| Flow Matching | 学习从噪声分布到动作分布的连续流，π0 等模型用于动作生成 |
| Diffusion Policy | 用扩散模型生成多峰连续动作分布 |
| JEPA | Joint Embedding Predictive Architecture，在表征空间预测目标而非还原全部像素 |
| Zero-shot | 没有针对目标任务或环境继续训练就直接评估 |
| Fine-tuning | 在预训练模型上使用目标机器人或任务数据继续训练 |
| LoRA | 参数高效微调方法，只训练低秩适配参数 |


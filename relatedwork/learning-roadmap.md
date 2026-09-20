# 24 周学习路线

默认每周投入 8–12 小时，先在仿真完成闭环，再考虑真机。

## 第 1–4 周：基础与工具链

### 学习内容

- Python、NumPy、PyTorch 基础。
- 机器人状态：关节位置/速度、IMU、机身姿态、足端接触。
- 控制基础：PD 控制、坐标系、刚体动力学、控制频率。
- RL 基础：MDP、PPO、reward、observation、action、domain randomization。

### 实践目标

- 安装 Isaac Sim/Isaac Lab，运行官方 locomotion 环境。
- 读懂一个四足环境的 observation、action、reward 和 termination。
- 完成一次 PPO 训练并可视化策略。

### 通过标准

- 能解释 policy frequency 与 physics timestep 的区别。
- 能说明每个 reward term 的用途及可能副作用。
- 能复现实验并保存配置、曲线和视频。

## 第 5–8 周：四足 locomotion baseline

### 学习内容

- `Learning to Walk in Minutes` 与 `legged_gym`。
- curriculum、privileged information、actuator model。
- sim-to-real 中的摩擦、质量、延迟和传感器噪声。

### 实践目标

- 训练速度跟踪策略。
- 做三组消融：移除 curriculum、减小 domain randomization、增加延迟。
- 报告速度误差、跌倒率和能耗代理指标。

## 第 9–12 周：视觉 locomotion

### 学习内容

- RGB、深度、LiDAR 和高度图的差异。
- teacher-student、历史编码与 recurrent state。
- 阅读 perceptive locomotion 与 WMP。

### 实践目标

- 给仿真机器人加入深度相机。
- 建立盲策略与视觉策略对照。
- 先做短时预测任务，再把 latent state 输入 locomotion policy。

## 第 13–16 周：语言与技能接口

### 学习内容

- SayTap 的足接触模式接口。
- prompt、结构化输出和动作约束。
- 技能库、有限状态机和安全过滤器。

### 实践目标

- 定义 6–10 个离散技能，如前进、后退、左转、右转、趴下、站起和不同步态。
- 用语言模型把指令转换为严格 JSON 技能序列。
- 在仿真执行前进行合法性检查，禁止语言模型直接输出电机指令。

## 第 17–20 周：四足 VLA

### 学习内容

- RT-2、OpenVLA、Octo 的 tokenization 与 action head。
- QUAR-VLA、QUART-Online 和 NaVILA。
- 模仿学习中的数据平衡、时序窗口和动作 chunking。

### 实践目标

- 先做低频视觉语言到航点或技能 token。
- 用脚本生成带语言标注的仿真轨迹。
- 训练小模型基线，不要一开始微调 7B 模型。

### 评估

- 已见指令与未见同义表达。
- 已见场景与新纹理/新布局。
- 指令成功率、碰撞率、跌倒率和端到端延迟。

## 第 21–24 周：世界模型与研究课题

### 学习内容

- DreamerV3 的 RSSM 与 imagined rollout。
- TD-MPC2 的 latent planning。
- WMP 的视觉预测状态。
- V-JEPA 2 的表征空间预测。

### 实践目标

- 比较像素重建与 latent prediction。
- 对候选技能做短时 rollout，选择碰撞风险更低的动作。
- 设计一个可发表的小问题，例如延迟感知的动作 chunk、跨地形 latent 对齐或 uncertainty-aware planning。

## 计算资源策略

- 单卡阶段优先跑 Isaac Lab locomotion、小视觉编码器和小规模行为克隆。
- 不把“从零训练 7B VLA”设为入门目标。
- 优先使用冻结视觉编码器、小 action head 或 LoRA。
- 真机实验前必须在仿真加入动作限幅、紧急停止、姿态保护与失败恢复。

## 推荐课程与知识顺序

1. 线性代数、概率、优化与 PyTorch。
2. 机器人学基础和反馈控制。
3. 强化学习与 PPO。
4. 视觉表示学习与 Transformer。
5. 模仿学习、Diffusion Policy 与 VLA。
6. 模型式强化学习与世界模型。


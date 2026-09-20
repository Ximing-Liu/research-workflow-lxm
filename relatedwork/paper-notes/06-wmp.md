# World Model-based Perception for Visual Legged Locomotion

- 年份：2024
- 任务：复杂地形视觉四足运动
- 平台：Unitree A1
- 论文：[arXiv](https://arxiv.org/abs/2409.16784)
- 代码：[GitHub](https://github.com/bytedance/WMP)

## 一句话贡献

通过预测视觉与本体状态学习环境世界模型，再让 locomotion policy 使用世界模型的 recurrent state，绕开传统 teacher-student 的信息差。

## 方法拆解

- 世界模型接收深度、本体状态与动作历史。
- recurrent latent state 表示地形与机器人动态。
- 策略基于 latent state 决策。
- 世界模型在仿真训练，但论文验证其能够预测真实轨迹。

## 关键实验

- 与 teacher/student 等基线比较复杂地形通过性能。
- 深度或本体预测消融。
- 分析模型更新间隔、训练序列长度和真实世界长时预测。

## 与本方向的关系

这是四足 world model 最直接的复现入口，比从通用视频世界模型开始更贴近 locomotion。

## 局限

- 世界模型主要帮助感知与状态表示，不等同于完整的语言条件规划系统。
- 模型预测误差可能在长 horizon 累积。
- 对新外观、新传感器和动态障碍的泛化需要进一步验证。

## 复现建议

先复现盲策略和视觉 student，再加入 RSSM。检查 latent state 是否真正编码地形，而不是只记忆速度与姿态。


# Learning to Walk in Minutes Using Massively Parallel Deep Reinforcement Learning

- 年份 / venue：CoRL 2021，PMLR 2022
- 任务：四足复杂地形 locomotion
- 机器人：ANYmal
- 输入与输出：本体/地形相关观测到低层动作
- 代码：[legged_gym](https://github.com/leggedrobotics/legged_gym)
- 论文：[PMLR](https://proceedings.mlr.press/v164/rudin22a.html)

## 一句话贡献

利用单 GPU 上的大规模并行仿真与 curriculum，把四足 locomotion policy 的训练从数天缩短到数分钟，并完成 sim-to-real。

## 方法拆解

- 同时运行数千个仿真机器人，提高 on-policy PPO 的数据吞吐。
- 使用游戏式 curriculum，让地形难度随表现提升。
- 通过 actuator model、噪声、随机推力以及物理参数随机化支持真机迁移。

## 与本方向的关系

它是 VLA 和世界模型之下必须先建立的低层控制底座。若 baseline 不能稳定行走，高层模型的语义能力没有意义。

## 局限

- 主要解决 locomotion，不处理语言与高层任务。
- 原始 Isaac Gym 已进入 legacy 阶段，新项目应迁移到 Isaac Lab。

## 复现建议

先复现速度跟踪，再加入粗糙地形。不要一开始修改 observation、reward 和网络结构三项以上。

## 阅读时要回答的问题

- 为什么并行环境数增大后 PPO 的 batch 与 update 需要调整？
- curriculum 怎样避免策略一直停留在简单地形？
- 哪些随机化直接影响 sim-to-real？


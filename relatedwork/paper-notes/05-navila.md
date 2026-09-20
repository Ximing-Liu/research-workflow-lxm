# NaVILA: Legged Robot Vision-Language-Action Model for Navigation

- 年份 / venue：RSS 2025
- 任务：腿式机器人视觉语言导航
- 平台：Unitree Go2、Booster T1、Unitree G1 等
- 项目：[NaVILA](https://navila-bot.github.io/)

## 一句话贡献

把 VLM 训练为高层 VLA 导航模型，并配套端到端视觉 locomotion policy 与物理真实的 VLN-CE-Isaac benchmark。

## 方法拆解

- 高层模型处理语言目标、视觉场景与导航决策。
- 低层视觉策略负责粗糙地形和局部避障。
- 训练数据混合人类视频、仿真导航和视觉问答。
- benchmark 将视觉语言导航与真实腿式低层控制连接起来。

## 与本方向的关系

NaVILA 展示了更实际的分层 VLA：高层模型无需直接输出每个关节动作，可以专注语义导航。

## 局限

- 系统组件较多，端到端失败原因不容易定位。
- 人类视频与机器人动作之间仍存在 embodiment gap。
- 项目复现需要导航数据、物理仿真和低层控制三套工具链。

## 复现建议

先固定低层策略，只训练高层离散导航动作或局部航点。评估时把 VLA 错误和 locomotion 错误分开统计。


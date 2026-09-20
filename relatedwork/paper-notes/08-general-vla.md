# RT-2、OpenVLA、Octo 与 π0

## RT-2

- 项目：[RT-2](https://robotics-transformer2.github.io/)

RT-2 把机器人动作编码成文本 token，与互联网视觉语言数据共同训练，展示 VLM 语义知识可以迁移到机器人控制。

## OpenVLA

- 项目：[OpenVLA](https://openvla.github.io/)
- 代码：[GitHub](https://github.com/openvla/openvla)

OpenVLA 是 7B 开源 VLA，使用 Open X-Embodiment 中约 97 万条机器人 episode。它适合学习 VLA 微调、动作 token 和开源模型工具链。

## Octo

- 项目：[Octo](https://octo-models.github.io/)

Octo 是较小的开源通用策略，使用 transformer backbone 和 diffusion action head，支持语言或目标图像，并强调适配新观察与动作空间。

## π0

- 论文：[π0 PDF](https://www.physicalintelligence.company/download/pi0.pdf)

π0 用 flow matching 生成连续动作块，代表从离散 action token 转向连续高频动作生成的路线。

## 对四足研究的启示

- 这些模型主要基于机械臂数据，不能直接期待 zero-shot 控制四足机器人。
- 可迁移的部分包括视觉语言编码器、动作 chunking、参数高效微调和数据混合方法。
- 四足机器人应优先把输出定义为航点、速度、步态或技能，而非原样照搬机械臂末端位姿动作。


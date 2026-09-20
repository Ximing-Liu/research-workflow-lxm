# Learning to Walk in Minutes

论文：*Learning to Walk in Minutes Using Massively Parallel Deep Reinforcement Learning*。

## 收录内容

```text
learning-to-walk-in-minutes/
├── README.md
├── paper/
│   └── rudin22a.pdf              # PMLR 官方论文 PDF
└── code/
    └── legged_gym/              # 官方 GitHub 仓库，浅克隆
```

| 类型 | 来源 |
|---|---|
| 论文 | [PMLR 正式页面](https://proceedings.mlr.press/v164/rudin22a.html) |
| 论文 PDF | [PMLR PDF](https://proceedings.mlr.press/v164/rudin22a/rudin22a.pdf) |
| 配套代码 | [legged_gym](https://github.com/leggedrobotics/legged_gym) |
| 现有结构化笔记 | [paper-notes/01-learning-to-walk-in-minutes.md](../paper-notes/01-learning-to-walk-in-minutes.md) |
| 核心代码索引 | [CORE_CODE.md](CORE_CODE.md) |

## 论文要点

- 通过单 GPU 上的大规模并行仿真提高 PPO 数据吞吐。
- 使用 curriculum 逐步增加地形难度，训练四足 locomotion policy。
- 结合 actuator model、观测噪声、随机推力和物理参数随机化完成 sim-to-real。
- 实验平台为 ANYmal；论文为 CoRL 2021 工作，收录于 PMLR volume 164（2022）。

## 代码说明

`code/legged_gym/` 是官方仓库的浅克隆，包含论文实验所依赖的环境、任务配置和训练入口。仓库 README 中的安装说明优先于本文件；运行前需要按照仓库要求准备 NVIDIA GPU、CUDA、PyTorch 和 Isaac Gym。

该仓库依赖的 Isaac Gym 已进入 legacy 阶段。用于复现论文时保留原始 Isaac Gym 环境；新实验应评估迁移到 Isaac Lab 的成本，不能把两套 API 当作完全兼容。

## 建议复现顺序

1. 先按官方说明跑通速度跟踪任务。
2. 再检查并行环境数、PPO batch/update 设置和 curriculum 配置。
3. 最后加入粗糙地形与随机化，并单独记录 sim-to-real 相关改动。

已有阅读笔记：[01-learning-to-walk-in-minutes.md](../paper-notes/01-learning-to-walk-in-minutes.md)。
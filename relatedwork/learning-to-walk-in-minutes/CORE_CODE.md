# 核心代码索引

这篇论文的实现不是一个单独的算法文件，而是一条由训练入口、任务注册、四足环境、配置和外部 PPO runner 组成的调用链。

## 主调用链

```text
scripts/train.py
  -> utils/task_registry.py
  -> envs/__init__.py
  -> envs/anymal_c/anymal.py
  -> envs/base/legged_robot.py
  -> rsl_rl.runners.OnPolicyRunner
```

## 最核心的文件

| 优先级 | 文件 | 作用 |
|---|---|---|
| 1 | [`envs/base/legged_robot.py`](code/legged_gym/legged_gym/envs/base/legged_robot.py) | 核心环境：控制步进、物理仿真、观测、奖励、终止、扰动和 terrain curriculum |
| 2 | [`envs/base/legged_robot_config.py`](code/legged_gym/legged_gym/envs/base/legged_robot_config.py) | 通用观测、命令、奖励、随机化和 PPO 超参数 |
| 3 | [`envs/anymal_c/mixed_terrains/anymal_c_rough_config.py`](code/legged_gym/legged_gym/envs/anymal_c/mixed_terrains/anymal_c_rough_config.py) | 论文对应的 ANYmal 粗糙地形配置：4096 环境、12 动作、PD 和 actuator network |
| 4 | [`envs/anymal_c/anymal.py`](code/legged_gym/legged_gym/envs/anymal_c/anymal.py) | ANYmal 专用环境和执行器相关逻辑 |
| 5 | [`utils/task_registry.py`](code/legged_gym/legged_gym/utils/task_registry.py) | 注册任务、创建 Isaac Gym 环境、创建 `rsl_rl` 的 `OnPolicyRunner` |
| 6 | [`scripts/train.py`](code/legged_gym/legged_gym/scripts/train.py) | 最薄的训练入口，串起环境和 PPO 训练 |

## 论文机制对应代码

### 大规模并行

`AnymalCRoughCfg.env.num_envs = 4096` 定义并行环境数。环境张量在 GPU 上批处理，`LeggedRobot.step()` 接收形状为 `[num_envs, num_actions]` 的动作。

### 控制和执行器模型

ANYmal 配置中的 `action_scale`、`decimation`、PD 参数和 `use_actuator_network` 位于 `anymal_c_rough_config.py`。真正的动作到力矩转换在 `LeggedRobot._compute_torques()` 路径中完成。

### Reward

通用奖励权重位于 `LeggedRobotCfg.rewards.scales`；`LeggedRobot.compute_reward()` 动态调用所有启用的 `_reward_*` 函数并求和。

### Terrain curriculum

`LeggedRobot._update_terrain_curriculum()` 根据机器人在 episode 中前进的距离升级或降低地形等级，这是论文 game-inspired curriculum 的核心实现。

### Domain randomization

`LeggedRobot._post_physics_step_callback()` 和相关随机化函数负责速度命令重采样、摩擦/质量随机化以及周期性推力。

### PPO

PPO 不在这个仓库内实现，而是通过 `utils/task_registry.py` 导入外部包：

```python
from rsl_rl.runners import OnPolicyRunner
```

相关配置在 `LeggedRobotCfgPPO`：策略网络、clip 参数、GAE、mini-batch、学习率和每个环境的 rollout 步数。阅读 PPO 更新细节时需要进入安装的 `rsl_rl` 包。

## 推荐阅读顺序

1. 先看 `scripts/train.py`，理解训练如何启动。
2. 看 `envs/__init__.py`，确认 `anymal_c_rough` 映射到哪个配置和环境类。
3. 看 `anymal_c_rough_config.py`，掌握论文实验的具体参数。
4. 重点阅读 `LeggedRobot.step()`、`compute_reward()` 和 `_update_terrain_curriculum()`。
5. 最后阅读 `LeggedRobotCfgPPO` 和外部 `rsl_rl.OnPolicyRunner`。
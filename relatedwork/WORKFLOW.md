# Related Work Workflow

这个 workflow 用来持续维护调研，不把 `relatedwork` 变成无法更新的链接集合。

## 1. 定义研究问题

每次调研先写清楚四个字段：

- **Embodiment**：Unitree Go1/Go2/A1、ANYmal、带机械臂的四足平台或通用机器人。
- **Task**：locomotion、视觉导航、语言指令执行、全身操作或长程任务。
- **Action abstraction**：电机力矩、关节目标、机身速度、落足模式、航点、技能 token。
- **Learning setting**：模仿学习、强化学习、模型预测控制、VLA 微调或世界模型规划。

若这四项不明确，不应直接比较论文结果。

## 2. 搜索顺序

优先使用一手来源：

1. 论文正式页面、arXiv、OpenReview、会议论文集。
2. 作者项目页和官方代码仓库。
3. 官方数据集、模型权重和 benchmark。
4. 博客与二手解读只用于发现关键词，不作为关键结论的唯一证据。

推荐检索组合：

```text
quadruped + vision language action
legged robot + world model
quadruped + language conditioned locomotion
visual locomotion + model based reinforcement learning
legged navigation + VLA
action tokenization + quadruped
```

## 3. 纳入标准

论文满足至少一项：

- 对四足/腿式机器人提出直接可用的方法、数据集或 benchmark。
- 对 VLA 的数据、动作表示、训练或推理提出基础方法。
- 对世界模型的状态学习、rollout、控制或规划具有直接参考价值。
- 有公开代码、模型、数据或足够清楚的实验细节，可用于学习或复现。

降低优先级的情况：

- 只有生成视频效果，没有与真实控制或决策的连接。
- 只在单一仿真场景报告结果，缺少强基线与消融。
- 标题包含 VLA/World Model，但核心方法只是调用封闭 API 拼接系统。

## 4. 论文卡片模板

每篇重点工作在 `paper-notes/` 建立一张卡片：

```markdown
# 标题

- 年份 / venue：
- 任务：
- 机器人与传感器：
- 输入与输出：
- 代码 / 数据：

## 一句话贡献
## 方法拆解
## 关键实验
## 与本方向的关系
## 局限
## 复现建议
## 阅读时要回答的问题
```

## 5. 横向比较维度

更新 `paper-matrix.md` 时至少记录：

- 任务与机器人平台
- 是否使用语言、RGB、深度、LiDAR、本体感觉
- 输出动作的抽象层级与执行频率
- 数据来源与规模
- 是否有真机实验
- 是否有代码、权重和数据
- 是否需要特权信息或 teacher policy
- 延迟、算力与安全处理

## 6. 证据等级

| 等级 | 证据 |
|---|---|
| A | 同行评审论文 + 真机实验 + 公开代码/数据 |
| B | 同行评审论文 + 真机实验，但复现材料不完整 |
| C | 预印本或项目页，有较充分实验和部分开源材料 |
| D | 概念演示、博客或缺少可验证实验 |

证据等级不是论文质量排名，只表示调研结论的可核验程度。

## 7. 更新流程

1. 在 `paper-matrix.md` 增加候选条目。
2. 核对版本、venue、代码和数据链接。
3. 对高优先级论文建立 paper note。
4. 更新 taxonomy 中的方法关系。
5. 若论文改变了实践建议，同步更新 roadmap 和 experiments。
6. 在提交信息中写明新增论文与判断变化。

## 8. 复现完成定义

复现不以“程序能运行”为结束，需要记录：

- 固定随机种子和软件版本。
- 至少三次独立训练或说明无法完成的原因。
- 报告任务成功率、跌倒率、速度跟踪误差和推理延迟。
- 保存训练曲线、评估视频、模型权重与配置。
- 明确与原论文在硬件、数据和评估协议上的差异。


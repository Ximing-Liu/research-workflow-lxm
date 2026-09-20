# DreamerV3、TD-MPC2 与 V-JEPA 2

## DreamerV3

- 论文：[Nature](https://www.nature.com/articles/s41586-025-08744-2)
- 代码：[GitHub](https://github.com/danijar/dreamerv3)

DreamerV3 学习 RSSM，在 imagined trajectories 中训练 actor 与 critic。它适合理解“学习世界模型后在模型里练习”的路线。

四足方向可借鉴：从视觉和本体历史学习状态，在模型中评估动作序列。但真机中必须控制 model exploitation 和长时误差。

## TD-MPC2

- 项目：[TD-MPC2](https://www.tdmpc2.com/)
- 论文：[arXiv](https://arxiv.org/abs/2310.16828)
- 代码：[GitHub](https://github.com/nicklashansen/tdmpc2)

TD-MPC2 学习无解码器的 latent world model，并用局部轨迹优化选择连续动作。它说明控制所需的世界模型不一定需要重建像素。

四足方向可借鉴：让高层规划器在 latent 空间比较技能或航点，不必替换成熟的低层 policy。

## V-JEPA 2

- 项目：[Meta](https://ai.meta.com/research/vjepa/)
- 论文与代码：[GitHub](https://github.com/facebookresearch/vjepa2)

V-JEPA 2 从互联网视频通过 masked latent prediction 学习运动理解。V-JEPA 2-AC 再用少量机器人轨迹做动作条件后训练，并在 latent 空间规划。

四足方向可借鉴：先利用无动作视频学视觉动力学，再用四足轨迹对齐动作。但现有机器人实验以机械臂为主，迁移到腿式平台仍是开放问题。

## 三者怎么选

| 目标 | 优先方法 |
|---|---|
| 学习 RSSM 与 imagination | DreamerV3 |
| 连续控制与在线 latent planning | TD-MPC2 |
| 视频自监督表征与不生成像素的预测 | V-JEPA 2 |
| 四足视觉 locomotion 的直接实现 | WMP |


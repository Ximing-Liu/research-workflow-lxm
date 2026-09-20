# 具身智能体中的形态计算：初步文献调研

调研日期：2026-09-18。依据：[原综述框架](./morphological-computation-review-framework.md)。

本报告围绕“什么是形态计算—身体如何承担功能—如何设计与验证”组织19篇代表性文献，供综述选题、精读和实验设计使用。本轮采用主题检索与代表性文献追踪，核对作者论文、出版页面、大学机构库和论文摘要；部分全文页面访问受限，未完成所有论文的全文及补充材料精读。因此，这是范围探索式初步调研，不是穷尽性系统综述；未核实的消融、样本量、统计显著性与硬件成本不作确定判断。时间覆盖1990—2026年，不表示已完整覆盖截至调研日的新论文。

## 1. 初步判断与综述定位

现有文献支持把研究分成三条相互关联、但证据要求不同的主线：

1. **形态促进控制与感知**：身体把任务变得容易，如被动行走和颗粒抓取。证据通常是机械模型、稳定性、抓取力或运动表现。
2. **形态实现可识别的信息处理**：身体状态承担时序变换、记忆、逻辑或反馈，如软体储备池、气动程序和机械网络。输入、内部状态与输出的对应关系更明确。
3. **形态—控制协同设计**：通过优化寻找更好的身体和策略。这是发现形态计算的设计手段，但优化后性能更好，并不自动证明身体承担了计算。

这种划分是本报告的组织方法。它参考了Müller与Hoffmann对“促进控制、促进感知、严格意义计算”的区分，并将协同设计单列为方法线。[论文：What Is Morphological Computation?](https://doi.org/10.1162/ARTL_a_00219)

建议综述的中心问题改写为：**在明确的任务、环境和系统边界下，身体承担了什么可检验的功能；这些功能是否减少了达到同等表现所需的外部感知、状态估计或控制资源？**

## 2. 检索范围与筛选原则

本轮主要检索词包括：`morphological computation`、`physical reservoir computing soft body`、`passive dynamic walking`、`morphology control co-design`、`mechanical neural networks`、`electronics-free pneumatic control`。通过经典论文与近期观点论文补充相关路线。

纳入以下工作：直接讨论形态计算定义或量化；明确利用身体动力学进行输入输出映射；展示机械或气动反馈、记忆与逻辑；为形态—控制协同优化提供代表性方法或基准。综述论文作为背景单列，不能当作新的实验验证。

暂不因“柔软、仿生、结构复杂、会运动”而纳入；不把视觉图像的数学形态学、普通软件神经网络或与身体功能无关的物理计算混入主题。神经形态计算按其神经启发的计算架构定义，与形态计算可以组合，但二者不是同义词。

## 3. 概念与理论基础：对应原框架第4节

### 3.1 工作定义与边界

建议采用两层工作定义：广义层面考察身体对感知和控制的功能贡献；严格层面要求指出任务输入如何编码、物理状态如何变换、输出如何读取，以及历史信息或逻辑如何被利用。

Pfeifer等的具身机器人综述提供身体、控制和环境协同的背景；Müller与Hoffmann则提醒，机械系统使控制问题简化，不必然意味着把原本脑中的计算逐项转移到了身体。这两者适合共同构成引言与概念边界，避免只采纳“卸载计算”的单一叙述。[Pfeifer等，2007](https://doi.org/10.1126/science.1145803)；[Müller与Hoffmann，2017](https://doi.org/10.1162/ARTL_a_00219)

### 3.2 两类理论工具

**信息论路线。** Zahedi与Ay通过感觉—运动闭环中世界状态与动作对行为的贡献提出量化方式。它适合描述依赖关系，但不能直接读成“身体替代了百分之多少CPU计算”。状态选取、采样和环境作用都会影响解释；因果贡献仍需干预实验。[Zahedi与Ay，2013](https://arxiv.org/abs/1301.6975)

**动力系统与储备池路线。** Hauser等以质量—弹簧系统研究身体实现时序变换的条件：在相应假设下，物理动态提供记忆和非线性，外部静态读出完成映射。理论针对特定滤波器类别及分离性等条件，不意味着任意软体都能通用计算。文献卷年为2011，在线发表时间为2012，应在引用管理中保留这一差别。[Hauser等，作者全文](https://igi-web.tugraz.at/people/maass/psfiles/209.pdf)

## 4. 作用机制与代表性论文：对应原框架第5—6、8节

以下“局限／待核验”包含本报告的评价和后续精读问题，不全部是作者原文结论。“未建立”表示本轮证据不能支持，而非断言原论文完全没有。

### 4.1 被动动力学与接触适应

| 编号／论文 | 任务、载体与环境 | 身体与控制器的分工 | 已核实的主要证据 | 局限／待核验 |
|---|---|---|---|---|
| R01 McGeer，1990 | 斜坡双足行走；刚性连杆、重力与接触 | 被动动力学生成步态，实验装置无需主动步态控制 | 理论分析与实物被动行走 | 工作地形和初始条件受限；不能据此声称具备通用规划 |
| R02 Collins等，2005 | 平地双足行走；被动动力学启发机构 | 主动供能配合机械动态 | 三种真实机器人；论文报告较低控制与能量需求 | 跨机器人比较并非同一硬件上的纯形态消融；需核对能耗口径 |
| R03 Brown等，2010 | 不同物体抓取；膜包裹颗粒 | 材料贴合后真空堵塞，实现抓取形状适配 | 实物抓取及摩擦、吸附、几何锁合的力学分析 | 简化了局部抓取控制，但不是物体识别或任务规划；仍需定位与气源 |

来源：[R01作者论文](https://courses.ece.ucsb.edu/ECE594/594D_F13Byl/papers/McGeer90.pdf)；[R02论文摘要](https://pubmed.ncbi.nlm.nih.gov/15718465/)；[R03论文全文](https://pmc.ncbi.nlm.nih.gov/articles/PMC2973877/)。

这组工作对“身体作为控制资源”的论证最直观，但应标为**促进控制的经典证据**。例如，自适应抓取减少了逐指接触调节的需求，并不证明它内部建立了物体的符号模型。

### 4.2 身体动力学作为时序计算与记忆

| 编号／论文 | 载体与功能 | 控制／读出与联合优化 | 实验与评价证据 | 局限／待核验 |
|---|---|---|---|---|
| R04 Hauser等，2011／2012 | 质量—弹簧模型；时间积分、非线性变换 | 简单静态读出；非形态—策略联合优化 | 理论与仿真，验证动态输入输出映射 | 无该文实物验证；保证依赖数学条件 |
| R05 Nakajima等，2015 | 真实硅胶软臂；非线性与短时记忆 | 读取身体状态并训练读出；非联合优化 | 非线性动力系统仿真任务及机器学习基线比较 | 身体动态与传感、驱动、读出构成整体；全系统节能尚不能由摘要推出 |
| R06 Terajima等，2025 | 张拉整体机器人与环境；多个运动行为 | 储备池反馈与训练读出；本文不是一般联合设计基准 | 仿真、多吸引子分析及训练外吸引子 | 无实物验证；训练外吸引子不等于有用的环境泛化 |

来源：[R04作者全文](https://igi-web.tugraz.at/people/maass/psfiles/209.pdf)；[R05论文](https://pmc.ncbi.nlm.nih.gov/articles/PMC4444959/)；[R06作者稿及状态](https://arxiv.org/abs/2507.21496)。R06的arXiv页面标注已被 *Chaos* 接收，本报告按2025年作者稿整理，不将其误标为实物结果。

这条路线的优势是能提出明确计算任务。论文精读应分别记录输入信号、驱动频率、可测状态、读出维度和训练方式，再区分开环预测表现与闭环控制稳定性。**短期记忆、长期存储和多稳态不是同一指标**，不宜统称“身体有记忆”后直接横向排名。

### 4.3 机械、材料与气动系统中的反馈和逻辑

| 编号／论文 | 载体与功能 | 控制责任／优化方式 | 实物与主要证据 | 局限／待核验 |
|---|---|---|---|---|
| R07 Drotman等，2021 | 软阀与气动回路；振荡、记忆、步态切换 | 气动振荡器和逻辑响应传感输入；人工电路设计 | 实物四足运动，恒定压缩空气同时供给控制与驱动 | 无电子不等于无能耗；必须计入供气及阀路损耗 |
| R08 Lee等，2022 | 可调刚度梁网络；学习机械输入输出响应 | 调整梁刚度；不应写成完全无外部训练系统 | 制作机械网络，实现多种机械行为学习 | 需区分材料执行映射与外部测量、参数更新；不同于短期动态记忆 |
| R09 He等，2023 | 响应材料、模块与剪纸结构；刺激感知和反馈 | 分布式模块把环境刺激连接至动作 | 真实软机器人；多刺激响应及模块组合逻辑 | 场景与刺激受限定；需核对响应时间、重复性与失效条件 |
| R10 Picella等，2024 | 气动模块；条件分支、循环、顺序执行 | 物理模块组成程序，集成感知与执行 | 实物电路及软抓取演示，包含If、If…break和For等结构 | 可编程控制不等于无限规模通用计算；扩展后的延迟与耗气待核验 |

来源：[R07论文摘要](https://pubmed.ncbi.nlm.nih.gov/34043527/)；[R08论文摘要](https://pubmed.ncbi.nlm.nih.gov/36260698/)；[R09作者全文](https://wjiaolab.wordpress.com/wp-content/uploads/2024/12/sciadv.ade9247.pdf)；[R10作者全文](https://pure.tue.nl/ws/portalfiles/portal/348034128/sciadv.adr2433.pdf)。

本报告将这组工作作为“嵌入身体的物理控制／计算”纳入。写作时还要区分：计算是由身体承担承载、运动功能的结构直接完成，还是由装在身体上的独立气动电路完成。二者都相关，但集成程度不同。

### 4.4 感知前端

R11 Lepora（2021）的TacTip综述把柔性仿生皮肤、光学读取和触觉感知串联起来，可作为感知章节入口。皮肤结构将接触转化为可测形变，后端算法仍负责解释；不能把后端深度模型的全部精度收益归给皮肤形态。它是综述，不计为一项新的独立硬件消融。[论文作者稿](https://arxiv.org/abs/2105.14455)

后续应沿其参考文献寻找匹配的原始对照：保持相机、解码网络与训练数据不变，仅改变皮肤厚度、内部结构或材料，比较定位误差、力估计误差与样本需求。

## 5. 形态设计、学习与适应：对应原框架第7节

| 编号／论文 | 方法与任务 | 是否联合设计 | 环境／硬件 | 对综述的贡献与边界 |
|---|---|---|---|---|
| R12 Bongard，2011 | 发育中的身体变化与进化控制；运动行为 | 身体变化过程与控制演化结合 | 仿真 | 提供形态变化促进学习和鲁棒行为的证据；不是实物在线长出新结构 |
| R13 Bhatia等，2021，Evolution Gym | 体素身体设计、设计搜索与深度强化学习 | 是 | 多任务二维仿真；无该基准实物验证 | 适合构建固定形态／联合优化对照；任务得分不能直接量化计算卸载 |
| R14 Wang等，2023，SoftZoo | 多种环境材料、可微设计表示与协同优化 | 是 | 三维多环境仿真 | 适合研究形态—环境依赖；仿真中的多环境能力不等于真实部署泛化 |

来源：[R12论文](https://pubmed.ncbi.nlm.nih.gov/21220304/)；[R13会议论文](https://proceedings.neurips.cc/paper_files/paper/2021/hash/118921efba23fc329e6560b27861f0c2-Abstract.html)；[R14作者稿](https://arxiv.org/abs/2303.09555)。

原框架的联合目标 `max J(m, π)` 可以保留，但建议加入资源预算。更强的研究问题是：在达到同等成功率的前提下，优化后的形态能否降低控制器规模、传感数量或在线计算时间？同时应计入离线形态搜索与训练成本，避免把设计阶段的巨大投入从系统成本中隐去。

## 6. 背景与近期综述：支撑框架，但不重复计作实验

| 编号 | 文献 | 适合放置的章节 | 使用方式 |
|---|---|---|---|
| R15 | Pfeifer、Lungarella与Iida，2007 | 引言、理论背景 | 建立具身与自组织视角 |
| R16 | Müller与Hoffmann，2017 | 定义、边界 | 给“促进功能”和“执行计算”设置不同证据标准 |
| R17 | Zahedi与Ay，2013 | 量化、评价 | 信息论模型研究，不能作为通用卸载比例量尺 |
| R18 | Hauser、Nanayakkara与Forni，2023 | 控制设计、挑战 | 从控制论角度讨论软体形态的功能设计与理论缺口 |
| R19 | Wang、Zhou、Kahak与Li，2026 | 分类、近期方向 | 观点论文；以振荡器、物理储备池和物理算法计算组织路线 |

来源：[R15](https://doi.org/10.1126/science.1145803)；[R16](https://doi.org/10.1162/ARTL_a_00219)；[R17](https://arxiv.org/abs/1301.6975)；[R18机构库](https://www.repository.cam.ac.uk/items/155d3b13-1d8b-47a7-8d86-f1f4764f326e)；[R19期刊论文](https://doi.org/10.1038/s41467-026-70866-6)。R19于2026-03-15正式发表；其2025年预印本不另算一篇。

## 7. 应用覆盖与研究空白：对应原框架第8节

| 原框架应用 | 本轮覆盖 | 下一轮需要补充的证据 |
|---|---|---|
| 腿足机器人 | R01、R02、R07；被动动态与气动步态 | 固定控制器的结构消融、未知地形、扰动恢复 |
| 软体机器人 | R05、R06、R09、R10 | 长时间漂移、闭环稳定性、制造重复性 |
| 操作机器人 | R03；R10 | 未见物体、定位与抓取成本分解 |
| 感知系统 | R11为综述入口 | 皮肤形态与后端算法相互独立的原始实验 |
| 水下机器人 | R14仅提供相关仿真环境线索 | 真实流固耦合、身体读出、环境能量利用的原始研究 |
| 空中机器人 | 本轮未建立代表性核心条目 | 翼刚度／翼形干预与控制负担的对应证据 |
| 群体机器人 | 本轮未建立代表性核心条目 | 固定局部规则，改变连接、形态或环境耦合的对照 |

“覆盖不足”是本轮文献集的限制，不是这些方向缺少研究的结论。预测处理、生态心理学及可供性也尚未形成专门文献支撑，不宜在初稿中与动力学和信息论同等展开。

## 8. 比较与评价建议：对应原框架第9—10节

### 8.1 分开报告四类证据

- **功能证据**：明确输入、物理状态、输出及任务，例如延迟信息恢复、逻辑条件响应。
- **形态因果证据**：改变刚度、几何或耦合，观察任务与内部状态变化。
- **资源证据**：同等任务表现下，对照在线计算、传感、能量及离线训练成本。
- **部署证据**：硬件重复实验、未见环境、材料漂移与制造差异。

这四类是本报告建议的提取标签，不是领域既有统一评分。理论充分、硬件成功、跨环境鲁棒和资源节省应分别判断，不合并为一个未经验证的“证据总分”。

### 8.2 推荐实验矩阵

| | 简单控制器／线性读出 | 较强控制器／非线性读出 |
|---|---|---|
| 基础形态 | 基准A | 基准B |
| 功能形态 | 实验C | 实验D |

固定控制器比较A与C，可观察即时机械贡献；分别公平重训后比较，可考察各形态可达到的性能。比较B与C时必须匹配成功率、训练预算、观测条件和任务难度。固定控制器可能不适合新形态，因此只做固定控制器对照也不充分。

储备池另加：相同读出直接处理原输入、输入延迟线、数字储备池，以及尽可能保持传感条件一致的物理消融。对机械／气动逻辑则测试输入组合、状态保持、切换可靠性、重复次数和级联后的错误传播。

### 8.3 指标应按功能匹配

| 问题 | 建议记录 | 易混淆点 |
|---|---|---|
| 时序处理 | NMSE、记忆曲线、输入频率、读出维度 | 单一任务误差不是一般计算能力 |
| 控制简化 | 控制频率、策略规模、实测延迟、训练量 | 参数少不一定实测更快 |
| 运动效率 | 明确归一化方式的运输成本、速度、负载 | 不同供能边界下的数值不能直接排序 |
| 感知贡献 | 误差、分辨率、噪声与后端模型规模 | 需控制训练数据和解码器 |
| 硬件代价 | 驱动、气源、传感、读出总能量及制造成本 | 物理变换不是零成本计算 |
| 泛化 | 未见条件、成功率和不确定性 | 多任务训练不等于零样本迁移 |

原框架中的“身体参与计算的比例”与“替代神经计算的程度”建议改为**待操作化的研究问题**，不预设现成统一标尺。暂不制作跨论文性能雷达图，因为上述论文的任务、硬件和指标口径不匹配。

## 9. 挑战与可形成论文的问题：对应原框架第11—12节

以下为基于本轮文献的研究建议，不是已经确立的领域结论。

**方向一：形态收益的可解释归因。** 在有限的形态参数空间内，建立任务表现、物理状态特征与控制器资源之间的关系；通过干预确认哪些动态承担记忆、滤波或反馈。相比单纯提高任务得分，这更贴合原框架的主问题。

**方向二：任务相关的身体记忆设计。** 联合调整柔性结构与读出，使物理时间尺度匹配任务所需历史窗口，再测试温度、负载和材料变化后的失效边界。目标不是记忆越长越好，而是可读取且对当前任务有用。

**方向三：考虑总成本的协同设计。** 在Evolution Gym或SoftZoo中先验证受预算约束的比较方法，再选择可制造形态做硬件实验。报告搜索、训练、执行三个阶段的成本，检验复杂度究竟被消除还是被转移。

大模型／视觉—语言—动作模型、多尺度群体计算可保留为未来方向，但本轮19篇文献尚不能支持其已成熟融合的结论。首轮综述宜重点写扎实“被动动力学—身体信息处理—协同设计—因果评价”这条主线。

## 10. 建议的精读顺序与后续文献表

第一轮依次精读R16（边界）、R17（量化）、R04（理论）、R05（真实身体计算），统一术语与判定标准。

第二轮对照R01／R02、R03、R07／R10，比较“简化任务”“物理实现反馈”和“显式逻辑”的不同证据。

第三轮阅读R12—R14与R18—R19，将理论问题转化为可执行的设计与实验。R06适合追踪多行为与闭环吸引子问题。

每篇精读补录：原文页码／图表、假设、完整系统边界、输入输出、形态参数、传感与控制、联合优化方式、硬件与环境、基线、形态消融、样本量、误差条、能量口径、代码数据和失效案例。目前只建立初筛记录，不应将这些待补字段默认为“无”。

## 11. 参考文献目录

1. **R01** McGeer, T. (1990). *Passive Dynamic Walking*. The International Journal of Robotics Research, 9(2), 62–82. [作者论文](https://courses.ece.ucsb.edu/ECE594/594D_F13Byl/papers/McGeer90.pdf).
2. **R02** Collins, S., Ruina, A., Tedrake, R., & Wisse, M. (2005). *Efficient bipedal robots based on passive-dynamic walkers*. Science, 307, 1082–1085. [DOI](https://doi.org/10.1126/science.1107799).
3. **R03** Brown, E., et al. (2010). *Universal robotic gripper based on the jamming of granular material*. PNAS, 107, 18809–18814. [DOI](https://doi.org/10.1073/pnas.1003250107).
4. **R04** Hauser, H., Ijspeert, A. J., Füchslin, R. M., Pfeifer, R., & Maass, W. (2011卷年；2012在线). *Towards a theoretical foundation for morphological computation with compliant bodies*. Biological Cybernetics, 105, 355–370. [DOI](https://doi.org/10.1007/s00422-012-0471-0).
5. **R05** Nakajima, K., Hauser, H., Li, T., & Pfeifer, R. (2015). *Information processing via physical soft body*. Scientific Reports, 5, 10487. [DOI](https://doi.org/10.1038/srep10487).
6. **R06** Terajima, R., Inoue, K., Nakajima, K., & Kuniyoshi, Y. (2025). *Multifunctional physical reservoir computing in soft tensegrity robots*. arXiv:2507.21496；页面标注Chaos已接收。 [作者稿](https://arxiv.org/abs/2507.21496).
7. **R07** Drotman, D., Jadhav, S., Sharp, D., Chan, C., & Tolley, M. T. (2021). *Electronics-free pneumatic circuits for controlling soft-legged robots*. Science Robotics, 6, eaay2627. [DOI](https://doi.org/10.1126/scirobotics.aay2627).
8. **R08** Lee, R. H., Mulder, E. A. B., & Hopkins, J. B. (2022). *Mechanical neural networks: Architected materials that learn behaviors*. Science Robotics, 7, eabq7278. [DOI](https://doi.org/10.1126/scirobotics.abq7278).
9. **R09** He, Q., Yin, R., Hua, Y., Jiao, W., Mo, C., Shu, H., & Raney, J. R. (2023). *A modular strategy for distributed, embodied control of electronics-free soft robots*. Science Advances, 9, eade9247. [DOI](https://doi.org/10.1126/sciadv.ade9247).
10. **R10** Picella, S., van Riet, C. M., & Overvelde, J. T. B. (2024). *Pneumatic coding blocks enable programmability of electronics-free fluidic soft robots*. Science Advances, 10, eadr2433. [DOI](https://doi.org/10.1126/sciadv.adr2433).
11. **R11** Lepora, N. F. (2021). *Soft Biomimetic Optical Tactile Sensing With the TacTip: A Review*. IEEE Sensors Journal, 21, 21131–21143. [DOI](https://doi.org/10.1109/JSEN.2021.3100645).
12. **R12** Bongard, J. (2011). *Morphological change in machines accelerates the evolution of robust behavior*. PNAS, 108, 1234–1239. [DOI](https://doi.org/10.1073/pnas.1015390108).
13. **R13** Bhatia, J., Jackson, H., Tian, Y., Xu, J., & Matusik, W. (2021). *Evolution Gym: A Large-Scale Benchmark for Evolving Soft Robots*. NeurIPS 34. [会议论文](https://proceedings.neurips.cc/paper_files/paper/2021/hash/118921efba23fc329e6560b27861f0c2-Abstract.html).
14. **R14** Wang, T.-H., et al. (2023). *SoftZoo: A Soft Robot Co-design Benchmark For Locomotion In Diverse Environments*. ICLR. [作者稿](https://arxiv.org/abs/2303.09555).
15. **R15** Pfeifer, R., Lungarella, M., & Iida, F. (2007). *Self-Organization, Embodiment, and Biologically Inspired Robotics*. Science, 318, 1088–1093. [DOI](https://doi.org/10.1126/science.1145803).
16. **R16** Müller, V. C., & Hoffmann, M. (2017). *What Is Morphological Computation? On How the Body Contributes to Cognition and Control*. Artificial Life, 23, 1–24. [DOI](https://doi.org/10.1162/ARTL_a_00219).
17. **R17** Zahedi, K., & Ay, N. (2013). *Quantifying Morphological Computation*. Entropy, 15, 1887–1915. [DOI](https://doi.org/10.3390/e15051887).
18. **R18** Hauser, H., Nanayakkara, T., & Forni, F. (2023). *Leveraging Morphological Computation for Controlling Soft Robots: Learning from Nature to Control Soft Robots*. IEEE Control Systems Magazine, 43. [DOI](https://doi.org/10.1109/MCS.2023.3253422).
19. **R19** Wang, J., Zhou, Z., Kahak, A., & Li, S. (2026). *Embodying physical computing into soft robots*. Nature Communications, 17, 2455. [DOI](https://doi.org/10.1038/s41467-026-70866-6).

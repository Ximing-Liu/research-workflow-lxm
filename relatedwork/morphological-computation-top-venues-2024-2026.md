# 最近两年AI顶会及相关高水平期刊：形态计算与相近工作

检索日期：2026-09-18。时间窗：**2024-09-18至2026-09-18**。承接[感知、记忆与控制专项调研](./morphological-computation-perception-memory-control.md)。

## 1. 结论与范围

**有强相关的近期高水平期刊工作；在本轮核实的AI顶会正式论文中，相近算法研究比严格意义的身体计算更常见。** Nature Machine Intelligence 2025的PAWS是“机械耦合降低控制维度”的直接代表；物理储备池、气动程序和机械算子执行的强相关论文还分布于Advanced Science、Science Advances及Nature Communications。

不能据此断言AI顶会完全没有形态计算论文。本轮为主题与定向站点检索，并未逐篇筛查全部会议论文集。以下收录13篇重点原始研究，分开标注场所和相关性；不将跨学科期刊统称为AI期刊，也不以出版社品牌替代学术质量判断。

检索覆盖NeurIPS、ICLR、ICML、AAAI、IJCAI的官方论文页／论文集，并扩展Nature Machine Intelligence、Science Robotics及相关跨学科期刊；补检了JMLR与IEEE相关条目，未形成该范围内的强相关核心入选。ICML 2026部分页面访问受限，覆盖不完整。2026年的会议只纳入已核实正式论文集条目，不把未来会议或投稿状态当作已发表。

关键词组合包括：morphological computation、physical reservoir、mechanical computing、embodied memory、robot morphology、morphology-control co-design、soft robot control、compliant sensing。使用论文正式日期／会议届次，不使用网页抓取日期或页脚版权年份。预印本与期刊版本合并。

相关性分级：

- **A：直接物理计算**——身体或物理结构承担动态信息处理、算子或逻辑执行。
- **B：功能强相关**——构型明确参与感知或降低控制负担，但不自动构成严格计算或计算卸载证据。
- **C：相近算法**——学习身体模型、搜索身体结构或适配不同构型；计算主要在软件中完成。

这些分级是本文筛选判断，不是论文作者共同使用的分类。

## 2. 优先阅读：强相关的近期原始研究

### J1. PAWS：把低维运动协同落实到机械结构

**Stella, Achkar, Della Santina & Hughes. Synergy-based robotic quadruped leveraging passivity for natural intelligence and behavioural diversity. Nature Machine Intelligence，2025-03-17，7:386–399。相关性B；AI与机器人交叉期刊。**

从动物关节运动数据提取PCA协同，再优化关节刚度与腱路，构成四足机器人PAWS；4个驱动器控制12个关节。实物展示多种行为与被动扰动响应。

**构型—算法联系**：低维协同关系经机械耦合变成可执行约束，将部分多关节协调交给结构。可把它理解为设计阶段的降维与运行阶段的机械实现。不能把驱动器减少比例直接换算为软件计算减少比例。

**适合你的方向**：控制简化、机械反馈、形态独立贡献。优先精读设计管线、不同耦合方式及扰动实验。[正式全文](https://doi.org/10.1038/s42256-025-00988-x)

### J2. Forces for free：利用手部形变估计接触力

**Zhu等. Forces for free: Vision-based contact force estimation with a compliant hand. Science Robotics，2025-06-25，10:eadq5046。相关性B；机器人领域期刊。**

通过相机观察顺应手的弹性形变估计接触力，同时优化机构以降低摩擦和构型奇异性，并为估计器加入记忆处理滞回带来的部分可观测性。摘要报告测试误差约0.2–0.4 N，也明确表示其速度与精度不及商用力／力矩传感器。

**算法启示**：构型可以创造可观测的力信息，但后端仍需视觉分割与时序估计。这里加入的是估计器记忆，不能误写成“身体替代了全部数字记忆”。[原始论文摘要与出版信息](https://pubmed.ncbi.nlm.nih.gov/40561044/)

### J3. 折纸机械臂作为自适应物理储备池

**Jun Wang & Suyi Li. Re-Purposing a Modular Origami Manipulator Into an Adaptive Physical Computer for Machine Learning and Robotic Perception. Advanced Science，2025-09-14首次在线，DOI: 10.1002/advs.202509389。相关性A；跨学科期刊。**

将模块化折纸机械臂作为物理储备池，比较构型、输入与计算任务；测试NARMA，并从身体动态识别负载重量与方向。论文用频谱的Peak Similarity Index讨论任务匹配，进一步加入形状记忆合金驱动。

**算法启示**：直接研究“什么构型适合什么计算任务”。物理非线性、短期动态与读出共同作用，适合连接你的感知与记忆章节。频谱相关性是解释线索，不是对任意任务成立的设计定理；感知能力也不等于已经验证所有闭环控制收益。[正式全文](https://doi.org/10.1002/advs.202509389)

### J4. 机械算子与机器人运动结合

**Wu Zhou & Yi-Ze Wang. Reprogrammable metamaterial robot with embodied versatile computation and mechanical intelligence. Nature Communications，2026-04-03首次发表，17:4805。相关性A；跨学科期刊。**

用弹性波超材料实现可编程空间模拟运算，连接机械逻辑及机器人爬行。理论与实验覆盖若干算子及其组合，运动模式受输出波场影响。

**算法启示**：这是“身体执行算子→计算输出调节运动”的直接实例，与仅用网络控制软机器人有本质区别。应检查输入编码、驱动和测量设备的完整边界；不是无外部设备的通用计算机，也不是量子计算硬件。[正式论文](https://doi.org/10.1038/s41467-026-71368-1)

### J5. 气动控制程序

**Picella, van Riet & Overvelde. Pneumatic coding blocks enable programmability of electronics-free fluidic soft robots. Science Advances，2024-12-20，10:eadr2433。相关性A；跨学科期刊。**

对应If、If…break、For的气动模块实现分支、循环和顺序动作，并展示软体操作。

**算法启示**：适合讨论控制程序的物理实现、状态保持、模块组合与执行可靠性。它已在前一份报告出现，保留在近两年核心清单中，不当作本轮新发现。复杂程序的规模化和全系统能效需要独立验证。[正式论文](https://doi.org/10.1126/sciadv.adr2433)

## 3. AI顶会正式论文：相近但不能直接等同于形态计算

以下六篇均核实了官方主会议／正式会议论文集页面。采用“相近路线”纳入，是因为它们提供可用于形态计算研究的表示、学习、优化或控制方法。

### C1. 稳定的潜空间动力学：NeurIPS 2024

**Maximilian Stölzle & Cosimo Della Santina. Input-to-State Stable Coupled Oscillator Networks for Closed-form Model-based Control in Latent Space.**

提出耦合振荡器网络CON，赋予潜在动力学拉格朗日结构与输入到状态稳定性，再从图像学习动态并在潜空间控制。

**可以借鉴**：为身体储备池或软体控制建立结构化、可分析的模型；把状态表示与控制稳定性联系起来。

**不能混淆**：CON是软件学习模型。全文附录中的软体闭环示例为仿真的两段PCC系统，不能因摘要写“soft robot”就标成真实软机器人控制。模型在其假设下的稳定性，也不能自动推广到模型误差存在时的真实系统。[官方论文页](https://proceedings.neurips.cc/paper_files/paper/2024/hash/952ddaa9299d81cc307427edab034784-Abstract-Conference.html)

### C2. 身体—流体耦合的降维控制：NeurIPS 2025

**Changyu Hu等. Learning to Control Free-Form Soft Swimmers.**

结合统一的降阶控制空间与GPU高保真流固耦合仿真，在多种软体形状上学习游动模式。

**可以借鉴**：构型如何影响可控形变模式，以及环境动力学如何成为控制资源。代码项目为FreeFlow。

**不能混淆**：主体是多形状下的控制学习与仿真工具，不是已完成一般构型—控制联合优化，也没有直接验证身体记忆或信息处理容量。报告中的实验按仿真证据理解。[官方主会论文](https://proceedings.neurips.cc/paper_files/paper/2025/hash/4d893f766ab60e5337659b9e71883af4-Abstract-Conference.html)

### C3. LLM辅助结构搜索：ICLR 2025

**Junru Song等. LASeR: Towards Diversified and Generalizable Robot Design with Large Language Models.**

以LLM作为进化搜索算子，通过DiRect反思机制改进探索与利用，在体素软机器人仿真中优化结构设计及多样性。

**可以借鉴**：将形态搜索从人工枚举扩展到生成式候选提出与历史反馈。

**不能混淆**：设计阶段LLM的推理不属于身体计算；任务表现改善也没有直接说明感知／记忆被卸载。适合作为设计方法，而不是功能证据。[官方论文](https://proceedings.iclr.cc/paper_files/paper/2025/hash/934eb45b99eff8f16b5cb8e4d3cb5641-Abstract-Conference.html)

### C4. 显式考虑控制适应的双层优化：ICLR 2026

**Yanning Dai, Yuhui Wang, Dylan Ashley & Jürgen Schmidhuber. Efficient Morphology-Control Co-Design via Stackelberg Proximal Policy Optimization.**

用Stackelberg博弈刻画身体与控制的相互适应，在形态更新时考虑控制器的适应动态，提高协同训练稳定性与效率。

**可以借鉴**：避免把当前控制器暂时不适应误判为某种构型质量差；很适合作为联合设计的算法基线。

**不能混淆**：研究对象是优化耦合，不是身体本身执行了多少计算。正式摘要已核实，完整硬件验证范围本轮未确认，不据此宣称实物部署。[官方论文](https://proceedings.iclr.cc/paper_files/paper/2026/hash/e9750610639c3e7a849cff746bf60dbd-Abstract-Conference.html)

### C5. 可制造的灵巧手协同设计：ICLR 2026

**Kehlani Fay等. House Of Dextra: Cross-Embodied Co-Design for Dexterous Hands.**

结合手部结构搜索、形态条件的跨构型控制与模块化制造，验证手内旋转等任务，并包含实物部署。作者报告在其平台与流程中可于24小时内完成设计、训练、制造和部署。

**可以借鉴**：把搜索空间、控制器共享和制造约束连起来，是“构型—控制—任务”链条较完整的近期实例。

**不能混淆**：24小时是特定工作流程的结果，不是普遍保证；操作性能提升也需要额外消融才能归因为形态计算。[官方论文](https://proceedings.iclr.cc/paper_files/paper/2026/hash/18c54ed6e0cc390d750f64927dbc4e93-Abstract-Conference.html)

### C6. 跨构型状态与动作接口：IJCAI 2025

**Yingbo Luo, Meibao Yao & Xueming Xiao. GCNT: Graph-Based Transformer Policies for Morphology-Agnostic Reinforcement Learning.**

结合改进GCN与Transformer，提取构型信息并在模块间交换表示，以适应不同数量的身体模块、状态与动作维度，并评估未见构型的零样本泛化。

**可以借鉴**：为形态变化后策略仍能使用的状态／动作接口提供基线。

**不能混淆**：结构信息被软件利用，与结构承担计算不同。本轮未确认实物结果，不将基准中的泛化写成真实硬件泛化。[官方Main Track论文](https://www.ijcai.org/proceedings/2025/972)

## 4. AI期刊中的相近工作

### J6. 机械感知前端与脉冲网络：Nature Machine Intelligence 2025

**da Costa等. Type II mechanoreceptors and cuneate spiking neuronal network enable touch localization on a large-area e-skin. 2025-08-04，7:1278–1291。**

结合嵌入光纤布拉格光栅的大面积皮肤与仿生两层脉冲网络，通过无监督学习进行触觉定位，报告定位误差低于10 mm。

适合作为“物理感知前端＋学习解码”的相关工作。主要信息处理包括脉冲网络，不能把神经形态计算等同于形态计算；是否降低解码负担需专门的前端对照。[正式论文](https://doi.org/10.1038/s42256-025-01076-w)

### J7. 非线性材料响应的图生成：Nature Machine Intelligence 2025

**Maurizi等. Designing metamaterials with programmable nonlinear responses and geometric constraints in graph space. 2025-07-22，7:1023–1036。**

GraphMetaMat以自回归图表示设计桁架超材料，目标涉及非线性响应与几何、制造约束。

适合作为物理计算载体逆向设计的方法来源：未来可把目标响应替换为任务相关滤波、记忆或控制指标。这是本文提出的迁移思路，不能写成原文已经验证了机器人记忆或闭环控制。[正式论文](https://doi.org/10.1038/s42256-025-01067-x)

## 5. 与感知、记忆、控制的对应关系

| 研究问题 | 最直接的近期论文 | 可配套借鉴的AI算法 | 需要补的证据 |
|---|---|---|---|
| 构型能否让环境信息更可观测？ | J2顺应手力估计；J3折纸储备池 | J6脉冲解码；J7构型生成 | 固定解码器的形态干预及公平重训 |
| 身体能否提供任务相关历史？ | J3动态储备池 | C1结构化动态模型 | 延迟恢复、数字缓存与时序网络对照 |
| 身体能否减少控制维度？ | J1 PAWS | C4双层协同优化；C6跨构型策略 | 同等任务表现的计算量与能耗 |
| 计算结果能否直接影响运动？ | J4机械算子机器人；J5气动程序 | C1闭环稳定性分析 | 输入编码、驱动、读出及供能的总成本 |
| 能否自动找到有利构型？ | J1设计管线 | C3 LASeR；C4 Stackelberg PPO；C5 Dextra | 目标中显式加入感知／记忆／控制资源 |
| 如何利用身体—环境动力学？ | J1机械反馈 | C2软体游动 | 环境干预、未见流场／地形、实物验证 |

这里“最直接”是相对于本次筛选集合，而非整个领域的排名。

## 6. 未纳入核心清单的边界情况

- **HyperDistill，ICML 2024**：与构型条件控制和推理效率十分相关，但会议在2024年7月，位于本次严格24个月窗口之外。可作背景，不应计入近两年核心结果。[官方论文](https://proceedings.mlr.press/v235/xiong24c.html)
- **CompetEvo，IJCAI 2024**：形态与竞争策略协同演化；2024年8月会议同样在时间窗之外。[官方论文](https://www.ijcai.org/proceedings/2024/10)
- **URMA／One Policy to Run Them All**：CoRL 2024论文，PMLR卷标为2025；属于机器人学习会议和跨构型控制方向，可补充，但应保留会议届次与卷出版年差异。[官方论文集](https://proceedings.mlr.press/v270/bohlinger25a.html)
- **CODEI，AAAI 2026条目**：明确标为2025期刊论文的Abstract Reprint，不能当作另一篇AAAI主会新研究。[官方条目](https://ojs.aaai.org/index.php/AAAI/article/view/41398)
- **COGENT**：找到的条目为EWRL 2025 workshop，不计入AI顶会主会。[原稿](https://openreview.net/pdf?id=IfLKMWrroL)
- **Embracing Evolution…**：本轮找到的是匿名Submitted to NeurIPS 2025稿件，未核实正式发表，不纳入。[检索到的稿件](https://openreview.net/pdf?id=JCqGIUAsbs)
- **Embodying physical computing into soft robots，Nature Communications 2026**：强相关观点／综述，适合作为扩展检索入口，不混入13篇原始研究计数。[正式论文](https://doi.org/10.1038/s41467-026-70866-6)
- **Wang等织物软臂感知，Advanced Intelligent Systems 2025**：主题直接相关，已在专项报告详述；本轮不因相关性强就将该期刊自动标为AI顶刊。[论文](https://doi.org/10.1002/aisy.202400534)

## 7. 总结与选题启示

从已核实的论文可以归纳出三条互补路线：

1. **物理功能实现**：J1—J5回答身体能承担什么。适合构建形态计算的核心证据。
2. **学习与设计工具**：C1—C6回答怎样建模、控制、搜索或迁移。适合构建算法贡献和实验基线。
3. **接口与载体设计**：J6—J7连接机械感知、神经解码及结构生成。适合拓展可学习的构型表示。

对你的“感知—记忆—控制”主题，建议首先读J1、J2、J3、C1、C4、C5。若只保留四篇核心对照，可用**J3折纸物理储备池＋J1 PAWS＋C1潜空间稳定控制＋C4双层协同设计**：分别覆盖身体计算、机械控制简化、软件动态模型与构型—策略优化。

一个值得检验的研究问题是：**在相同感知／运动性能下，能否联合优化身体与读出，使所需数字记忆、控制器规模或在线延迟减少，并在未见环境中保持收益？**

可以比较“固定／优化构型 × 无记忆／有数字记忆控制器”，将身体的物理记忆和软件状态清楚分开。这个问题由文献综合提出，并非本轮检索已证明的无人研究空白，也不构成论文新颖性保证。

## 8. 核验说明

13篇核心研究均有正式出版页或官方会议论文集链接。对PAWS、CON、折纸储备池和机械算子机器人读取了部分全文方法／结果；其余主要依据原始摘要和正式条目信息，尚未完成全部补充材料核查。文中的数字是作者在特定设置下报告的结果，不作跨任务排名。

本轮没有建立“AI顶会已广泛解决身体长期记忆”的证据；检索结果中软件记忆、形状记忆材料、身体动态记忆频繁混用，写作时必须分别标注。

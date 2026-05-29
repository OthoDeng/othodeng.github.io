#import "../book.typ": book-page
#show: book-page.with(title: "NWP Practice Report 2")
#outline()

= 基本原理

本实验针对一维线性平流方程，对比分析三种不同时间积分格式的稳定性特征。三种格式分别是：时间前差（欧拉）格式、时间梯形隐式（Crank-Nicolson）格式和时间中央差（蛙跳）格式。空间离散统一采用中央差格式。

== 控制方程

考虑一维线性平流方程：

$
  (dif u) / (dif t) + C (dif u) / (dif x) = 0
$

其中 $u(x, t)$ 为所关注的物理量场，$C$ 为相速度（常波速）。该方程描述了一个以恒定速度 $C$ 传播的波形，其精确解为 $u(x, t) = u_0(x - C t)$，即初始波形沿 $x$ 方向以速度 $C$ 无衰减、无形变地平移。

当 $C > 0$ 时，波动向 $x$ 正方向传播；当 $C < 0$ 时，波动向 $x$ 负方向传播。

== 空间离散：中央差格式

空间导数采用二阶中心差分近似：

$
  (dif u) / (dif x) approx (u_(i+1)^n - u_(i-1)^n) / (2 Delta x)
$

该格式具有二阶空间精度，截断误差为 $O(Delta x^2)$。代入平流方程得到半离散形式：

$
  (dif u_i) / (dif t) = - C (u_(i+1) - u_(i-1)) / (2 Delta x)
$

令 $F_i^n = -C (u_(i+1)^n - u_(i-1)^n) / (2 Delta x)$ 为空间差分算子，以下分别讨论三种时间积分方案。

== 时间积分方案一：前差（欧拉）格式

时间导数采用一阶向前差分近似：

$
  (u_i^(n+1) - u_i^n) / (Delta t) = F_i^n
$

得到显式递推公式：

$
  u_i^(n+1) = u_i^n + Delta t dot F_i^n
$

展开为完整形式（定义 $sigma = C Delta t / Delta x$ 为 CFL 数）：

$
  u_i^(n+1) = u_i^n - sigma / 2 (u_(i+1)^n - u_(i-1)^n)
$

*Von Neumann 稳定性分析*：设 $u_i^n = G^n e^(i k x_i)$，其中 $i = sqrt(-1)$，代入得放大因子：

$
  G = 1 - i sigma sin(k Delta x)
$

其模平方为：

$
  |G|^2 = 1 + sigma^2 sin^2(k Delta x)
$

由于 $sigma^2 sin^2(k Delta x) >= 0$，恒有 $|G|^2 >= 1$。除 $sin(k Delta x) = 0$ 外严格大于 1，因此该格式*绝对不稳定*。这是前差（欧拉）格式结合空间中央差的致命缺陷——无论 $Delta t$ 取多小，数值解均会随时间增长而发散。

== 时间积分方案二：梯形隐式（Crank-Nicolson）格式

梯形格式在时间层 $n$ 和 $n+1$ 之间取平均：

$
  (u_i^(n+1) - u_i^n) / (Delta t) = 1 / 2 (F_i^n + F_i^(n+1))
$

展开得：

$
  u_i^(n+1) - u_i^n = - (C Delta t) / (4 Delta x) [(u_(i+1)^n - u_(i-1)^n) + (u_(i+1)^(n+1) - u_(i-1)^(n+1))]
$

令 $alpha = C Delta t / (4 Delta x)$，整理为三对角方程：

$
  -alpha u_(i-1)^(n+1) + u_i^(n+1) + alpha u_(i+1)^(n+1) = u_i^n - alpha(u_(i+1)^n - u_(i-1)^n)
$

该格式为隐式格式，每个时间步需用 Thomas 算法求解三对角方程组。

*Von Neumann 稳定性分析*：代入谐波解得放大因子：

$
  G = (1 - i ((sigma) / 2) sin(k Delta x)) / (1 + i ((sigma) / 2) sin(k Delta x))
$

分子分母互为共轭，因此 *$|G| = 1$*，格式#strong[无条件稳定]，且无振幅耗散。Crank-Nicolson 格式具有时间二阶精度 $O(Delta t^2)$，是求解平流方程的优良方案。

== 时间积分方案三：中央差（蛙跳）格式

时间导数采用二阶中心差分，空间也用中央差：

$
  (u_i^(n+1) - u_i^(n-1)) / (2 Delta t) = F_i^n
$

得到三层显式递推公式：

$
  u_i^(n+1) = u_i^(n-1) + 2 Delta t dot F_i^n = u_i^(n-1) - sigma(u_(i+1)^n - u_(i-1)^n)
$

该格式为*三步法*格式，起步需要 $u^0$ 和 $u^1$ 两个时刻的值。$u^1$ 需由其他格式计算，本文考察三种起步方案：

$
  u_i^1 = u_i^0 + Delta t dot F_i^0 dot A_2 + Delta t dot F_i^("Euler") dot B_2
$

其中 $A_2 + B_2 = 1$，$F_i^("Euler")$ 为用欧拉前差预估的 $u^1$ 处的空间导数：

- *欧拉前差*（$A_2 = 1, B_2 = 0$）：$u_i^1 = u_i^0 + Delta t F_i^0$
- *欧拉后差*（$A_2 = 0, B_2 = 1$）：$u_i^1 = u_i^0 + Delta t F_i^("Euler")$
- *赫恩格式*（$A_2 = 0.5, B_2 = 0.5$）：两者的平均

*Von Neumann 稳定性分析*：蛙跳格式的放大因子满足二次方程：

$
  G^2 + 2 i sigma sin(k Delta x) G - 1 = 0
$

解得 $G_(1,2) = -i sigma sin(k Delta x) plus.minus sqrt(1 - sigma^2 sin^2(k Delta x))$。

- 当 $|sigma| <= 1$ 时，$|G_(1,2)| = 1$，格式*中性稳定*（无耗散）
- 当 $|sigma| > 1$ 时，$|G| > 1$，格式不稳定

因此蛙跳格式的稳定性条件为 $|sigma| <= 1$。但由于起步格式的误差会随时间传播，不同起步方案对解的质量有显著影响。

= 数值试验设计

== 试验参数设置

本实验在一维周期性边界条件下进行，计算域共 $n x = 50$ 个格点，空间格距 $Delta x = 20.0$。初始场设定为：

$
  u_0(x) = 0.5 + sin((4 pi x) / L)
$

其中 $L = n x dot Delta x = 1000$ 为计算域总长度。精确解为该初始波形以速度 $C$ 在周期域中平移。

== 实验一：时间前差（欧拉）格式 + 空间中央差

空间中央差 + 时间前差格式（FTCS）的试验参数如下：

#figure(
  table(
    columns: 6,
    align: center,
    stroke: none,
    table.hline(stroke: 1.5pt),
    table.header([工况], [$C$], [$Delta t$], [$sigma$], [$n t$], [总积分时间]),
    table.hline(stroke: 0.75pt),
    [ftcs\_small], [5.0], [2.0], [0.5], [60], [$t = 120$],
    [ftcs\_large], [5.0], [6.0], [1.5], [60], [$t = 360$],
    table.hline(stroke: 1.5pt),
  ),
  caption: [实验一（FTCS）参数配置]
)

== 实验二：时间梯形隐式（Crank-Nicolson）格式 + 空间中央差

梯形隐式格式在理论上无条件稳定，本实验设置四个不同 $sigma$ 值（0.5, 1.0, 2.0, 4.0）验证其稳定性：

#figure(
  table(
    columns: 6,
    align: center,
    stroke: none,
    table.hline(stroke: 1.5pt),
    table.header([工况], [$C$], [$Delta t$], [$sigma$], [$n t$], [总积分时间]),
    table.hline(stroke: 0.75pt),
    [cn\_sigma05], [5.0], [2.0], [0.5], [60], [$t = 120$],
    [cn\_sigma10], [5.0], [4.0], [1.0], [30], [$t = 120$],
    [cn\_sigma20], [5.0], [8.0], [2.0], [16], [$t = 128$],
    [cn\_sigma40], [5.0], [16.0], [4.0], [8], [$t = 128$],
    table.hline(stroke: 1.5pt),
  ),
  caption: [实验二（Crank-Nicolson）参数配置]
)

== 实验三：时间中央差（蛙跳）格式 + 空间中央差

蛙跳格式起步需用三种不同起步方案（欧拉前差、欧拉后差、赫恩格式），并分别在稳定（$sigma = 0.5$）和临界（$sigma = 1.0$）条件下进行试验：

#figure(
  table(
    columns: 7,
    align: center,
    stroke: none,
    table.hline(stroke: 1.5pt),
    table.header([工况], [$A_2$], [$B_2$], [$C$], [$Delta t$], [$sigma$], [$n t$]),
    table.hline(stroke: 0.75pt),
    [lf\_euler\_stable], [1.0], [0.0], [5.0], [2.0], [0.5], [60],
    [lf\_bwdeuler\_stable], [0.0], [1.0], [5.0], [2.0], [0.5], [60],
    [lf\_heun\_stable], [0.5], [0.5], [5.0], [2.0], [0.5], [60],
    table.hline(stroke: 0.75pt),
    [lf\_euler\_marginal], [1.0], [0.0], [5.0], [4.0], [1.0], [32],
    [lf\_bwdeuler\_marginal], [0.0], [1.0], [5.0], [4.0], [1.0], [32],
    [lf\_heun\_marginal], [0.5], [0.5], [5.0], [4.0], [1.0], [32],
    table.hline(stroke: 1.5pt),
  ),
  caption: [实验三（蛙跳格式）参数配置]
)

== 边界条件与初始化

程序采用*周期性边界条件*，即 $u(0, t) = u(L, t)$。在 Fortran 实现中，通过引入虚格点 $X_"temp"(0)$ 和 $X_"temp"(n x+1)$ 来实现：

- $X_"temp"(0) = X_"in"(n x)$（最左侧虚格点取最右侧实际格点值）
- $X_"temp"(n x+1) = X_"in"(1)$（最右侧虚格点取最左侧实际格点值）

= 结果与讨论

== 实验一：时间前差格式（FTCS）—— 绝对不稳定

#figure(
  image("数值天气预报/plot_ftcs_unstable_small.png", width: 100%),
  caption: [FTCS 小步长工况：$sigma = 0.5$，初始场、精确解与各时刻数值解]
)

在 $sigma = 0.5$ 的小步长工况下（#ref），不稳定增长相对缓慢。初始时刻数值解与精确解吻合，但随着时间推进，高频振荡逐渐显现，到 $t = 120$ 时（最终时刻）波形已出现明显的振荡噪声，波幅被放大（均方根从初始的 0.866 增大到最终的 1.227）。

#figure(
  image("数值天气预报/plot_ftcs_unstable_large.png", width: 100%),
  caption: [FTCS 大步长工况：$sigma = 1.5$，初始场、精确解与各时刻数值解（symlog 坐标）]
)

在 $sigma = 1.5$ 的大步长工况下（#ref），不稳定增长极快。仅到 $t/4 = 90$ 时刻，波幅已被放大至约 6 的量级，到 $t/2 = 180$ 时刻更是达到 $10^3$ 以上的量级。数值解完全被不稳定性噪声淹没，精确解信息丧失殆尽。

#figure(
  image("数值天气预报/compare_ftcs.png", width: 100%),
  caption: [FTCS 格式不同 CFL 数下的最终状态对比（symlog 坐标）]
)

对比两个工况可见（#ref），更大的 $sigma$ 导致更剧烈的不稳定增长速率。这与理论分析一致：$|G| = sqrt(1 + sigma^2 sin^2(k Delta x))$，$sigma$ 越大，放大因子越大，不稳定性增长越快。

== 实验二：时间梯形隐式格式（Crank-Nicolson）—— 无条件稳定

#figure(
  image("数值天气预报/plot_cn_sigma05.png", width: 100%),
  caption: [Crank-Nicolson 格式：$sigma = 0.5$，各时刻数值解与精确解吻合良好]
)

#figure(
  image("数值天气预报/plot_cn_sigma10.png", width: 100%),
  caption: [Crank-Nicolson 格式：$sigma = 1.0$（临界 CFL），格式依然稳定]
)

#figure(
  image("数值天气预报/plot_cn_sigma20.png", width: 100%),
  caption: [Crank-Nicolson 格式：$sigma = 2.0$（超 CFL），格式依然稳定]
)

#figure(
  image("数值天气预报/plot_cn_sigma40.png", width: 100%),
  caption: [Crank-Nicolson 格式：$sigma = 4.0$（远超 CFL），格式依然稳定]
)

从 #ref 至 #ref 可见，当 $sigma$ 从 0.5 增大到 4.0，Crank-Nicolson 格式在所有工况下均保持稳定。四个工况的均方根值始终保持在 0.8660（与精确解完全一致），说明该格式*无条件稳定*且*无振幅耗散*。

然而，需要指出的是，虽然 Crank-Nicolson 格式振幅守恒，但随着 $sigma$ 的增大，波形出现一定程度的*频散畸变*（波形相位误差），尤其在 $sigma = 4.0$ 时波形高波数部分的传播速度与精确解存在偏差。这是由于大 CFL 数下，时间截断误差增大所致。

#figure(
  image("数值天气预报/compare_cn.png", width: 100%),
  caption: [Crank-Nicolson 格式：不同 $sigma$ 值下最终状态的对比]
)

#ref 综合对比了四个 $sigma$ 值下的最终状态，所有数值解均保持稳定，波形振幅与精确解一致。与实验一中 FTCS 格式的结果形成鲜明对比。

== 实验三：时间中央差格式（蛙跳格式）—— 条件稳定及起步方案影响

=== 稳定工况（$sigma = 0.5$）

#figure(
  image("数值天气预报/plot_lf_euler_stable.png", width: 100%),
  caption: [蛙跳格式 + 欧拉起步（$A_2=1, B_2=0$），$sigma = 0.5$]
)

#figure(
  image("数值天气预报/plot_lf_bwdeuler_stable.png", width: 100%),
  caption: [蛙跳格式 + 欧拉后差起步（$A_2=0, B_2=1$），$sigma = 0.5$]
)

#figure(
  image("数值天气预报/plot_lf_heun_stable.png", width: 100%),
  caption: [蛙跳格式 + 赫恩起步（$A_2=0.5, B_2=0.5$），$sigma = 0.5$]
)

在 $sigma = 0.5$ 的稳定条件下（#ref 至 #ref），三种起步方案的蛙跳格式均保持稳定，但解的质量存在差异：

- 欧拉起步（$A_2=1$）的数值解均方根从 0.8660 略增至 0.8699，表现为*轻微振幅放大*。
- 欧拉后差起步（$A_2=0$）的数值解均方根从 0.8660 略减至 0.8621，表现为*轻微振幅衰减*。
- 赫恩起步（$A_2=0.5$）的数值解均方根保持在 0.8660，变化极小（最终 0.86604），几乎完美守恒。

#figure(
  image("数值天气预报/compare_lf_firststep_stable.png", width: 100%),
  caption: [蛙跳格式（$sigma = 0.5$）：三种起步方案最终状态对比]
)

#ref 清晰展示了三种起步方案的差异：赫恩起步最接近精确解，欧拉起步波幅略大，欧拉后差起步波幅略小。这说明在稳定条件下，起步格式的精度直接影响解的长期质量——*赫恩格式*作为二阶精度的预估-校正格式，能够提供最佳起步条件。

=== 临界工况（$sigma = 1.0$）

#figure(
  image("数值天气预报/plot_lf_euler_marginal.png", width: 100%),
  caption: [蛙跳格式 + 欧拉起步，$sigma = 1.0$（临界 CFL）]
)

#figure(
  image("数值天气预报/plot_lf_bwdeuler_marginal.png", width: 100%),
  caption: [蛙跳格式 + 欧拉后差起步，$sigma = 1.0$（临界 CFL）]
)

#figure(
  image("数值天气预报/plot_lf_heun_marginal.png", width: 100%),
  caption: [蛙跳格式 + 赫恩起步，$sigma = 1.0$（临界 CFL）]
)

在 $sigma = 1.0$ 的临界条件下（#ref 至 #ref），各方案的均方根出现不同程度的波动：

- 欧拉起步：均方根在 0.866～0.884 之间振荡
- 欧拉后差起步：均方根在 0.849～0.865 之间振荡
- 赫恩起步：均方根在 0.8660～0.8663 之间微小振荡，最稳定

三种方案均未发散（符合 $|sigma| <= 1$ 的稳定性判据），但赫恩起步的振幅波动最小。值得注意的是，$sigma = 1.0$ 时，在某些波数下 $|G| = 1$ 成立，但舍入误差和起步误差的共同作用会导致解的质量下降。

#figure(
  image("数值天气预报/compare_lf_firststep_marginal.png", width: 100%),
  caption: [蛙跳格式（$sigma = 1.0$）：三种起步方案最终状态对比]
)

== 三种时间积分格式综合对比

#figure(
  image("数值天气预报/summary_three_schemes.png", width: 100%),
  caption: [三种时间积分格式综合对比：(a) FTCS 前差格式——不稳定；(b) Crank-Nicolson 梯形隐式——无条件稳定；(c) 蛙跳格式 $sigma=0.5$——稳定，赫恩起步最优；(d) 蛙跳格式 $sigma=1.0$——临界稳定]
)

#figure(
  table(
    columns: 6,
    align: center,
    stroke: none,
    table.hline(stroke: 1.5pt),
    table.header([时间格式], [时间精度], [稳定性], [振幅特征], [$|G|$], [起步要求]),
    table.hline(stroke: 0.75pt),
    [前差（欧拉）], [一阶], [绝对不稳定], [振幅放大], [$|G| >= 1$], [无],
    [梯形隐式（CN）], [二阶], [无条件稳定], [振幅守恒], [$|G| = 1$], [无（需解三对角）],
    [中央差（蛙跳）], [二阶], [条件稳定 $|sigma| <= 1$], [振幅守恒], [$|G| = 1$（稳定时）], [需起步方案],
    table.hline(stroke: 1.5pt),
  ),
  caption: [三种时间积分格式的稳定性特征对比]
)

#ref 将所有关键结果汇总于一图。可以清楚地看到：(a) FTCS 格式在两个 $sigma$ 值下均发散；(b) Crank-Nicolson 格式在所有 $sigma$ 下均保持稳定且与解析解吻合；(c-d) 蛙跳格式在稳定和临界条件下，赫恩起步始终最优。

= 结论

本次实习通过数值试验系统对比了三种时间积分格式（前差 Euler、梯形隐式 Crank-Nicolson、中央差蛙跳 Leapfrog）在空间中央差离散下求解一维线性平流方程的稳定性特征。主要结论如下：

1. *时间前差格式（FTCS）*：理论与实践均证明该格式绝对不稳定。放大因子恒满足 $|G| >= 1$，数值解随时间指数增长而发散。$sigma$ 越大（时间步长越大），发散速率越快。该格式不能独立用于平流方程的求解。

2. *时间梯形隐式格式（Crank-Nicolson）*：无条件稳定，$|G| = 1$ 恒成立。数值试验验证了即使 $sigma$ 增大至 4.0，格式仍然保持振幅守恒。同时该格式具有时间二阶精度，是求解平流方程的优良方案。但需注意每步需求解三对角方程组，计算成本高于显式格式。此外，大 $sigma$ 下存在频散误差（相位失真）。

3. *时间中央差格式（蛙跳格式）*：条件稳定，稳定域为 $|sigma| <= 1$。在稳定域内格式无耗散（$|G| = 1$），但起步方案对解的质量影响显著。三种起步方案中：
   - 赫恩格式（$A_2 = B_2 = 0.5$）起步精度最高，振幅守恒最优
   - 欧拉前差起步导致轻微振幅放大
   - 欧拉后差起步导致轻微振幅衰减
   推荐使用*赫恩格式*作为蛙跳格式的起步方案。

4. *格式选择建议*：在实际数值天气预报模式中，平流项的离散化需兼顾稳定性、精度和计算效率。Crank-Nicolson 格式虽然无条件稳定且精度高，但隐式求解增加了计算量；蛙跳格式显式求解效率高，但需满足 CFL 条件且需注意起步方案的精度。两者的结合使用（如半隐式半拉格朗日方法）是现代业务模式的常用方案。


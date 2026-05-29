#import "../book.typ": book-page
#show: book-page.with(title: "NWP Practice Report 1")
#outline()



= 基本原理
1. 根据已有的空间前差和后差子程序，补充完整的空间中央差格式子程序；
2. 使用时间前差格式，分别结合空间前差、空间后差和空间中央差三种格式，通过改变相速度（波速 $C$）、空间格距 $Delta x$ 或时间步长 $Delta t$，绘制不同工况下的模拟结果，直观展示稳定与不稳定情形；
3. 理解各格式稳定性的条件（CFL条件），并分析其数值频散与耗散特征。

== 控制方程

考虑一维线性平流方程：

$
  (dif u) / (dif t) + C (dif u) / (dif x) = 0
$

其中 $u(x, t)$ 为所关注的物理量场，$C$ 为相速度（常波速）。该方程描述了一个以恒定速度 $C$ 传播的波形，其精确解为 $u(x, t) = u_0(x - C t)$，即初始波形沿 $x$ 方向以速度 $C$ 无衰减、无形变地平移。

当 $C > 0$ 时，波动向 $x$ 正方向传播；当 $C < 0$ 时，波动向 $x$ 负方向传播。

== 时间离散

采用 *时间前差格式*（Forward Time），即对时间导数采用一阶向前差分近似：

$
  (dif u) / (dif t) approx (u_i^(n+1) - u_i^(n)) / (Delta t)
$

其中下标 $i$ 表示空间格点索引，上标 $n$ 表示时间层索引。将平流方程的时间导数替换为前差近似，得到显式时间递推格式：

$
  u_i^(n+1) = u_i^(n) - (C Delta t) / (Delta x) dot D_x(u^n)
$

式中 $D_x(u^n)$ 表示空间导数的差分近似算子。



== 空间前差格式（Forward Space，FTFS）

空间导数采用一阶向前差分近似：

$
  (dif u) / (dif x) approx (u_(i+1)^n - u_i^n) / (Delta x)
$

代入时间递推公式得：

$
  u_i^(n+1) = u_i^n - (C Delta t) / (Delta x) (u_(i+1)^n - u_i^n)
$

令 $sigma = C Delta t / Delta x$ 为 CFL 数，则：

$
  u_i^(n+1) = (1 + sigma) u_i^n - sigma u_(i+1)^n
$

利用 von Neumann 稳定性分析方法，设 $u_i^n = lambda^n e^(i k x_i)$（$i = sqrt(-1)$，$k$ 为波数），代入得放大因子：

$
  G = 1 - sigma(e^(i k Delta x) - 1)
$

其模平方为：

$
  |G|^2 = 1 + 2 sigma (1 + sigma)(cos k Delta x - 1)
$

由于 $cos k Delta x - 1 <= 0$，当且仅当 $1 + sigma >= 0$ 时 $|G|^2 <= 1$。因此 FTFS 格式的稳定性条件为：

$
  -1 <= sigma <= 0
$

即 *$C <= 0$*（波速必须为非正）。当 $C < 0$（波向负方向传播）且 $|C| Delta t / Delta x <= 1$ 时格式稳定；当 $C > 0$ 时格式绝对不稳定。

== 空间后差格式（Backward Space，FTBS）

空间导数采用一阶向后差分近似：

$
  (dif u) / (dif x) approx (u_i^n - u_(i-1)^n) / (Delta x)
$

代入时间递推公式得：

$
  u_i^(n+1) = u_i^n - (C Delta t) / (Delta x) (u_i^n - u_(i-1)^n)
$

即：

$
  u_i^(n+1) = (1 - sigma) u_i^n + sigma u_(i-1)^n
$

von Neumann 分析得放大因子：

$
  G = 1 - sigma(1 - e^(-i k Delta x))
$

其模平方为：

$
  |G|^2 = 1 - 2 sigma (1 - sigma)(1 - cos k Delta x)
$

由于 $1 - cos k Delta x >= 0$，当且仅当 $1 - sigma >= 0$ 时 $|G|^2 <= 1$。因此 FTBS 格式的稳定性条件为：

$
  0 <= sigma <= 1
$

即 *$C >= 0$* 且 $C Delta t / Delta x <= 1$。当 $C > 0$（波向正方向传播）且 CFL 数不超过 1 时格式稳定；当 $C < 0$ 或 $sigma > 1$ 时格式不稳定。

FTFS 和 FTBS 格式体现了 *迎风格式* 的思想：差分方向应沿着信息的来流方向。当波速为正，信息从上游（左侧）传来，应使用后差格式（向后看上游）；当波速为负，信息从上游（右侧）传来，应使用前差格式。

== 空间中央差格式（Central Space，FTCS）

空间导数采用二阶中心差分近似：

$
  (dif u) / (dif x) approx (u_(i+1)^n - u_(i-1)^n) / (2 Delta x)
$

代入时间递推公式得：

$
  u_i^(n+1) = u_i^n - (C Delta t) / (2 Delta x) (u_(i+1)^n - u_(i-1)^n)
$

即：

$
  u_i^(n+1) = u_i^n - sigma / 2 (u_(i+1)^n - u_(i-1)^n)
$

von Neumann 分析得放大因子：

$
  G = 1 - i sigma sin(k Delta x)
$

其模平方恒有：

$
  |G|^2 = 1 + sigma^2 sin^2(k Delta x)
$

由于 $sigma^2 sin^2(k Delta x) >= 0$，恒有 $|G|^2 >= 1$，且除 $sin(k Delta x) = 0$ 的情形外严格大于 1。因此 FTCS 格式是 *绝对不稳定* 的，无论如何调整 $Delta t$ 或 $Delta x$ 都无法使格式稳定。

== 数值频散与耗散

在数值求解平流方程时，不同的差分格式会引入数值误差，主要表现为：(1) *数值耗散*：由于差分格式的截断误差中含有偶数阶导数项，导致波幅衰减。FTBS/FTFS 格式具有一阶精度，截断误差主导项为 $O(Delta t, Delta x)$ 的二阶导数项，表现出较强耗散性。(2) *数值频散*：由于截断误差中的奇数阶导数项导致不同波数分量的相速度不同，使波形发生畸变。FTCS 格式虽具有二阶空间精度（截断误差 $O(Delta t, Delta x^2)$），但时间为一阶，且无条件不稳定。

= 数值试验设计

== 试验参数设置

本实验在一维周期性边界条件下进行，计算域共 $n x = 50$ 个格点。初始场设定为：

$
  u_0(x) = 0.5 + sin((4 pi x) / L)
$

其中 $L = n x dot Delta x$ 为计算域总长度。精确解为该初始波形以速度 $C$ 在周期域中平移。

实验共设置 6 个工况，分别对应三种空间差分格式在稳定与不稳定参数下的表现：

#figure(
  table(
    columns: 7,
    align: center,
    stroke: none,
    table.hline(stroke: 1.5pt),
    table.header([工况], [格式], [$C$], [$Delta x$], [$Delta t$], [$sigma$], [时间步数 $n t$]),
    table.hline(stroke: 0.75pt),
    [ftfs_stable], [FTFS], [-2.0], [20.0], [2.0], [-0.2], [60],
    [ftfs_unstable], [FTFS], [2.0], [20.0], [2.0], [0.2], [60],
    [ftbs_stable], [FTBS], [5.0], [20.0], [2.0], [0.5], [60],
    [ftbs_unstable], [FTBS], [5.0], [20.0], [4.8], [1.2], [60],
    [ftcs_unstable_small], [FTCS], [5.0], [20.0], [2.0], [0.5], [60],
    [ftcs_unstable_large], [FTCS], [5.0], [20.0], [6.0], [1.5], [60],
    table.hline(stroke: 1.5pt),
  ),
  caption: [数值试验参数配置]
)

== 边界条件与初始化

程序采用 *周期性边界条件*，即 $u(0, t) = u(L, t)$。在 Fortran 实现中，通过引入虚格点 $X_"temp"(0)$ 和 $X_"temp"(n x+1)$ 来实现：

- $X_"temp"(0) = X_"in"(n x)$（最左侧虚格点取最右侧实际格点值）
- $X_"temp"(n x+1) = X_"in"(1)$（最右侧虚格点取最左侧实际格点值）


= 结果与讨论

== FTFS 格式（时间前差 + 空间前差）

FTFS 格式在 $C = -2.0$、$Delta x = 20.0$、$Delta t = 2.0$（$sigma = -0.2$）时满足稳定性条件 $-1 <= sigma <= 0$，数值解稳定传播。

#figure(
  image("数值天气预报/plot_ftfs_stable.png", width: 100%),
  caption: [FTFS 稳定工况：$C = -2.0$，$sigma = -0.2$，初始场与最终时刻对比]
)

由图可见，稳定工况下数值解能够较好地跟随精确解的平移，波形基本保持完整，但存在一定程度的幅值衰减（数值耗散），这是由于 FTFS 格式仅具有一阶空间精度所导致的。

#figure(
  image("数值天气预报/plot_ftfs_unstable.png", width: 100%),
  caption: [FTFS 不稳定工况：$C = 2.0$，$sigma = 0.2$，初始场与最终时刻对比]
)

当 $C$ 改为正值（$C = 2.0$，$sigma = 0.2$）后，格式不再满足稳定性条件。从图中可以看到，数值解迅速发散，波形完全失真，模拟值与精确解差异巨大，最终时刻的波幅远超合理范围。这验证了 FTFS 格式仅适用于波速为负（$C <= 0$）的情形。

#figure(
  image("数值天气预报/compare_ftfs.png", width: 100%),
  caption: [FTFS 格式稳定与不稳定工况最终状态对比（symlog 坐标）]
)

== FTBS 格式（时间前差 + 空间后差）

FTBS 格式在 $C = 5.0$、$Delta x = 20.0$、$Delta t = 2.0$（$sigma = 0.5$）时满足稳定性条件 $0 <= sigma <= 1$，数值解稳定。

#figure(
  image("数值天气预报/plot_ftbs_stable.png", width: 100%),
  caption: [FTBS 稳定工况：$C = 5.0$，$sigma = 0.5$，初始场与最终时刻对比]
)

稳定工况下，尽管波速较大，但模拟波形仍能较好地追踪精确解的位置，波形保持稳定。与 FTFS 类似，一阶精度的空间后差格式同样存在数值耗散，波幅有所衰减。

#figure(
  image("数值天气预报/plot_ftbs_unstable.png", width: 100%),
  caption: [FTBS 不稳定工况：$C = 5.0$，$sigma = 1.2$，初始场与最终时刻对比]
)

当增大时间步长使 $sigma = 1.2 > 1$ 时（$Delta t = 4.8$），CFL 条件被破坏。数值解在计算域内产生剧烈振荡，波幅被大幅度放大，精确解与模拟值几乎完全脱节。这验证了 FTBS 格式稳定的必要条件是 $0 <= sigma <= 1$。

#figure(
  image("数值天气预报/compare_ftbs.png", width: 100%),
  caption: [FTBS 格式稳定与不稳定工况最终状态对比（symlog 坐标）]
)

== FTCS 格式（时间前差 + 空间中央差）

根据理论分析，FTCS 格式无条件不稳定。以下两个工况分别以较小的 $sigma = 0.5$ 和较大的 $sigma = 1.5$ 进行验证。

#figure(
  image("数值天气预报/plot_ftcs_unstable_small.png", width: 100%),
  caption: [FTCS 小步长工况：$C = 5.0$，$sigma = 0.5$，初始场与最终时刻对比]
)

#figure(
  image("数值天气预报/plot_ftcs_unstable_large.png", width: 100%),
  caption: [FTCS 大步长工况：$C = 5.0$，$sigma = 1.5$，初始场与最终时刻对比]
)

两个工况的数值解均出现了显著的不稳定现象：
- 在 $sigma = 0.5$ 的小步长工况下，不稳定增长相对缓慢，但最终时刻（$t = 120$）波形已出现明显的高频振荡噪声，波幅被放大；
- 在 $sigma = 1.5$ 的大步长工况下，不稳定增长极快，最终时刻的数值解量级已达 $10^8$，完全淹没真实波形。

#figure(
  image("数值天气预报/compare_ftcs.png", width: 100%),
  caption: [FTCS 格式不同 CFL 数下的不稳定增长对比（symlog 坐标）]
)

对比两个工况可见，更大的 CFL 数导致更剧烈的不稳定增长速率。这与理论分析一致：放大因子 $|G| = sqrt(1 + sigma^2 sin^2(k Delta x))$ 表明 $sigma$ 越大，高频分量的放大倍数越大。

== 三种格式稳定性对比小结

#figure(
  table(
    columns: 5,
    align: center,
    stroke: none,
    table.hline(stroke: 1.5pt),
    table.header([格式], [空间精度], [稳定性条件], [稳定工况 CFL], [数值特征]),
    table.hline(stroke: 0.75pt),
    [FTFS], [一阶], [$ -1 <= sigma <= 0 $（迎风，$C <= 0$）], [$sigma = -0.2$], [稳定，有耗散],
    [FTBS], [一阶], [$ 0 <= sigma <= 1 $（迎风，$C >= 0$）], [$sigma = 0.5$], [稳定，有耗散],
    [FTCS], [二阶（空间）], [恒不稳定], [—], [无条件不稳定],
    table.hline(stroke: 1.5pt),
  ),
  caption: [三种空间差分格式稳定性对比]
)

FTFS 和 FTBS 格式均为 *条件稳定* 格式，其稳定性取决于 CFL 数 $sigma = C Delta t / Delta x$ 是否落入稳定域。两者的稳定域互补——FTFS 适用于 $C <= 0$（波动向负方向传播），FTBS 适用于 $C >= 0$（波动向正方向传播），这一性质体现了迎风差分的物理本质。

FTCS 格式虽然具有二阶空间精度（截断误差含 $O(Delta x^2)$ 项，理论上空间分辨率更优），但由于时间离散仅为一阶前差，整个格式无条件不稳定，在实际应用中通常需要配合其他时间积分方案（如蛙跳格式、Runge-Kutta 法等）使用。

= 结论

本次实习通过数值试验系统对比了三种空间差分格式（前差 FTFS、后差 FTBS、中央差 FTCS）在求解一维线性平流方程时的稳定性特征，主要结论如下：

1. *FTFS 格式*（时间前差 + 空间前差）：当 $C <= 0$ 且 $|sigma| <= 1$ 时稳定。该格式适用于波动向负方向传播的情形。$C > 0$ 时格式绝对不稳定。

2. *FTBS 格式*（时间前差 + 空间后差）：当 $C >= 0$ 且 $sigma <= 1$ 时稳定。该格式适用于波动向正方向传播的情形。$sigma > 1$ 或 $C < 0$ 时格式不稳定。

3. *FTCS 格式*（时间前差 + 空间中央差）：理论上无条件不稳定，无论如何调整 $Delta t$ 和 $Delta x$ 的值，数值解均会随时间增长而发散。数值试验结果充分验证了这一理论结论。

4. *迎风格式的物理意义*：FTFS 和 FTBS 各自仅在一个传播方向上稳定，其本质是差分方向必须与信息传播方向（特征线方向）一致。这一原则在数值天气预报的平流项离散化中具有重要指导意义。

5. *CFL 条件的作用*：对于条件稳定的格式（FTFS、FTBS），不仅需要差分方向正确，还必须满足 CFL 数落在稳定域内（$|sigma| <= 1$），即时间步长不能超过波动穿越一个空间格距所需的时间。

上述结果为理解和选择数值天气预报模式中的平流项离散方案提供了理论基础，也说明了在实际应用中为何常采用半拉格朗日方法或高阶迎风格式来兼顾稳定性与精度。


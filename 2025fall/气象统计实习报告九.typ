#import "../book.typ": book-page
#show: book-page.with(title: "MS Practice Report 9")
#outline()

= 冬季海温 EOF 分析
针对 1981~2010 年冬季（DJF）30S~30N HadISST 海温距平资料，提取前三个特征向量及其时间系数，分析主要时空模态。
== 数据与分析方法


EOF 原理：设$f(x)_t$ 为第$t$年的网格距平向量，协方差矩阵
$
  C = 1/(n - 1) sum_t (upright(bold(x))_t - overline(upright(bold(x))))(upright(bold(x))_t - overline(upright(bold(x))))^sans(T)
$
求特征方程
$
  C upright(bold(e))_k = lambda_k upright(bold(e))_k

$
得空间特征向量 $upright(bold(e))_k$，对应解释方差 $lambda_k$。时间系数（PC）为
$
  a_(k, t) = upright(bold(e))_k^sans(T) (upright(bold(x))_t - overline(upright(bold(x))))
$
表示第 $k$ 模态在第 $t$ 年的强度。EOF 模式互相正交，能以最少的模态表示最大方差。


== EOF 结果
#figure(
  image("winter_eof_summary.png"),
  caption: "图 1. DJF 海温 EOF1–3 空间模态与时间系数",
)

== 结果与讨论
+ EOF1（53.5% 方差）：呈典型东太平洋单极增暖/降温结构，PC1 在 1982/83、1997/98、2009/10 等年偏正，对应厄尔尼诺事件；负位相（如 1988/89、1998/99）反映拉尼娜冷事件。说明 ENSO 是该区域冬季海温距平的主导变率源。
+ EOF2（10.2%）：显示中太平洋与东太平洋的偶极型，突出 CP-El Niño/Modoki 模式。当 PC2 为正（1991/92、2002/03）时，中太平洋暖异常强而东部反号；负值反映传统 EP 型。此模态解释了 ENSO 类型转换。
+ EOF3（5.5%）：特征在西太平洋和南北半球存在相反信号，可能涉及季风—海气耦合或印度洋-太平洋桥效应。PC3 变化更频繁，表明其代表较高频或区域性振荡，需要结合大气环流资料进一步确认。
+ PC 柱状图的红蓝配色帮助定位暖冷位相交替；PC1 与观测 ENSO 年份吻合度高，PC2/PC3 幅度较小但揭示了次一级的结构。空间等值线强调了异常中心与梯度，便于描述海温跃变区域。

== 结论
冬季 30S~30N 海温距平的主要方差由厄尔尼诺型模态控制，中太平洋调制型及更局地的模态次之。EOF 提供了紧凑的时空分解，使得对异常事件的识别与解释更直观。后续可结合显著性检验、旋转 EOF 或与 SOI、PDO 等指数的回归，深入探讨不同模态的物理成因与对区域气候的影响。

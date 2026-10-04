#import "../book.typ": book-page
#show: book-page.with(title: "相关与自相关")
#outline()

= 气温序列的相关与自相关

== 资料介绍
资料包含 1970—1989 年的 20 组年平均气温与冬季平均气温等级值。每一列对应同一年，计算时按照年份配对。题目提供的是等级值，以下分析沿用这些数值，不另行换算为气温单位。

本次实习计算两种关系。相关系数描述两个序列在同一年是否共同变化；自相关系数描述同一个序列相隔若干年后的关系。计算任务包括：
1. 计算两个气温之间的相关系数。
2. 分别找出两个气温数据自相关系数绝对值最大的滞后时间长度。（滞后长度T最大取10）
3. 自己制作X、Y两个时间序列（Y=X），验证相关系数是否为1.
4. 自己制作X、Y两个时间序列（Y=-X），验证相关系数是否为-1.


== 数据表
#figure(
  [
    #table(
      columns: 11,
      align: center + horizon,
      stroke: .5pt,

      table.hline(),
      [年份], table.cell(colspan: 10, align: center)[年平均气温],
      table.hline(),
      [1970-1979], [3.40], [3.30], [3.20], [2.90], [3.40], [2.80], [3.60], [3.00], [2.80], [3.00],
      [1980-1989], [3.10], [3.00], [2.90], [2.70], [3.50], [3.20], [3.10], [2.80], [2.90], [2.90],
      table.hline(),
    )
    #v(2em)
    #table(
      columns: 11,
      align: center + horizon,
      stroke: .5pt,
      [年份], table.cell(colspan: 10, align: center)[冬季平均气温],
      table.hline(),
      [1970-1979], [3.24], [3.14], [3.26], [2.38], [3.32], [2.71], [2.84], [3.94], [2.75], [1.83],
      [1980-1989], [2.80], [2.81], [2.63], [3.20], [3.60], [3.40], [3.07], [1.87], [2.63], [2.47],
      table.hline(),
    )
  ],
  caption: "中国1970～1989年年平均和冬季平均气温数据"
)

== 计算方法

=== Pearson 相关系数
$
  r = (sum_(i=1)^n (x_i-overline(x))(y_i-overline(y))) /
    sqrt((sum_(i=1)^n (x_i-overline(x))^2)(sum_(i=1)^n (y_i-overline(y))^2))
$
分子计算两个序列共同变化的方向，分母消除各自数值尺度的影响。正值表示同向变化，负值表示反向变化。序列必须具有相同长度，且每个序列都需要存在变化；常数序列的相关系数没有定义。

=== 自相关系数

本报告采用全序列均值和固定分母，计算滞后 $tau$ 年的自相关：
$
  r(tau) = (sum_(i=1)^(n-tau) (x_i-overline(x))(x_(i+tau)-overline(x))) /
    (sum_(i=1)^n (x_i-overline(x))^2)
$
滞后为零时，分子与分母相同，结果为 1。随着滞后增加，参加计算的数据对数由 $n$ 减少为 $n-tau$。本题最大滞后为 10 年，届时只有 10 对数据。

若协方差使用 $n-tau$ 作分母、方差使用 $n$ 作分母，相应结果需要再乘以 $n/(n-tau)$。两种定义的数值不同，报告和程序需要使用一致的定义。这里保留固定分母的结果，便于直接核对程序。

== Python 实现
#show raw: set par(leading: 0.7em)
```python
import math

def corr(x, y):
    n = len(x)
    if n != len(y) or n < 2:
        raise ValueError("Sequences must have equal length >= 2")
    if not all(math.isfinite(v) for v in (*x, *y)):
        raise ValueError("All observations must be finite")
    mx = sum(x) / n
    my = sum(y) / n
    num = sum((xi - mx) * (yi - my) for xi, yi in zip(x, y))
    denx = sum((xi - mx) ** 2 for xi in x)
    deny = sum((yi - my) ** 2 for yi in y)
    if denx == 0 or deny == 0:
        raise ValueError("Correlation requires nonconstant sequences")
    return num / math.sqrt(denx * deny)

def ac(x, L):
    n = len(x)
    if not isinstance(L, int) or not 1 <= L < n:
        raise ValueError("Lag must be an integer between 1 and n - 1")
    if not all(math.isfinite(v) for v in x):
        raise ValueError("All observations must be finite")
    m = sum(x) / n
    den = sum((v - m) ** 2 for v in x)
    if den == 0:
        raise ValueError("Autocorrelation requires a nonconstant sequence")
    r = []
    for k in range(1, L + 1):
        num = 0.0
        for t in range(k, n):
            num += (x[t] - m) * (x[t - k] - m)
        r.append(num / den)
    return r
```
== 计算结果

按数据表复算，年平均气温等级值的均值为 3.0750，冬季平均气温等级值的均值为 2.8945，两者的 Pearson 相关系数为 0.4685。

#table(
  columns: 3,
  align: center,
  [滞后年数], [年平均气温自相关], [冬季平均气温自相关],
  table.hline(),
  [1], [-0.1317], [0.1054],
  [2], [0.0507], [-0.1895],
  [3], [-0.2242], [-0.0919],
  [4], [0.1213], [-0.2942],
  [5], [0.0969], [-0.2441],
  [6], [0.0706], [0.0777],
  [7], [-0.2420], [0.1302],
  [8], [0.1531], [0.2158],
  [9], [-0.0701], [0.0640],
  [10], [0.1859], [-0.1302],
)

在 1—10 年的搜索范围内，年平均气温自相关绝对值最大的位置为 7 年，冬季平均气温为 4 年，两者均为负相关。这里选择的是绝对值最大的位置，需要同时报告相关符号。

== 如何理解这些数值

$r=0.4685$ 表示年平均气温与冬季平均气温有一定的同向线性关系。冬季本身参与年平均值的计算，两者在统计上存在共同组成部分，因此解释这项相关时需要考虑这一关系。

自相关最大的滞后年数只描述本次样本中的极值位置。样本只有 20 年，同时搜索了 10 个滞后，不能仅凭 7 年或 4 年处的负值确定气候周期。若要讨论周期，还需要更长序列及相应的检验。

将任意具有变化的序列分别与自身及其相反数配对，可以得到 $r(X,X)=1$ 和 $r(X,-X)=-1$。这两项核查分别检查相关符号和归一化计算。

自相关定义参考 #link("https://www.itl.nist.gov/div898/handbook/eda/section3/eda35c.htm")[NIST Autocorrelation]。

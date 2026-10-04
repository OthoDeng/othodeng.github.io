#import "../book.typ": book-page
#show: book-page.with(title: "滞后相关与偏相关")
#outline()

= 冬季月平均气温的滞后相关与偏相关

== 资料介绍
本题使用北京冬季 12 月、1 月和 2 月气温序列，考察不同月份的联系。计算前需要按照同一个冬季整理资料，例如 12 月和次年 1、2 月应属于同一行。冬季编号的规则决定了零滞后对应哪些观测。

计算包括 12 月与 1 月、12 月与 2 月的滞后相关，最大滞后取 10；随后控制第三个月份的线性关系，计算 偏相关。这里的滞后单位为冬季样本的时间间隔，若每行对应一个冬季，滞后 1 表示相隔一个冬季。


== 公式
#figure(
  $
    r_(x y)(tau)
    = (sum_(i=1)^(n-tau) (x_i-overline(x)_tau)(y_(i+tau)-overline(y)_tau)) /
      sqrt((sum_(i=1)^(n-tau) (x_i-overline(x)_tau)^2)
        (sum_(i=1)^(n-tau) (y_(i+tau)-overline(y)_tau)^2))
  $
)

对每个滞后分别截取 $x_1,dots,x_(n-tau)$ 和 $y_(1+tau),dots,y_n$，重新计算这两段序列的均值。正滞后按照 $x_i$ 与 $y_(i+tau)$ 配对，因此交换两个序列时需要同时注意时间方向。

设第三个序列为 $z$，偏相关 的公式为
$
  r_(x y | z) = (r_(x y)-r_(x z)r_(y z)) /
    sqrt((1-r_(x z)^2)(1-r_(y z)^2))
$
它等价于分别用 $z$ 对 $x$ 和 $y$ 做含截距的一元回归，再计算两组残差的相关系数。这种处理扣除了两个序列各自与 $z$ 的线性联系。

== 结果
#table(
  columns: 12,
  align: (left, center, center, center, center, center, center, center, center, center, center, center),
  [$tau$], [$0$], [$1$], [$2$], [$3$], [$4$], [$5$], [$6$], [$7$], [$8$], [$9$], [$10$],
  table.hline(),
  [$r_("12", "1")$], [$0.35$], [$-0.06$], [$0.39$], [$-0.01$], [$-0.01$], [$0.07$], [$-0.23$], [$-0.26$], [$-0.26$], [$0.02$], [$0.03$],
  [$r_("12", "2")$], [$0.24$], [$0.15$], [$0.34$], [$0.06$], [$-0.07$], [$-0.37$], [$-0.23$], [$0.08$], [$-0.21$], [$-0.04$], [$-0.16$],
)

#table(
  columns: 3,
  align: (center, center, center),
  [$rho$], [$rho_("12", "1" | "2")$], [$rho_("12", "2" | "1")$],
  table.hline(),
  [结果], [$0.3268$], [$0.2034$],
)

== Python 函数
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
    sx = sum((a - mx) ** 2 for a in x)
    sy = sum((b - my) ** 2 for b in y)
    cov = sum((a - mx) * (b - my) for a, b in zip(x, y))
    if sx == 0 or sy == 0:
        raise ValueError("Correlation requires nonconstant sequences")
    return cov / math.sqrt(sx * sy)

def xcorr(x, y, m=10):
    n = len(x)
    if n != len(y) or not isinstance(m, int) or not 0 <= m <= n - 2:
        raise ValueError("Equal lengths and at least two pairs per lag are required")
    return [corr(x[:n - t], y[t:n]) for t in range(m + 1)]

def pcorr(x, y, z):
    rxy = corr(x, y)
    rxz = corr(x, z)
    ryz = corr(y, z)
    den = (1 - rxz * rxz) * (1 - ryz * ryz)
    if den <= 0:
        raise ValueError("Control-variable residual variance must be positive")
    return (rxy - rxz * ryz) / math.sqrt(den)

```

== 结果解释

零滞后时，12 月与 1 月的相关系数为 0.35，12 月与 2 月为 0.24。两组序列在滞后 2 处分别达到 0.39 和 0.34；12 月与 2 月在滞后 5 处为 −0.37。相关符号随滞后改变，显示不同时间配对给出了不同的关系。

控制 2 月后，12 月与 1 月的 偏相关 为 0.3268；控制 1 月后，12 月与 2 月为 0.2034。两项结果均保留了正号。表中的普通相关系数只保留两位小数，因此不能用这些经过取整的数值精确反算四位小数的偏相关。

滞后相关需要同时检查有效样本数。滞后越长，计算使用的年份越少，对个别异常冬季也越敏感。这里没有提供原始逐年资料、完整样本量及显著性检验结果，因此表中的最大相关只用于描述样本，尚不能据此判断预报能力。

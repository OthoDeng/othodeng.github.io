#import "../book.typ": book-page
#show: book-page.with(title: "MS Practice Report 2")
#outline()

= 算给定数据的落后交叉相关系数和偏相关系数

== 资料介绍
根据下表北京冬季（12月～2月）气温资料计算：
1. 12月气温与1月和2月气温的落后交叉相关系数（滞后长度$tau$最大取10）
2. 偏相关系数。


== 公式
#figure(
  $
    r_(x y)(tau)
    = 1/(n-tau) sum_(i=1)^(n-tau) ((x_i - overline(x))(y_(i+tau) - overline(y)))/(sigma_x sigma_y)
  $
)

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
def corr(x, y):
    n = min(len(x), len(y))
    x, y = x[:n], y[:n]
    mx = sum(x) / n
    my = sum(y) / n
    sx = sum((a - mx) ** 2 for a in x)
    sy = sum((b - my) ** 2 for b in y)
    cov = sum((a - mx) * (b - my) for a, b in zip(x, y))
    return cov / math.sqrt(sx * sy) if sx > 0 and sy > 0 else float("nan")

def xcorr(x, y, m=10):
    n = min(len(x), len(y))
    return [corr(x[:n - t], y[t:n]) if n - t >= 2 else float("nan") for t in range(m + 1)]

def pcorr(x, y, z):
    rxy = corr(x, y)
    rxz = corr(x, z)
    ryz = corr(y, z)
    den = math.sqrt((1 - rxz * rxz) * (1 - ryz * ryz))
    return (rxy - rxz * ryz) / den if den != 0 else float("nan")

```

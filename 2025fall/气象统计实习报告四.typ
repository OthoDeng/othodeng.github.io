#import "../book.typ": book-page
#show: book-page.with(title: "MS Practice Report 4")
#outline()

= 环流指标与气温的线性回归
利用下表数据，以环流指标为预报因子，气温为预报量，计算气温和环流指标之间的一元线性回归方程，并对回归方程进行检验。

== 关键python代码
计算回归系数
```python
sxx = sum((x - mx) ** 2 for x in circ)
syy = sum((y - my) ** 2 for y in temp)
sxy = sum((x - mx) * (y - my) for x, y in zip(circ, temp))

b = sxy / sxx
a = my - b * mx
r = sxy / (sxx * syy) ** 0.5
```

回归平方和与残差平方和
```python
ssr_reg = sxy ** 2 / sxx  # 回归平方和
ssr_res = syy - ssr_reg   # 残差平方和
```

F检验
```python
msr = ssr_reg / 1
mse = ssr_res / (n - 2)
f_stat = msr / mse
```


== 结果
#figure(
table(
  columns: 2,
  align: (left, right),
  stroke: 0.5pt,
  inset: 6pt,
  [
    回归方程
  ], [
    $hat(y) = 7.51 - 0.23x$
  ],
  [
    相关系数 $r$
  ], [
    $-0.7289$
  ],
  [
    决定系数 $R^2$
  ], [
    $0.5313$
  ],
  [
    回归平方和 $italic("SS")_r$
  ], [
    $30.8795$
  ],
  [
    残差平方和 $italic("SS")_e$
  ], [
    $27.2405$
  ],
  [
    总平方和 $italic("SS")_t$
  ], [
    $58.1200$
  ],
  [
    F统计量
  ], [
    $20.40$
  ],
  [
    F临界值 $F(1,18,0.05)$
  ], [
    $4.41$
  ],
)
)
结论：
  $F=20.40 > F_alpha=4.41$，回归方程显著,程序截图见附录。

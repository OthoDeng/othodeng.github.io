#import "../book.typ": book-page
#show: book-page.with(title: "MS Practice Report 3")
#outline()

= 验证一元线性回归子程序
自己制作X、Y两个时间序列($y = 10 + 0.5x$)，验证一元线性回归子程序算出的系数是10和0.5.
相关

== 关键python代码
计算斜率和截距
```Python
sxx = sum((x - mx) ** 2 for x in X)
sxy = sum((x - mx) * (y - my) for x, y in zip(X, Y))
b = sxy / sxx
a = my - b * mx
```
 计算相关系数
```python
syy = sum((y - my) ** 2 for y in Y)
r = sxy / (sxx * syy) ** 0.5
```
生成随机数：
```Python
import random
random.seed(42)
```

== 结果
#figure(
table(
  columns: 3,
  align: (left, center, right),
  stroke: .5pt,
  inset: 6pt,
  [项目], [估计值], [理论值],
  table.hline(),
  [回归方程], [$Y = 10.00 + 0.500 X$], [$Y = 10 + 0.5 X$],
  [截距 $a$], [$10.0000$], [$10.0000$],
  [斜率 $b$], [$0.5000$], [$0.5000$],
  [相关系数 $r$], [$1.0000$], [$1.0000$],
  [决定系数 $R^2$], [$1.0000$], [$1.0000$],
)
)

验证结果：计算出的系数确实是 10 和 0.5, 相关系数为 1.0，程序截图见附录.

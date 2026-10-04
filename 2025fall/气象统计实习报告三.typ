#import "../book.typ": book-page
#show: book-page.with(title: "一元回归程序验证")
#outline()

= 验证一元线性回归子程序
本题给定 $y=10+0.5x$，用已知关系构造两组序列，再检查回归程序是否能够恢复截距 10 和斜率 0.5。样本中没有加入随机误差，因而所有点都应位于同一条直线上。

== 最小二乘计算

对模型 $hat(y)_i=a+b x_i$，最小二乘法选择使残差平方和 $sum_i (y_i-hat(y)_i)^2$ 最小的 $a$ 和 $b$。令
$
  S_(x x)=sum_i (x_i-overline(x))^2, quad
  S_(x y)=sum_i (x_i-overline(x))(y_i-overline(y))
$
则 $b=S_(x y)/S_(x x)$，$a=overline(y)-b overline(x)$。需要 $S_(x x)>0$，因此用于验证的 $X$ 必须具有变化。

== 可运行的验证代码
```python
import numpy as np

X = np.arange(1.0, 21.0)
Y = 10 + 0.5 * X
mx = X.mean()
my = Y.mean()
sxx = sum((x - mx) ** 2 for x in X)
sxy = sum((x - mx) * (y - my) for x, y in zip(X, Y))
b = sxy / sxx
a = my - b * mx
syy = sum((y - my) ** 2 for y in Y)
r = sxy / (sxx * syy) ** 0.5
residuals = Y - (a + b * X)
np.testing.assert_allclose([a, b, r], [10, 0.5, 1], atol=1e-12)
np.testing.assert_allclose(residuals, 0, atol=1e-12)
np.testing.assert_allclose(residuals.sum(), 0, atol=1e-12)
print(a, b, r)
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

== 程序核查的范围

这组数据恢复了理论截距与斜率，残差在数值精度范围内为零。含截距的最小二乘回归还满足残差和为零、残差与 $X$ 的内积为零；这两项性质可以检查截距和斜率是否使用了相同的样本。

由于 $Y$ 完全由 $X$ 决定，$r=1$、$R^2=1$ 是数据构造的直接结果。这项实习检查计算公式和程序实现。对气象观测建立回归时，仍需检验残差、异常观测和预报误差，不能由本题推断实际资料也能得到同样的拟合程度。

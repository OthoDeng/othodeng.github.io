#import "../book.typ": book-page
#show: book-page.with(title: "多元回归程序验证")
#outline()

= 多元线性回归子程序验证
利用指定关系 $Y(t)=10+4X_1(t)+X_2(t)-5X_3(t)$ 构造时间序列，检查程序是否能够恢复四个已知系数。三个解释变量需要提供不同的信息；若某个变量可以由其余变量和截距项精确表示，回归系数就不能唯一确定。
== 原理
构造截距项与三个时间序列组成的矩阵 $X=[bold(1),X_1,X_2,X_3]$。根据普通最小二乘法，
系数向量满足正规方程 $X^T X beta=X^T y$。在 $X$ 满列秩时，形式上可写为 $beta=(X^T X)^(-1)X^T y$，残差向量为 $e=y-X beta$。

计算时直接求解最小二乘问题，并检查矩阵的列秩。这样可以检查截距项、变量顺序和系数输出是否对应。决定系数使用
$ R^2=1-(sum_i e_i^2)/(sum_i (y_i-overline(y))^2) $。

== 关键 python 代码
```python
import numpy as np

def ols(design, target):
    design = np.asarray(design, dtype=float)
    target = np.asarray(target, dtype=float)
    if design.ndim != 2 or target.shape != (design.shape[0],):
        raise ValueError("Design rows must match the one-dimensional target")
    if design.shape[0] <= design.shape[1]:
        raise ValueError("More observations than coefficients are required")
    if not np.isfinite(design).all() or not np.isfinite(target).all():
        raise ValueError("All observations must be finite")
    beta, _, rank, _ = np.linalg.lstsq(design, target, rcond=None)
    if rank != design.shape[1]:
        raise ValueError("Design matrix must have full column rank")
    residuals = target - design @ beta
    return beta, residuals

t = np.linspace(-1, 1, 20)
X1 = t
X2 = t ** 2
X3 = np.sin(2 * t)
design = np.column_stack([np.ones(t.size), X1, X2, X3])
target = 10 + 4 * X1 + X2 - 5 * X3
beta, residuals = ols(design, target)
np.testing.assert_allclose(beta, [10, 4, 1, -5], atol=1e-12)
np.testing.assert_allclose(residuals, 0, atol=1e-12)
np.testing.assert_allclose(design.T @ residuals, 0, atol=1e-12)
```

== 结果
#figure(
  table(
    columns: 3,
    align: (left, center, center),
    stroke: .5pt,
    inset: 6pt,
    [项目], [理论值], [程序估计],
    table.hline(),
    [截距], [$10.0000$], [$10.0000$],
    [$b_1$], [$4.0000$], [$4.0000$],
    [$b_2$], [$1.0000$], [$1.0000$],
    [$b_3$], [$-5.0000$], [$-5.0000$],
    [$R^2$], [$1.0000$], [$1.0000$],
  ),
  caption: "自制序列的多元回归结果",
)

== 系数与残差的核查

`design` 的四列依次为截距、`X1`、`X2`、`X3`，因此 `beta` 的输出顺序应为 10、4、1、−5。交换解释变量的列顺序时，对应系数的位置也会改变，预测值应保持相同。

这组构造数据没有随机误差，程序输出在数值精度范围内恢复了理论系数，残差为零，$R^2=1$。同时检查 $X^T e=0$，可以核查最小二乘解是否满足残差与各列解释变量正交的性质。

== 使用观测资料时的检查

实际气象因子之间往往存在较强相关。此时不同系数组合可能给出接近的预测值，单个系数对样本变化会更加敏感。使用多元回归时，需要检查解释变量之间的关系，并报告检验样本上的预测误差。本题的确定关系验证只检查程序能否恢复指定模型，不能说明三个变量在观测资料中的物理作用。

#import "../book.typ": book-page
#show: book-page.with(title: "MS Practice Report 5")
#outline()

= 多元线性回归子程序验证
编写多元线性回归子程序，利用自制时间序列 $Y(t)=10+4X_1(t)+X_2(t)-5X_3(t)$ 验证程序输出的系数。
== 原理
构造截距项与三个时间序列组成的矩阵 $X=[bold(1),X_1,X_2,X_3]$。根据普通最小二乘法，
系数向量满足 $beta=(X^T X)^(-1) X^T y$，残差向量为 $e=y-X beta$。回归优度由 $R^2=1-(e^T e)/(y-overline(y))^T(y-overline(y))$ 给出。

== 关键 python 代码
```python
def ols(design, target):
    xtx = design.T @ design
    xty = design.T @ target
    beta = np.linalg.solve(xtx, xty)
    residuals = target - design @ beta
    return beta, residuals
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

程序按照矩阵公式精确复现理论系数并获得 $R^2=1.0$，验证了多元回归子程序的正确性。

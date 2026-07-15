#import "../book.typ": book-page
#show: book-page.with(title: "MS Practice Report 1")
#outline()

=  计算给定数据资料的简单相关系数和自相关系数

== 资料介绍
根据下表中年平均气温和冬季平均气温的等级数据进行下列计算：
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

实习报告中附出简单相关系数或自相关系数程序。

答案：r=0.47 年平均气温在滞后长度j=7、冬季序列在j=4最大。


== 自相关系数公式
$
  r(tau) =
  1/(n-tau) sum_(i=1)^(n-tau) ((x_i-overline(x))/(s)) ((x_(i+tau)-overline(x))/(s))
  = (s(tau))/(s^2)
$
Python 函数如下：
#show raw: set par(leading: 0.7em)
#show raw: set text(font:"Libertinus Serif")
```python
def ac(x, L):
    n = len(x)
    L = min(L, n - 1)
    m = sum(x) / n
    den = sum((v - m) ** 2 for v in x)
    r = []
    for k in range(1, L + 1):
        num = 0.0
        for t in range(k, n):
            num += (x[t] - m) * (x[t - k] - m)
        r.append(num / den)
    return r
```
== 相关系数公式
$
 r = "Cov"(X, Y) / (sigma_X sigma_Y)
$
Python 函数如下：
```python
def corr(x, y):
    n = min(len(x), len(y))
    x = x[:n]; y = y[:n]
    mx = sum(x) / n; my = sum(y) / n
    num = sum((xi - mx) * (yi - my) for xi, yi in zip(x, y))
    denx = sum((xi - mx) ** 2 for xi in x)
    deny = sum((yi - my) ** 2 for yi in y)
    return num / math.sqrt(denx * deny)

```

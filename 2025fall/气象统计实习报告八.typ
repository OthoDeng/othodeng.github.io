#import "../book.typ": book-page
#show: book-page.with(title: "滑动平均与累积距平")
#outline()

= 11 点滑动平均与累积距平分析
资料文件 `MA.DAT` 包含 85 个样本。本次计算居中 11 点滑动平均和累积距平，分别观察局部平均水平与相对于全序列均值的累计变化。文件没有给出日期、变量名称和单位，图中横轴沿用样本序号。

== 数据与方法
=== 居中滑动平均

将当前点及其前后各 5 个点共同取平均，只在窗口完整时计算：
$display(overline(x)_i = 1/11 sum_(k=-5)^5 x_(i+k)\, i=6\,dots\,80)$。
第一个有效值由样本 1—11 计算，放在样本 6 的位置；最后一个由样本 75—85 计算，放在样本 80 的位置。共得到 $85-11+1=75$ 个有效值，前后各 5 个点保留为 `NaN`。

窗口居中后，均值对应窗口的中间时刻。每个平滑值都使用了未来 5 个样本，适用于完整序列的事后分析。用于实时预报时，应根据当时已经获得的资料重新选择窗口。

=== 累积距平

先求全序列平均值 $overline(x)$，定义距平 $a_i=x_i-overline(x)$，累积距平为
$ A_i=sum_(j=1)^i a_j $。
相邻累积值的差满足 $A_i-A_(i-1)=a_i$。因此曲线上升表示当前值高于全序列均值，下降表示低于均值；一段持续上升或下降对应同方向距平的连续积累。

采用本序列自身的均值作为基准时，全部距平之和为零，故 $A_85=0$，计算机运算中允许出现数值精度范围内的微小误差。累积距平的正负反映此前的累计结果，当前样本的距平方向应由曲线的变化方向判断。

== 关键程序
```python
import numpy as np

def centered_moving_average(data, window=11):
    data = np.asarray(data, dtype=float)
    if data.ndim != 1 or not np.isfinite(data).all():
        raise ValueError("Input must be a finite one-dimensional series")
    n = len(data)
    if not isinstance(window, int) or window < 1 or window % 2 != 1 or window > n:
        raise ValueError("Window must be a positive odd integer no larger than the series")
    half = window // 2
    sm = np.full(n, np.nan)
    for i in range(n):
        if i - half >= 0 and i + half < n:
            sm[i] = np.mean(data[i-half:i+half+1])
    return sm

data = np.loadtxt("MA.DAT", ndmin=1)
if data.ndim != 1 or data.size != 85 or not np.isfinite(data).all():
    raise ValueError("MA.DAT must contain 85 finite values in one column")
smoothed = centered_moving_average(data, window=11)
mean_val = np.mean(data)
cum_anom = np.cumsum(data - mean_val)
np.testing.assert_equal(np.isfinite(smoothed).sum(), 75)
np.testing.assert_allclose(np.diff(cum_anom), (data - mean_val)[1:], atol=1e-10)
np.testing.assert_allclose(cum_anom[-1], 0, atol=1e-10, rtol=0)
```


== 结果图
#figure(
  image("7-1.png"),
  caption: "原始序列与居中 11 点滑动平均",
)

#figure(
  image("7-2.png"),
  caption: "相对于全序列均值的累积距平",
)

== 结果读取与程序检查

随附计算结果给出的序列均值为 2.9435。滑动平均有效值应有 75 个，横轴位置为 6—80，首尾空缺对应完整窗口无法形成的位置。

一个异常值会同时进入多个相邻窗口，因此平滑曲线上的连续变化可能部分来自窗口重叠。相邻的 11 点平均共享 10 个观测，不能把 75 个平滑值当作 75 个相互独立的样本进行检验。

累积距平出现局部最大值时，可以检查该处前后的距平是否由正转负；出现局部最小值时，检查是否由负转正。曲线接近水平表示距平积累较慢，不能单独说明原序列没有波动，因为连续正负距平也可能相互抵消。

这份资料没有说明采样时间间隔，因此 11 点窗口只能解释为 11 个样本。变量的物理意义同样需要资料说明，现有结果按高于或低于均值描述。居中窗口的时间位置参考 #link("https://www.itl.nist.gov/div898/handbook/pmc/section4/pmc422.htm")[NIST Centered Moving Average]。

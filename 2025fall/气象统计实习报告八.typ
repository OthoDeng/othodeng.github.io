#import "../book.typ": book-page
#show: book-page.with(title: "MS Practice Report 8")
#outline()

= 11 点滑动平均与累积距平分析
利用文件 `MA.DAT` 中的 85 个样本，编写 11 点滑动平均程序，对时间序列进行平滑并分析累积距平。全部图表与程序运行均使用 Python （numpy+matplotlib）。

== 数据与方法
数据：`MA.DAT` 仅含一列浮点数，代表时间序列 $x_i(i=1,dots,85)$，数据无日期信息，按样本序号作图。

滑动平均：采用居中窗长 11 点的简单滑动平均，只在窗口完整时计算：
$display(overline(x)_i = 1/11 sum_(k=-5)^5 x_(i+k)\, i=6\,dots\,80)$。
前后 5 个点因缺少邻域而记为 `NaN`。

累积距平：先求序列平均值 $overline(x)$，距平为 $a_i = x_i - overline(x)$，累积距平 $A_i = sum_(j=1)^i a_j$ 用于观察长期偏离的累积效应。正距平堆积代表阶段性偏湿，负距平表示偏干。

== 关键程序
```python
def centered_moving_average(data, window=11):
    n = len(data)
    half = window // 2
    sm = np.full(n, np.nan)
    for i in range(n):
        if i - half >= 0 and i + half < n:
            sm[i] = np.mean(data[i-half:i+half+1])
    return sm

data = read_series("MA.DAT")
smoothed = centered_moving_average(data, window=11)
mean_val = np.nanmean(data)
cum_anom = np.cumsum(data - mean_val)
```


== 结果图
#figure(
  image("7-1.png"),
  caption: "图 1. 原始序列与 11 点滑动平均折线图",
)

#figure(
  image("7-2.png"),
  caption: "图 2. 累积距平柱状图",
)

== 结果与分析
- 样本数为 85，原始均值 $overline(x) = 2.9435$。滑动平均有效点 75 个，能较好刻画低频波动，明显削弱 10 点以下尺度的尖峰。
- 图 1 中红色平滑曲线落后蓝色原始序列半窗宽（5 个样本），峰谷幅度缩小，说明 11 点窗口适合提取年际变化背景。
- 图 2 的累积距平初始阶段缓慢上升，约在样本 25 左右开始下降，随后在 55 之后快速转正，表明该序列存在若干持续偏干—偏湿阶段的转换。
- 柱状图正负色块分界清楚，零线附近的停滞段对应原序列的平稳期；最后阶段累计值急升，提示最近若干样本偏离长期均值较为显著。

== 结论
居中 11 点滑动平均能够在保持总体趋势的同时过滤短期噪声，适合于该长度序列的平滑处理。累积距平图揭示了序列的阶段性转折点，可作为评价持续偏差事件的依据；若需要更精细的定量诊断，可叠加显著性检验或多种窗口长度进行对比。

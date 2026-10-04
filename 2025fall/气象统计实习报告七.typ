#import "../book.typ": book-page
#show: book-page.with(title: "夏季降水趋势")
#outline()

= 中国夏季降水线性倾向率分析

== 数据与方法
资料文件为 `160zhan-rainfall-summer.txt`，包含 160 个站点的经纬度，以及 1982—2006 年共 25 年的夏季累计降水量，单位为 mm。每个站点分别拟合降水量与年份的关系，再将各站斜率绘制为空间分布。

=== 逐站线性倾向率

设站点降水量为 $P_i$，对应年份为 $t_i$，拟合 $hat(P)_i=a+b t_i$。斜率为
$
  b = (sum_i (t_i-overline(t))(P_i-overline(P))) /
    (sum_i (t_i-overline(t))^2)
$
若年份以年为单位，$b$ 的单位为 mm/年。线性倾向率取 $10b$，单位为 mm/10a。正号表示拟合降水量随年份增加，负号表示减少。使用 $t_i-overline(t)$ 作为解释变量可以得到相同斜率，此时截距对应样本平均年份的拟合降水量。

1982 年到 2006 年相隔 24 年。拟合直线两端的差值为 $24b=2.4 times (10b)$。这一差值由全部年份共同拟合得到，与直接计算两个端点观测之差的含义不同。

=== 资料检查

线性拟合前应检查年份顺序、降水单位、缺测标记，以及每个站点的有效观测数量。下面的代码要求 25 年资料均为有限数值，发现缺测时立即终止计算。文件若使用特定数值表示缺测，读取时还需要按照资料说明识别该标记。不能将缺测标记当作真实降水量参与拟合。

=== IDW 插值

使用 `cKDTree` 搜索每个格点最近的 8 个站点，按距离平方的倒数加权。在经度 75°—135°、纬度 5°—55°范围内，分别设置 240 个经度点与 220 个纬度点。格点趋势为
  $
    T_(g r i d) = (sum_(i = 1)^k (w_i T_i) )/(sum_(i = 1)^k  w_i),
  $
其中 $w_i=d_i^(-2)$，$T_i$ 为站点倾向率。格点与站点重合时，直接采用该站点数值。

下面的距离以经纬度坐标计算，适用于理解 IDW 的计算过程。经度一度对应的实际距离随纬度改变，因此这种距离没有统一的长度单位。若用于定量空间分析，应使用适合研究区域的投影坐标或球面距离，并重新评估邻近站点及插值结果。

结果图使用 Natural Earth 国界限制显示范围。国界掩膜只规定地图上哪些区域显示数值；边界内仍可能存在离观测站很远的格点，需要结合站点分布判断可信范围。

== 关键代码
```python
import numpy as np
from scipy.spatial import cKDTree

# df 为已读取的站点资料表。
yrs = np.arange(1982, 2007)
yr_cols = [str(y) for y in yrs]
trend = []
for _, row in df.iterrows():
    rain = row[yr_cols].to_numpy(dtype=float)
    if not np.isfinite(rain).all():
        raise ValueError("Each station must have 25 finite annual values")
    slope, _ = np.polyfit(yrs - yrs.mean(), rain, 1)
    trend.append(slope * 10)
df["trend"] = trend

lon_vec = np.linspace(75, 135, 240)
lat_vec = np.linspace(5, 55, 220)
lon_grid, lat_grid = np.meshgrid(lon_vec, lat_vec)
pts = df[["经度", "纬度"]].to_numpy()
vals = df["trend"].to_numpy()
if len(pts) < 8 or not np.isfinite(pts).all():
    raise ValueError("At least eight stations with finite coordinates are required")
if len(np.unique(pts, axis=0)) != len(pts):
    raise ValueError("Station coordinates must be unique")
tree = cKDTree(pts)
qry = np.column_stack([lon_grid.ravel(), lat_grid.ravel()])
dist, idx = tree.query(qry, k=8, workers=-1)
exact = dist[:, 0] == 0
grid_values = np.empty(len(qry))
grid_values[exact] = vals[idx[exact, 0]]
w = 1.0 / dist[~exact] ** 2
grid_values[~exact] = np.sum(vals[idx[~exact]] * w, axis=1) / w.sum(axis=1)
grid = grid_values.reshape(lon_grid.shape)
```

== 结果图

#figure(
  image("plot20.png"),
  caption: "中国夏季降水线性倾向率分布图",
)

== 趋势图的阅读方法

首先根据色标判断倾向率的单位和正负，再检查相邻站点是否给出一致方向。连续色带由插值产生，地图上的格点数量远多于观测站数量，格点之间共享邻近站点的信息。一个范围较大的色块能否代表区域变化，需要回到该区域站点的斜率与有效年份进行核查。

本次使用的 IDW 权重均为正，并经过归一化，因此格点值位于参与插值的 8 个站点趋势值的最小值与最大值之间。这个性质可以用于检查插值程序。绘图网格增加到 240 × 220 并没有增加观测数量，也没有提高原始站网的空间分辨能力。

图中没有标注趋势显著性。若要判断某站趋势是否显著，需要由残差计算斜率标准误，并在相应假设下进行检验；25 个完整年份的一元回归残差自由度为 23。时间自相关会影响标准误，多个站点同时检验还需要考虑多重检验问题。

夏季累计降水量反映整个季节的总量。讨论暴雨、连续无雨日或干旱事件时，需要日降水及相应事件指标；本题的季节总量趋势不能单独回答这些问题。

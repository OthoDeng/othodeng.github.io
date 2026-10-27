#import "../book.typ": book-page
#show: book-page.with(title: "Hydrological and Meteorological Models: XAJ")
 

= 流域介绍
屯溪流域集水面积为$2697 k m^2$，上游嵌套呈村流域与月潭流域，集水面积分别为290km2、954km2。屯溪流域邻近中国东南沿海，位于亚热带季风气候区，年平均温度为17℃。冬季盛行西北风，天气晴冷干燥，夏季多东南风，气温高，光照强，空气湿润；春、秋两季气旋活动频繁，冷暖变化大。春季及初夏多锋面雨，夏秋之际多台风。屯溪流域地势西高东低，最大、最小海拔高程分别为1614m、115m，相对高差较大。屯溪流域多年平均降雨量为1600mm，多年平均蒸发量为920mm。降雨在年内、年际分配极不均匀；4-6月多雨，降雨量占全年降雨量的50%，易发生洪涝灾害；7-9月降雨量仅占20%，旱灾频繁。DEM从地理空间数据云网站下载（http://www.gscloud.cn/），选择SRTMDEM数字高程数据产品，分辨率为90m×90m。

#figure(image("水文气象模型/概况图.png"),
caption: [屯溪流域概况图])

== 资料介绍
（1）屯溪流域十一个雨量站点黟县、儒村、岩前、休宁、流口、上溪口、五城（月潭）、石门、屯溪、大连、左龙1986年——1998年共13年逐日降雨资料；

（2）呈村、月潭、屯溪水文站1986年——1998年共13年逐日的日平均流量资料；

（3）呈村、月潭、屯溪站1986年——1998年共13年逐日的蒸发资料；

（4）屯溪流域新安江模型参数初值和状态变量初值材料。


= 方法介绍

课程任务包括比较呈村、月潭、屯溪三个水文站的典型洪水过程，计算洪峰到达时间差和流量变化，并使用新安江模型模拟 1986—1998 年逐日流量。本报告记录模型计算方法、屯溪站模拟评价以及参数敏感性分析。

模型采用三层蒸散发、蓄满产流、二水源划分和线性水库汇流。地面径流 RS 转换为入河流量 QS，地下径流 RG 经线性水库计算得到 QG，两者相加得到河网入流 QT，再计算出口流量 Q。各部分公式见下文。

评价同时使用流量过程线、NSE、KGE、逐年径流深误差和洪峰误差。NSE 与 KGE 分别按完整的 13 年序列和各个年份计算，并报告逐年指标的平均值。参数分析包括单参数扰动和 LHS 抽样；依据敏感性结果提出的调参顺序见“调参建议”。


= 采用给定参数及初值逐日连续模拟
新安江模型最初以实测雨量站为中心，采用泰森多边形划分计算单元，主要用于考虑降雨空间分布不均匀，故把计算单元划分也称为“分单元面积”，模型也被描述成“分散式模型”。

新安江模型描述的是一个计算单元内降雨径流的产汇流过程，模型结构将整个过程概化为蒸散发、产流、分水源、汇流四个部分，汇流部分又划分成坡面汇流、计算单元内河网汇流阶段。各计算单元至流域出口断面由河道相连接，故流域整体汇流过程划分成了三个阶段。模型结构具有流域计算分单元、流域汇流分阶段、坡面汇流分水源“三分”特征。
== 蒸散发及产流计算
按照三层蒸发模式，从上层到下层计算，分为以下四种情况：
1. 当 $W U + P >= E_P$时，
$
E_U = E_P, E_L = 0, E_D = 0
$

2. 当 $W U + P < E_P$ 且 $W L >= C dot W L M$时，
$
E_U = W U + P, E_L = (E_P -E_U) W L \/ W L M, E_D = 0
$

3. 当 $W U + P < E_P$ 且 $C(E_P -E_U)<= W L < C dot W L M$时，
$
E_U = W U + P, E_L = C dot (E_P -E_U), E_D = 0
$

4. 当 $W U + P < E_P$ 且 $W L < C(E_P -E_U)$时，
$
E_U = W U + P, E_L = W L, E_D = C dot (E_P -E_U -E_L)
$
其中，$W U$、$W L$分别为上层和下层的蓄水量，$P$为降雨量，$E_P$为潜在蒸散发量，$C$为蒸散发分配系数，$W L M$为下层的最大蓄水量。

== 降雨产流计算
按照蓄满产流概念，初始土壤含水量为$W$, 最大值为$a$,满足：
$
  a = W M M [1-(1-W/(W M))^(1/(1+b))]
$

其中，$W M M$为土壤的最大含水量，$b$为土壤的非线性参数。降雨产生的总径流量$R$计算公式如下：
$
  R = P E + W - W M + W M (1- (P E + a)/(W M M))^(b+1), a + P E <= W M M
$
全流域蓄满后：
$
  R = P E -(W M -W), a + P E > W M M
$


== 分水源计算
由于⼀次洪⽔的降⾬和下垫⾯⼟壤含⽔量的时空变化，在全流域蓄满前，只有部分流域⾯积达蓄满，产⽣径流。在这产流⾯积上，如果时段降⾬量⼩于稳定下渗率，⾬量下滲率必⼩于稳渗值。

参考@fig:水源划分 ,水源划分过程示意图，按照二水源划分，把总径流量R划分为地面（直接）径流RS和地下径流RG。地面径流RS由降雨量PE与产流面积FC的关系决定，地下径流RG由剩余的产流面积决定。
#figure(
  image("水文气象模型/水源划分.png"),
  caption: [水源划分过程示意图]
)<fig:水源划分>

水源分量地下径流：
$
r_(g i) = F C_alpha = F C r_i/(P E_i) 
$

水源分量直接径流：
$
r_(s i) = r_i -r_(g i) = (P E_i -F C) r_i/(P E_i)
$

总地下径流：
$
R G = sum_(i, P E > F C) F C r_i/(P E_i) + sum_(i, P E_i<= F C) r_i
$
总直接径流：
$
R S = sum_(i, P E > F C) (P E_i - F C) r_i/(P E_i)
$
== 汇流计算
地下径流汇流。地下径流汇流可采用线性水库或滞后演算法模拟。当采用线性水库时，计算公式为

$
Q G(t) = C G dot Q G (t-1) + (1 - C G) dot R G(t) dot U
$
其中, $Q G$ 为地下径流汇流量，$C G$为地下径流汇流系数，$R G$为地下径流量，$U$为单位转换系数。

单元⾯积河⽹总入流。单元⾯积河网总入流为地面径流与地下径流出流之和，计算公式为：
$
Q T(t) = Q S(t) + Q G(t)
$
其中，$Q T$ 为单元面积河网总入流。

单元⾯积河⽹汇流。单元⾯积河网汇流采用线性水库形式，当采用滞后演算法时计算公式为：
$
Q(t) = C R dot Q(t-1) + (1-C R) dot Q T(t-L)
$
其中，$Q$ 为单元面积出口流量，$C R$为河网汇流系数，$L$为河网滞后时间。


== 评价指标
假设河网汇流采用线性水库形式：
$
Q_t = C_S Q_(t-1) + (1 - C_S) Q T_(t-L)
$

纳什效率系数（NSE）：
$
N S E = 1 - (sum_(i=1)^n (Q_(s,i)-Q_(o,i))^2) / (sum_(i=1)^n (Q_(o,i)overline(Q_o))^2)
$

克林-古尔德效率系数（KGE）：
$
K G E = 1 - sqrt((r-1)^2 + (alpha-1)^2 + (beta-1)^2)
$

其中：
$
r = c o r r(Q_(s i m), Q_(o b s)), alpha = sigma_((s i m)) / sigma_((o b s)), beta = overline(Q_(s i m)) / overline(Q_(o b s))
$

逐年径流深（mm）计算：
$
H = sum_(d=1)^n Q_d * 86.4 / A
$

逐年径流深相对误差：
$
R E_H = (H_(s i m) - H_(o b s)) / H_(o b s) * 100%
$

逐年洪峰相对误差：
$
R E_P = (Q_(p,(s i m)) - Q_(p,(o b s))) / Q_(p,(o b s)) * 100%
$



= 模拟评价与参数敏感性
== 分析设置

局部敏感性分析逐个改变参数，扰动幅度为 −30%、−20%、−10%、+10%、+20%、+30%，以 NSE 和 KGE 的变化范围衡量敏感性，并绘制参数响应曲线。全局分析采用 300 组 LHS 样本，以参数和评价指标之间的 Spearman 相关描述本次抽样中的关系。

敏感性分析工作簿分别设置参数输入、模型计算和指标输出区域。结果包括整体与逐年 NSE、KGE，以及逐年径流深和洪峰相对误差。


== NSE/KGE 综合评价结果
1986-1998 年整体与逐年评价如下：

#figure(

  table(
  align: center,
  stroke: none,
  columns: 5,
  table.hline(stroke: 1.5pt),
  table.header([评价方式], [NSE], [KGE], [说明], [结果解读]),
  table.hline(stroke: .75pt),
  [13年整体], [0.765], [0.841], [全时段统一评价], [整体精度较好],
  [逐年平均], [0.685], [0.745], [逐年评价后取平均], [年际差异较明显],
  table.hline(stroke: 1.5pt),
))

逐年评价中：NSE 最优年份为 1996 年（0.867），NSE 最低年份为 1987 年（0.412）；KGE 最优年份为 1994 年（0.862），最低年份为 1987 年（0.563）。

#figure(
  image("水文气象模型/outputs/nse_kge/nse_kge_yearly_overall.png"),
  caption: [逐年与整体 NSE/KGE 对比]
)

== 逐年径流深与洪峰误差
逐年径流深相对误差绝对值平均为 5.66%，逐年洪峰相对误差绝对值平均为 30.92%。说明模型对年总水量的模拟明显优于洪峰过程模拟，洪峰偏差仍需通过汇流参数进一步优化。

#figure(
  image("水文气象模型/outputs/yearly_error/yearly_runoff_peak_error.png"),
  caption: [逐年径流深与洪峰相对误差]
)

== 局部敏感性分析（单参数扰动）
局部分析分别计算各参数扰动下 NSE 和 KGE 的最大值与最小值之差，以两项跨度的平均值作为综合敏感性。排名前五的参数为：

#figure(
  table(
  align: center,
  stroke: none,
  columns: 4,
  table.hline(stroke: 1.5pt),

  table.header([参数], [NSE跨度], [KGE跨度], [综合敏感性],),
  table.hline(stroke: 0.75pt),
  [CS], [0.0756], [0.0787], [0.0772],
  [K], [0.0608], [0.0815], [0.0711],
  [FC], [0.0598], [0.0729], [0.0664],
  [CG], [0.0353], [0.0844], [0.0599],
  [B], [0.0127], [0.0095], [0.0111],
  table.hline(stroke: 1.5pt),
))


#figure(
  grid(
    columns: 4,
    image("水文气象模型/outputs/local_sensitivity/curves/FC_response_curve.png"),
    image("水文气象模型/outputs/local_sensitivity/curves/CG_response_curve.png"),
    image("水文气象模型/outputs/local_sensitivity/curves/B_response_curve.png"),
    image("水文气象模型/outputs/local_sensitivity/curves/WLM_response_curve.png"),
    image("水文气象模型/outputs/local_sensitivity/curves/WM_response_curve.png"),
    image("水文气象模型/outputs/local_sensitivity/curves/CS_response_curve.png"),
    image("水文气象模型/outputs/local_sensitivity/curves/K_response_curve.png"),
    image("水文气象模型/outputs/local_sensitivity/curves/WUM_response_curve.png"),
  ),
  caption: [FC、CG、B、WLM、WM、CS、K、WUM 参数-指标响应曲线]
)

== 全局敏感性分析（LHS）
基于 LHS（300 组样本）+ Spearman 相关，全局敏感性前五参数为：CS、K、FC、CG、WLM。
#figure(
table(
  align: center,
  stroke: none,
  columns: 4,
  table.hline(stroke: 1.5pt),
  table.header([参数], [rho(NSE)], [rho(KGE)], [平均绝对相关]),
  table.hline(stroke: .75pt), 
  [CS], [0.598], [0.458], [0.528],
  [K], [0.480], [0.516], [0.498],
  [FC], [0.479], [0.403], [0.441],
  [CG], [0.150], [0.462], [0.306],
  [WLM], [-0.111], [-0.116], [0.114],
  table.hline(stroke: 1.5pt),
)
)
#figure(
  image("水文气象模型/outputs/global_sensitivity/global_sensitivity_spearman.png",width: 80%),
  caption: [全局敏感性排序（LHS+Spearman）]
)

== 调参建议
局部与全局分析共同敏感参数为：CG、CS、FC、K。重点调参可以放在：B、CG、CS、FC、K、WLM。

先调 CS、CG（控制汇流过程与洪峰形态）。
再调 K、FC（影响蒸散与产流量级）。
最后调整 B、WLM（改善中低流量阶段与年际稳定性）。


= 流量过程线
1986年至1998年逐年流量过程线，包括实测流量过程线、基于指定参数的模拟流量过程线以及经过参数调试后的模拟流量过程线。
#figure(
  image("水文气象模型/屯溪流域_年度汇流过程_4x4_page1.png"),
  caption: [屯溪流域逐日降雨输入与模拟/实测流量对比过程线]
)


= 结果分析

模拟流量在洪水发生时间和汛期变化趋势上与观测基本吻合。整体 NSE 为 0.765，KGE 为 0.841；逐年平均值分别为 0.685 和 0.745，反映出不同年份的模拟表现存在差异。径流深误差与洪峰误差表明，本次模拟对年总水量的再现优于洪峰。

== 当前方法的局限
部分高水年份和极端洪水场次存在洪峰高估或低估。日尺度输入可能平滑短历时暴雨，滞后时间和线性水库系数也可能影响洪峰模拟；固定参数还可能难以适应下垫面随时间变化。这些解释需要进一步检验。已有局部与全局敏感性结果可用于选择率定参数，后续评价需关注洪峰误差和不同年份的表现。

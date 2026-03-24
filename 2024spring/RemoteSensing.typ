#import "@preview/dvdtyp:1.0.1": *

#show: dvdtyp.with(
  title: "Remote Sensing",
  subtitle: [Observing the Earth's changing climate],
  author: "Curious Otto Deng",
  abstract: "This is the note taken in class, written in " + link("https://tpyst.app")[Typst] + [. If you woud like to try out typology, it is strongly recommended to have a look at ] +link("https://github.com/typst-doc-cn/tutorial/")[Typst-doc-cn]+ [.],
)

#outline()

#v(6cm)

= Earth Energy Budget
Earth Energy Budget is a calculated Figure of the flow of energy, in radiation.

== Radiation

#problem[
  Why global warming?
  ]
Global warming has nothing to do with green house gases.
#example("addition")[Suppose you have a blanket in a room. One blamket is enougth 
]


#definition("Shortwave Radiation")[ 
  Shortwave radiation. Most radiation emmited by sun is short-wave.
]

#definition("Longwave Radiation")[
  Longwave radiation. wave that reflescted from the ground.
]

= Passive Remote Sensing
#theorem("Wein's Law")[
  $ lambda _max = b / T $
  Where b is constant, T is the temperature.
]
#theorem("Plank's Law")[
  $ B_nu (nu,T) = (2 h nu ^3) /c^2 1/(exp((h nu)/(k_beta T)) -1) $
]
#theorem("Bolzmann")[ 
 For an ideal absorber/emitter or black body, the Stefan–Boltzmann law states that the total energy radiated per unit surface area per unit time  is directly proportional to the fourth power of the black body's temperature, T:
 $ M ^o = sigma T^4$
]

Note the absorption of water vapor in all part of the spectrum and the absorption of $C O_2$.

= How do satellite radiometers work?
== NISTAR
Single NISTAR Eletrical Substitution Radiometer Channel.

Only measure the infra part.

#definition[
  $ "IR" = "TOTAL" - "VIS" $
]

== AVHRR
The Advanced Very High Resolution Radiometer.

AVHRR Imaging:
$
 cases("Visible",
 "Near IR",
 "IR Channel"
)$

AVHRR Special Bands

== Radiometric Scanning
#definition("Swath")[
  Swath. The width of a satellite's orbit path.
]

== Visible Remote Sensing - Ocean
Chlorophy Concentration

= Satellite & History
#theorem("Kelpler's Third Theory")[
  $ r^3\/T^3 = "constant" $
]

#theorem("Newton's Univesal Gravity")[
  $ F = G (m_1 m_2)/r^2 $
]

== Satellite Orbits around the Earth
1. Geostationary / Geosynchronous Orbit
2. Polar Orbit

= Hottest Year on Record
== How to measure the temperature?
#definition("Thermometer")[
  Begins in 1980.
]

#problem[
  Sparse Spatial Coverage over Oceans. No records with Thermometer Record. Before 2000.
]
*Solutions:* Ships!

There is  Global Ship Track Array

= Suggested Research Topic

 #problem[Application of Remote Sensing in Climate Change Monitoring. ]
Students can study how to use satellite remote sensing data to monitor changes in the Earth's environment that are caused by #highlight("anthropogenic climate change"). This monitoring can include changes in the Earth's surface temperature or the extend of the Earth's glaciers and sea ice coverage, using #highlight("advanced satellite retrieval") methods.

#problem[The rise and fall of greenhouse gases since the last ice age. ]
Climate changes across the past 24,000 years provide key insights into Earth system responses to external forcing. Global climate change has become a global problem as a result of accelerated human activity and industrialization. Since the Industrial Revolution, the rate of global warming has increased considerably compared to the rate of paleoclimatic warming. Comparing the #highlight("rate of warming") since the Industrial Revolution with the rate of paleoclimatic warming is of great significance for understanding the impact of human activities on global climate change and provides a scientific basis for formulating measures to address climate change.

#problem[Paleo-perspectives on Arctic warming. ]
Ice is more reflective and less absorbent of sunlight than land or the surface of an ocean. When ice melts, it typically reveals darker areas of land or sea, and this results in increased sunlight absorption and associated warming. #highlight("Polar amplification") is much stronger in the Arctic than in Antarctica. What effects is Arctic amplification having, both in the region and for the world? And How we explain Arctic warming in Paleo-perspectives? 

== Important Note
#definition[
  二氧化碳、甲烷浓度寿命。
]
#definition("Global Warming Potential")[
  GWP。一化學物質的全球變暖潛勢定義為從開始釋放一公斤該物質起，一段時間內輻射效應的對時間積分，相對於同條件下釋放一公斤參考氣體（二氧化碳）對應時間積分的比值：
  $ "GWP"(x) = (integral^"TH" _0 a_x dot \[x(t) \] dif t )/(integral^"TH" _0 a_r dot \[r(t) \] dif t ) $
]

== Dataset
- Temperature(surface): GISSTEMP, Copernicus
- Precipitation: GPCP
- Cloulds: ISCCP-H, MODIS
- Radiation: CERES(ASR, LW, Total)

#definition("GISSTEMP-v4")[
  The GISS Surface Temperature Analysis version 4 (GISTEMP v4) is an estimate of global surface temperature change.
]
Combined Land-Surface Air and Sea-Surface Water Temperature Anomalies (Land-Ocean Temperature Index, L-OTI):
- *Global-mean monthly*, seasonal, and annual means, 1880-present, updated through most recent month
- *Northern Hemisphere-mean monthly*, seasonal, and annual means, 1880-present, updated through most recent month
- *Southern Hemisphere-mean monthly*, seasonal, and annual means, 1880-present, updated through most recent month
- *Zonal annual means*, 1880-present, updated through most recent complete year

#definition("ISSCCP-h")[
  The Cloud Properties - International Satellite Cloud Climatology Project (ISCCP) H-Series Climate Data Record (CDR) focuses on the distribution and variation of cloud radiative properties to improve understanding and modeling of the way clouds affect climate. This dataset provides an improved understanding of the radiation budget, as well as specific insight on the relationship between clouds and the radiation balance. These data can be used to support many other cloud studies, including efforts to understand the long-term global hydrologic cycle. The dataset period of record includes data from 1983 to 2018.
]
#definition("CERES")[
  http://ceres.larc.nasa.gov
]

== Data Analysis
#definition("Mean")[
  $ macron(X) = sum^n _(i=1) x_i $
]
#definition("Variance")[
  $ sigma^2 = (sum \(x_i - mu\)^2)/n $
]
=  Revisit the scattering spectrum of the Eart
== Calculating Mean Temperature
#theorem("Calculating Mean Temp")[
  $ macron(T) =  sum ^365 _(i=1) (cos("Latitude") * T_i) /360 $
  $ macron(P) = (integral.double _Omega "perp" dot dif x dot dif y)/(integral.double _Omega dif x dot dif y) $
]

== The Urban Heat Island effect.
#example("Urban Heat Island Adjustment")[
  At night, the cities can be labelled as Use the darker weather station at night.
]

== Revisit the scattering spectrum of the Earth
#problem[ There is clouds, we can't measure the surface temperature.
]
Microwave radiation whenever there is clouds.

Requires a large area. The sea surface temperature. But you can not use it in the continent.

== Hyperspectual Raidiometer
Retrive radiation in hundreds of Channels.

== Conclusion
#rect("Thermometer:")
- Reliable surface measurements
- Long temperature record
- Poor Coverage over oceans
- Urban Heat effect

#rect("Satellite:")
- Global coverage
- short temperature record
- Cloud effect
== Looking at the trends
#definition("Linear Regression. ")[

For every grid of great point. we take average of the year, do a linear Regression, calculate the slope of the linear regression. $dif/(dif t) T$.
]

= Tasks
#problem("Week 1")[
  计算逐年/逐月平均的云/辐射/降水数据随时间变化。
]

1. 查找文献（研究背景、前人的研究基础、Knowledge Gap、研究意义）
2. 确认选题（具体变量、区域、研究时间段、可能的影响机制）
3. Coding
4. Paper Writing


Extention: #highlight("聚类、EOF、神经网络")


= Write a Research Paper
#example("Outline")[
  0. Abstract
  1. Introduction
  2. Data and Methods
  3. Results
  4. Conclusions
  5. References
]

== Abstract
The last thing you write, written finally. 100~150 words, no citing, avoid "I", No copying the conclusion.

=== Plain Language Summary (Optional)

== Introduction

The previous paper in similar field published in the past. 
```
In this Study, we ...
^^ ^^^^ ^^^^^
```
The most important part, what we are doing, why it's important.

== Data and Methods 
=== Data
Generally describe & explain the mechanism and give a citation.
=== Methods
Modeling citing, (domain, last access : DD-MM-YYYY)
== Results 
- Graphs
The most significant figure shall put first.


== Conclusions (or Discussions)
```
Further modeling studies are needed to fully understand ...
^^^^^^
```

=== Data Availability Statement

== References
Do follow the citation standard.


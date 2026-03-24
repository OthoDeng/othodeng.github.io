#import "@preview/dvdtyp:1.0.1": *

#set page(paper: "us-letter", margin: (left: 10mm, right: 10mm, top: 12mm, bottom: 15mm))

// 群友黑魔法,控制首段缩进
#let empty-par = par[#box()]
#let fake-par = context empty-par + v(-measure(empty-par + empty-par).height)
#show heading: it => it + fake-par

#show figure: it => it + v(10pt)

// Editing the linkstyle
#show link: it => {
  set text(fill: blue)
  it
}

#import "../book.typ": book-page

#show: book-page.with(title: "A Model that Explains the Contrasting SST Trends in the Southern Pacific Ocean")
#show: dvdtyp.with(
  title: "A Model that Explains the Contrasting SST Trends in the Southern Pacific Ocean",
  author: "Kaihuai Deng"
)
#outline()

= Abstract
Sea surface temperature (SST) in the southern Pacific Ocean plays an important role in ocean-atmosphere interactions, forcing atmospheric and sea ice variability. Satellite and in-situ datasets show contrasting SST trend in the southern Pacific Ocean during 1993-2021, consisting of SST warming trend ($0.05 degree dot "yr"^(-1)$) in the region of 80$degree$W-180,50$degree$S-30$degree$S and cooling trend ($-0.04degree  dot "yr"^(-1)$) in the area of 60°W-150°W, 55°S-70°S. A detailed trend analysis for the wind and sea ice concentration suggest that Ekman transport and sea ice radiative positive feedback are the two key contributors to the contrasting SST trends. The intensified downwelling(upwelling), induced by the Ekman transport and strengthened westerlies, gives rise to warm(cold) water swarming in (upturning) from lower latitudes (deeper ocean), which causes SST warming(cooling). Moreover, the sea ice increase at higher latitudes, due to both the cold water transport from deeper ocean layer and broken ice transport from polar regions, strengthens the cooling trend through sea ice positive radiative feedback.
    
= Plain Language Summary
content: [The southern Pacific Ocean is an indispensable part in the climate system while it still remained poorly observed. And the SST trend is regarded as an important indicator of global climate change. Using the satellite and in-situ dateset, we found that the contrasting SST trends from 1993 to 2021, one area in this region is warmed by 0.3°C per decade, while another area is cooled by -0.1°C per decade.Considering impacts of various factors such as wind, sea ice and radiation, the primarily explanation is that  wind-driven warm(cold) water from the subtropics(deeper ocean) flows in and goes downward (goes upward and flow away) in the warm(cold) area through oceanic circulation and leads to the SST warming(cooling). Additionally, the cooling trend is also related to the cold water that flow to higher latitudes and form ice there and at the same time, trash ice from polar regions driven by enhanced south wind speed will be transported there. As a result, ice increases, reflects more shortwave radiation to the space, and surface downward shortwave radiation decreases which contributes to SST decreases.


= Introduction
//Outline:
//Importance of SST
//Others found contrasting trend
//However, mechanism is not studied
//In this study,

//重要性,二稿
//A comprehensive understanding of the mechanisms underlying the variability of 
Sea surface temperature (SST) is essential for understanding the global climate dynamics and sea-air interaction. The South Pacific Ocean (60$degree$W-180,70$degree$S-30$degree$S) serves as a major heat reservoir and plays a vital role in regulating global climate. The South Pacific Ocean stores and redistributes vast amounts of heat, which significantly impacts global climate systems.

Wind-driven ocean circulation plays a fundamental role in the Earth's energy balance, affecting ocean heat content (OHC) at interannual to decadal timescales@Fernandez. // ocean heat content, global climate
Environmental factors such as SST, sea surface salinity, and chlorophyll-α concentration are crucial in determining seabird assemblages across the Eastern South Pacific Ocean. These factors influence seabird abundance and species richness, which are indicative of ocean productivity@Serratosa.// oean ecosystem
SST variations in the South Pacific can significantly affect regional climate, particularly in areas like New Zealand. Studies have shown that SSTs around New Zealand are correlated with barotropic Rossby waves estimated from South Pacific wind stress@Bowen. 



A positive trend in temperature was recorded in an area of the ocean situated around 179°E, 46°S, which suggests a notable increase in sea surface temperatures over recent decades, showing that the warming is a result of changes in the local flows of Subantarctic Water@Sutton.
Meanwhile, one research highlights that the increasing SST trend in the South Pacific region is associated with sea level pressure and surface adcevtion@Saurral.//warming & possible reason 
A 2020 study identified a cooling pattern in the region between the ice edge and the subantarctic front in the Pacific sector between the years 1982 and 2011. This cooling trend was found to be closely associated with changes in sea ice@Haumann.//cooling, 

//，添加到3-4个


//Various factors contribute to the observed trends in SST, including but not limit to atmospheric circulation changes, anthropogenic greenhouse gas emissions, and natural variability @Sarah @Rintoul. The Southern Annular Mode (SAM), for instance, has been identified as a significant driver of climate variability in the region, influencing wind patterns and oceanic upwelling @Gareth Additionally, changes in the Antarctic Circumpolar Current (ACC) and increased stratification of the upper ocean layers may also be contributing to these trends. @Böning 


Previous study suggests that changes in the net surface shortwave radiation and Ekman horizontal advection are the two key contributors to the SST cooling@Xu. A further research study has indicated that the observed warming is a consequence of alterations in the local flows of Subantarctic Water@Sutton.  These shifts resulted in the displacement of sea ice from the Antarctic coastline, thereby exposing the underlying ocean and facilitating solar heating, which in turn contributed to the further melting of sea ice@Turner. An additional factor could the very strong westerly winds north of the sea that moved sea ice out of this basin and toward the east. However, the mechanism of the SST warming and cooling between the two regions has not been thoroughly studied. The interaction between these contrasting temperature trends and their driving forces remains unclear, posing a challenge for understanding the regional climate dynamics.//研究机制，然而两个区域冷暖的偶机制没有被研究清楚
 
//Furthermore, we validate the cooling trend in the sea ice region through the lens of radiative fluxes and sea surface height (SSH). Our findings also highlight a positive feedback mechanism between SST and sea ice. 
//This comprehensive approach not only advances our understanding of the underlying processes but also provides critical insights into the broader implications for climate dynamics in the Southern Ocean.


// 三稿 In this study
This study aims to investigate the SST warming and cooling trends in the southern Pacific Ocean, and reveal the sea-air-ice interaction mechanisms, which dominate the SST variability.This paper is organized ad follows. Data and method used in this study are present in #link(<section2>)[Section 2]. The trends and mechanisms of SST variability connected to physical environments are analyzed in #link(<section3>)[Section 3]. Finally, our key findings are summarized in #link(<section4>)[Section 4].





// “在南大洋中两个区域发现sst相反的趋势，根据所读文献了解到可以从海水的输送角度进行研究，通过分析水平和垂直的海水输送我们发现了海水、海温、海冰三者存在着相互联系，形成一个完整的体系，并且我们从辐射、海面高度等角度验证了变冷海区海冰的变化趋势，同时发现海温和海冰之间存在着正反馈作用。”
// = Data and Methods


= Data and Methods <section2>
//The approach was to examine time series where they available and then focus on the changes in the 30 years. The two region were chosen based on the observed SST changes.
The data products described below were used to define and analyze the ocean changes.
The datasets were collated in #link(<Table>)[tabular] form for enhanced clarity.

*Table 1:* Overview of variables, timescale, resolution and source.In order to maintain consistency and control variebility, the majority of the datasets were collected between 1993 and 2021. 
#figure(table(columns: 4,align:center,
[*Variable*],[*Timescale*],[*Resolution*],[*Source*],
[SST],[1993\~2021],[$0.05degree times 0.05degree$],[Copernicus],
[SSH],[1993\~2021],[$0.25degree times 0.25degree$],[DUACS],
[Radiation],[2001\~2021],[$1degree times 1degree$],[CERES],
[SLP],[1993\~2021],[$2.5degree times 2.5degree$],[NCEP],
[SSW],[1993\~2021],[$2.5degree times 2.5degree$],[NCEP],
[SIC],[1993\~2021],[$25 times 25 space\km^2$],[NSDIC])
)<Table>

== Satellite Data

- *Sea Surface Temperature*
#v(5pt)
For this study, we calculated the monthly SST trends for the period from 1993 to 2021. The SST data utilized in this study is sourced from the Copernicus objectively-analyzed SST product. This product is based on daily, global climate SST analyses generated by the European Space Agency (ESA) SST Climate Change Initiative (CCI) and the Copernicus Climate Change Service (C3S) (Merchant et al., 2019; product SST-GLO-SST-L4-REP-OBSERVATIONS-010-024 @Merchant). The data provides a comprehensive and consistent dataset for climate analysis and is available at https://doi.org/10.48670/moi-00243.

- *Sea Suraface Height*
#v(5pt)
The daily sea surface height (SSH) data utilized in this study is derived from the DUACS delayed-time (DT-2021 version) SSH maps, from 1993 to 2021. This dataset, provided by the Copernicus Climate Change Service and the Copernicus Marine Service (product SEALEVEL_GLO_PHY_CLIMATE_L4_MY_008_057), combines the "my" (multi-year) dataset when available and the "myint" (multi-year interim) dataset thereafter. The dataset is based on a stable number of altimeters (two) in the satellite constellation, ensuring consistent and reliable sea level observations. More details about the product can be found at https://doi.org/10.48670/moi-00238.

- *Radiation*
#v(5pt)
The dataset employs CERES EBAF (Energy Balanced and Filled) data, SYB1deg - Level 3, from NASA/LaRC @EBAF_1 @EBAF_2, which were recorded on a monthly basis from 2001 to 2021.
The Climate Data Record (CDR) comprises monthly and climatological averages of observed and computed surface all-sky, clear-sky (spatially complete), and cloud radiative effect (CRE) fluxes, as well as associated clouds. It is suitable for analysis of variability at intra-seasonal, inter-annual, and longer time scales. The TOA net flux is constrained to ocean heat storage. CERES can be found at https://ceres.larc.nasa.gov.




== Reanalysis Data

- *Sea Level Pressure & Sea Surface Wind*
#v(5pt)
We utilized the NCEP-NCAR Reanalysis  data (provided by the NOAA PSL, Boulder, Colorado, USA, from their website at https://psl.noaa.gov) to analyze both sea surface wind (SSW) speeds and sea level pressure trends from January 1993 to December 2021. This comprehensive dataset, developed collaboratively by the National Centers for En vironmental Prediction (NCEP) and the National Center for Atmospheric Research (NCAR) @NCEP, provides global coverage with a 2.5° $times$ 2.5° spatial resolution. The reanalysis data, which spans from 1948 to the present, incorporates a wide range of meteorological variables assimilated through a consistent model. For our analysis, we extracted monthly SSW (U and V components) and sea level pressure (SLP) data. The long-term consistency and global coverage of this dataset make it particularly valuable for studying climate trends and variability. By using the same dataset for both wind speed and pressure analyses, we ensure coherence in our findings and can explore potential relationships between these atmospheric parameters over the nearly three-decade period.


// Using it Monthly 王佳璐: 风速用的是1993-2021年逐月的u、v风场数据资料




- *Sea Ice Concentration*
#v(5pt)
The ice concentration data were obtained from the National Snow and Ice Data Center (NSIDC) @NSIDC and are available on a $25 "km" times 25 "km"$ grid, measured on a monthly basis. This dataset constitutes a Climate Data Record (CDR) of sea ice concentration derived from passive microwave observations. The CDR algorithm integrates ice concentration estimates using a rule-based approach, combining outputs from two established algorithms: the NASA Team (NT) algorithm (Cavalieri et al., 1984) and the NASA Bootstrap (BT) algorithm (Comiso, 1986). Detailed information about the dataset and access to the data can be found at https://doi.org/10.7265/EFMZ-2T65.



== Methods 

*Linear Regression:*
/// 试图线性回归描述
To analyze the trends in SST, SSH, Radiaton, SLP, SSW and SIC in the Southern Ocean, we utilized linear regression techniques. Linear regression is a statistical method used to model the relationship between a dependent variable and one or more independent variables. In this study, we applied linear regression to determine the rates of change in SST and SLA over the period from 1993 to 2021.

 For each grid point within the study regions, we performed a linear regression analysis to estimate the trend over the 30-year period.
 The linear regression model is defined as: $ Y = beta_0 + beta_1 X + epsilon.alt $ <Eq.1>
#v(5pt)
Where $Y$ is the variables, $X$ is time (in years), $beta_0$ is the intercept, $beta_1$ is the slope (trend), and $epsilon.alt$ is the error term.
 The slope $beta_1$ represents the rate of change in variable per year.

#v(10pt)

*Ekman Mathematical Derivation:*
// Ekman 螺线
// Things can be further simplified by considering wind blowing in the y-direction only. This means is the results will be relative to a north–south wind (although these solutions could be produced relative to wind in any other direction):
The Ekman mathematical derivation was employed to calculate wind induced water flow in the zonal, meridional and vertical directions, with a view to establishing a wind trend in the southern hemisphere.



$ "UE" = - (tau_y)/(rho_omega f) $<Eq.2>
$ "VE" = - (tau_x)/(rho_omega f) $
$ "WE" = 1/(rho_omega f) \( (partial tau_y)/(partial x) - (partial tau_x)/(partial y))
$

Where UE, VE and WE represent Ekman transport in the $u, v "and" w $ direction.
$tau$ is the wind stress, $rho$ is the density, $f$ is the Coriolis parameter, constant.
In #link(<Eq.2>)[equation 2 and 3] the plus sign applies to the northern hemisphere and the minus sign to the southern hemisphere.
#v(10pt)




= Results <section3>

// 海面高度变化趋势数据 解释的海水辐聚 辐散 和目前已有所有数据相吻合。
== Linear trends of SST, SSW, SLP, SIC and SSH

#link(<sst>)[Figure 1] shows the linear SST trend in the southern Pacific Ocean (80$degree$W-180,70$degree$S-30$degree$S). The SST trend reveals a contrasting pattern in the study region. The warming region  (80$degree$W-180,50$degree$S-30$degree$S) , located in the South Pacific Ocean, exhibits an overall increasing trend of approximately $0.3degree C dot "decade"^(-1)$, with a maximum warming rate reaching up to $0.6degree C dot "decade"^(-1)$. Conversely, the cooling region is found at the area of 150$degree$W-60$degree$W,70$degree$S-50$degree$S, where shows an average decreasing trend of about $-0.1degree C dot "decade"^(-1)$, with the maximum declining rate reaching $-0.2degree C dot "decade"^(-1)$.This pattern is consistent with findings from previous studies. Studies by Sutton et al.@Sutton have documented similar warming trends in the South Pacific Ocean, indicating a significant increase in SSTs in recent decades. The cooling trend observed aligns with the results reported by Haumann et al. (2020) @Haumann, who identified a similar cooling pattern in the region between the ice edge and the subantarctic front in the Pacific sector from 1982 to 2011. However, our findings suggest that the SST exhibits the contrasting trend changes in the study region. Thus, the warming area connected to co-occurring the cooling need to more mechanism discussion.

#figure(image("pic/SST.jpg",width: 80%),caption: [
  Sea surface temperature trend ($degree C space "yr"^(-1)$).
  The studied warming region is in 80°W and 180°W, 50°S and 30°S.
  The cooling region is in 60°W and 150°W, 70°S and 55°S.
  The dotting area is statistically significant at 95.5% confidence level using a Student's t-test.
]) <sst>


// SST 一段， 剩下四个要素一段，描述这些冷暖区域的趋势。
// SSW SLP SIC SSH

Simultaneously, other variables (i.e.,SSW,SLP,SSH and SIC) exhibit significant anomalies trends across the regions (#link(<trend>)[Figure 2]). 
In the warming region (80$degree$W-180,50$degree$S-30$degree$S), the SSW shows a reduction in wind speed with a trend of $-0.03 m · s^(-1) dot "decade"^(-1)$. The SLP, indicates an increasing trend of $0.65 "millibars" dot "decade"^(-1)$. Regarding the SSH, the warming region demonstrates an increasing trend of $50"mm" dot "decade"^(-1)$. In general, the warming region exhibits a tendency towards deceleration in sea surface wind speed, an increase in sea level pressure and an elevation in sea surface height.// Warming
While for the cooling region (60°W-150°W, 55°S-70°S), the SSW displays an increasing trend of $0.02 m dot s^(-1) dot "decade"^(-1)$. For SLP, a decreasing trend were shown in $-1.95 "millibars" dot "decade"^(-1)$. The SSH in the cooling region exhibits a decreasing trend of $-20"mm" dot "decade"^(-1)$. To conclude, the cooling region displays a pattern of increasing sea surface wind speed, a reduction in sea level pressure and a decline in sea surface height.//cooling



//For sea surface wind (SSW), the warming region shows a reduction in wind speed with a trend of $-0.03 m · s^(-1) dot "decade"^(-1)$, whereas the cooling region displays an increasing trend of $0.02 m dot s^(-1) dot "decade"^(-1)$.
//Regarding sea level pressure (SLP), the warming region indicates an increasing trend of $0.65 "millibars" dot "decade"^(-1)$, in contrast to the cooling region which shows a decreasing trend of $-1.95 "millibars" dot "decade"^(-1)$.
//For sea surface height (SSH), the warming region demonstrates an increasing trend of $50"mm" dot "decade"^(-1)$, while the cooling region exhibits a decreasing trend of $-20"mm" dot "decade"^(-1)$.

The sea ice concentration (SIC) shows a increasing trend in the band of $65degree S - 70 degree S$, $90degree W - 150degree W$. While a decreasing trend in the band of $70degree S - 75degree S$,$120degree W - 180$ (See #link(<seaice>)[Section 3.3]).



#figure(image("pic/Trend.jpg",width: 90%),caption: [Annual trends of SSW, SLP, SSH and SIC in high latitude of South Hemisphere.
  (a) The trend of SSW ($m space s^(-1) space \yr^(-1)$).
  (b) The trend of SLP ($h \Pa space \yr^(-1)$).
  (c) The trend of SSH ($m m space \yr^(-1)$).
  (d) The trend of SIC  ($\% dot \yr^(-1)$).
  The dotting area is statistically significant at 95.5% confidence level using a Student's t-test.
])<trend>

 





== Underlying Mechanism for Ekman transport

Using #link(<Eq.2>)[Ekman mathematical derivation], we calculated Ekman transport in the horizontal and vertical directions. The analysis, depicted in #link(<figure.ssw>)[Figures 3a-c], illustrates the climatology of Ekman transport in zonal(UE), meridional(VE), and vertical(WE) directions. In the warming regions(80$degree$W-180,50$degree$S-30$degree$S), zonal transports ($u$ direction) exhibit a predominant positive pattern, indicating a dominant eastward transport. In the meridional direction ($v$), the meridional transports also show a significant positive tendency, suggesting a stronger northward transport. Additionally, the vertical direction (WE) displays a negative pattern, implying the downwelling processes. In the cooling regions(80$degree$W-180,30$degree$S-50$degree$S), the zonal and meridional transports are similar to the warming area, but the intensity of the zonal and meridional transports is weak than that of warming region. Conversely, the significant negative Ekman pumping (WE) is found in the cooling region, which confirms the upwelling processes.

#link(<figure.ssw>)[Figure 3d-f] reveals the trend of Ekman transport patterns during 1993-2021.In warming regions(80$degree$W - 180,50$degree$S - 30$degree$S), the zonal transports exhibit a positive trend, indicating an increased tendency to blow eastward. In the meridional transport, there is a dominant positive tendency, with a stronger northward flow. Vertically,  a significant negative trend is found, and related to the enhancing downwelling. 
As the same time,cooling regions display opposing trends, with a significant 
 negative trend, highlighting the intensity of downwelling.


#figure(image("pic/SSW.jpg"),caption: [The climatology and the trend distribution in zonal, meridional and vertical direction.
(a-c) shows the climatology distribution.
(d-f) shows the trend distribution.
The dotting area is statistically significant at 95.5% confidence level using a Student's t-test.
])<figure.ssw>

All in all, this consistency between climatological patterns and trends emphasizes the dominance of the Ekman transport in meridional direction, reinforcing the overall understanding of wind dynamics in the study region. The contrasting SST in the study region is highly related to the Ekman transport. The strengthens downwelling (upwelling) induced by wind-driven convergence (divergence) process could be responsible for the warming (cooling) in the study region.
== More Possible Causes of SST Cooling <seaice>
//海冰描述
From the mechanism for Ekman transport between different sea areas with contrasting SST trends, the divergence on cooling sea area surface may bring cooling water mass to higher latitudes(65°S-70°S, 90°W-150°W), near the Ross Sea, which facilitates the ice formation there. Therefore we focus on the area with sea ice coverage all year around in the Southern Ocean(65°S-75°S, 180°-90°W) (labelled with Area 0) and its trend from 1993 to 2021 (#link(<figure.sic>)[Figure 4]). And the assumption corresponds well with the real trend we observe, that the sea ice piles up significantly at the edge of the cooling area (65°S-70°S, 90°W-150°W) (labelled with Area 1).

#figure(image("pic/SIC(clim+trend).png"),caption:[The climatology(a) and the trend(b) distribution in sea ice concentration(SIC)($\% dot "yr"^(-1)$) of Area 0,1,2 during 1993-2021. (The dotting area is statistically significant at 95% confidence level using a Student's t-test)])<figure.sic>

In order to figure out the contribution of sea ice to the cooling trend, we consider sea-ice radiative feedback contribution and thus we analyze the climate states and trends of the outgoing TOA shortwave flux, outgoing TOA longwave flux and TOA net downward radiation flux under clear sky in the Area 0 from 2001 to 2021 (Figure 5). For the edge of the cooling area, the Area 1, the observations show a positive trend in TOA shortwave flux whereas negative trends in both outgoing TOA longwave flux and TOA net downward radiation flux (Figure 5d-5f). Taking their climate states into consideration (Figure 5a-5c), we note that the Area 1 reflects more shortwave into extra-atmosphere, and lose more heat generally than before. Although the outgoing TOA longwave flux trend indicates that the cooling area radiates less longwave out, its slower speed leads to the dominant role of TOA shortwave flux, resulting in less and less heat storage and cooler SST. Subsequently, the lower temperature brings about more ice formation and accumulation and the sea-ice radiative positive feedback runs in cycle, which is a possible cause of cooling trend over that period.

#figure(image("pic/radiation.png"),
caption: [The climatology($W dot m^(-2)$) and the trend($W dot m^(-2) dot "yr"^(-1)$) distribution in outgoing TOA shortwave flux(a,d), outgoing TOA longwave flux(b,e) and TOA net downward radiation flux(c,f) under clear sky of Area 0,1,2 during 1993-2021 (The dotting area is statistically significant at 95% confidence level using a Student's t-test).])

A striking new result is that the sea ice significant decline at higher latitudes(70°S-75°S,180°-120°W) (labelled with Area 2) than the edge of the cooling area(Area 1), contradicts with the principle that ice melts at lower latitudes with more heat. We examine the reasons and consequences of the ice loss in the Area 2 and find out the change of sea level pressure (SLP), controlling sea surface winds (SSW) strongly, is consistent with observations of change of ice concentration. A depression, which is called The Amundsen low, controls the almost southerly wind near the Ross Sea and the Amundsen Sea throughout the year. Due to the intensifying depression over the period, the south wind picks up, speeds up the trash ice transport from Area 1 to Area 2, and the exposed sea surface gains more heat through sea-ice radiative positive feedback, which accelerates ice breaking and transport finally. That also accounts for the opposite trend in Area 2 of all radiation components mentioned above to Area 1. As a consequence, the sea ice decline at higher latitudes is a contributor to the sea ice accumulation and cooling trend in the cooling area.

#figure(image("pic/SLP+SSW.png"),caption:[The climatology and the trend distribution in sea level pressure (SLP) (a-b) and sea surface winds (SSW) (c-d) during 1993-2021 (The dotting area is statistically significant at 95% confidence level using a Student's t-test).])






= Conclusion <section4>
To provide an overview of the main findings of this study, a conceptual model is presented in (#link(<figure.mechan>)[Figure 7]) that illustrate how the sea-ice-air interaction, explaining the contrasting SST trends in the Southern Pacific Ocean. Here, the co-occurring SST warming and cooling is found in the Southern Pacific Ocean. Along with the southward shifting and strengthening of the west wind, the enhancing upwelling (downwelling) induced by Ekman transport cloud be responsible for the SST cooling (warming). Moreover,we found that sea ice radiative positive feedback is also playing an important role in the SST cooling. Cold water carried by local upwelling and sea ice transported by southeasterly winds cause a significant increase in sea ice in the cooling area. Thus, the increasing sea ice albedo lead to accelerating heat loss and further aggravating the SST cooling.

However, the impacts of both the seasonal cycle of sea ice concentration and the cloud radiative feedback still remain unclear and this work would be be fully implemented in the future.

#figure(image("pic/model_new.png"),caption:[
  Schematic diagram for contrasting SST trends in the southern pacific 
 Ocean, illustrating the sea-ice-air interactions and sea ice radiative feedback. 
]) <figure.mechan> 



#set heading(numbering: none) //后面的标题没有数字标

= Data Availability Statement
The SST data product is available from https://doi.org/10.48670/moi-00243/.
The SSH data is available from: https://doi.org/10.48670/moi-00238/.
Energy Balanced and Filled (EBAF) level-3 source is available from: https://ceres.larc.nasa.gov/data/#ebaftoa-level-3/.
NCEP-NCAR Reanalysis 1 is available from: https://psl.noaa.gov/.
NSIDC is available at: https://nsidc.org/data/.

= References 
#set par(justify: true, first-line-indent: 0pt);

#bibliography(title:none, style:"american-psychological-association", "SO_references.bib")
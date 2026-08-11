#import "@preview/dvdtyp:1.0.1": *
#import "../book.typ": book-page
#show: book-page.with(title: "Drought Tracking and Attribution")

#show: dvdtyp.with(
  title: "Area expansion dominates rising global three-dimensional terrestrial water storage drought severity",

  author: "Kaihuai Deng, Zhongwei Huang",
  abstract: "Drought is expanding and intensifying worldwide, threatening water security. GRACE/GRACE-FO terrestrial water storage (TWS) assessments treat drought as isolated grid cell anomalies rather than connected events, leaving the roles of precipitation deficits and evaporative demand unresolved. Here we apply a three-dimensional TWS drought tracking algorithm to the GRACE/GRACE-FO record (August 2002–July 2025), identifying 672 TWS drought events. Here we use a moisture flux attribution framework to show that drought severity, intensity, and area all increased significantly, with spatial expansion accounting for approximately 75% of the severity trend. We further document a shift toward droughts amplified by evaporative demand. Precipitation's contribution declined, and 15.9% of the drought area shifted to regimes dominated by evapotranspiration. These findings call for full water column, event-based drought monitoring that tracks spatial expansion and consistent with an increasing influence of evaporative demand during TWS droughts.",
)

#highlight("The paper is currently under review. This note is figure-only, and the content is subject to change. Please refer to the final version of the paper for accurate information.")

= Characteristics of global TWS drought events 
#figure(
  image("pic/figure1_final.png"),
  caption: "Spatiotemporal characteristics of global three-dimensional TWS drought events identified between August 2002 and July 2025. (a) Centroid locations of individual TWS drought events. Circle size was proportional to cumulative drought severity (unit: 106 km²·month), and circle color indicated drought duration. Six of the most severe historical events were outlined and labelled. (b) Violin plots of drought onset years grouped by continent, with black horizontal lines denoting continental medians. (c) Continental comparison of median drought duration (blue bars) and median cumulative severity (pink bars).",
)

#figure(
  image("pic/figure2_final.png"),
  caption: "Grid cell drought frequency and mean intensity during active drought months from August 2002 to July 2025. (a) Spatial distribution of drought frequency, defined as the fraction of months in which each grid cell was part of an identified three-dimensional TWS drought event. The right-hand panel showed the corresponding land-only zonal mean frequency (dark blue line) with its interquartile range (shaded blue band). (b) Spatial distribution of mean drought intensity, calculated as the average of the absolute DSI values over all active drought months at each grid cell. The right-hand panel showed the corresponding land-only zonal mean intensity (dark red line) with its interquartile range (shaded red band).",
)
=  Changing trend of global TWS drought severity
#figure(
  image("pic/figure3_final.png"),
  caption: "Trends in global three-dimensional TWS drought severity, area, and intensity and attribution of drought severity changes from August 2002 to July 2025. (a) Monthly time series of global severity, intensity, and spatial area (dashed lines) and their 12-month moving average (solid lines). Dashed black lines indicated ordinary least-squares linear trends, all significant at p < 0.001. Shaded pink bands denoted 95% confidence intervals, and light blue vertical bars indicated active El Niño periods. (b) Long-term changing trend of TWS drought severity, intensity, and area at global and continental scales, with 95% bootstrap confidence intervals. The adjacent donut charts showed the relative contributions of changes in area (blue) and intensity (orange) to the severity trend.",
)

= The driving factors to global TWS drought events
#figure(
  image("pic/figure4_final.png"),
  caption: "Global TWS drought driving mechanisms and their transitions over time. (a) Spatial distribution of the precipitation contribution rate (C_P) to TWS drought events during 2002-2025. Blue grid cells denoted precipitation dominated regimes (C_P>50%), and orange/red grid cells indicated evapotranspiration dominated regimes (C_P≤50%). The inset plot showed the global probability density functions of C_P for the full period (grey curve), the early subperiod (2002–2014; light blue curve), and the late subperiod (2014–2025; orange curve). (b) Spatial distribution of the six transition categories of dominant drivers between the early (2002–2014) and late (2014–2025) subperiods. Each category corresponds to one combination of precipitation dominated and evapotranspiration dominated classifications in the two subperiods. The inset bar chart shows the fraction of global drought area occupied by each transition category. ",
)
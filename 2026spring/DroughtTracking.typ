#import "/packages/preview/dvdtyp/1.0.1/dvd.typ": *
#import "../book.typ": book-page
#import "../publication-status.typ": grl-status
#show: book-page.with(title: "Drought Tracking and Attribution")

#show: dvdtyp.with(
  title: "Area expansion dominates rising global three-dimensional terrestrial water storage drought severity",

  author: "Kaihuai Deng, Zhongwei Huang",
  subtitle: "Research figure archive",
  abstract: "These figures describe connected terrestrial water storage drought events identified from GRACE/GRACE-FO observations between August 2002 and July 2025. They cover event characteristics, severity trends, and classifications based on precipitation and actual evapotranspiration anomalies.",
)

#grl-status

Figures retain their original analysis versions. See the #link("../research/tws-drought.html")[project page] for current methods and results.

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

= Precipitation and actual evapotranspiration anomalies
#figure(
  image("pic/figure4_final.png"),
  caption: "P–ET anomaly classifications and their changes over time. (a) Spatial distribution of the precipitation contribution metric (C_P) during 2002–2025. Blue grid cells denote precipitation-dominated classifications (C_P>50%); orange/red cells denote actual-evapotranspiration-dominated classifications (C_P≤50%). The inset shows C_P distributions for the full period (grey), 2002–2014 (light blue), and 2014–2025 (orange). (b) Six transition categories between the early and late subperiods, with their fractions of global drought area in the inset. C_P compares precipitation and actual evapotranspiration anomalies and does not measure their causal contributions to storage loss.",
)

#import "../book.typ": book-page
#import "../publication-status.typ": grl-status
#import "../templates/profile.typ": profile, profile-label
#show: book-page.with(title: "Global 3D Terrestrial Water Storage Drought Tracking")
#show: profile

#profile-label[September 2025–present] \
Independent research advised by #link("https://faculty.nuist.edu.cn/huangzhongwei/zh_CN/index.htm")[Prof. Zhongwei Huang] (NUIST), Nanjing

= Research Question

Grid-based drought indices describe local anomalies. This project connects drought regions across successive months to track event movement, splitting, and merging, and examines how changes in area and intensity contribute to global TWS drought severity.

= Approach

I processed a 23-year GRACE/GRACE-FO terrestrial water storage record and used EEMD to separate long-term nonstationary components from event-scale variability. I adapted a connected-component and temporal-overlap tracking method, compared eight overlap thresholds, and selected a 16% threshold. The tracking records event continuation, splitting, and merging. I also compared event-scale precipitation and actual evapotranspiration anomalies.

= Results and Contribution

The analysis identifies 672 global drought events from August 2002 to July 2025, with event-level measures of duration, area, severity, movement, and splitting and merging. The v3.1 manuscript attributes 80.2% of the global severity trend to area expansion and 19.8% to mean intensity changes. The precipitation–evapotranspiration comparison describes observed accompanying conditions; causal contributions to storage loss require additional water-balance information.

I lead the associated Provincial Undergraduate Innovation Program (XJDC202610300604). My advisor provided reference studies and contributed to interpretation and discussion. The associated abstract has been accepted for poster presentation at AGU26, where I am the presenting author.

= Manuscript

#grl-status

= Research Materials

#link("../2026spring/DroughtTracking.html")[Drought tracking figures and research notes] · #link("../publications.html")[Publications & Manuscripts]

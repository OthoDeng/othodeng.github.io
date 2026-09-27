#import "book.typ": book-page

#show: book-page.with(title: "Introduction")

#let research_block(
  name: none,
  date: none,
  entity: none,
  location: none,
) = {
  heading(level: 1, name)
  if date != none {
    text(font: "Libertinus Serif", style: "italic", date)
  }
  v(1pt)
  if entity != none {
    text(fill: luma(20%), style: "oblique", entity)
    if location != none {
      text(", ")
      text(fill: luma(20%), location)
    }
  }
}

#show quote: it => block(
  width: 100%,
  inset: (left: 12pt, y: 4pt),
  stroke: (left: 2pt + rgb("#aaaaaa")),
  text(
    fill: rgb("#666666"),
    style: "italic",
    it.body,
  ),
)

= About Me

I am *Otto (Kaihuai) Deng*, an Atmospheric Science (Hydrometeorology) undergraduate at _Nanjing University of Information Science and Technology_ (NUIST), graduating in July 2027. Since 2023, I have conducted research at the #link("https://hymed.nuist.edu.cn/main.htm")[*Key Laboratory of Hydrometeorological Disaster Mechanism and Warning of Ministry of Water Resources*].

#quote[Growing up in typhoon and flood proned Guangdong motivates me to connect physical climate science with decisions that reduce harm.]

I use satellite observations, reanalysis, and numerical models to study *hydroclimate extremes*, focusing on drought evolution, land-atmosphere interactions, and climate risk and exposure. My experiences with flooding in Guangzhou and my family's farmland near Zhanjiang keep me interested in when and where hazards reach people, and how reliable that information is.

My #link("https://raw.githubusercontent.com/OthoDeng/othodeng.github.io/main/cv/CV_KaihuaiDeng.pdf")[CV] provides a concise overview; the sections below describe my projects in more detail.

#link("mailto:kaihuaideng@nuist.edu.cn")[kaihuaideng\[at\]nuist.edu.cn] · #link("https://github.com/OthoDeng")[GitHub] · #link("https://OttoQwQ.me")[Blog] · #link("https://t.me/AdolescentDelusions")[Academics] · #link("https://www.linkedin.com/in/othodeng/")[LinkedIn]

= Current Focus & Recent News

- *September 2026:* Submitted the R4 revision of my first-author manuscript, _Global unequal exposure to intensifying hydrological droughts_, to _Journal of Hydrology_. The revised manuscript is under review.
- *August 2026:* Submitted an abstract on my first-author global drought tracking research to #link("https://www.agu.org/annual-meeting")[AGU Fall Meeting 2026] (poster requested; acceptance pending).
- *July 2026–present:* Research intern at the #link("https://climatesmartlab.ca/")[Climate Smart Lab], University of Prince Edward Island (UPEI), Canada, supported by the #link("https://www.mitacs.ca/our-programs/globalink-research-internship/")[CSC-Mitacs Globalink program]. I am studying shoreline change using historical coastal data, GIS maps, and grouped change rate summaries.
- *June 2026:* Selected for the #link("https://www.dess.tsinghua.edu.cn/")[Tsinghua DESS Forum for Outstanding Undergraduates] (70 participants nationwide), where I presented my 3D drought research in English and discussed its design and extensions with #link("http://faculty.dess.tsinghua.edu.cn/luhui/")[Prof. Hui Lu].

= Research Interests

  *Satellite Hydrology* · *Hydroclimate Extremes* · *Land-Atmosphere Interactions* · *Climate Risk and Exposure*

= Publications & Manuscripts

#rect(
  radius: 5pt,
)[
  #set text(font: "Charter")

  [1] *Deng, K.*, Huang, Z.\* (2026). _Increasing severity of global three-dimensional terrestrial water storage droughts revealed by satellite observations._ Manuscript in preparation.

  #text(size: 0.85em, fill: luma(40%))[Develops an event-based framework for tracking global terrestrial water storage droughts and examining their severity evolution alongside precipitation and actual evapotranspiration anomalies.]

  [2] *Deng, K.*, Huang, Z.\*, Li, H., Wu, J. (2026). _Global unequal exposure to intensifying hydrological droughts._ _Journal of Hydrology_. Revised manuscript under review (R4 submitted).

  #text(size: 0.85em, fill: luma(40%))[Combines GRACE/GRACE-FO drought diagnostics with gridded population data to quantify exposure trends, their hydroclimatic and demographic contributions, and regional inequality.]

  [3] Wang, J.\* and *Deng, K.* (2024). _A Model that Explains the Contrasting SST Trends in the Southern Pacific Ocean._ _STECEP_. #link("https://doi.org/10.61173/xnag2k18")[https://doi.org/10.61173/xnag2k18]

  #text(size: 0.85em, fill: luma(40%))[Uses multi-source satellite and reanalysis data to develop a conceptual sea-air-ice explanation for contrasting Southern Pacific SST trends.]
]

= Selected Research

#research_block(
  name: "Global 3D Terrestrial Water Storage Drought Tracking",
  entity: [Independent research advised by #link("https://faculty.nuist.edu.cn/huangzhongwei/zh_CN/index.htm")[Prof. Zhongwei Huang] (NUIST)],
  location: "Nanjing",
  date: "September 2025–present",
)

*Research question.* Conventional grid by grid drought indices describe local anomalies but often lose the identity, movement, splitting, and merging of droughts as coherent spatiotemporal events. This project asks how global terrestrial water storage droughts evolve as three-dimensional objects and how their affected area and intensity shape changes in severity.

*Approach.* I processed a 23-year GRACE/GRACE-FO terrestrial water storage record and used EEMD to separate long-term nonstationary components from event-scale variability. I then developed a three-dimensional connected-event tracking framework that preserves drought lineages through splitting and merging. I also compared event-scale precipitation and actual evapotranspiration anomalies to describe accompanying conditions.

*Contribution and status.* The framework identifies 672 global drought events from August 2002 to July 2025 and produces event-level measures of duration, area, severity, propagation, and lineage. In the current manuscript, area expansion accounts for 77.7% of the increase in monthly drought severity; average intensity and their interaction account for 19.2% and 3.2%. These are results from a manuscript in preparation. The precipitation evapotranspiration comparison describes observed conditions and does not establish causal contributions to storage loss. I lead the associated Provincial Undergraduate Innovation Program (XJDC202610300604) and am preparing the first-author manuscript for submission.

#research_block(
  name: "Global Unequal Exposure to Intensifying Hydrological Droughts",
  entity: [First-author research advised by #link("https://faculty.nuist.edu.cn/huangzhongwei/zh_CN/index.htm")[Prof. Zhongwei Huang] (NUIST)],
  location: "Nanjing",
  date: "June 2025–present",
)

*Research question.* This study examines how global hydrological drought characteristics have changed over the GRACE era, how rapidly population exposure has increased, and whether that increase is associated primarily with changing hydroclimatic conditions, population growth, or their interaction.

*Approach.* I processed GRACE/GRACE-FO CSR RL06 v03 mascon observations from 2002–2024, used EEMD for nonlinear signal separation, calculated monthly drought severity indices, and identified events with run theory. I combined the drought record with GPW v4 population grids, an 11-year moving-window trend analysis, and a three-term exposure decomposition. The team also evaluated alternative EEMD settings, gap-filling strategies, drought thresholds, and population assumptions during revision.

*Main findings.* The R4 analysis estimates that global drought exposure increased by *38.76 million person-exposures per year*. Hydroclimatic conditions, population growth, and their interaction contributed *73.2%*, *5.3%*, and *21.5%*, respectively; the hydroclimatic contribution reached 76.3% for extreme-to-exceptional droughts. Holding the 2021–2024 population constant at its 2020 level produced a trend of 38.09 million person-exposures per year. The largest increases were concentrated in developing and water-scarce regions. These terms describe an observational exposure decomposition and do not establish causal attribution to anthropogenic climate change.

*My role and status.* I led the research design, global data processing, analysis, visualization, and manuscript preparation. During R4 revision, I raised questions about the effects of the GRACE–GRACE-FO observation gap and data differences on regional results; my advisor completed the follow-up tests. The R4 revision is under review at _Journal of Hydrology_.

#research_block(
  name: "Shoreline Change on Prince Edward Island",
  entity: [Mitacs Globalink research internship advised by #link("https://climatesmartlab.ca/team/xander-wang/")[Prof. Xander Wang] (University of Prince Edward Island)],
  location: "Charlottetown, PE, Canada",
  date: "July 2026–present",
)

Prince Edward Island's changing coastline raises questions about where erosion persists and how short periods of change compare with longer records. Our ongoing project brings together historical shoreline and coastal protection data. I have contributed to organizing CHRIS shoreline layers, making QGIS maps, and summarizing existing shoreline change rates by coastal setting. A jointly authored interim report records this stage of the work. Further tests of long-term hotspots and storm related change remain planned.

#research_block(
  name: "Fluctuation Theorem and TCWV Asymmetry",
  entity: [Independent research advised by #link("https://faculty.nuist.edu.cn/yin/zh_CN/index/111951/list/index.htm")[Prof. Jun Yin] (NUIST)],
  location: "Nanjing",
  date: "September 2024–September 2025",
)

I explored whether a nonequilibrium fluctuation-theorem framework developed for surface temperature could be extended to total column water vapor (TCWV) and precipitation. Using ERA5, I quantified probability-density-function asymmetry across smoothing timescales from 1 to 20 years and tested the thermodynamic link between SST and TCWV. The analysis reproduced an SST-TCWV Clausius-Clapeyron scaling of approximately 7% K⁻¹ ($R^2 = 0.95$) and motivated an exploratory extension of the tail-rescaling framework to precipitation. I produced a manuscript draft in Typst and LaTeX and refined the theoretical interpretation through research discussions with #link("https://www.polito.it/en/staff?p=lamberto.rondoni")[Prof. Lamberto Rondoni].

#research_block(
  name: "WRF-based Precipitation Sensitivity over Jing-Jin-Ji",
  entity: [Independent research advised by #link("https://faculty.nuist.edu.cn/wangmengya/zh_CN/index/142611/list/index.htm")[Dr. Mengya Wang] (NUIST)],
  location: "Nanjing",
  date: "March 2025–July 2025",
)

I configured WRF/WPS with three nested domains on Linux HPC and conducted 16 sensitivity experiments over the Beijing-Tianjin-Hebei region. The experiments perturbed initial soil moisture by ±10% to ±50% and modified urban land-use/land-cover extent to represent rapid urbanization. I evaluated simulated precipitation using spatial correlation, RMSE, and threat scores and examined water-vapor transport and boundary-layer responses. This project introduced me to controlled numerical experimentation and the limits of attributing regional precipitation changes to land-surface perturbations.

#research_block(
  name: "Precipitation-Runoff Prediction in the Yiluo River Basin",
  entity: [Research assistant advised by #link("https://orcid.org/0000-0001-6983-7368")[Prof. Xing Yuan] (Institute of Atmospheric Physics, Chinese Academy of Sciences)],
  location: "Nanjing",
  date: "June 2024–March 2025",
)

I applied EOF analysis to monthly precipitation interannual increments and extracted three principal components explaining more than 90% of the variance. After screening hydroclimatic predictors using correlation analysis and stepwise regression, I built a BiLSTM interannual increment hybrid prediction model. Relative to statistical downscaling, the model improved temporal correlation by 16% and reduced RMSE by 20%; CSSPv2-driven monthly runoff forecasts achieved an NSE of 0.65. The project connected statistical prediction, deep learning, and land-surface hydrological evaluation.

#research_block(
  name: "Contrasting SST Trends in the Southern Pacific Ocean",
  entity: [Student researcher advised by #link("https://science.gsfc.nasa.gov/sci/bio/george.tselioudis")[Prof. George Tselioudis] (Columbia University / NASA GISS)],
  location: "Beijing",
  date: "March 2024–September 2024",
)

As a co-author, I used Python to analyze a 29-year collection of satellite and reanalysis products, including Copernicus SST, DUACS sea-surface height, CERES radiation, NCEP atmospheric fields, and NSIDC sea ice concentration. We derived Ekman transport from wind stress to examine the Southern Pacific SST dipole and developed a conceptual feedback in which upwelling, sea-ice transport, albedo, and shortwave radiation reinforce regional cooling. The study was published in _STECEP_ in 2024.

= Operational Experience

#research_block(
  name: "Leizhou Meteorological Bureau, Guangdong",
  entity: [Intern, Forecast Division],
  location: "Zhanjiang, Guangdong",
  date: "July 2025–August 2025",
)

During Typhoons Danas and Wipha, I participated in operational monitoring and warning activities, followed real-time changes in intensity and landfall trajectories, and compared guidance from ECMWF, CMA, NCEP, and TRAMS. This experience showed me how numerical forecasts, observational evidence, uncertainty, and communication come together in time-sensitive hazard decisions.

= Technical Profile

#rect(
  radius: 5pt,
)[
  *Earth observation and data:* GRACE/GRACE-FO, ERA5, SMAP, GPM, Google Earth Engine, ArcGIS, QGIS, CHRIS shoreline data

  *Methods:* EEMD, drought indices, run theory, three-dimensional connected-event tracking, exposure decomposition, EOF, regression, sensitivity analysis

  *Models and computing:* WRF/WPS, CSSPv2, Xinanjiang model, Linux/HPC, Git

  *Programming:* Python (NumPy, SciPy, xarray, PyTorch, TensorFlow), MATLAB, Shell, Fortran, Typst/LaTeX

  *Languages:* Chinese (Mandarin and Cantonese), English (IELTS 7.0), French (A2)
]

= Beyond Research

I have trained as a competitive swimmer for ten years and won first place in a NUIST departmental medley relay in 2025. Outside research, I enjoy traveling, hiking, photography, cooking, coffee and tea, and rhythm games. I also maintain this public collection of course and research notes because writing reproducible explanations is one of the best ways I know to test whether I truly understand a method.

You can find selected photography on #link("https://www.instagram.com/0ttod3ng/")[Instagram \@0ttod3ng] and more code and projects on #link("https://github.com/OthoDeng")[GitHub].

= About This Site

These notes were written by #link("https://github.com/OthoDeng/notes")[Otto Deng] from course lectures, research projects, and independent study. If you notice a mistake or would like to discuss a project, please #link("mailto:kaihuaideng@nuist.edu.cn")[get in touch].

The site is written in #link("https://github.com/typst/typst")[Typst] and built with #link("https://github.com/Myriad-Dreamin/shiroa")[shiroa]. Some notes use the #link("https://typst.app/universe/package/dvdtyp/")[dvdtyp] template.

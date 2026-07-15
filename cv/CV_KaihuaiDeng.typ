#let conf(
  name: none,
  address: none,
  phone: none,
  email: none,
  blog: none,
  birth: none,
  doc
) = {
  set page(margin: (x: 32pt, y: 32pt))
  set text(font: "New Computer Modern", size: 10.5pt)

  set document(
    title: "CV_en",
    author: name,
  )

  show link: underline

  set align(center)
  text(size: 18pt, weight: "bold")[#name]
  v(5pt)
  text(address)
  v(2pt)
  stack(
    dir: ltr,
    spacing: 4pt,
    text(phone),
    text("·"),
    link(blog),
    text("·"),
    link("mailto:" + email)
  )
  v(4pt)

  set align(start)
  set line(stroke: 0.38pt + luma(20%))
  show heading.where(
    level: 1
  ): it => {
    v(4pt)
    align(left, text(size: 12.5pt, weight: "bold", upper(it.body)))
    v(-9pt)
    stack(
      dir: ltr,
      spacing: 4pt,
      line(length: 100%),
    )
    v(3pt)
  }
  show heading.where(
    level: 2
  ): it => {
    box(text(size: 10pt, weight: "semibold", it, rgb("#1A237E")))
  }

  doc
}
#let cv_block(
  name: none,
  date: none,
  entity: none,
  description: none,
  location: none,
) = {
  grid(
    columns: (1fr, auto),
    column-gutter: 8pt,
    heading(level: 2, name),
    text(size: 9.5pt, style: "italic", date),
  )
  v(1pt)
  if entity != none {
    grid(
      columns: (1fr, auto),
      column-gutter: 8pt,
      text(size: 9.5pt, fill: luma(20%), style: "oblique", entity),
      text(size: 9.5pt, fill: luma(20%), location),
    )
  }
  text(size: 9.5pt, fill: luma(12%), description)
}

#let award_block(
  name: none,
  date: none,
  entity: none,
) = {
  grid(
    columns: (auto, auto, 1fr, auto),
    heading(level: 2, name),
    text(". "),
    text(size: 9.5pt, fill: luma(20%), style: "oblique", entity),
    text(size: 9.5pt, style: "italic", date),
  )
}

#let cv_link(
  url,
) = link("https://" + url, text(fill: rgb(20%, 20%, 40%), url))

//// Preview ////

#show: doc => conf(
  name: "KAIHUAI DENG",
  address: "No.219, Ningliu Road, Nanjing, Jiangsu, China (Postcode: 210044)",
  birth: "2005/01/20",
  phone: "(+86) 173-2700-6642",
  blog: "https://othodeng.github.io",
  email: "kaihuaideng@nuist.edu.cn",
  doc,
)

= Education
#cv_block(
  name: "Nanjing University of Information Science and Technology",
  date: "2023.09 – 2027.07 (Expected)",
  description: [
    - *B.S.* in Atmospheric Science, Hydrometeorology division.
    - *Weighted average score*: 85.99 | *GPA*: 3.618.
  ],
)

= Area of Interest
Remote Sensing · Land–Atmosphere Coupling · Extreme Events · WRF Modeling

= Publications

[1] *Deng, K.*, Huang, Z.\*, (2026). *Area expansion driven intensification and evaporative amplification of global drought.* _Geophysical Research Letters._ (to be submitted as Letter)

[2] *Deng, K.*, Huang, Z.\*, Li, H., Wu, J., (2026). *Global unequal exposure to intensifying hydrological droughts.* _Journal of Hydrology._ (Major Revision)

[3] Wang, J.\* and *Deng, K.* (2024). *A Model that Explains the Contrasting SST Trends in the Southern Pacific Ocean*. _STECEP._ #link("https://doi.org/10.61173/xnag2k18","doi.org/10.61173/xnag2k18")

= Research Experience
#cv_block(
  name: "Global 3D Hydrological Drought Tracking & Mechanism Attribution",
  entity: [Independent research. Supervised by #link("https://faculty.nuist.edu.cn/huangzhongwei/zh_CN/index.htm")[Prof. Zhongwei Huang] (NUIST)],
  location: "Nanjing",
  date: "2025.09 – Present",
  description: [
    - Applied *EEMD* to 23-year GRACE/GRACE-FO TWS, developed a *3D drought clustering algorithm*, identifying *672* discrete global drought events with topological splitting/merging.
    - Constructed $C_E = E'\/(E'-P')$ evaporative contribution framework: *14.8%* of grid cells shifted from supply-deficit to compound droughts; area expansion drives *70–80%* of global severity increase ($p < 0.05$).
    - Presented at *Tsinghua University DESS 2026 National Forum* (70 nationwide, English defense); Provincial Undergraduate Training Program on Innovation and Entrepreneurship (XJDC202610300604, PI).
  ]
)

#cv_block(
  name: "Global Unequal Exposure to Intensifying Hydrological Droughts",
  entity: [Research assistant. Supervised by #link("https://faculty.nuist.edu.cn/huangzhongwei/zh_CN/index.htm")[Prof. Zhongwei Huang] (NUIST)],
  location: "Nanjing",
  date: "2025.03 – 2025.09",
  description: [
    - Computed *DSI* from GRACE/GRACE-FO CSR RL06 v03 mascon TWS via EEMD; integrated GPW v4 population grids, decomposing exposure trends: climate *64.5%*, population *18.2%*, interaction *17.3%* (severe events: climate *76.1%*).
    - Revealed *42.78 million people/yr* exposure increase concentrated in developing regions; most high-income regions showed stable/declining trends. Under *Major Revision* at _Journal of Hydrology_.
  ]
)

#cv_block(
  name: "Fluctuation Theorem & TCWV Asymmetry",
  entity: [Independent research. Supervised by #link("https://faculty.nuist.edu.cn/yin/zh_CN/index/111951/list/index.htm")[Prof. Jun Yin] (NUIST). Discussed with #link("https://www.polito.it/en/staff?p=lamberto.rondoni")[Prof. Lamberto Rondoni] (Politecnico di Torino)],
  // location: "Nanjing",
  date: "2024.09 – 2025.09",
  description: [
    - Extended nonequilibrium *fluctuation theorem* (Yin et al., 2024, _J. Climate_) from surface temperature to TCWV using ERA5; quantified PDF asymmetry $A_("asym")$ across $tau = 1–20$ yr smoothing timescales.
    - Validated SST–TCWV Clausius-Clapeyron scaling ($R^2 = 0.95$, ~7%/K); migrated tail-rescaling framework to precipitation, demonstrating universality. Produced manuscript draft.
  ]
)
#pagebreak()
#cv_block(
  name: "WRF-based Precipitation Sensitivity over Jing–Jin–Ji",
  entity: [Independent research. Supervised by #link("https://faculty.nuist.edu.cn/wangmengya/zh_CN/index/142611/list/index.htm")[Dr. Mengya Wang] (NUIST)],
  location: "Nanjing",
  date: "2025.03 – 2025.07",
  description: [
    - Configured *WRF/WPS* with 3 nested domains on Linux HPC; conducted *16 sensitivity experiments* perturbing soil moisture ($plus.minus 10%$ to $plus.minus 50%$) and urban LULC to simulate rapid regional urbanization.
    - Evaluated precipitation responses via spatial correlation, RMSE, and threat scores; identified optimal cumulus and microphysics parameterization schemes minimizing simulated biases.
  ]
)

#cv_block(
  name: "Precipitation–Runoff Prediction in the Yiluo River Basin",
  entity: [Research assistant. Supervised by #link("https://orcid.org/0000-0001-6983-7368")[Prof. Xing Yuan] (LabESM, CAS)],
  location: "Nanjing",
  date: "2024.06 – 2025.03",
  description: [
    - Applied *EOF* to monthly precipitation interannual increments, extracting 3 PCs explaining *>90%* variance; screened key hydroclimatic predictors via correlation analysis and stepwise regression.
    - Built *LSTM + interannual increment* hybrid model: TCC improved *16%*, RMSE reduced *20%* vs. statistical downscaling; CSSPv2 basin runoff forecasts achieved *NSE = 65%* for monthly streamflow.
  ]
)

#cv_block(
  name: "Contrasting SST Trends in the Southern Pacific Ocean",
  entity: [Student researcher. Supervised by #link("https://science.gsfc.nasa.gov/sci/bio/george.tselioudis")[Prof. George Tselioudis] (Columbia University / NASA GISS)],
  location: "Beijing",
  date: "2024.03 – 2024.09",
  description: [
    - Analyzed *29-year multi-source satellite/reanalysis datasets* (Copernicus SST, DUACS SSH, CERES, NCEP, NSIDC SIC) to characterize SST trends across the Southern Pacific (80°W–180, 70°S–30°S).
    - Derived *Ekman transport* ($U_E$, $V_E$, $W_E$) from wind stress to attribute the SST dipole; diagnosed a *sea ice radiative positive feedback* cycle. Published as co-first author in _STECEP_ (2024).
  ]
)

= Internship
#cv_block(
  name: "Climate Smart Lab, University of Prince Edward Island",
  entity: [Research Intern. Supervised by #link("https://climatesmartlab.ca/team/xander-wang/")[Prof. Xander Wang] (UPEI)],
  location: "PEI, Canada",
  date: "2026.07 – 2026.10",
  description: [
    - Fully funded by *Mitacs Globalink* and *Chinese Government Scholarship (CSC)* ($<=$260 awardees nationwide). Conducting land–atmosphere coupling diagnostics and *GRACE-based groundwater trend analysis* for PEI.
    - Comparing satellite TWS estimates with local well measurements to assess freshwater sustainability in a groundwater-dependent province.
  ]
)

#cv_block(
  name: "Leizhou Meteorological Bureau, Guangdong",
  entity: [Intern, Forecasting Division, Guangdong Provincial Meteorological Observation],
  location: "Zhanjiang",
  date: "2025.07 – 2025.08",
  description: [
    - Participated in frontline monitoring/warning for *Typhoon Danas (2025)* and *Typhoon Wipha (2025)*, tracking intensification and landfall trajectories; conducted *multi-model NWP comparison* (ECMWF, CMA, NCEP, TRAMS).
    - Calibrated field hydrologic equipment (groundwater wells, flux towers, snow sensors) utilizing telemetry systems, ensuring continuous environmental data collection for disaster forecasting.
  ]
)

= Selected Awards & Honors
#award_block(
  name: "National Outstanding Undergraduate Forum",
  entity: [Tsinghua University, DESS (70 nationwide)],
  date: "Jun 2026"
)
#award_block(
  name: "Chinese Government Scholarship",
  entity: [Chinese Scholarship Council ($<=$260 awardees nationwide)],
  date: "Jan 2026"
)
#award_block(
  name: "Mitacs Globalink Scholarship",
  entity: [Mitacs, Canadian national research organization],
  date: "Jan 2026",
)
#award_block(
  name: "Second‑Class Academic Scholarship",
  entity: "Nanjing University of Information Science & Techonology",
  date: "Nov 2025"
)
#award_block(
  name: "Second‑Class Academic Scholarship",
  entity: "Nanjing University of Information Science & Techonology",
  date: "Nov 2024"
)
#award_block(
  name: "Merit Student",
  entity: "Nanjing University of Information Science & Techonology",
  date: "Dec 2024"
)

= Additional Information

- *Programming:* Python (numpy, scipy, xarray, PyTorch), Shell, Fortran, MATLAB, Typst/LaTeX.
- *Methods & Models:* EEMD, Clustering algorithm, EOF, GMM, LSTM, WRF/WPS, Xinanjiang (XAJ).
- *Data & Tools:* GRACE/GRACE-FO, ERA5, GLDAS, Google Earth Engine, Linux (HPC), Git.
- *Languages:* English (IELTS 7.0, C1), Chinese (Mandarin, Cantonese, Hokkien), French (A2).

#let conf(
  name: none,
  address: none,
  phone: none,
  email: none,
  blog: none,
  birth: none,
  doc
) = {
  set page(margin: (x: 17pt, y: 10pt))
  set text(font: "New Computer Modern", size: 10.5pt)

  set document(
    title: "CV_en",
    author: name,
  )

  show link: underline

  set align(center)
  text(size: 18pt, weight: "bold")[#name]
  // v(5pt)
  // text(address)
  // v(2pt)
  stack(
    dir: ltr,
    spacing: 4pt,
    text(phone),
    text("·"),
    link("https://" + blog),
    text("·"),
    link("mailto:" + email)
  )
  // v(4pt)

  set align(start)
  set line(stroke: 0.38pt + navy)
  show heading.where(
    level: 1
  ): it => {

    v(4pt)
    align(left, text(size: 12pt, weight: "bold", upper(it.body),navy))
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
    // v(1.5pt)
    box(text(size: 10.5pt, weight: "semibold", it, rgb("#1A237E")))
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
    text(size: 10.5pt, style: "italic", date, weight: "bold"),
  )
  v(1.5pt)
  if entity != none {
    grid(
      columns: (1fr, auto),
      column-gutter: 8pt,
      text(size: 10.5pt, fill: luma(20%), style: "oblique", entity,spacing: 3pt),
      text(size: 10.5pt, fill: luma(20%),location, style: "oblique", weight:"bold"),
    )
  }
  v(1pt)
  text(size: 10pt, fill: luma(12%), description, spacing: 2.5pt)
}

#let award_block(
  name: none,
  date: none,
  entity: none,
) = {
  grid(
    columns: (auto, auto, 1fr, auto),
    heading(level: 2, name),
    text(": "),
    text(size: 10.5pt, fill: luma(20%), style: "oblique", entity),
    text(size: 10.5pt, style: "italic", date),
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
  blog: "othodeng.github.io",
  email: "kaihuaideng@nuist.edu.cn",
  doc,
)

= Education
#cv_block(
  name: "Nanjing University of Information Science and Technology",
  date: "Nanjing, China",
  location: "Sept 2023 – Jul 2027 (Expected)",
  entity: [B.S. in Atmospheric Science (Hydrometeorology)],
  description: [

    _NUIST ranks 1st in China and 8th globally for Atmospheric Sciences_
    - Weighted average score: 85.53/100 | GPA: 3.57/4.0 | Class ranking: 6/51 *(top 12%)*
    - Research affiliate of the *Key Laboratory of Hydrometeorological Disaster Mechanism and Warning of the Ministry of Water Resources* in Nanjing University of Information Science and Technology since freshman year.
    - Relevant coursework: Probability & Statistics, Remote Sensing for Hydrometeorology, Hydrometeorology Modeling, Numerical Weather Prediction, Python Programming.

  ],
)

= Area of Interest
*Remote Sensing · Land–Atmosphere Coupling · Extreme Events · WRF Modeling*

= Publications

[1] *Deng, K.*, Huang, Z.\*, (2026). *Area expansion dominates rising global three-dimensional terrestrial water storage drought severity* _Geophysical Research Letters._ (to be submitted as Letter)

[2] *Deng, K.*, Huang, Z.\*, Li, H., Wu, J., (2026). *Global unequal exposure to intensifying hydrological droughts.* _Journal of Hydrology._ (Minor Revision, R3)

[3] Wang, J.\* and *Deng, K.* (2024). *A Model that Explains the Contrasting SST Trends in the Southern Pacific Ocean*. _STECEP._ #link("https://doi.org/10.61173/xnag2k18","doi.org/10.61173/xnag2k18")

= Research Experience
#cv_block(
  name: "Mitacs Globalink Research",
  entity: [Research Intern. Advisor: #link("https://climatesmartlab.ca/team/xander-wang/")[Prof. Xander Wang] (University of Prince Edward Island)],
  location: "Jul 2026 - Present",
  date: "Charlottetown, PE, Canada",
  description: [
    - Fully funded by Mitacs Globalink and Chinese Government Scholarship (CSC) ($<=$260 awardees nationwide). Conducting land–atmosphere coupling diagnostics and GRACE-based groundwater trend analysis for Prince Edward Island.
    - Comparing satellite TWS estimates with local well measurements to assess freshwater sustainability in PEI.
  ]
)
#cv_block(
  name: "Global 3D Hydrological Drought Tracking & Mechanism Attribution",
  entity: [Independent research. Advisor: #link("https://faculty.nuist.edu.cn/huangzhongwei/zh_CN/index.htm")[Prof. Zhongwei Huang] (NUIST). Discussed with #link("http://faculty.dess.tsinghua.edu.cn/luhui/")[Prof. Hui Lu] (Tsinghua University)],
  location: "",
  date: "Sept 2025 - Present",
  description: [
    - Applied EEMD to 23-year GRACE/GRACE-FO TWS, developed a 3D drought clustering algorithm, identifying 672 discrete global drought events with topological splitting/merging.
    - Constructed $C_E = E'\/(E'-P')$ evaporative contribution framework: 14.8% of grid cells shifted from supply-deficit to compound droughts; area expansion drives ~75\% of global severity increase ($p < 0.05$).
    - Presented at Tsinghua University DESS 2026 National Forum (70 nationwide, English defense); Principal Investigator of the Provincial Undergraduate Training Program on Innovation and Entrepreneurship (XJDC202610300604).
  ]
)

#cv_block(
  name: "Global Unequal Exposure to Intensifying Hydrological Droughts",
  entity: [Research assistant. Advisor: #link("https://faculty.nuist.edu.cn/huangzhongwei/zh_CN/index.htm")[Prof. Zhongwei Huang] (NUIST)],
  location: "",
  date: "Jun 2025 - Aug 2026",
  description: [
- Computed DSI from GRACE/GRACE-FO CSR RL06 v03 mascon TWS via EEMD with Matlab.
-Integrated GPW v4 population grids, decomposing exposure trends: climate 64.5%, population 18.2%, interaction 17.3% (severe events: climate 76.1%).
- Revealed 42.78 million people/yr exposure increase concentrated in developing regions; most high-income regions showed stable/declining trends.
-	Wrote a paper as the first author and under minor revision at the _Journal of Hydrology_.


  ]
)

#cv_block(
  name: "Fluctuation Theorem & TCWV Asymmetry",
  entity: [Independent research. Advisor: #link("https://faculty.nuist.edu.cn/yin/zh_CN/index/111951/list/index.htm")[Prof. Jun Yin] (NUIST). Discussed with #link("https://www.polito.it/en/staff?p=lamberto.rondoni")[Prof. Lamberto Rondoni] (Politecnico di Torino)],
  // location: "Nanjing",
  date: "Sept 2024 - Sept 2025",
  description: [
    - Extended nonequilibrium fluctuation theorem (Yin et al., 2024, _J. Climate_) from surface temperature to TCWV using ERA5; quantified PDF asymmetry $A_("asym")$ across $tau = 1–20$ yr smoothing timescales.
    - Validated SST–TCWV Clausius-Clapeyron scaling ($R^2 = 0.95$, ~7%/K); migrated tail-rescaling framework to precipitation, demonstrating universality. Produced manuscript draft in Typst and LaTeX.
  ]
)
// #pagebreak()
#cv_block(
  name: "WRF-based Precipitation Sensitivity over Jing–Jin–Ji",
  entity: [Independent research. Advisor: #link("https://faculty.nuist.edu.cn/wangmengya/zh_CN/index/142611/list/index.htm")[Dr. Mengya Wang] (NUIST)],
  location: "",
  date: "Mar 2025 - Jul 2025",
  description: [
    - Configured WRF/WPS with 3 nested domains on Linux HPC; conducted 16 sensitivity experiments perturbing soil moisture ($plus.minus 10%$ to $plus.minus 50%$) and urban LULC to simulate rapid regional urbanization.
    - Evaluated precipitation responses via spatial correlation, RMSE, and threat scores; identified optimal cumulus and microphysics parameterization schemes minimizing simulated biases.
  ]
)

#cv_block(
  name: "Precipitation–Runoff Prediction in the Yiluo River Basin",
  entity: [Research assistant. Advisor: #link("https://orcid.org/0000-0001-6983-7368")[Prof. Xing Yuan] (LabESM, Institute of Atmospheric Physics, CAS)],
  location: "",
  date: "Jun 2024 - Mar 2025",
  description: [
    - Applied EOF to monthly precipitation interannual increments, extracting 3 PCs explaining >90% variance; screened key hydroclimatic predictors via correlation analysis and stepwise regression.
    - Built BiLSTM + interannual increment hybrid model: TCC improved 16%, RMSE reduced 20% vs. statistical downscaling; CSSPv2 basin runoff forecasts achieved NSE = 65% for monthly streamflow.
  ]
)

#cv_block(
  name: "Contrasting SST Trends in the Southern Pacific Ocean",
  entity: [Student researcher. Advisor: #link("https://science.gsfc.nasa.gov/sci/bio/george.tselioudis")[Prof. George Tselioudis] (Columbia University / NASA GISS)],
  location: "",
  date: "Mar 2024 - Sep 2024",
  description: [
    - Used Python to analyze 29-year multi-source satellite/reanalysis datasets (Copernicus SST, DUACS SSH, CERES, NCEP, NSIDC SIC) to characterize SST trends across the Southern Pacific (80°W–180, 70°S–30°S).
    - Derived Ekman transport ($U_E$, $V_E$, $W_E$) from wind stress to attribute the SST dipole; diagnosed a sea ice radiative positive feedback cycle. Published as co-first author in _STECEP_ (2024).
  ]
)

= Internship

#cv_block(
  name: "Leizhou Meteorological Bureau, Guangdong",
  entity: [Intern. Forecast Division, #link("http://www.leizhou.gov.cn/lztqyb/")[Leizhou Meteorological Bureau] (Guangdong)],
  location: "Zhanjiang, Guangdong",
  date: "Jul 2025 - Aug 2025",
  description: [
    - Participated in frontline monitoring/warning for Typhoon Danas (2025) and Typhoon Wipha (2025), tracking intensification and landfall trajectories; conducted multi-model NWP comparison (ECMWF, CMA, NCEP, TRAMS).
    - Calibrated field hydrologic equipment (groundwater wells, flux towers, snow sensors) utilizing telemetry systems, ensuring continuous environmental data collection for disaster forecasting.
  ]
)

= Selected Awards & Honors
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
  entity: "NUIST (top 20%)",
  date: "Nov 2024 & Nov 2025"
)
#award_block(
  name: "Merit Student",
  entity: "NUIST (top 15%)",
  date: "Dec 2024"
)
#award_block(
  name: "1st Place, Swimming Medley Relay",
  entity: "NUIST (1/23, department level)",
  date: "May 2025"
)

= Additional Information

#award_block(
  name: "Programming",
  entity: "Python (5 yrs+), Shell Script (5 yrs+), Fortran (2 yrs), Typst/LaTeX (3 yrs)"
)
#award_block(
  name: "Certificates",
  entity: "MIT Deep Learning Lecture Certificate"
)
#award_block(
  name: "Tools",
  entity: "Google Earth Engine, Linux (HPC), Git, WRF, MATLAB"
)
#award_block(
  name: "Languages",
  entity: "English (Academic Proficiency), Chinese (Mandarin, Cantonese), French (A2)"
)

#heading(level: 2, "Activities:")
  - #grid(
    columns: (auto, 1fr, auto),
    "Oral presentation in English, National Forum for Outstanding Undergraduates. ",

    "DESS, Tsinghua University",
    "Jun 2026"
  )              
  - Maintains a public academic website (#cv_link("othodeng.github.io")) sharing study notes from 10+ courses.
  - 10-year swimming training.
  
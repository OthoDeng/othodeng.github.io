#let conf(
  name: none,
  address: none,
  phone: none,
  email: none,
  blog: none,
  birth: none,
  doc
) = {
  set page(margin: (x: 20pt, y: 16pt))
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
    - Weighted average score: 85.53/100 | GPA: 3.57/4.0 | Class ranking: 6/51 *(top 12%)*
    - Research affiliate since 2023, Key Laboratory for Hydrometeorological Hazards, Ministry of Water Resources.
    - Relevant coursework: Probability & Statistics, Remote Sensing for Hydrometeorology, Hydrometeorology Modeling, Numerical Weather Prediction, Python Programming.

  ],
)

= Research Interests
*Remote Sensing · Hydroclimate Extremes · Land–Atmosphere Interactions · Climate Risk Analysis*

= Publications & Manuscripts

[1] *Deng, K.*, Huang, Z.\*, (2026). *Area expansion dominates rising global three-dimensional terrestrial water storage drought severity.* (Manuscript in preparation)

[2] *Deng, K.*, Huang, Z.\*, Li, H., Wu, J., (2026). *Global unequal exposure to intensifying hydrological droughts.* _Journal of Hydrology._ (Revised manuscript under review, R3 submitted)

[3] Wang, J.\* and *Deng, K.* (2024). *A Model that Explains the Contrasting SST Trends in the Southern Pacific Ocean*. _STECEP._ #link("https://doi.org/10.61173/xnag2k18","https://doi.org/10.61173/xnag2k18")

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
  entity: [Independent research. Advisor: #link("https://faculty.nuist.edu.cn/huangzhongwei/zh_CN/index.htm")[Prof. Zhongwei Huang] (NUIST).],
  location: "",
  date: "Sept 2025 - Present",
  description: [
    - Developed a three-dimensional event-tracking framework for 23 years of GRACE/GRACE-FO terrestrial water storage observations, identifying 672 drought events and their splitting–merging lineages.
    - Designed an evaporative contribution diagnostic to distinguish precipitation deficit and evapotranspiration influenced droughts and assess how spatial expansion contributes to increasing event severity.
    - Principal Investigator of the Provincial Undergraduate Training Program on Innovation and Entrepreneurship.
    - Refined the research design and extensions through discussions with #link("http://faculty.dess.tsinghua.edu.cn/luhui/")[Prof. Hui Lu] at the 2026 Tsinghua DESS Forum.
  ]
)

#cv_block(
  name: "Global Unequal Exposure to Intensifying Hydrological Droughts",
  entity: [Research assistant. Advisor: #link("https://faculty.nuist.edu.cn/huangzhongwei/zh_CN/index.htm")[Prof. Zhongwei Huang] (NUIST)],
  location: "",
  date: "Jun 2025 - Aug 2026",
  description: [
- Applied EEMD to GRACE/GRACE-FO CSR RL06 mascon observations and derived event-based drought metrics.
- Integrated GPW population grids to quantify a global increase of 38.76 million person-exposures yr⁻¹ and decomposed the increase into hydroclimatic conditions (73.2%), population growth (5.3%), and their interaction (21.5%).
-	Led the complete research workflow, from study design and global data processing to manuscript preparation and responses to reviewers; revised manuscript under review at _Journal of Hydrology_ (R3 submitted).


  ]
)
// #pagebreak()
#cv_block(
  name: "Fluctuation Theorem & TCWV Asymmetry",
  entity: [Independent research. Advisor: #link("https://faculty.nuist.edu.cn/yin/zh_CN/index/111951/list/index.htm")[Prof. Jun Yin] (NUIST).],
  // location: "Nanjing",
  date: "Sept 2024 - Sept 2025",
  description: [
    - Extended nonequilibrium fluctuation theorem (Yin et al., 2024, _J. Climate_) from surface temperature to TCWV using ERA5; quantified PDF asymmetry $A_("asym")$ across $tau = 1–20$ yr smoothing timescales.
    - Validated SST–TCWV Clausius-Clapeyron scaling ($R^2 = 0.95$, ~7%/K); migrated tail-rescaling framework to precipitation, demonstrating universality. Produced manuscript draft in Typst and LaTeX.
    - Refined the theoretical interpretation and explored extensions to precipitation through research discussions with #link("https://www.polito.it/en/staff?p=lamberto.rondoni")[Prof. Lamberto Rondoni] (Politecnico di Torino).
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
  entity: [Research assistant. Advisor: #link("https://orcid.org/0000-0001-6983-7368")[Prof. Xing Yuan] (Institute of Atmospheric Physics, Chinese Academy of Sciences)],
  location: "",
  date: "Jun 2024 - Mar 2025",
  description: [
    - Applied EOF to monthly precipitation interannual increments, extracting 3 PCs explaining >90% variance; screened key hydroclimatic predictors via correlation analysis and stepwise regression.
    - Built BiLSTM + interannual increment hybrid model: TCC improved 16%, RMSE reduced 20% vs. statistical downscaling; CSSPv2 basin runoff forecasts achieved NSE = 0.65 for monthly streamflow.
  ]
)

#cv_block(
  name: "Contrasting SST Trends in the Southern Pacific Ocean",
  entity: [Student researcher. Advisor: #link("https://science.gsfc.nasa.gov/sci/bio/george.tselioudis")[Prof. George Tselioudis] (Columbia University / NASA GISS)],
  location: "",
  date: "Mar 2024 - Sep 2024",
  description: [
    - Used Python to analyze 29-year multi-source satellite/reanalysis datasets (Copernicus SST, DUACS SSH, CERES, NCEP, NSIDC SIC) to characterize SST trends across the Southern Pacific (80°W–180, 70°S–30°S).
    - Derived Ekman transport ($U_E$, $V_E$, $W_E$) from wind stress to attribute the SST dipole; diagnosed a sea ice radiative positive feedback cycle. Published as co-author in _STECEP_ (2024).
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
  name: "Tsinghua DESS Forum for Outstanding Undergraduates",
  entity: "Selected participant (70 nationwide)",
  date: "Jun 2026"
)
#award_block(
  name: "Provincial Undergraduate Innovation Program",
  entity: "Principal Investigator (Provincial level project)",
  date: "May 2026"
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
  entity: "NUIST (top 20%)",
  date: "Nov 2024 & Nov 2025"
)
#award_block(
  name: "Merit Student",
  entity: "NUIST (top 15%)",
  date: "Dec 2024"
)

= Additional Information

#award_block(
  name: "Programming",
  entity: "Python (5 yrs+), Shell Script (5 yrs+), Fortran (2 yrs), Typst/LaTeX (3 yrs)"
)
#award_block(
  name: "Tools",
  entity: "Google Earth Engine, Linux (HPC), Git, WRF, MATLAB, TensorFlow, PyTorch, ArcGIS"
)
#award_block(
  name: "Languages",
  entity: "English (C1, Academic Proficiency), Chinese (Mandarin, Cantonese), French (A2)"
)

#award_block(
  name: "Activities",
  entity: [Competitive swimmer for 10 years; first place in the NUIST departmental medley relay (2025). Maintains a public academic website (#cv_link("othodeng.github.io")) sharing study notes from 10+ courses.],
)
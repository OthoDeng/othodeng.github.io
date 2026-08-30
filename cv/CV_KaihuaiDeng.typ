#let conf(
  name: none,
  phone: none,
  email: none,
  blog: none,
  doc,
) = {
  set page(margin: (x: 20pt, y: 16pt))
  set text(font: "New Computer Modern", size: 10.5pt)

  set document(
    title: "CV_KaihuaiDeng_revised",
    author: name,
  )

  show link: underline

  set align(center)
  text(size: 18pt, weight: "bold")[#name]
  stack(
    dir: ltr,
    spacing: 4pt,
    text(phone),
    text("·"),
    link("https://" + blog),
    text("·"),
    link("mailto:" + email),
  )

  set align(start)
  set line(stroke: 0.38pt + navy)
  show heading.where(level: 1): it => {
    v(4pt)
    align(left, text(size: 12pt, weight: "bold", upper(it.body), navy))
    v(-9pt)
    line(length: 100%)
    v(3pt)
  }
  show heading.where(level: 2): it => {
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
      text(size: 10.5pt, fill: luma(20%), style: "oblique", entity, spacing: 3pt),
      text(size: 10.5pt, fill: luma(20%), location, style: "oblique", weight: "bold"),
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
    text(size: 10.5pt, fill: luma(20%), entity),
    text(size: 10.5pt, style: "italic", date),
  )
}

#let cv_link(url) = link(
  "https://" + url,
  text(fill: rgb(20%, 20%, 40%), url),
)

#show: doc => conf(
  name: "KAIHUAI DENG",
  phone: "(+86) 173-2700-6642",
  blog: "othodeng.github.io",
  email: "kaihuaideng@nuist.edu.cn",
  doc,
)

= Education
#cv_block(
  name: "Nanjing University of Information Science and Technology (NUIST)",
  date: "Nanjing, China",
  location: "Sep 2023 - Jul 2027 (Expected)",
  entity: [B.S. in Atmospheric Science (Hydrometeorology)],
  description: [
     _NUIST ranked \#1 in China and \#8 globally for Atmospheric Science (2025 ShanghaiRanking GRAS)._
    - Weighted average: 85.53/100 | GPA: 3.57/4.0 | Class rank: 6/51 *(top 12%)*
    - Undergraduate researcher since 2023, Key Laboratory of Hydrometeorological Disaster Mechanism and Warning of Ministry of Water Resources.
    - Relevant coursework: Probability & Statistics, Remote Sensing for Hydrometeorology, Hydrometeorological Modeling, Numerical Weather Prediction, Python Programming.
  ],
)

= Research Interests
*Remote Sensing · Hydroclimate Extremes · Land–Atmosphere Interactions · Climate Risk Analysis*

= Manuscripts & Presentations

[1] *Deng, K.*, Huang, Z.\* _Area Expansion Dominates Rising Global Three-Dimensional Terrestrial Water Storage Drought Severity._ Manuscript in preparation; presented in English at the 2026 National Outstanding Undergraduate Forum, Department of Earth System Science, Tsinghua University *(70 participants nationwide)*.

[2] *Deng, K.*, Huang, Z.\*, Li, H., Wu, J. _Global Unequal Exposure to Intensifying Hydrological Droughts._ Manuscript under review at _Journal of Hydrology_; third revision submitted.

[3] Wang, J.\*, *Deng, K.* (2024). _A Model that Explains the Contrasting SST Trends in the Southern Pacific Ocean._ _STECEP._ #link("https://doi.org/10.61173/xnag2k18", "https://doi.org/10.61173/xnag2k18")

#text(size: 8.8pt, style: "italic")[\* Corresponding author.]

= Research Experience
#cv_block(
  name: "Mitacs Globalink Research Internship",
  entity: [Research intern _|_ Advisor: #link("https://climatesmartlab.ca/team/xander-wang/")[Prof. Xander Wang] (University of Prince Edward Island)],
  location: "Jul 2026 - Present",
  date: "Charlottetown, PE, Canada",
  description: [
    - Awarded the fully funded 2026 Chinese Scholarship Council (CSC)-Canada Mitacs Globalink Research Internship *(≤260 awardees nationwide)*.
    - Analyzing land-atmosphere coupling and GRACE-based groundwater trends for Prince Edward Island; comparing satellite terrestrial water storage estimates with local well observations to assess freshwater sustainability.
  ],
)

#cv_block(
  name: "Global 3D Hydrological Drought Tracking & Mechanism Attribution",
  entity: [Independent research _|_ Advisor: #link("https://faculty.nuist.edu.cn/huangzhongwei/zh_CN/index.htm")[Prof. Zhongwei Huang] (NUIST)],
  location: "",
  date: "Sep 2025 - Present",
  description: [
    - Developed a three-dimensional event-tracking framework for 23 years of GRACE/GRACE-FO terrestrial water storage observations, identifying 672 drought events and reconstructing their splitting-merging lineages.
    - Designed an evaporative-contribution diagnostic to separate precipitation-deficit and evapotranspiration-related influences and quantify how spatial expansion contributes to increasing event severity.
    - Principal Investigator of a Provincial Undergraduate Training Program on Innovation and Entrepreneurship.
  ],
)

#cv_block(
  name: "Global Unequal Exposure to Intensifying Hydrological Droughts",
  entity: [Research assistant _|_ Advisor: #link("https://faculty.nuist.edu.cn/huangzhongwei/zh_CN/index.htm")[Prof. Zhongwei Huang] (NUIST)],
  location: "",
  date: "Jun 2025 - Aug 2026",
  description: [
    - Applied EEMD to GRACE/GRACE-FO CSR RL06 mascon observations and derived event-based drought metrics; integrated GPW population grids to estimate a global trend of 38.76 million person-exposures yr⁻¹.
    - Decomposed the exposure increase into hydroclimatic conditions (73.2%), population growth (5.3%), and their interaction.
    - Led study design, global data processing, visualization, manuscript drafting, and reviewer-response analysis under faculty supervision; third revision submitted to _Journal of Hydrology_.
  ],
)

#cv_block(
  name: "Fluctuation Theorem & TCWV Asymmetry",
  entity: [Independent research _|_ Advisor: #link("https://faculty.nuist.edu.cn/yin/zh_CN/index/111951/list/index.htm")[Prof. Jun Yin] (NUIST)],
  location: "",
  date: "Sep 2024 - Sep 2025",
  description: [
    - Extended a nonequilibrium fluctuation theorem (Yin et al., 2024, _J. Climate_) from surface temperature to TCWV using ERA5; quantified PDF asymmetry $A_("asym")$ across $tau = 1–20$ yr smoothing timescales.
    - Validated SST–TCWV Clausius–Clapeyron scaling ($R^2 = 0.95$, approximately 7%/K) and tested the transferability of the tail-rescaling framework; produced a manuscript draft; discussed with #link("https://www.polito.it/en/staff?p=lamberto.rondoni")[Prof. Lamberto Rondoni] (Politecnico di Torino).
  ],
)

#cv_block(
  name: "WRF-based Precipitation Sensitivity over Jing-Jin-Ji",
  entity: [Independent research _|_ Advisor: #link("https://faculty.nuist.edu.cn/wangmengya/zh_CN/index/142611/list/index.htm")[Dr. Mengya Wang] (NUIST)],
  location: "",
  date: "Mar 2025 - Jul 2025",
  description: [
    - Configured WRF/WPS with three nested domains on Linux HPC; conducted 16 experiments perturbing soil moisture ($plus.minus 10%$ to $plus.minus 50%$) and urban LULC to represent rapid-urbanization scenarios.
    - Evaluated precipitation responses using spatial correlation, RMSE, and threat scores; identified the lowest-bias cumulus–microphysics configuration among the tested experiments.
  ],
)

#cv_block(
  name: "Precipitation–Runoff Prediction in the Yiluo River Basin",
  entity: [Research assistant _|_ Advisor: #link("https://orcid.org/0000-0001-6983-7368")[Prof. Xing Yuan] (Institute of Atmospheric Physics, Chinese Academy of Sciences)],
  location: "",
  date: "Jun 2024 - Mar 2025",
  description: [
    - Applied EOF to monthly precipitation interannual increments, extracting three PCs explaining >90% of variance; screened hydroclimatic predictors using correlation analysis and stepwise regression.
    - Built a BiLSTM + interannual-increment hybrid model, improving TCC by 16% and reducing RMSE by 20% relative to statistical downscaling; evaluated CSSPv2 monthly streamflow forecasts.
  ],
)

#cv_block(
  name: "Contrasting SST Trends in the Southern Pacific Ocean",
  entity: [Student researcher _|_ Advisor: #link("https://science.gsfc.nasa.gov/sci/bio/george.tselioudis")[Prof. George Tselioudis] (Columbia University / NASA GISS)],
  location: "",
  date: "Mar 2024 - Sep 2024",
  description: [
    - Analyzed 29 years of multi-source satellite and reanalysis data (Copernicus SST, DUACS SSH, CERES, NCEP, NSIDC SIC) across the Southern Pacific (80°W–180°, 70°S–30°S).
    - Derived Ekman transport ($U_E, V_E, W_E$) from wind stress to attribute the SST dipole and diagnosed a sea-ice radiative positive-feedback cycle; published as co-author in _STECEP_ (2024).
  ],
)

= Internship
#cv_block(
  name: "Leizhou Meteorological Bureau, Guangdong",
  entity: [Intern _|_ Forecast Division],
  location: "Zhanjiang, China",
  date: "Jul 2025 - Aug 2025",
  description: [
    - Supported operational monitoring and warning for Typhoon Danas (2025) and Typhoon Wipha (2025), tracking intensification and landfall trajectories and comparing ECMWF, CMA, NCEP, and TRAMS forecasts.
    - Participated in calibration and telemetry checks for ometeorological field instruments.
  ],
)

= Selected Awards & Honors
#award_block(
  name: "Provincial Undergraduate Training Program",
  entity: "Principal Investigator (provincial-level project)",
  date: "May 2026",
)
#award_block(
  name: "Mitacs Globalink Research Internship Award",
  entity: [CSC–Mitacs Joint Program (≤260 awardees nationwide)],
  date: "Jan 2026",
)
#award_block(
  name: "Second Class Academic Scholarship",
  entity: "NUIST (top 20%)",
  date: "Nov 2024 & Nov 2025",
)
#award_block(
  name: "Merit Student",
  entity: "NUIST (top 15%)",
  date: "Dec 2024",
)

= Additional Information
#award_block(
  name: "Programming",
  entity: "Python, Shell scripting, Fortran, Typst/LaTeX",
)
#award_block(
  name: "Scientific Computing",
  entity: "Google Earth Engine, Linux/HPC, Git, WRF/WPS, MATLAB, ArcGIS",
)
#award_block(
  name: "Machine Learning",
  entity: "TensorFlow, PyTorch, BiLSTM, EOF, EEMD",
)
#award_block(
  name: "Languages",
  entity: "Mandarin (native), Cantonese (native), English (proficient), French (basic)",
)
#award_block(
  name: "Academic Service",
  entity: [Creator and maintainer of #cv_link("othodeng.github.io"), publishing study notes from 10+ courses],
)

#let conf(
  name: none,
  phone: none,
  email: none,
  blog: none,
  doc,
) = {
  set page(margin: (x: 20pt, y: 16pt))
  set text(font: "New Computer Modern", size: 11pt)
  set par(leading: 0.6em, spacing: 0.7em)
  set list(spacing: 3.5pt)
  set text(hyphenate: false)

  set document(
    title: "CV_KaihuaiDeng",
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
  text(size: 10.5pt, fill: luma(12%), description, spacing: 3pt)
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
     _NUIST ranked \#1 in China and \#8 globally for Atmospheric Science (2026 ShanghaiRanking GRAS)._
    - Weighted average: 85.53/100 | GPA: 3.57/4.0 | Class rank: 6/51 *(top 12%)*
    - Relevant coursework: Probability & Statistics, Remote Sensing for Hydrometeorology, Hydrometeorological Modeling, Numerical Weather Prediction, Python Programming.
  ],
)

= Research Interests
*Remote Sensing · Hydroclimate Extremes · Land–Atmosphere Interactions · Climate Risk Analysis*

= Publications & Manuscripts

[1] *Deng, K.*, Huang, Z.\* _Area Expansion Dominates Rising Global Three-Dimensional Terrestrial Water Storage Drought Severity._ Under review at _Geophysical Research Letters_.

[2] *Deng, K.*, Huang, Z.\*, Li, H., Wu, J. _Global Unequal Exposure to Intensifying Hydrological Droughts._ R4 revision submitted to _Journal of Hydrology_.

[3] Wang, J.\*, *Deng, K.* (2024). _A Model that Explains the Contrasting SST Trends in the Southern Pacific Ocean._ _Science and Technology of Engineering, Chemistry and Environmental Protection._ #link("https://doi.org/10.61173/xnag2k18", "https://doi.org/10.61173/xnag2k18")

#text(size: 8.8pt, style: "italic")[\* Corresponding author.]

= Conference Presentations

*Deng, K.*, Huang, Z. (2026). _Area expansion dominates rising global three-dimensional terrestrial water storage drought severity._ AGU26, San Francisco, USA, 11 December 2026. Accepted poster; presenting author.

*Global 3D TWS drought research.* English research presentation, National Outstanding Undergraduate Forum, Department of Earth System Science, Tsinghua University, June 2026. (70 participants nationwide)

= Research Experience
#cv_block(
  name: "Mitacs Globalink Research Internship",
  entity: [Research intern _|_ Advisor: #link("https://climatesmartlab.ca/team/xander-wang/")[Prof. Xander Wang] (University of Prince Edward Island)],
  location: "Jul 2026 - Oct 2026",
  date: "Charlottetown, PE, Canada",
  description: [
    - Integrated shoreline epochs (1968–2022) and coastal protection records from the PEI Climate Hazard & Risk Information System in QGIS; calculated change statistics weighted by  length and data coverage by coastal setting.
    - Compared historical and recent erosion hotspots using 1,052 fixed transects in 51 spatial groups at Naufrage; found that three of 11 recent hotspots overlapped historical hotspots.
    - Presented findings in lab meetings and coauthored an interim research report.
  ],
)

#cv_block(
  name: "Global 3D Terrestrial Water Storage Drought Tracking",
  entity: [Research assistant | Advisor: #link("https://faculty.nuist.edu.cn/huangzhongwei/zh_CN/index.htm")[Prof. Zhongwei Huang] (NUIST)],
  location: "",
  date: "Sep 2025 - Present",
  description: [
    #text(size: 10pt, style: "italic")[Key Laboratory of Hydrometeorological Disaster Mechanism and Warning]
    - Built a global drought tracking algorithm for GRACE/GRACE-FO observations (2002–2025) using EEMD, GLDAS-2.2 CLSM gap filling, eight-neighbor spatial connectivity, and 16% directional overlap between months.
    - Reconstructed 672 drought events, including splits and mergers; tested overlap thresholds of 10–22% and compared event precipitation and actual evapotranspiration anomalies from ERA5-Land.
    - Produced an event catalog and NetCDF event labels and quantified first-order area and intensity effects on severity; led algorithm implementation, sensitivity analysis, visualization, and manuscript preparation.
  ],
)
// #pagebreak()

#cv_block(
  name: "Global Unequal Exposure to Intensifying Hydrological Droughts",
  entity: [Research assistant _|_ Advisor: #link("https://faculty.nuist.edu.cn/huangzhongwei/zh_CN/index.htm")[Prof. Zhongwei Huang] (NUIST)],
  location: "",
  date: "Jun 2025 - Oct 2026",
  description: [
    #text(size: 10pt, style: "italic")[Key Laboratory of Hydrometeorological Disaster Mechanism and Warning]
    - Applied EEMD to GRACE/GRACE-FO observations, calculated drought frequency, duration, and intensity, and combined drought indicators with GPW population grids; assessed trends using Theil–Sen estimation.
    - Estimated that the population exposed to drought increased by 38.76 million people per year; separated hydroclimatic (73.2%), population (5.3%), and interaction (21.5%) contributions.
    - Led study design, global data processing, visualization, and manuscript drafting; contributed to revision analyses examining mission gaps and population assumptions.
  ],
)


#cv_block(
  name: "Fluctuation Theorem & TCWV Asymmetry",
  entity: [Research assistant | Advisor: #link("https://faculty.nuist.edu.cn/yin/zh_CN/index/111951/list/index.htm")[Prof. Jun Yin] (NUIST)],
  location: "",
  date: "Sep 2024 - Sep 2025",
  description: [
    #text(size: 10pt, style: "italic")[Key Laboratory of Hydrometeorological Disaster Mechanism and Warning]
    - Investigated moisture fluctuations and their relationship with precipitation using monthly ERA5 data (1940–2024); constructed probability density functions and calculated asymmetry $A_("asym")$ using moving averages over different years.
    - Estimated an SST–TCWV regression slope of 0.0645 $"K"^(-1)$ ($R^2 = 0.95$); compared positive and negative distribution tails and conditional relationships among moisture, vertical motion, and precipitation.
    - Independently developed the analyses, figures, and manuscript draft; discussed the framework with #link("https://www.polito.it/en/staff?p=lamberto.rondoni")[Prof. Lamberto Rondoni] (Politecnico di Torino).
  ],
)

#cv_block(
  name: "WRF Precipitation Sensitivity over Jing-Jin-Ji",
  entity: [Advisor: #link("https://faculty.nuist.edu.cn/wangmengya/zh_CN/index/142611/list/index.htm")[Dr. Mengya Wang] (NUIST)],
  location: "",
  date: "Mar 2025 - Jul 2025",
  description: [
    - Configured WRF/WPS on Linux HPC for 5–13 July 2021 with 27/9/3 km nested domains; used WSM6, YSU, and KF as the baseline and disabled cumulus parameterization in the 3 km domain.
    - Compared precipitation responses across physics configurations using spatial correlation, RMSE, and threat scores; assessed differences across rainfall processes and intensity classes.
    - Independently prepared model inputs, configured namelist files, managed HPC jobs, and completed the experiment report; used ndown for nested simulations.
  ],
)

#cv_block(
  name: "Precipitation–Runoff Prediction in the Yiluo River Basin",
  entity: [Research assistant _|_ Advisor: #link("https://orcid.org/0000-0001-6983-7368")[Prof. Xing Yuan] (Institute of Atmospheric Physics, Chinese Academy of Sciences)],
  location: "",
  date: "Jun 2024 - Mar 2025",
  description: [
    - Applied EOF to CN05.1 monthly precipitation interannual increments to characterize variability between years; screened SST and soil moisture predictors using correlation analysis and stepwise regression.
    - Contributed to BiLSTM precipitation prediction and CSSPv2 streamflow experiments driven by precipitation forecasts; evaluated monthly streamflow forecasts and supported model execution on HPC.
    - Team results: three PCs explained >90% of variance; precipitation TCC improved by 16% and RMSE decreased by 20% relative to statistical downscaling; monthly streamflow NSE reached 0.65.
  ],
)

#cv_block(
  name: "Contrasting SST Trends in the Southern Pacific Ocean",
  entity: [Student researcher _|_ Advisor: #link("https://science.gsfc.nasa.gov/sci/bio/george.tselioudis")[Prof. George Tselioudis] (Columbia University / NASA GISS)],
  location: "",
  date: "Mar 2024 - Sep 2024",
  description: [
    - Analyzed Copernicus SST, DUACS sea surface height, CERES radiation, NCEP winds, and NSIDC sea ice across the Southern Pacific (1993–2021); calculated spatial trends and statistical significance.
    - Derived Ekman transport and pumping from wind stress and compared sea ice and radiative changes to develop a conceptual explanation of contrasting SST trends.
    - Collaborated on literature review, data analysis, conceptual modeling, and manuscript writing; second author of the resulting publication.
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
    - Participated in calibration and telemetry checks for meteorological field instruments.
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
  entity: [CSC-Mitacs Joint Program (≤260 awardees nationwide)],
  date: "Jan 2026",
)
#award_block(
  name: "Second Class Academic Scholarship",
  entity: "NUIST (top 20%)",
  date: "Nov 2024, Nov 2025, Nov 2026",
)
#award_block(
  name: "Merit Student",
  entity: "NUIST (top 15%)",
  date: "Dec 2024, Dec 2025, Dec 2026",
)

= Additional Information
#award_block(
  name: "Programming",
  entity: "Python, Shell scripting, Fortran, Typst/LaTeX",
)
#award_block(
  name: "Scientific Computing",
  entity: "Google Earth Engine, Linux/HPC, Git, WRF/WPS, MATLAB, ArcGIS, QGIS",
)
#award_block(
  name: "Statistical & Machine Learning Methods",
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

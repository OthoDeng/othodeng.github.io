#let conf(
  name: none,
  address: none,
  phone: none,
  email: none,
  blog: none,
  birth: none,
  doc
) = {
  set page(margin: (x: 40pt, y: 40pt))
  set text(font: "New Computer Modern", size: 12pt)

  set document(
    title: "CV_en",
    author: name,
  )

  show link: underline
  
  set align(center)
  par(text(size: 18pt, weight: "bold", name))
  v(8pt)
  par(address)
  par(stack(
    dir: ltr,
    spacing: 4pt,
    text(phone),
    text("·"),
    link(blog),
    text("·"),
    link("mailto:" + email)
  ))
  v(4pt)

  set align(start)
  set line(stroke: 0.38pt + luma(20%))
  show heading.where(
    level: 1
  ): it => {
    set text(size: 14pt, weight: "bold")
    v(4pt)
    align(left, smallcaps(it))
    v(-10pt)
    stack(
      dir: ltr,
      spacing: 4pt,
      line(length: 100%),
//      line(length: 4pt),
//      line(length: 4pt),
//      line(length: 4pt),
 //     line(length: 4pt),
 //     line(length: 4pt),
    )
    v(4pt)
  }
  show heading.where(//Heading style
    level: 2
  ): it => {
    box(text(size: 11pt, weight: "semibold", it, rgb("#1A237E")))
  }

  doc
}
#let cv_block(//CV Content style
  name: none,
  date: none,
  entity: none,
  description: none,
  location: none,
  ) = par({
  heading(level:2, name)
    h(1fr)
  text(style: "italic", date)
  v(1pt)
  if entity != none {
    text(fill: luma(20%),style:"oblique", entity)
    h(1fr)
    text(fill: luma(20%),location) 
  }
    text(fill: luma(12%),description)
})

#let award_block(
  name: none,
  date: none,
  entity: none,
  ) = par({
  heading(level:2, name)
  text(". ")
  text(fill: luma(20%),style:"oblique", entity)
    h(1fr)
  text(style: "italic", date)
})

#let cv_link(
  url,
) = link("https://" + url, text(fill: rgb(20%, 20%, 40%), url))

//// Preview ////

#show: doc => conf(
  name: "KAIHUAI DENG",
  address: "No.219, Ningliu Road, Nanjing, Jiangsu, China(Postcode: 210044)",
  birth: "2005/01/20",
  phone: "(+86) 173-2700-6642",
  blog: "https://othodeng.github.io",
  email: "kaihuaideng@nuist.edu.cn",
  doc,
)

= Education
#cv_block(
  name: "Nanjing University of Information Science and Technology",
  date: "Sep 2023 – Jul 2027 (expected)",
  description: [
    - *B.S.* in Atmospheric Science, Hydrometereology division.
    - *Weighted average score*: 85.99 | *GPA*: 3.618.
  ],
)

= Area of Interest
Extreme events · Flash droughts · Land–atmosphere coupling · WRF modeling

= Publications

[1] *Deng, K.*, Huang, Z.\*, Li, H., Wu, J., (2026). *Global unequal exposure to intensifying hydrological droughts.* _Journal of hydrology._ (Major Revision)

[2] *Deng, K.*, Huang, Z.\*, (2026). *Intensifying global 3D terrestrial water storage drought under climate change.* (To be submit)

[3] *Deng, K.*\* and Wang, J. (2024). *A Model that Explains the Contrasting SST Trends in the Southern Pacific Ocean*. _Science and Technology of Engineering, Chemistry, and Environmental Protection._ #link("https://doi.org/10.61173/xnag2k18","doi.org/10.61173/xnag2k18")

= Research Experience
#cv_block(
  name: "Global Spatiotemporal Tracking of 3D Hydrological Drought & Exposure",
  entity: [Independent research. Supervised by #link("https://faculty.nuist.edu.cn/huangzhongwei/zh_CN/index.htm")[Prof. Zhongwei Huang] (NUIST)],
  location: "Nanjing",
  date: "2025.09 – Present",
  description: [
    - Processed 22 years of GRACE/GRACE-FO satellite data via EEMD decomposition to calculate *Drought Severity Index(DSI)*.
    - Engineered a 3D spatiotemporal *Python clustering algorithm* to track drought life-cycles, revealing anthropogenic climate change drives *64.5%* of worsening water-scarcity exposure.
  ]
)

#cv_block(
  name: "WRF-based Precipitation Sensitivity Experiments (Jing–Jin–Ji Region)",
  entity: [Independent research. Supervised by #link("https://faculty.nuist.edu.cn/wangmengya/zh_CN/index/142611/list/index.htm")[Dr. Mengya Wang] (NUIST)],
  location: "Nanjing",
  date: "2025.03 – 2025.07",
  description: [
    - Executed precipitation modeling using *WRF/WPS* on Linux HPC clusters, modifying *cumulus and microphysics parameterizations* to evaluate surface boundary layer fluxes.
    - Quantified model uncertainties to identify *optimal parameterization schemes*, minimizing biases in simulated precipitation and surface-atmosphere energy exchanges. 
  ]
)


#cv_block(
  name: "Precipitation–Runoff Prediction in the Yiluo River Basin",
  entity: [Research assistant. Supervised by #link("https://orcid.org/0000-0001-6983-7368")[Prof. Xin Yuan] (LabESM, CAS)],
  location: "Nanjing",
  date: "2024.06 – 2025.03",
  description: [
    - Analyzed historical hydrometeorological forcings (ERA5, CN05.1) utilizing *EOF decomposition* to extract dominant variability modes.
    - Developed a *physical-statistical surface water routing model* to translate atmospheric boundary conditions into quantitative streamflow, constructing a robust *basin-scale runoff prediction framework*.
  ]
)

#cv_block(
  name: "A Model Explaining Contrasting SST Trends in the Southern Pacific",
  entity: [Supervised by #link("https://faculty.nuist.edu.cn/yin/zh_CN/index/111951/list/index.htm")[Prof. Jun Yin] (NUIST) & #link("https://science.gsfc.nasa.gov/sci/bio/george.tselioudis")[Prof. George Tselioudis] (Columbia University)],
  location: "Beijing",
  date: "2024.03 – 2025.09",
  description: [
    - Analyzed 64 years of *ERA5 reanalysis data* (1960–2024) via *nonequilibrium fluctuation* and *Linear response theory* to evaluate global temperature anomalies.
    - Processed multi-decadal *SST data* to quantify Southern Pacific trends, proposing a *mechanism-based model* elucidating regional thermal behaviors based on *coupled sea–air–ice processes*.
  ]
)
= Internship
#cv_block(
  name: "University of Prince Edward Island, Mitacs",
  entity: [Research assistant. Supervised by #link("https://climatesmartlab.ca/team/xander-wang/")[Prof. Xander Wang] (Climate Smart Lab, UPEI)],
  location: "PEI, Canada",
  date: "2026.07 ~ 2026.10 (Expected)",
  description: [
    - Conduct comprehensive *Climate Change and Health Vulnerability Assessment* for PEI across risk areas using baseline health data and socioeconomic determinants.
    - Map climate-related health disparities for high-risk demographics to inform local *adaptation planning* and public health policy formulation.
  ]
)

#cv_block(
  name: "Leizhou Meteorological Bureau",
  entity: [Intern, Forecasting Division, Guangdong Provincial Meteorological Observation],
  location: "Zhanjiang",
  date: "2025.07 ~ 2025.08",
  description: [
    - Executed real-time radar/satellite monitoring of severe weather (*Typhoons*) and conducted data QA/QC for regional station networks to support *disaster forecasting*.
    - Calibrated and maintained field hydrologic equipment (groundwater wells, flux towers, snow sensors) utilizing *telemetry systems*, ensuring continuous high-fidelity environmental data collection.
  ]
)


= Selected Awards & Honors
#award_block(
  name:"Chinese Government Scholarship",
  entity: "Selected for Mitacs research internship, CSC.",
  date: "Jan 2026"
  
)
#award_block(
  name:"First‑Class Academic Scholarship",
  entity: "Recognition for academic performance, NUIST",
  date: "Nov 2025"
)
#award_block(
  name:"Second‑Class Academic Scholarship",
  entity: "Recognition for academic performance, NUIST",
  date: "Nov 2024"
)

#award_block(
  name: "Merit Student",
  entity: "Recognition for all‑round excellence, NUIST",
  date: "Dec 2024"
)

= Additional Information

- Programming: *Python*, Shell, Fortran, LaTeX, Typst.
- Software: Linux (HPC), Git, *WRF*, Excel, Matlab, *Google Earth Engine*. 
- Languages: English (IELTS overall 7.0), Chinese (native), French (A2, Duolingo).


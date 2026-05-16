#import "book.typ": book-page

#show: book-page.with(title: "Introduction")

#let cv_block(
  name: none,
  date: none,
  entity: none,
  location: none,
  ) = {
  heading(level:2, name)
  text(font: "New Computer Modern", style: "italic", date,)
  v(1pt)
  if entity != none {
    text(fill: luma(20%),style:"oblique", entity)
    text(", ")
    text(fill: luma(20%),location)
  }
}


= About Me

I am *Otto (Kaihuai) Deng*, an undergraduate student in Atmospheric Science (Hydrometeorology) at _Nanjing University of Information Science and Technology_ (NUIST).

My research centers on *satellite remote sensing of hydrological drought*, extending into *land–atmosphere coupling mechanisms* and *climate change impact attribution*. 

I grew up in Guangzhou, a monsoon- and typhoon-prone region  this drives my motivation to use science to reduce harm and inform equitable decision-making.

Supported by the *Chinese Government Scholarship(CSC)* and *Mitacs Globalink Scholarship*, I am pursuing an 2026 internship at #link("https://climatesmartlab.ca/")[UPEI Climate Smart Lab], PEI, Canada).

#link("mailto:kaihuaideng@nuist.edu.cn")[kaihuaideng\[at\]nuist.edu.cn] · #link("https://github.com/OthoDeng")[GitHub] · #link("https://OttoQwQ.me")[Blog] · #link("https://t.me/OttoQwQ")[Telegram]

= Research Interests

#rect(
  radius: 5pt,
  fill: rgb("#F5F5F5"),
)[
  #set text(size: 0.95em)

  *Remote sensing* · *Land–Atmosphere Coupling* · *Climate Change Attribution* · *Drought Population Exposure* · *WRF Modeling* · *Deep Learning* · *Fluctuation Theorem & Non-equilibrium Statistical Physics* · *Numerical Weather Prediction*
]

= Publications

#rect(
  radius: 5pt,
  fill: rgb("#E3F2FD").lighten(50%),
)[
  #set text(font: "Times New Roman")

  [1] *Deng, K.*, Huang, Z.\*, Li, H., Wu, J., (2026). Global unequal exposure to intensifying hydrological droughts. _Journal of Hydrology_. (Major Revision)
  #text(size: 0.85em, fill: luma(40%))[Climate change contributed 64.5% to increased global drought population exposure.]

  [2] *Deng, K.*, Huang, Z.\*, (2026). Intensifying global 3D terrestrial water storage drought under climate change. (To be submitted)
  #text(size: 0.85em, fill: luma(40%))[Adapted a 3D drought tracking algorithm (originated from Herrera-Estrada et al.) to identify 672 global drought events; classified supply-deficit vs. compound droughts via GMM of $C_E$.]

  [3] *Deng, K.\* * and Wang, J. (2024). A Model that Explains the Contrasting SST Trends in the Southern Pacific Ocean. _STECEP_. #link("../2024spring/SouthernOcean.html")[doi.org/10.61173/xnag2k18]

  [4] Yang, Z., Liu, Y., Wu, Y., Wen, Y., Wu, J., *Deng, K.*, et al. (2024). PET Image Synthesis from MRI Using Generative Adversarial Networks. _UV2024, IEEE_.
]


= Research Experience

#cv_block(
  name: "Global 3D Hydrological Drought Tracking & Population Exposure",
  entity: [Independent research. Supervised by #link("https://faculty.nuist.edu.cn/huangzhongwei/zh_CN/index.htm")[Prof. Zhongwei Huang] (NUIST)],
  location: "Nanjing",
  date: "2025.09 – Present",
)
- Adapted and refined a 3D drought tracking algorithm (connected-component labeling + directional overlap tracking, originated from #link("https://www.linkedin.com/in/herreraestrada/")[Dr. Julio E. Herrera-Estrada]) for GRACE/GRACE-FO TWS data; tuned parameters for global-scale application
- Applied EEMD + run theory to compute DSI; classified drought mechanisms via GMM of $C_E$
- Identified 672 global 3D drought events; analyzed trends in frequency, duration, intensity, and spatial migration

#cv_block(
  name: "Global Unequal Exposure to Intensifying Hydrological Droughts",
  entity: [Independent research. Supervised by #link("https://faculty.nuist.edu.cn/huangzhongwei/zh_CN/index.htm")[Prof. Zhongwei Huang] (NUIST)],
  location: "Nanjing",
  date: "2025.03 – 2025.09",
)
- Decomposed climate-driven vs. population-driven contributions to global drought exposure changes
- Integrated GRACE-derived DSI with GPW population grids; applied 11-year moving window + EEMD
- Climate change accounts for 64.5% of increased global drought population exposure
- Under Major Revision at _Journal of Hydrology_

#cv_block(
  name: "WRF-based Precipitation Sensitivity (Jing–Jin–Ji Region)",
  entity: [Independent research. Supervised by #link("https://faculty.nuist.edu.cn/wangmengya/zh_CN/index/142611/list/index.htm")[Dr. Mengya Wang] (NUIST)],
  location: "Nanjing",
  date: "2025.03 – 2025.07",
)
- Configured WRF/WPS to investigate precipitation sensitivity to land surface perturbations over the Beijing–Tianjin–Hebei region

#cv_block(
  name: "Precipitation–Runoff Prediction in the Yiluo River Basin",
  entity: [Research assistant. Supervised by #link("https://orcid.org/0000-0001-6983-7368")[Prof. Xin Yuan] (LabESM, CAS)],
  location: "Nanjing",
  date: "2024.06 – 2025.03",
)
- Applied EOF to extract dominant hydroclimatic modes; implemented Xinanjiang model for 13-year daily streamflow simulation (NSE/KGE evaluation)

#cv_block(
  name: "Contrasting SST Trends in the Southern Pacific",
  entity: [Supervised by #link("https://science.gsfc.nasa.gov/sci/bio/george.tselioudis")[Prof. George Tselioudis] (Columbia University)],
  location: "Beijing",
  date: "2024.03 – 2025.09",
)
- Developed a conceptual model for the SST dipole pattern in the Southern Pacific
- Published as first author in _STECEP_ (2024)

#cv_block(
  name: "Fluctuation Theorem & TCWV Asymmetry",
  entity: [Independent research. Supervised by #link("https://faculty.nuist.edu.cn/yin/zh_CN/index/111951/list/index.htm")[Prof. Jun Yin] (NUIST). Discussed with #link("https://www.polito.it/en/staff?p=lamberto.rondoni")[Prof. Lamberto Rondoni] (Politecnico di Torino)],
  location: "Nanjing",
  date: "2024.07 – Present",
)
- Investigating time-reversal symmetry breaking in atmospheric TCWV using fluctuation theorem
- Quantified PDF asymmetry $A_(a s y m)$ and tail rescaling across $tau = 1$–$20$ yr scales
- SST–TCWV Clausius-Clapeyron scaling: $R^2 = 0.95$, CC rate ~7%/K


= Internship

#cv_block(
  name: "Climate Smart Lab, University of Prince Edward Island",
  entity: [Mitacs Globalink Research Intern. Supervised by #link("https://climatesmartlab.ca/team/xander-wang/")[Prof. Xander Wang]],
  location: "PEI, Canada",
  date: "2026.07 – 2026.10",
)

#cv_block(
  name: "Leizhou Meteorological Bureau",
  entity: [Intern, Forecasting Division, Guangdong Provincial Meteorological Observation],
  location: "Zhanjiang",
  date: "2025.07 – 2025.08",
)
- Typhoon Danas & Wipha frontline monitoring; multi-model ensemble comparison (ECMWF/CMA/NCEP/TRAMS)


= Technical Skills

#rect(
  radius: 5pt,
  fill: rgb("#F5F5F5"),
)[
  #set text(size: 0.95em)

  *Data:* GRACE/GRACE-FO CSR RL06, ERA5, GLDAS 2.2, GPW, Google Earth Engine, NetCDF/HDF5

  *Methods:* EEMD, 3D spatiotemporal clustering, run theory, GMM, EOF, 11-year moving window, LHS, finite difference methods, von Neumann stability analysis

  *Models:* WRF/WPS, Xinanjiang (XAJ)

  *Programming:* Python (numpy, scipy, xarray, PyTorch) · Shell · Fortran · Git · Typst/LaTeX

  *Languages:* Chinese (Mandarin, Cantonese), English (IELTS 7.0, C1), French (A2)
]


= Personal

I love traveling, hiking, and photography — find me on #link("https://www.instagram.com/0ttod3ng/")[Instagram \@0ttod3ng]. Coffee and tea lover, animal person. I play #link("https://maimaidx.jp/")[maimai でらっくす].

More: #link("https://OttoQwQ.me")[Blog] · #link("https://t.me/Otttos_daily")[Daily Life] · #link("https://t.me/AdolescentDelusions")[学术生活 Academic Life]


= About this note

Notes taken by #link("https://github.com/OthoDeng/notes")[Otto Deng] from course lectures. Mistakes? Let me know. More projects: #link("https://github.com/OthoDeng")[GitHub].


= Acknowledgement

Built with #link("https://github.com/typst/typst")[Typst] and #link("https://github.com/Myriad-Dreamin/shiroa")[shiroa]. Some notes use the #link("https://typst.app/universe/package/dvdtyp/")[dvdtyp] template.

*shiroa* (_云笺_) is a tool for creating modern online books in pure typst, similar to #link("https://rust-lang.github.io/mdBook/index.html")[mdBook].

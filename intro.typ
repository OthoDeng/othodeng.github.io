#import "book.typ": book-page

#show: book-page.with(title: "Introduction")

#let cv_block(
  name: none,
  date: none,
  entity: none,
  location: none,
  ) = {
  heading(level:1, name)
  text(font: "Libertinus Serif", style: "italic", date,)
  v(1pt)
  if entity != none {
    text(fill: luma(20%),style:"oblique", entity)
    text(", ")
    text(fill: luma(20%),location)
  }
}


= About Me

I am *Otto (Kaihuai) Deng*, an undergraduate student in Atmospheric Science (Hydrometeorology) at _Nanjing University of Information Science and Technology_ (NUIST). My latest resume: #link("https://raw.githubusercontent.com/OthoDeng/othodeng.github.io/main/cv/CV_KaihuaiDeng.pdf")[CV_Kaihuai_Deng.pdf].

My research centers on *satellite remote sensing of hydrological drought*, extending into *land–atmosphere coupling mechanisms* and *climate change impact attribution*. I grew up in Guangdong, a monsoon and typhoon-proned region, this drives my motivation to use science to reduce harm and inform equitable decision-making.

#link("mailto:kaihuaideng@nuist.edu.cn")[kaihuaideng\[at\]nuist.edu.cn] · #link("https://github.com/OthoDeng")[GitHub] · #link("https://OttoQwQ.me")[Blog] · #link("https://t.me/AdolescentDelusions")[学术生活 Academic Life]

= Recent News
1. I am currently working as a short-term researcher at #link("https://climatesmartlab.ca/")[UPEI Climate Smart Lab], PEI, Canada, supported by the *Chinese Government Scholarship (CSC)* and *Mitacs Globalink Scholarship* ($<=$260 awardees nationwide). Kindly note that my timezone is in UTC-3 (Atlantic Daylight Time), 11 hours behind UTC+8 (China Standard Time).

2. Selected for the #link("https://www.dess.tsinghua.edu.cn/")[Tsinghua University Department of Earth System Sciences] *2026 National Outstanding Undergraduate Forum* (70 nationwide), I presented my 3D drought research in English. Discussed drought mechanisms, AI interpretability, and model coupling with #link("http://faculty.dess.tsinghua.edu.cn/luhui/")[Prof. Hui Lu] (Associate Chair & Professor, Tsinghua DESS), with whom I am exploring remote collaboration opportunities.


= Research Interests
  *Remote Sensing* · *Land–Atmosphere Coupling* · *Extreme Events* · *WRF Modeling*

= Publications

#rect(
  radius: 5pt,
)[
  #set text(font: "Charter")

  [1] *Deng, K.*, Huang, Z.\*, (2026). Area expansion driven intensification and evaporative amplification of global drought. _Geophysical Research Letters_. (to be submitted as Letter)
  #text(size: 0.85em, fill: luma(40%))[First global 3D TWS drought tracking from GRACE/GRACE-FO; identified 672 events (2002–2025); Attribution framework reveals a regime shift from supply-deficit to compound droughts.]

  [2] *Deng, K.*, Huang, Z.\*, Li, H., Wu, J., (2026). Global unequal exposure to intensifying hydrological droughts. _Journal of Hydrology_. (Major Revision)
  #text(size: 0.85em, fill: luma(40%))[Quantified global drought population exposure increasing at 42.78 million people/yr; decomposed climate (64.5%) vs. population (35.5%) contributions.]

  [3] Wang, J.\* and *Deng, K.* (2024). A Model that Explains the Contrasting SST Trends in the Southern Pacific Ocean. _STECEP_. #link("https://doi.org/10.61173/xnag2k18")[doi.org/10.61173/xnag2k18]
  #text(size: 0.85em, fill: luma(40%))[Developed a conceptual sea–air–ice interaction model explaining the Southern Pacific SST dipole, wind-driven Ekman convergence/divergence creates the warming/cooling contrast, while sea ice albedo feedback reinforces the cooling trend.]
]


= Research Experience

#cv_block(
  name: "Global 3D Hydrological Drought Tracking & Mechanism Attribution",
  entity: [Independent research. Supervised by #link("https://faculty.nuist.edu.cn/huangzhongwei/zh_CN/index.htm")[Prof. Zhongwei Huang] (NUIST)],
  location: "Nanjing",
  date: "2025.09 – Present",
)
- Applied EEMD to remove nonlinear anthropogenic trends (groundwater extraction, glacial melt) from 23-year GRACE/GRACE-FO TWS record (2002–2025, 1° grid), isolating climate-driven drought signals.
- Developed a 3D drought tracking algorithm, identifying 672 discrete global drought events with topological splitting/merging handling.
- Constructed a $C_E = E'\/(E'-P')$ evaporative contribution framework; revealed that $14.8%$ of drought-affected grid cells shifted from precipitation-driven to evaporative-demand-amplified regimes, concentrated in the Amazon, Sahel, and southern Europe.
- OLS trend decomposition showed area expansion accounts for 70–80% of global severity increase ($p lt 0.05$); global severity rising at $17 times 10^6 k m^2 dot $month/decade.
- Transformed into 2026 Provincial Undergraduate Training Program on Innovation and Entrepreneurship (XJDC202610300604, provincial-level recommended, PI). Presented at Tsinghua DESS 2026 National Forum (70 selected nationwide, English defense).

#cv_block(
  name: "Global Unequal Exposure to Intensifying Hydrological Droughts",
  entity: [Research assistant. Supervised by #link("https://faculty.nuist.edu.cn/huangzhongwei/zh_CN/index.htm")[Prof. Zhongwei Huang] (NUIST)],
  location: "Nanjing",
  date: "2025.03 – 2025.09",
)
- Applied EEMD (white noise amplitude 0.15, 100 ensemble trials) to remove nonlinear anthropogenic trends from 23-year GRACE/GRACE-FO CSR RL06 v03 mascon TWS (2002–2024, 1° grid), then computed monthly DSI using a climatological standardization framework.
- Integrated GPW v4 population grids (0.25° → 1° interpolation) and decomposed population exposure trends into climate (64.5%), population (18.2%), and interaction (17.3%) contributions; for severe-to-extreme events, climate contribution rose to 76.1%.
- Revealed a pronounced inequality: developing regions with high water scarcity (e.g., East Africa, South Asia, West Asia) experienced the largest exposure increases, while most high-income regions showed stable or declining trends.
- Under Major Revision at _Journal of Hydrology_.

#cv_block(
  name: "Fluctuation Theorem & TCWV Asymmetry",
  entity: [Independent research. Supervised by #link("https://faculty.nuist.edu.cn/yin/zh_CN/index/111951/list/index.htm")[Prof. Jun Yin] (NUIST). Discussed with #link("https://www.polito.it/en/staff?p=lamberto.rondoni")[Prof. Lamberto Rondoni] (Politecnico di Torino)],
  location: "Nanjing",
  date: "2024.09 – 2025.09",
)
- Extended the nonequilibrium fluctuation theorem framework (Yin et al., 2024, _J. Climate_) from surface temperature to total column water vapor (TCWV) using ERA5 reanalysis.
- Quantified time-reversal symmetry breaking via PDF asymmetry metric $A_("asym") = integral P(Delta x) \ln(P(Delta x) / P(-Delta x)) d(Delta x)$ across multi-decadal timescales ($tau = 1, 5, 10, 15, 20$ yr smoothing).
- Validated SST–TCWV Clausius-Clapeyron scaling: $R^2 = 0.95$, slope ~7%/K, confirming the thermodynamic coupling between ocean warming and atmospheric moisture.
- Migrated the tail-rescaling framework from temperature to precipitation, demonstrating universality of the fluctuation-dissipation approach.
- Produced manuscript draft (Typst + LaTeX); discussed theoretical foundations with Prof. Lamberto Rondoni (co-author of the original #link("https://journals.ametsoc.org/view/journals/clim/37/9/JCLI-D-23-0273.1.xml")[fluctuation theorem framework]).

#cv_block(
  name: "Precipitation–Runoff Prediction in the Yiluo River Basin",
  entity: [Research assistant. Supervised by #link("https://orcid.org/0000-0001-6983-7368")[Prof. Xing Yuan] (LabESM, CAS)],
  location: "Nanjing",
  date: "2024.06 – 2025.03",
)
- Applied Empirical Orthogonal Function (EOF) to decompose monthly precipitation interannual increments over the Yiluo River Basin, extracting 3 dominant principal components (PCs) that explain more than 90% of the total variance.
- Screened key hydroclimatic predictors (SST, SM etc.) from global reanalysis datasets using correlation analysis and stepwise regression to identify optimal precursors for seasonal prediction.
- Built a deep learning prediction model using Long Short-Term Memory (LSTM) networks integrated with the interannual increment method, which improved the temporal correlation coefficient (TCC) by 16% and reduced prediction Root-Mean-Square Error (RMSE) by 20% compared to conventional statistical downscaling.
- Evaluated the high-resolution CSSPv2 land surface hydrological model driven by optimized precipitation predictions to simulate mid-to-long-term basin runoff, resulting in a Nash-Sutcliffe Efficiency (NSE) of 65% for monthly streamflow forecasts.

#cv_block(
  name: "WRF-based Precipitation Sensitivity over Jing–Jin–Ji",
  entity: [Independent research. Supervised by #link("https://faculty.nuist.edu.cn/wangmengya/zh_CN/index/142611/list/index.htm")[Dr. Mengya Wang] (NUIST)],
  location: "Nanjing",
  date: "2025.03 – 2025.07",
)
- Configured WRF/WPS with 3 domain setup over the Beijing–Tianjin–Hebei region to investigate precipitation sensitivity to land surface perturbations.
- Conducted 16 sensitivity experiments by systematically perturbing initial soil moisture levels (by ±10% to ±50%) and modifying urban land use/land cover (LULC) extents to simulate rapid regional urbanization.
- Analyzed atmospheric water vapor flux convergence and boundary layer thermodynamic structures, evaluating simulated precipitation responses using spatial correlation, root mean square error (RMSE), and threat scores.

#cv_block(
  name: "Contrasting SST Trends in the Southern Pacific Ocean",
  entity: [Student researcher. Supervised by #link("https://science.gsfc.nasa.gov/sci/bio/george.tselioudis")[Prof. George Tselioudis] (Columbia University / NASA GISS)],
  location: "Beijing",
  date: "2024.03 – 2024.09",
)
- Analyzed 29-year multi-source satellite and reanalysis datasets (1993–2021) — Copernicus SST (0.05°), DUACS SSH (0.25°), CERES radiation (1°), NCEP SLP/SSW (2.5°), NSIDC SIC (25 km) — to characterize SST trends across the Southern Pacific Ocean (80°W–180, 70°S–30°S).
- Derived Ekman transport (zonal UE, meridional VE, vertical WE) from sea surface wind stress to attribute the dipole mechanism: intensified downwelling drives warm-water convergence in the warming region, while strengthened upwelling brings cold deep water to the surface in the cooling region.
- Diagnosed a sea ice radiative positive feedback: upwelled cold water + southerly wind-driven ice transport from polar regions increase sea ice concentration, raising albedo and reducing net downward shortwave radiation, which further amplifies SST cooling in a self-reinforcing cycle.
- Synthesized findings into a conceptual sea–air–ice interaction model; published as first/corresponding author in _STECEP_ (2024).

= Internship

#cv_block(
  name: "Climate Smart Lab, University of Prince Edward Island",
  entity: [Research Intern. Supervised by #link("https://climatesmartlab.ca/team/xander-wang/")[Prof. Xander Wang]],
  location: "PEI, Canada",
  date: "2026.07 – 2026.10",
)
- Fully funded by #link("https://www.mitacs.ca/")[Mitacs Globallink] and #link("https://www.csc.edu.cn/")[Chinese Government Scholarship (CSC)], I am currently conducting research on land–atmosphere coupling diagnostics and GRACE-based groundwater trend analysis for Prince Edward Island (PEI), Canada. EMAIL ME if you are interested in collaborating on this project.

Potential research directions: 
1. Land–atmosphere coupling diagnostics. Comparing coupling metrics (e.g., soil moisture–precipitation feedback, convective triggering potential) between high-resolution regional simulations and coarser driving models; 
2. GRACE-based groundwater trend analysis for PEI, comparing satellite TWS estimates with local well measurements to assess freshwater sustainability in a groundwater-dependent province.

#cv_block(
  name: "Leizhou Meteorological Bureau, Guangdong",
  entity: [Intern, Forecasting Division.],
  location: "Zhanjiang",
  date: "2025.07 – 2025.08",
)
- Participated in frontline monitoring and warning operations for Typhoon Danas (2025) and Typhoon Wipha (2025), tracking real-time intensification and landfall trajectories.
- Conducted multi-model ensemble comparison of NWP forecasts (ECMWF, CMA, NCEP, TRAMS), evaluating track error, intensity bias, and precipitation forecast skill against ground observations.
- Gained operational experience in typhoon early-warning workflow, from numerical guidance interpretation to public warning dissemination.


= Technical Skills

#rect(
  radius: 5pt,
  fill: rgb("#F5F5F5"),
)[
  #set text(size: 0.95em)

  *Software:* Linux (HPC), Git, WRF, Excel, Matlab, Google Earth Engine.

  *Methods:* EEMD, Clustering algorithm, Run theory, GMM, EOF, RSI, Finite difference methods, Von Neumann stability analysis

  *Models:* WRF/WPS, Xinanjiang (XAJ)

  *Programming:* Python (numpy, scipy, xarray, PyTorch) · MATLAB (TopoToolbox) · Shell · Fortran · Git · Typst/LaTeX

  *Languages:* Chinese (Mandarin, Cantonese, Hokkien), English (IELTS 7.0, C1), French (A2)
]


= Personal

I love traveling, hiking, and photography — find me on #link("https://www.instagram.com/0ttod3ng/")[Instagram \@0ttod3ng]. Coffee and tea lover, animal person. I play #link("https://maimaidx.jp/")[maimai でらっくす] BTW.


= About this note

Notes taken by #link("https://github.com/OthoDeng/notes")[Otto Deng] from course lectures. Mistakes? Let me know. More projects: #link("https://github.com/OthoDeng")[GitHub].


= Acknowledgement

Built with #link("https://github.com/typst/typst")[Typst] and #link("https://github.com/Myriad-Dreamin/shiroa")[shiroa]. Some notes use the #link("https://typst.app/universe/package/dvdtyp/")[dvdtyp] template.

*shiroa* (_云笺_) is a tool for creating modern online books in pure typst, similar to #link("https://rust-lang.github.io/mdBook/index.html")[mdBook].

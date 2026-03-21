#import "book.typ": book-page

#show: book-page.with(title: "Introduction")

#let cv_block(//CV Content style
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


= About this note
This note was taken by #link("https://github.com/OthoDeng/notes")[Otto Deng]. He takes notes according to the lectures he attends. If there is any mistake, don't hesitate to let me know! Check out for my GitHub for more projects: #link("https://github.com/OthoDeng")[Otto Deng's GitHub].

= About Otto
I am *Otto Deng*, an undergraduate student majoring in *Atmospheric Science, Hydrometeorology division*. 


= Area of Interest
Extreme events · Flash droughts · Land–atmosphere coupling · WRF modeling

= Research Experience
#cv_block(
  name: "Global Spatiotemporal Tracking of 3D Hydrological Drought & Exposure",
  entity: [Independent research. Supervised by #link("https://faculty.nuist.edu.cn/huangzhongwei/zh_CN/index.htm")[Prof. Weizhong Huang] (NUIST)],
  location: "Nanjing",
  date: "2025.09 – Present",
)

#cv_block(
  name: "WRF-based Precipitation Sensitivity Experiments (Jing–Jin–Ji Region)",
  entity: [Independent research. Supervised by #link("https://faculty.nuist.edu.cn/wangmengya/zh_CN/index/142611/list/index.htm")[Dr. Mengya Wang] (NUIST)],
  location: "Nanjing",
  date: "2025.03 – 2025.07",

)



#cv_block(
  name: "Precipitation–Runoff Prediction in the Yiluo River Basin",
  entity: [Research assistant. Supervised by #link("https://orcid.org/0000-0001-6983-7368")[Prof. Xin Yuan] (LabESM, CAS)],
  location: "Nanjing",
  date: "2024.06 – 2025.03",

)

// #cv_block(
//   name: "Research Assistant, Hydroclimatology and Climate Dynamics",
//   entity: "School of Hydrology and Water Resources, NUIST",
//   location: "Nanjing",
//   date: "2023.09 – 2025.01",
//   description: [
//     - Processed ERA5 reanalysis data and diagnosed land–atmosphere coupling indicators.
//     - Conducted diagnostic analyses of surface fluxes, soil moisture, and atmospheric variables.
//     - Prepared standardized datasets and figures supporting ongoing hydroclimatology research.
//   ]
// )

#cv_block(
  name: "A Model Explaining Contrasting SST Trends in the Southern Pacific",
  entity: [Supervised by #link("https://faculty.nuist.edu.cn/yin/zh_CN/index/111951/list/index.htm")[Prof. Jun Yin] (NUIST) & #link("https://science.gsfc.nasa.gov/sci/bio/george.tselioudis")[Prof. George Tselioudis] (Columbia University)],
  location: "Beijing",
  date: "2024.03 – 2025.09",
)
= Internship
#cv_block(
  name: "University of Prince Edward Island",
  entity: [Research assistant. Supervised by #link("https://climatesmartlab.ca/team/xander-wang/")[Prof. Xander Wang] (Climate Smart Lab, UPEI)],
  location: "PEI, Canada",
  date: "2026.07 ~ 2026.10",
  
)
#cv_block(
  name: "Leizhou Meteorological Bureau",
  entity: [Intern, Forecasting Division, Guangdong Provincial Meteorological Observation],
  location: "Zhanjiang",
  date: "2025.07 ~ 2025.08",
)



= Available Links
There are some ways to reach me:
- #link("CV.typ")[Curriculum Vitae]

- #link("https://OttoQwQ.me")[Blog Posts]

- #link("mailto:ottodeng9@gmail.com")[OttoDeng9\[at\]gmail.com]

- #link("https://t.me/Otttos_daily")[Telegram]


- #link("https://t.me/AdolescentDelusions")[学术生活]



= Acknowledgement
This note is made by #link("https://github.com/typst/typst")[Typst], built with #link("https://github.com/Myriad-Dreamin/shiroa")[shiroa].
In the lastest version of this note, I imported the #link("https://typst.app/universe/package/dvdtyp/")[dvdtyp] template for better styling.

*shiroa* (_Shiro A_, or _The White_, or _云笺_) is a simple tool for creating modern online (cloud) books in pure typst. It has similar use cases as #link("https://rust-lang.github.io/mdBook/index.html")[mdBook], which is ideal for creating product or API documentation, tutorials, course materials or anything that requires a clean, easily navigable and customizable presentation.

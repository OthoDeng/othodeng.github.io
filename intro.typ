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




= About Me
Hello! 
I am *Otto (Kaihuai) Deng*, an undergraduate student majoring in Atmospheric Science, Hydrometeorology Division, _Nanjing University of Information Science and Technology_(NUIST). 

My academic interest lies in *extreme weather events, flash droughts, land–atmosphere coupling, WRF modeling*. I am deeply passionate about understanding the complex mechanisms behind these phenomena, leveraging advanced computational tools, remote sensing products, and modeling to quantify the impacts of anthropogenic climate change on global water resources. 

For more information of my study, see also #link("https://t.me/AdolescentDelusions")[学术生活 Academic Life]: a Telegram channel where I share my thoughts on academia, research, and life as a student.

Throughout my undergraduate studies, I have actively engaged in comprehensive, independent research. Some of my work has been published in peer-reviewed journals, and I have several manuscripts currently under review or in preparation:


#rect(
  radius: 5pt,
  fill: rgb("#E3F2FD").lighten(50%),
)[
  #set text(font: "Times New Roman")
  
  *Deng, K.*, Huang, Z.\*, Li, H., Wu, J., (2026). Global unequal exposure to intensifying hydrological droughts. _Journal of hydrology_. (Major Revision)

  *Deng, K.*, Huang, Z.\*, (2026). Intensifying global 3D terrestrial water storage drought under climate change. (To be submit)

  *Deng, K.\* * and Wang, J. (2024). A Model that Explains the Contrasting SST Trends in the Southern Pacific Ocean. _Science and Technology of Engineering, Chemistry, and Environmental Protection_. #link("../2024spring/SouthernOcean.html")[doi.org/10.61173/xnag2k18]
]

Complementing my academic work, I have gained practical forecasting and fieldwork experience at the _Guangdong Provincial Meteorological Observation_, and I am honored to be sponsored by the _Chinese Government Scholarship_ & _Mitacs Globalink Scholarship_ for an upcoming 2026 research internship at the _University of Prince Edward Island_ in Canada.

- #link("https://OttoQwQ.me")[Blog Posts]
- #link("https://t.me/Otttos_daily")[Telegram Channel] for my daily life and thoughts.
- Email: #link("mailto:ottodeng9@gmail.com")[ottodeng9\[at\]gmail.com]


= Interests
I love traveling, hiking, and exploring new places.

I enjoy photography, check out my Instagram for some of my works(also my daily reels): #link("https://www.instagram.com/0ttod3ng/")[\@0ttod3ng]. 

Strong cooffee lover, sometimes tea as well. 

I love languages learning, currently I can speak: `eng, chi[cmn, yue], fra`. But I actually don't know too much `jpn`.

I play #link("https://maimaidx.jp/")[maimai でらっくす] BTW.


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




= Acknowledgement
This note is made by #link("https://github.com/typst/typst")[Typst], built with #link("https://github.com/Myriad-Dreamin/shiroa")[shiroa].
In the lastest version of this note, I imported the #link("https://typst.app/universe/package/dvdtyp/")[dvdtyp] template for better styling.

*shiroa* (_Shiro A_, or _The White_, or _云笺_) is a simple tool for creating modern online (cloud) books in pure typst. It has similar use cases as #link("https://rust-lang.github.io/mdBook/index.html")[mdBook], which is ideal for creating product or API documentation, tutorials, course materials or anything that requires a clean, easily navigable and customizable presentation.

#import "@preview/shiroa:0.3.1": *

#show: book


#book-meta( // put metadata of your book like book.toml of mdbook
  title: "Notebook by Otto",
  description: "Course notes",
  repository: "https://github.com/othodeng/othodeng.github.io",
  authors: ("Kaihuai-Deng", "Otto-Deng"),
  language: "en",

  summary: [ // this field works like summary.md of mdbook
    #prefix-chapter("intro.typ")[Introduction]

    = Profile
    - #chapter("news.typ")[News]
    - #chapter("research.typ")[Research]
      - #chapter("research/tws-drought.typ")[3D TWS Drought Tracking]
      - #chapter("research/drought-exposure.typ")[Hydrological Drought Exposure]
      - #chapter("research/shoreline-change.typ")[PEI Shoreline Change]
      - #chapter("research/tcwv-asymmetry.typ")[Fluctuation Theorem and TCWV]
      - #chapter("research/wrf-precipitation.typ")[WRF Precipitation Sensitivity]
      - #chapter("research/yiluo-runoff.typ")[Yiluo Precipitation-Runoff Prediction]
      - #chapter("research/southern-ocean.typ")[Southern Pacific SST Trends]
    - #chapter("publications.typ")[Publications & Manuscripts]
    - #chapter("about.typ")[About]

    = Research Notes & Training
    - #chapter("2024spring/RemoteSensing.typ")[Remote Sensing Quick Notes]
    - #chapter("2024spring/SouthernOcean.typ")[A Model that Explains the Contrasting SST Trends in the Southern Pacific Ocean]
    - #chapter("2025spring/GCA2.typ")[The 2nd GEOS-Chem Asia Meeting (GCA2)]
    - #chapter("2026spring/DroughtTracking.typ")[Drought Tracking and Attribution]

    = 2024 Fall
    - #chapter("2024fall/流体力学上.typ")[Fluid Dynamics I]
    - #chapter("2024fall/流体力学下.typ")[Fluid Dynamics II]
    - #chapter("2024fall/大气化学.typ")[Atmospheric Chemistry]
    - #chapter("2024fall/大气物理.typ")[Atmospheric Physics]
    - #chapter("2024fall/数理方程.typ")[Equations of Mathematic Physics]
    - #chapter("2024fall/热力学.typ")[Thermodynamics]
  

    = 2025 Spring
    - #chapter("2025spring/天气学原理.typ")[Principles of Meteorology]
    - #chapter("2025spring/现代气候学.typ")[Modern Climatology]
    - #chapter("2025spring/计算方法.typ")[Computational Methods]

    = 2025 Fall
    - #chapter("2025fall/气象统计实习报告一.typ")[Meteorological Statistics]
      - #chapter("2025fall/气象统计实习报告一.typ")[MS Practice 1]
      - #chapter("2025fall/气象统计实习报告二.typ")[MS Practice 2]
      - #chapter("2025fall/气象统计实习报告三.typ")[MS Practice 3]
      - #chapter("2025fall/气象统计实习报告四.typ")[MS Practice 4]
      - #chapter("2025fall/气象统计实习报告五.typ")[MS Practice 5]
      - #chapter("2025fall/气象统计实习报告六.typ")[MS Practice 6]
      - #chapter("2025fall/气象统计实习报告七.typ")[MS Practice 7]
      - #chapter("2025fall/气象统计实习报告八.typ")[MS Practice 8]
      - #chapter("2025fall/气象统计实习报告九.typ")[MS Practice 9]
    
    = 2026 Spring
    - #chapter("2026spring/数值天气预报.typ")[Numerical Weather Prediction]
      - #chapter("2026spring/数值天气预报实习报告一.typ")[NWP Practice 1]
      - #chapter("2026spring/数值天气预报实习报告二.typ")[NWP Practice 2]
      - #chapter("2026spring/数值天气预报实习报告三.typ")[NWP Practice 3]
      - #chapter("2026spring/数值天气预报实习报告四.typ")[NWP Practice 4]

    - #chapter("2026spring/水文气象模型.typ")[Hydrological and Meteorological Models]

    = 2027 Spring
    - #chapter("2027spring/水文信息学.typ")[Hydrological Informatics]


  ],
)


// re-export page template
#import "templates/page.typ": project
#let book-page = project

#build-meta(dest-dir: "book/")


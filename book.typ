#import "@preview/shiroa:0.1.2": *

#show: book


#book-meta( // put metadata of your book like book.toml of mdbook
  title: "Notebook by Otto",
  description: "Course notes",
  repository: "https://github.com/othodeng/othodeng.github.io",
  authors: ("Kaihuai-Deng", "Otto-Deng"),
  language: "en",

  summary: [ // this field works like summary.md of mdbook
    #prefix-chapter("intro.typ")[Introduction]

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
    - #chapter("2025fall/气象统计.typ")[Meteorological Statistics]
    
    = 2026 Spring
    - #chapter("2026spring/数值天气预报.typ")[Numerical Weather Prediction]
      - #chapter("2026spring/数值天气预报实习报告一.typ")[NWP Practice 1]
      - #chapter("2026spring/数值天气预报实习报告二.typ")[NWP Practice 2]
      - #chapter("2026spring/数值天气预报实习报告三.typ")[NWP Practice 3]

    - #chapter("2026spring/水文气象模型.typ")[Hydrological and Meteorological Models]


    = Research
    - #chapter("2024spring/RemoteSensing.typ")[Remote Sensing Quick Notes]
    - #chapter("2024spring/SouthernOcean.typ")[A Model that Explains the Contrasting SST Trends in the Southern Pacific Ocean]
    - #chapter("2025spring/GCA2.typ")[The 2nd GEOS-Chem Asia Meeting (GCA2)]


  ],
)


// re-export page template
#import "templates/page.typ": project
#let book-page = project

#build-meta(dest-dir: "book/")

#get-book-meta()


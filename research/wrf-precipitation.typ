#import "../book.typ": book-page
#import "../templates/profile.typ": profile, profile-label
#show: book-page.with(title: "WRF-based Precipitation Sensitivity over Jing-Jin-Ji")
#show: profile

#profile-label[March 2025–July 2025] \
Independent research advised by #link("https://faculty.nuist.edu.cn/wangmengya/zh_CN/index/142611/list/index.htm")[Dr. Mengya Wang] (NUIST), Nanjing

= Experiments

I configured WRF/WPS on Linux HPC to compare microphysics, cumulus, and boundary-layer parameterization schemes over the Beijing-Tianjin-Hebei region. The simulations covered 5–13 July 2021, with three nested domains at 27, 9, and 3 km resolution. The baseline used WSM6, YSU, and Kain–Fritsch, with cumulus parameterization disabled in the 3 km domain.

= Evaluation and Interpretation

I compiled and configured WRF/WPS, prepared the inputs, submitted HPC jobs, and compared precipitation and surface sensible and latent heat fluxes across schemes. I also used ndown to manage the computational cost of nested simulations. The project produced a report and comparisons across schemes; the available cases were insufficient to identify a generally optimal configuration for the region.

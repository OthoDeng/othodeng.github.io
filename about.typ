#import "book.typ": book-page
#import "templates/profile.typ": profile, profile-colors, profile-label, profile-panel
#show: book-page.with(title: "About")
#show: profile

= Operational Experience

== Leizhou Meteorological Bureau, Guangdong

*July 2025–August 2025* \
Intern, Forecast Division, Zhanjiang, Guangdong

During Typhoons Danas and Wipha, I participated in operational monitoring and warning activities, followed real-time changes in intensity and landfall trajectories, and compared guidance from ECMWF, CMA, NCEP, and TRAMS. This experience showed me how numerical forecasts, observational evidence, uncertainty, and communication come together in time-sensitive hazard decisions.

= Technical Profile

#profile-panel[
#profile-label[OBSERVATIONS & METHODS]

*Earth observation and data:* GRACE/GRACE-FO, ERA5, SMAP, GPM, Google Earth Engine, ArcGIS, QGIS, CHRIS shoreline data

*Methods:* EEMD, drought indices, run theory, three-dimensional connected-event tracking, exposure decomposition, EOF, regression, sensitivity analysis
]

#profile-panel(color: profile-colors.plum)[
#profile-label(color: profile-colors.plum)[MODELS & COMPUTING]

*Models and computing:* WRF/WPS, CSSPv2, Xinanjiang model, Linux/HPC, Git

*Programming:* Python (NumPy, SciPy, xarray, PyTorch, TensorFlow), MATLAB, Shell, Fortran, Typst/LaTeX
]

*Languages:* Chinese (Mandarin and Cantonese), English (IELTS 7.0), French (A2)

= Beyond Research

#profile-panel(color: profile-colors.amber)[
I have trained as a competitive swimmer for ten years and won first place in a NUIST departmental medley relay in 2025. Outside research, I enjoy traveling, hiking, photography, cooking, coffee and tea, and rhythm games. I also maintain this public collection of course and research notes because writing reproducible explanations is one of the best ways I know to test whether I truly understand a method.
]

You can find selected photography on #link("https://www.instagram.com/0ttod3ng/")[Instagram \@0ttod3ng] and more code and projects on #link("https://github.com/OthoDeng")[GitHub].

= About This Site

These notes were written by #link("https://github.com/OthoDeng/notes")[Otto Deng] from course lectures, research projects, and independent study. If you notice a mistake or would like to discuss a project, please #link("mailto:kaihuaideng@nuist.edu.cn")[get in touch].

The site is written in #link("https://github.com/typst/typst")[Typst] and built with #link("https://github.com/Myriad-Dreamin/shiroa")[shiroa]. Some notes use the #link("https://typst.app/universe/package/dvdtyp/")[dvdtyp] template.

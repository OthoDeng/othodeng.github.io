#import "book.typ": book-page
#import "publication-status.typ": grl-title, grl-status, jh-title, jh-status
#import "templates/profile.typ": profile, profile-colors, profile-label, profile-panel

#show: book-page.with(title: "Publications & Manuscripts")
#show: profile

= Manuscripts Under Review

#profile-panel[
#profile-label[MANUSCRIPT]

*Deng, K.*, Huang, Z.\* (2026). #emph(grl-title). #grl-status

Develops an event-based framework for tracking global terrestrial water storage droughts and examining their severity evolution alongside precipitation and actual evapotranspiration anomalies. #link("research/tws-drought.html")[Project details]
]

#profile-panel[
#profile-label[MANUSCRIPT]

*Deng, K.*, Huang, Z.\*, Li, H., Wu, J. (2026). #emph(jh-title). #jh-status

Combines GRACE/GRACE-FO drought diagnostics with gridded population data to quantify exposure trends, their hydroclimatic and demographic contributions, and regional inequality. #link("research/drought-exposure.html")[Project details]
]

= Published Work

#profile-panel(color: profile-colors.teal)[
#profile-label(color: profile-colors.teal)[PUBLISHED · 2024]

Wang, J.\* and *Deng, K.* (2024). _A Model that Explains the Contrasting SST Trends in the Southern Pacific Ocean._ _STECEP_. #link("https://doi.org/10.61173/xnag2k18")[https://doi.org/10.61173/xnag2k18]

Uses multi-source satellite and reanalysis data to develop a conceptual sea-air-ice explanation for contrasting Southern Pacific SST trends. #link("research/southern-ocean.html")[Project details] · #link("2024spring/SouthernOcean.html")[Article]
]

= Conference Presentations

#profile-panel(color: profile-colors.amber)[
#profile-label(color: profile-colors.amber)[ACCEPTED POSTER · UPCOMING]

*Deng, K.* (presenting author). _Area expansion dominates rising global three-dimensional terrestrial water storage drought severity._ *AGU26*, San Francisco, USA.

Scheduled for *11 December 2026, 08:30–12:00 PST*, Moscone Center, Halls ABC (Poster Hall). Session H51J: _Drought Risk in a Changing Climate: Diagnosis, Modeling, and Management I Poster_. Abstract ID: *2085650*.

#link("research/tws-drought.html")[Research project]
]

#profile-panel(color: profile-colors.teal)[
#profile-label(color: profile-colors.teal)[ORAL PRESENTATION · COMPLETED]

*Deng, K.* Research presentation on global three-dimensional TWS drought tracking. *Forum for Outstanding Undergraduates*, Department of Earth System Science, Tsinghua University, *June 2026*.

Delivered the research presentation and answered technical questions in English. The presentation covered the research question, tracking method, and results, including how event tracking describes drought extent and evolution through time.

#link("research/tws-drought.html")[Research project]
]

#import "book.typ": book-page
#import "news-items.typ": latest-news
#import "templates/profile.typ": profile, profile-colors, profile-panel, profile-entry

#show: book-page.with(title: "Introduction")
#show: profile

#set par(justify: false, leading: 0.75em, spacing: 1em)


= Kaihuai (Otto) Deng

Undergraduate · Nanjing University of Information Science and Technology · Graduating July 2027


#v(0.4em)

Since 2023, I have conducted research at the #link("https://hymed.nuist.edu.cn/main.htm")[*Key Laboratory of Hydrometeorological Disaster Mechanism and Warning of Ministry of Water Resources*] at NUIST.

I use satellite observations, reanalysis, and numerical models to study *hydroclimate extremes*, focusing on drought evolution, land-atmosphere interactions, and climate risk and exposure. My experiences with flooding in Guangzhou and my family's farmland near Zhanjiang keep me interested in when and where hazards reach people, and how reliable that information is.

#v(0.3em)


#link("https://raw.githubusercontent.com/OthoDeng/othodeng.github.io/main/cv/CV_KaihuaiDeng.pdf")[Academic CV]
#h(0.7em)
#link("research.html")[Explore my research #sym.arrow.r]

#block(above: 0.9em)[
  #set text(size: 0.85em)
  #link("mailto:kaihuaideng@nuist.edu.cn")[kaihuaideng\[at\]nuist.edu.cn] \
  #link("https://github.com/OthoDeng")[GitHub] · #link("https://OttoQwQ.me")[Blog] · #link("https://t.me/AdolescentDelusions")[Academics] · #link("https://www.linkedin.com/in/othodeng/")[LinkedIn]
]

#v(0.7em)
#line(length: 100%, stroke: 0.8pt)

= Recent News

#profile-panel(color: profile-colors.amber)[
  #set text(size: 0.9em)
  #set list(spacing: 0.65em)
  #latest-news
]

#link("news.html")[All news]

= Keep Reading

#profile-entry("Research", "research.html", [
  Projects in satellite hydrology, drought, coastal change, and atmospheric modeling.
])

#profile-entry("Publications & Manuscripts", "publications.html", [
  Published work, manuscripts, and conference presentations.
], color: profile-colors.teal)

#profile-entry("About", "about.html", [
  Operational experience, technical profile, and life beyond research.
], color: profile-colors.plum)

#block(above: 1em)[
  #text(size: 0.85em)[*Course notes* · Browse the semester chapters in the navigation for lecture notes and practical reports.]
]

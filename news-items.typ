#let news-items = (
  (
    year: 2026,
    upcoming: true,
    body: [*11 Dec 2026:* My abstract, _Area expansion dominates rising global three-dimensional terrestrial water storage drought severity_, has been accepted for poster presentation at AGU26. I am the presenting author, with the presentation scheduled in San Francisco.],
  ),
  (
    year: 2026,
    upcoming: false,
    body: [*Sep 2026:* Submitted the R4 revision of my first-author manuscript, _Increasing global population exposure to intensifying hydrological droughts with regional disparities_, to _Journal of Hydrology_.],
  ),
  (
    year: 2026,
    upcoming: false,
    body: [*Jul 2026 - Oct 2026:* Began a research internship at the #link("https://climatesmartlab.ca/")[Climate Smart Lab], University of Prince Edward Island, supported by the #link("https://www.mitacs.ca/our-programs/globalink-research-internship/")[CSC-Mitacs Globalink program], studying shoreline change.],
  ),
  (
    year: 2026,
    upcoming: false,
    body: [*Jun 2026:* Selected for the #link("https://www.dess.tsinghua.edu.cn/")[Tsinghua DESS Forum for Outstanding Undergraduates] (70 participants nationwide), where I presented my 3D drought research in English and discussed its design and extensions with #link("http://faculty.dess.tsinghua.edu.cn/luhui/")[Prof. Hui Lu].],
  ),
)

#let latest-news = list(..news-items.slice(0, calc.min(3, news-items.len())).map(item => item.body))

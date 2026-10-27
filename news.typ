#import "book.typ": book-page
#import "news-items.typ": news-items
#import "templates/profile.typ": profile, profile-colors, profile-label, profile-panel

#show: book-page.with(title: "News")
#show: profile

#let upcoming = news-items.filter(item => item.upcoming)
#if upcoming.len() > 0 {
  heading[Upcoming]
  profile-panel(color: profile-colors.amber)[
    #profile-label(color: profile-colors.amber)[ON THE CALENDAR]
    #v(0.4em)
    #list(..upcoming.map(item => item.body))
  ]
}

#let past = news-items.filter(item => not item.upcoming)
#for year in past.map(item => item.year).dedup().sorted().rev() {
  heading(str(year))
  list(..past.filter(item => item.year == year).map(item => item.body))
}

See #link("publications.html")[Publications & Manuscripts] for manuscript status and #link("research.html")[Research] for ongoing projects.

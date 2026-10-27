#import "page.typ": is-dark-theme

#let profile-colors = if is-dark-theme {
  (blue: rgb("8fc9ef"), teal: rgb("8fd4c5"), amber: rgb("e2bc7d"), plum: rgb("c8b1e8"))
} else {
  (blue: rgb("215c88"), teal: rgb("196b61"), amber: rgb("8a551e"), plum: rgb("725394"))
}

#let profile(body) = {
  set par(justify: false, leading: 0.75em, spacing: 0.9em)
  show heading.where(level: 1): it => {
    set text(font: "Libertinus Serif", fill: profile-colors.blue)
    it
  }
  body
}

#let profile-label(body, color: profile-colors.blue) = box(
  inset: (x: 7pt, y: 4pt),
  radius: 3pt,
  fill: color.transparentize(90%),
  text(
    font: ("BlexMono Nerd Font Mono", "DejaVu Sans Mono"),
    size: 0.7em,
    fill: color,
    body,
  ),
)

#let profile-panel(body, color: profile-colors.blue) = block(
  width: 100%,
  breakable: false,
  inset: 13pt,
  radius: 6pt,
  fill: color.transparentize(94%),
  stroke: 0.6pt + color.transparentize(65%),
  above: 0.9em,
  below: 0.9em,
  body,
)

#let profile-entry(title, destination, description, color: profile-colors.blue) = profile-panel(color: color)[
  #text(font: "Libertinus Serif", size: 1.12em, weight: "bold", fill: color)[
    #link(destination)[#title #sym.arrow.r]
  ]
  #v(0.35em)
  #text(size: 0.9em)[#description]
]

// This is important for shiroa to produce a responsive layout
// and multiple targets.
#import "@preview/shiroa:0.3.1": get-page-width, is-web-target, is-pdf-target, plain-text, x-target, shiroa-sys-target

// --- Inlined from shiroa template-link.typ (not exported in v0.3.1) ---
#let _make-unique-label(it, disambiguator: 1) = label({
  let k = plain-text(it).trim()
  if disambiguator > 1 {
    k + "_d" + str(disambiguator)
  } else {
    k
  }
})

#let _label-disambiguator = state("label-disambiguator", (:))
#let _update-label-disambiguator(k) = _label-disambiguator.update(it => {
  it.insert(k, it.at(k, default: 0) + 1)
  it
})
#let _get-label-disambiguator(loc, k) = _make-unique-label(k, disambiguator: _label-disambiguator.at(loc).at(k))

#let heading-hash(it, hash-color: blue) = {
  let title = plain-text(it.body)
  if title != none {
    let title = title.trim()
    _update-label-disambiguator(title)
    context if shiroa-sys-target() == "paged" {
      let loc = here()
      let dest = _get-label-disambiguator(loc, title)
      let h = measure(it.body).height
      place(
        left,
        dx: -20pt,
        [
          #set text(fill: hash-color)
          #link(loc)[\#] #dest
        ],
      )
    } else {
      let loc = here()
      let dest = _get-label-disambiguator(loc, title)
      html.elem(
        "div",
        attrs: (
          role: "none",
          style: "float: left; width: 0pt; position: relative; right: var(--heading-hash-offset-"
            + str(it.level)
            + ", 20px)",
        ),
      )[
        #set text(fill: hash-color)
        #html.elem(
          "h" + str(it.level + 1),
          attrs: (style: "display: inline;", class: "typst-content-link shiroa-heading-hash"),
          [
            #link(dest)[\#] #dest
          ],
        )
      ]
    }
  }
}

// --- Inlined from shiroa template-theme.typ (not exported in v0.3.1) ---
#let book-theme-from(preset, xml: xml, read: none, target: x-target) = {
  let theme-target = if target.contains("-") {
    target.split("-").at(1)
  } else {
    "light"
  }
  if theme-target == "wrapper" {
    theme-target = "light"
  }
  let theme-style = preset.at(theme-target)

  let is-dark-theme = theme-style.at("color-scheme") == "dark"
  let is-light-theme = not is-dark-theme

  let main-color = rgb(theme-style.at("main-color"))
  let dash-color = rgb(theme-style.at("dash-color"))

  let code-theme-file = theme-style.at("code-theme")

  let code-extra-colors = if code-theme-file.len() > 0 {
    if read != none {
      theme-style.insert("code-theme", bytes(read(code-theme-file)))
    }
    let data = xml(theme-style.at("code-theme")).first()

    let find-child(elem, tag) = {
      elem.children.find(e => "tag" in e and e.tag == tag)
    }

    let find-kv(elem, key, tag) = {
      let idx = elem.children.position(e => "tag" in e and e.tag == "key" and e.children.first() == key)
      elem.children.slice(idx).find(e => "tag" in e and e.tag == tag)
    }

    let plist-dict = find-child(data, "dict")
    let plist-array = find-child(plist-dict, "array")
    let theme-setting = find-child(plist-array, "dict")
    let theme-setting-items = find-kv(theme-setting, "settings", "dict")
    let background-setting = find-kv(theme-setting-items, "background", "string")
    let foreground-setting = find-kv(theme-setting-items, "foreground", "string")
    (bg: rgb(background-setting.children.first()), fg: rgb(foreground-setting.children.first()))
  } else {
    (bg: rgb(239, 241, 243), fg: none)
  }

  (
    style: theme-style,
    is-dark: is-dark-theme,
    is-light: is-light-theme,
    main-color: main-color,
    dash-color: dash-color,
    code-extra-colors: code-extra-colors,
  )
}

// Metadata
#let page-width = get-page-width()
#let is-pdf-target = is-pdf-target()
#let is-web-target = is-web-target()

// Theme (Colors)
#let (
  style: theme-style,
  is-dark: is-dark-theme,
  is-light: is-light-theme,
  main-color: main-color,
  dash-color: dash-color,
  code-extra-colors: code-extra-colors,
) = book-theme-from(toml("theme-style.toml"), xml: it => xml(it))

// Fonts
#let main-font = (
  "Arial",
  "BabelStone Han",
  // "Source Han Serif TC",
  // shiroa's embedded font
  "Libertinus Serif",
)
#let code-font = (
  "BlexMono Nerd Font Mono",
  // shiroa's embedded font
  "DejaVu Sans Mono",
)

// Sizes
#let main-size = if is-web-target {
  16pt
} else {
  10.5pt
}
#let heading-sizes = (26pt, 22pt, 14pt, 12pt, main-size)
#let list-indent = 0.5em

// Set page properties at top level for Typst 0.14+ compatibility
#set page(
  numbering: none,
  number-align: center,
  width: page-width,
)

#set page(
  margin: (
    top: 20pt,
    left: 20pt,
    bottom: 0.5em,
    rest: 0pt,
  ),
  height: auto,
) if is-web-target

/// The project function defines how your document looks.
/// It takes your content and some metadata and formats it.
/// Go ahead and customize it to your liking!
#let project(title: "Typst Book", authors: (), kind: "page", body) = {

  // set basic document metadata
  set document(
    author: authors,
    title: title,
  ) if not is-pdf-target

  // set web/pdf page properties
  // Note: set page() moved to top level for Typst 0.14+ compatibility

  // Set main text
  set text(
    font: main-font,
    size: main-size,
    fill: main-color,
    lang: "en",
  )

  // Set main spacing
  set enum(
    indent: list-indent * 0.618,
    body-indent: list-indent,
  )
  set list(
    indent: list-indent * 0.618,
    body-indent: list-indent,
  )
  set par(leading: 0.7em)
  set block(spacing: 0.7em * 1.5)

  // Set text, spacing for headings
  // Render a dash to hint headings instead of bolding it as well if it's for web.
  show heading: set text(weight: "regular") if is-web-target
  show heading: it => {
    let it = {
      set text(size: heading-sizes.at(it.level))
      if is-web-target {
        heading-hash(it, hash-color: dash-color)
      }
      it
    }

    block(
      spacing: 0.7em * 1.5 * 1.2,
      below: 0.7em * 1.2,
      it,
    )
  }

  // link setting
  show link: set text(fill: dash-color)

  // math setting
  show math.equation: set text(weight: 400)

  // code block setting
  show raw: it => {
    set text(font: "Geneva")
    if "block" in it.fields() and it.block {
      rect(
        width: 100%,
        inset: (x: 4pt, y: 5pt),
        radius: 4pt,
        fill: code-extra-colors.bg,
        [
          #set text(fill: code-extra-colors.fg) if code-extra-colors.fg != none
          #set par(justify: false)
          // #place(right, text(luma(110), it.lang))
          #it
        ],
      )
    } else {
      it
    }
  }

  // Main body.
  set par(justify: true)

  body
}

#let part-style = heading

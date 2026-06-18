#let Chemistry-Style-disable-state = state("Chemistry-Style-disable", true)

#let chem-toggle(bool) = {Chemistry-Style-disable-state.update(bool)}

#let if-state-enabled( it , fn ) = {
    context {
      let bDisable = Chemistry-Style-disable-state.get()
      if ( bDisable == false ){ it }
      else { fn }
    }
}

#let chem-disabled(content) = {
  chem-toggle(false)
  content
  chem-toggle(true)
}

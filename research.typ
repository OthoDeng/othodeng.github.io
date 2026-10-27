#import "book.typ": book-page
#import "templates/profile.typ": profile, profile-colors, profile-label, profile-panel, profile-entry

#show: book-page.with(title: "Research")
#show: profile

= Satellite Hydrology and Drought

#profile-entry("Global 3D Terrestrial Water Storage Drought Tracking", "research/tws-drought.html", [
  Tracking droughts as connected events through space and time using GRACE/GRACE-FO observations, with measures of area, intensity, severity, movement, and lineage.
])

#profile-entry("Global Unequal Exposure to Intensifying Hydrological Droughts", "research/drought-exposure.html", [
  Combining satellite-derived drought diagnostics with population grids to examine exposure trends and their hydroclimatic and demographic contributions.
])

= Coastal Change

#profile-entry("Shoreline Change on Prince Edward Island", "research/shoreline-change.html", [
  Mapping historical shoreline data and comparing shoreline change rates, hotspot persistence, and changes near coastal structures.
], color: profile-colors.teal)

= Atmospheric Science Research

#profile-label(color: profile-colors.plum)[PROCESSES · MODELS · PREDICTION]

*#link("research/tcwv-asymmetry.html")[Fluctuation Theorem and TCWV Asymmetry]*

Exploring probability-distribution asymmetry in water vapor and precipitation, and its relationship to a fluctuation-theorem framework.

*#link("research/wrf-precipitation.html")[WRF-based Precipitation Sensitivity over Jing-Jin-Ji]*

Comparing precipitation and surface heat fluxes across WRF microphysics, cumulus, and boundary-layer schemes.

*#link("research/yiluo-runoff.html")[Precipitation-Runoff Prediction in the Yiluo River Basin]*

Participating in a team project using EOF analysis, predictor selection, BiLSTM prediction, and CSSPv2 runoff simulation.

*#link("research/southern-ocean.html")[Contrasting SST Trends in the Southern Pacific Ocean]*

Using satellite and reanalysis data to investigate connections among wind, ocean transport, sea ice, and SST trends.

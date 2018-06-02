##
# home_p5_map
##
div_home_p5_map <- tags$div(
  id = "panel5",
  googleway::google_mapOutput("map", height = "650px")
)
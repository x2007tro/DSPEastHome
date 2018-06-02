##
# home_p4_schedule
##
div_home_p4_schedule <- tags$div(
  id = "panel4_frame",
  tags$div(class = "panel4_space"),
  tags$div(
    id = "panel4_content",
    tags$h2(style = "color:white", "SCHEDULE /"), br(),
    uiOutput("opt_schedule")
  ),
  tags$div(class = "panel4_space")
)
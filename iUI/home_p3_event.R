##
# home_p3_event
##
div_home_p3_event <- tags$div(
  id = "panel3_frame",
  tags$div(class = "panel3_space"),
  fluidRow(
    column(
      width = tp_wid_hlf,
      align = "center",
      style = "border:0px;",
      tags$div(
        id = "event_when_frame",
        tags$div(
          id = "event_when_content",
          tags$h4(style = "color:gray", "WHEN /"),
          uiOutput("opt_event_when")
        )
      )
    ),
    column(
      width = tp_wid_hlf,
      align = "center",
      style = "border:0px;",
      tags$div(
        id = "event_where_frame",
        tags$div(
          id = "event_where_content",
          tags$h4(style = "color:gray", "WHERE /"),
          uiOutput("opt_event_where")
        )
      )
    )
  ),
  tags$div(class = "panel3_space"),
  fluidRow(
    column(
      width = 12,
      align = "center",
      style = "border:0px;",
      tags$div(
        id = "event_about_frame",
        tags$div(
          id = "event_about_content",
          tags$h4(style = "color:gray", "ABOUT THE EVENT /"),
          uiOutput("opt_event_about")
        )
      )
    )
  ),
  tags$div(class = "panel3_space")
)
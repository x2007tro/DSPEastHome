##
# home_p2_joinus
##
div_home_p2_joinus <- tags$div(
  id = "panel2_frame",
  tags$div(
    id = "panel2_content",
    tags$h5(style = "color:rgba(96, 96, 94, 1)", "PLEASE JOIN US VIA SLACK"),
    br(),
    actionButton("req_join", "Request Now")
  )
)
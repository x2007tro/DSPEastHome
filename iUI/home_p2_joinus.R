##
# home_p2_joinus
##
div_home_p2_joinus <- tags$div(
  id = "panel2_frame",
  tags$div(class = "panel2_space"),
  tags$div(
    id = "panel2_content",
    tags$h5(style = "color:rgba(96, 96, 94, 1)", "PLEASE JOIN US"),
    br(),
    tags$div(style = "margin:0; ", textInput("req_email", NULL, "your_email@email.com")),
    tags$div(style = "margin:0; ", actionButton("req_join", "Request now"))
  ),
  tags$div(class = "panel2_space")
)
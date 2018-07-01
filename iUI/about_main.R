##
# about us section
##
div_about_main <- tags$div(
  style = "margin:0;",
  id = "panel_about_main",
  tags$div(
    style = "padding:5px; margin:5px; background-color:rgba(255, 255, 255, 0.7); border-radius:5px;",
    tags$h1(style="color:white; font-weight:bold; background-color:rgba(255, 0, 0, 0.7); padding:5px 0;border-radius:5px;","About us"),
    br(),
    tags$h1(style="color:rgba(48, 59, 69, 1); font-weight:bold;border-radius:5px;","We're a Canadian East Coast network of practicing data scientists, 
            researchers and supporting organizations driven to expand our capabilities 
            in Data Science and Artificial Intelligence.")
  )
)
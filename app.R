##
# Load liabs
##
library(shiny)
library(DT)
library(shinythemes)
library(googleway)
library(readxl)
library(dplyr)
library(httr)
library(assertive)

##
# Source server and ui components
##
source("./global.R")
source("./iUI/main.R")
source("./iServer/main.R")

##
# Launch shiny app
##
shinyApp(
  ui = mainUI,
  server = mainServer
)
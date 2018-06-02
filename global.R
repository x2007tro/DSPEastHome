##
# Directory parameters
##
# dev_dir <- paste0("C:/Users/",Sys.info()["user"], "/OneDrive/Development/")
# shiny_dir <- paste0(dev_dir, "Shiny/DSPEastHome/")
# setwd(shiny_dir)

##
# Load helpers
##
# source(paste0(shiny_dir, "Helper/ml_helper.R"))

##
# UI parameters
##
tp_wid_nar <- 2
tp_wid_med <- 4
tp_wid_hlf <- 6
tp_wid_wde <- 8
file_dir_field_width <- "700px"
blotter_field_default_width <- "90px"
gmap_api_key <- "AIzaSyBqXn0BmOkn5mCtyhpHh2ROPHX8YfVS-bg"
gmap_custom_style <- 
'[
{"featureType":"all","elementType":"all","stylers":[{"invert_lightness":false},{"saturation":-100},{"lightness":30},{"gamma":0.5},{"hue":"#435158"}]},
{"featureType":"road.arterial","elementType":"all","stylers":[{"color":"#ff7f7f"}]},
{"featureType":"transit.station","elementType":"labels.text","stylers":[{"visibility":"off"}]}
]'

##
# CSS helper
##
css_center <- "position:absolute; left:0; right:0; top:0; bottom:0; margin:auto;"

##
# Event data
##
event_wb_path <- "./input/event.xlsx"



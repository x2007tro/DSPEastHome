##
# Load helpers
##
source("./helper/mailgun.R")
source("./helper/sendEmail.R")

##
# Event data
##
event_wb_path <- "./input/event.xlsx"

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
# Email list
##
email_list <- c("kemin.business@gmail.com")
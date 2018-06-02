##
# home_p5_map server
##

##
# Render location on google map
##
output$map <- googleway::renderGoogle_map({
  if(length(event()) == 0){
    googleway::google_map(key = gmap_api_key,
                          location = c(45.964993, -66.646332),  # Fallback option: Fredericton
                          styles = gmap_custom_style,
                          zoom = 15)
  } else {
    googleway::google_map(key = gmap_api_key,
                          data = event()$event_info,
                          location = c(event()$event_info$loc_lat,
                                       event()$event_info$loc_lon),
                          styles = gmap_custom_style,
                          zoom = 12) %>% 
      googleway::add_markers(lat = "loc_lat", 
                             lon = "loc_lon",
                             info_window = "loc_name",
                             update_map_view = FALSE)
  }
})
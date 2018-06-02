
#
# Shiny server
#
mainServer <- function(input, output, session) {

  ##
  # Setup root directory if user selects different path
  ##
  source("./iServer/data_load.R", local = TRUE)
  
  ##
  # server function for panel1
  ##
  source("./iServer/home_p1_post.R", local = TRUE)
  
  ##
  # server function for panel2
  ##
  source("./iServer/home_p2_joinus.R", local = TRUE)
  
  ##
  # server function for panel3
  ##
  source("./iServer/home_p3_event.R", local = TRUE)
  
  ##
  # server function for panel4
  ##
  source("./iServer/home_p4_schedule.R", local = TRUE)
  
  ##
  # server function for panel5
  ##
  source("./iServer/home_p5_map.R", local = TRUE)
}

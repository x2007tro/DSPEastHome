##
# home_p1_post server
##

##
# Render event date and time on post
##
output$opt_event_post_dt <- renderUI({
  if(length(event()) == 0){
    list(
      tags$h4(style = "color:white", "data processing error")
    )
  } else {
    opt_date <- event()$event_info$mth_day
    opt_time <- event()$event_start
    
    list(
      tags$h4(style = "color:white", paste0(opt_date, " at ", opt_time))
    )
  }
})

##
# Render event name on post
##
output$opt_event_post_name <- renderUI({
  if(length(event()) == 0){
    list(
      tags$h2(style = "color:white", "data processing error")
    )
  } else {
    opt_event_names <- event()$event_names
    n <- length(opt_event_names)
    
    list(
      lapply(1:n, function(i){
        tags$h1(style = "color:white; font-weight:bold;", opt_event_names[[i]])
      })
    )
  }
  
})

##
# Render event date and time on post
##
output$opt_event_post_loc <- renderUI({
  if(length(event()) == 0){
    list(
      tags$h4(style = "color:white", "data processing error")
    )
  } else {
    opt_loc <- event()$event_info$loc_name
    
    list(
      tags$h4(style = "color:white", paste0("@", opt_loc))
    )
  }
  
})
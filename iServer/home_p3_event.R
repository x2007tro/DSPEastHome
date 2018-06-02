##
# home_p3_event server
##

##
# Render event date
##
output$opt_event_when <- renderUI({
  if(length(event()) == 0){
    list(
      tags$h2(style = "color:rgba(48, 59, 69, 1); font-weight:bold;", "data processing error")
    )
  } else {
    opt_md <- event()$event_info$mth_day
    opt_yr <- event()$event_info$yr
    
    list(
      tags$h1(style = "color:rgba(48, 59, 69, 1); font-weight:bold;", paste0(opt_md,",")),
      tags$h1(style = "color:rgba(48, 59, 69, 1); font-weight:bold;", opt_yr)
    )
  }
})

##
# Render event location
##
output$opt_event_about <- renderUI({
  if(length(event()) == 0){
    list(
      tags$h2(style = "color:rgba(48, 59, 69, 1); font-weight:bold;", "data processing error")
    )
  } else {
    opt_event_descrips <- event()$event_descrips
    n <- length(opt_event_descrips)
    
    list(
      lapply(1:n, function(i){
        tags$h1(style = "color:rgba(48, 59, 69, 1); font-weight:bold;", opt_event_descrips[[i]])
      })
    )
  }
})

##
# Render event about
##
output$opt_event_where <- renderUI({
  if(length(event()) == 0){
    list(
      tags$h2(style = "color:rgba(48, 59, 69, 1); font-weight:bold;", "data processing error")
    )
  } else {
    opt_event_loc_name <- event()$event_info$loc_name
    opt_event_loc_add <- event()$event_info$loc_address
    
    list(
      tags$h1(style = "color:rgba(48, 59, 69, 1); font-weight:bold;", opt_event_loc_name),
      tags$h1(style = "color:rgba(48, 59, 69, 1); font-weight:bold;", opt_event_loc_add)
    )
  }
})
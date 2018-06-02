##
# home_p4_schedule server
##

##
# Render event schedule
##
output$opt_schedule <- renderUI({
  if(length(event()) == 0){
    list(
      tags$h2(style = "color:white", "data processing error")
    )
  } else {
    opt_sche_tms <- event()$event_sche_time
    opt_sche_dtls <- event()$event_sche_details
    n <- min(length(opt_sche_tms), length(opt_sche_dtls))
    
    lapply(1:n, function(i){
      tags$div(
        tags$h1(style = "color:white; font-weight:bold;", opt_sche_tms[[i]]),
        tags$h2(style = "color:white", opt_sche_dtls[[i]]),
        br()
      )
    })
  }
})
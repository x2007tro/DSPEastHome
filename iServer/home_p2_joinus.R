##
# home_p2_joinus server
##
observeEvent(input$req_join, {
  msg <- input$req_email
  
  tryCatch({
    SendEmailFromDSPEast(email_list, "New join request", msg)
    showNotification("Email is successfully sent to the organizer. We will contact you shortly.",
                     type = "message")
  },
  error = function(cond) {
  },
  warning = function(cond) {
  },
  finally = {
    
  })
  
})
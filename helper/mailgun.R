#' @title mailgun factory
#' @description Creates an `IMmailgun` object that allows you to send emails and retrieve stats from your mailgun account.
#' @export
mailgun <- R6::R6Class(
  "IMmailgun",
  private = list(
    ..url = NULL,
    ..api_key = NULL,
    ..from = NULL,
    ..subject = "Mailgun from R"
  ),
  
  active = list(
    
    from = function(value){
      if(missing(value)){
        private$..from
      } else {
        if(!assertive::is_a_string(value)) stop("from has to be a character string")
        private$..from <- value
      }
    },
    
    subject = function(value){
      if(missing(value)){
        private$..subject
      } else {
        if(!assertive::is_a_string(value)) stop("subject has to be a character string")
        private$..subject <- value
      }
    }
  ),
  
  public = list(
    initialize = function(url, api_key, from){
      private$..url <- url
      private$..api_key <- api_key
      private$..from <- from
    },
    
    sendEmail = function(to, subject, plaintext=NA,
                         html=NA, attachment=NA){
      
      if(!missing(subject)){
        private$..subject <- subject
      }
      
      lapply(X = to, FUN = sendEmail,
             from = private$..from,
             plaintext = plaintext,
             html = html,
             subject = private$..subject,
             attachment = attachment,
             url = paste0(private$..url, "/messages"),
             api_key = private$..api_key)
      
      
    },
    
    stats = function(){
      req <- httr::GET(paste0(private$..url, "/stats"),
                       httr::authenticate("api", private$..api_key),
                       query = list(event='accepted', event='opened',
                                    event='complained', event='clicked',
                                    event='failed'))
      httr::stop_for_status(req)
      stats <- httr::content(req, "parsed", "application/json")
      df <- data.frame(matrix(unlist(stats$items), nrow = length(stats$items), byrow = T))
      colnames(df) <- c("id", "event", "total_count", "created_at")
      df$created_at <- as.POSIXct(df$created_at, format = '%a, %d %b %Y %H:%M:%S')
      df
    }
  )
  
)
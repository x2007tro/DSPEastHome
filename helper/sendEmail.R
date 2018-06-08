##
# Send emails using mailgun
##
sendEmail <- function(from, to, plaintext, html, subject, attachment, url, api_key){
  if(!is.na(html)) html <- readChar(html, nchar = file.info(html)$size)
  if(!is.na(attachment)) attachment <- httr::upload_file(attachment)
  the_body <-
    list(
      from=from,
      to=to,
      subject=subject,
      text=plaintext,
      html=html,
      attachment=attachment
    )
  req <- httr::POST(url,
                    httr::authenticate("api", api_key),
                    encode = "multipart",
                    body = the_body[!is.na(the_body)])
  httr::stop_for_status(req)
}

##
# Customize send email
##
SendEmailFromDSPEast <- function(rec, sub = "No subject", msg = "No content"){
  
  # Create an IMmailgun object
  email_client <- mailgun$new(url = mailgun_url, api_key = mailgun_api_key, from = mailgun_from)
  
  # Send a simple email
  email_client$sendEmail(to = rec, subject = sub, plaintext = msg)
}
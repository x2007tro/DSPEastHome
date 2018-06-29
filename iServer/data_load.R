##
# Load event data from excel
##
event <- reactive({
  # load event info
  event_info_all <- readxl::read_excel(path = event_wb_path,
                                       sheet = "Event Info",
                                       skip = 2,
                                       col_names = TRUE)
  
  # remove all the na rows, just in case
  event_info_clean1 <- event_info_all[!is.na(event_info_all$event_id),]
  
  # select only active events
  event_info_clean2 <- event_info_clean1[event_info_clean1$active == 1,]
  
  rec_cnt <- nrow(event_info_clean2)
  if(rec_cnt == 0){
    # if no active event, output error message and an empty data.frame
    msg <- "no active event"
  } else {
    # if active event found, process event information
    event_info <- event_info_clean2[rec_cnt,]   # always use the latest record
    
    # load and clean event schedule
    event_schedule_all <- readxl::read_excel(path = event_wb_path,
                                             sheet = "Event Schedule",
                                             skip = 2,
                                             col_names = TRUE)
    event_schedule_clean1 <- event_schedule_all[!is.na(event_schedule_all$event_id),]
    
    # join event info and schedule
    event_full <- as.data.frame(dplyr::left_join(event_info_clean2, event_schedule_clean1, by = "event_id"))
    msg <- "good"
  }
  
  if(msg == "good"){
    # create the final result list with the following components:
    # 
    # 1.\ general info (data.frame)
    # 2.\ event name (list)
    # 3.\ event details (list)
    # 4.\ event schedule (list)
    #
    general_info <- event_full[,c("loc_name", "loc_address", "loc_lat", "loc_lon")]
    general_info$mth_day <- format(event_full$date, "%B %d")
    general_info$yr <- format(event_full$date, "%Y")
    
    #extract event names
    event_names_full <- lapply(1:3, function(i, my_data){
      tmp <- my_data[1, paste0("event_name",i)]
      if(is.na(tmp)){
        res <- NULL
      } else {
        res <- tmp
      }
    }, event_full)
    
    # remove empty names
    event_names_clean <- event_names_full[!unlist(lapply(event_names_full, is.null))]
    
    #extract event names
    event_descrips_full <- lapply(1:5, function(i, my_data){
      tmp <- my_data[1, paste0("event_descrip",i)]
      if(is.na(tmp)){
        res <- NULL
      } else {
        res <- tmp
      }
    }, event_full)
    
    # remove empty details
    event_descrips_clean <- event_descrips_full[!unlist(lapply(event_descrips_full, is.null))]
    
    #extract event schedule time
    event_sche_time_full <- lapply(1:5, function(i, my_data){
      begin <- my_data[1, paste0("begin",i)]
      end <- my_data[1, paste0("end",i)]
      
      if(is.na(begin) & is.na(end)){
        res <- NULL
      } else {
        res <- paste0(format(begin, "%H:%M"), " - ", format(end, "%H:%M"))
      }
    }, event_full)
    
    # remove empty names
    event_sche_time_clean <- event_sche_time_full[!unlist(lapply(event_sche_time_full, is.null))]
    
    #extract event schedule details
    event_sche_det_full <- lapply(1:5, function(i, my_data){
      tmp <- my_data[1, paste0("details",i)]
      
      if(is.na(tmp)){
        res <- NULL
      } else {
        res <- tmp
      }
    }, event_full)
    
    # remove empty names
    event_sche_det_clean <- event_sche_det_full[!unlist(lapply(event_sche_det_full, is.null))]
    
    res <- list(
      event_info = general_info,
      event_names = event_names_clean,
      event_descrips = event_descrips_clean,
      event_start = ifelse(is.na(event_full[1, "begin1"]), "", format(event_full[1, "begin1"], "%H:%M")),
      event_sche_time = event_sche_time_clean,
      event_sche_details = event_sche_det_clean
    )
  } else {
    # no active event, return null list
    res <- list()
  }
  
  return(res)
})

##
# Load blog
##
blog <- reactive({
  # load blog info
  blog_all <- readxl::read_excel(path = blog_wb_path,
                                 sheet = "Blog",
                                 skip = 2,
                                 col_names = TRUE)
  
  # remove all the na rows, just in case
  blog_clean1 <- blog_all[!is.na(blog_all$blog_id),]
  
  # select only active events
  blog_clean2 <- blog_clean1[blog_clean1$active == 1,]
  blog_clean2 <- as.data.frame(blog_clean2)
  
  # process blog only if at least one blog was found
  if(nrow(blog_clean2) == 0){
    # return empty list
    res <- list()
  } else {
    ##
    # process each blog content
    res <- lapply(1:nrow(blog_clean2), function(i){
      blg_title <- blog_clean2[i, "title"]
      blg_subtitle <- blog_clean2[i, "subtitle"]
      blg_author <- blog_clean2[i, "author"]
      blg_blog_date <- format(blog_clean2[i, "blog_date"], "%Y-%m-%d")
      blg_category <- blog_clean2[i, "category"]
      
      ##
      # content process
      fp <- blog_clean2[i, "content"]
      conn <- file(paste0("./input/blogs/", fp), open = "r")
      blg_content <- readLines(conn)
      close.connection(conn)
      
      res1 <- list(
        title = blg_title,
        subtitle = blg_subtitle,
        author = blg_author,
        blog_date = blg_blog_date,
        category = blg_category,
        meat = blg_content
      )
    })
  }
  
  return(res)
})

##
# Load blogger
##
bloggers <- reactive({
  # load blogger info
  blogger_all <- readxl::read_excel(path = blog_wb_path,
                                    sheet = "Blogger",
                                    skip = 2,
                                    col_names = TRUE)
  
  # remove all the na rows, just in case
  blogger_clean1 <- blogger_all[!is.na(blogger_all$blogger_id),]
  
  # select only active events
  blogger_clean2 <- blogger_clean1[blogger_clean1$active == 1,]
  blogger_clean2 <- as.data.frame(blogger_clean2)
  
  # process blogger only if at least one blogger was found
  if(nrow(blogger_clean2) == 0){
    # return empty list
    res <- list()
  } else {
    ##
    # process each blogger content
    res <- lapply(1:nrow(blogger_clean2), function(i){
      blg_name <- blogger_clean2[i, "name"]
      blg_occupation <- blogger_clean2[i, "occupation"]
      blg_description <- blogger_clean2[i, "description"]
      
      res1 <- list(
        name = blg_name,
        occupation = blg_occupation,
        description = blg_description
      )
    })
  }
  
  return(res)
})
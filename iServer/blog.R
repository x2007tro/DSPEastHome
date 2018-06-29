##
# Render blog content
##
output$blog_post <- renderUI({
  # Dynamically create n posts based on blog document
  opt <- lapply(1:length(blog()), function(i){
    tags$div(
      class = "inner_blog_post_frame",
      tags$div(
        class = "inner_blog_post_content",
        # format:
        # title
        # subtitle
        # author, time, category
        # ### space ###
        # content
        tags$h3(class = "blog_post_l1", id = paste0("blog_post_title",i), blog()[[i]]$title),
        tags$div(class = "blog_post_l2", id = paste0("blog_post_author",i), 
                 paste0("(",blog()[[i]]$category,")", " Posted on ",  blog()[[i]]$blog_date, " by ", blog()[[i]]$author)),
        br(), br(),
        #tags$div(class = "blog_post_l3", id = paste0("blog_post_meat",i), blog()[[i]]$meat)
        tags$div(
          class = "blog_post_l3", 
          id = paste0("blog_post_meat",i),
          lapply(1:length(blog()[[i]]$meat), function(z){
            msg <- blog()[[i]]$meat[z]
            if(msg == ""){
              #br()
            } else {
              tags$div(msg)
            }
          })
        )
      ),
      tags$div(class = "inner_blog_post_space") # horizontal space on bottom
    )
  })
  
  do.call(tagList, opt)
})

##
# Render navigation blog
##
output$blog_nav_list <- renderUI({
  # Dynamically create blog list
  tags$div(
    id = "inner_blog_nav_fame",
    tags$ul(
      lapply(1:length(blog()), function(i){
        tags$li(tags$a(style="color:white",
                       href=paste0("#", "blog_post_title",i), 
                       paste0("blog_post_title",i)))
      })
    ),
    tags$div(class = "inner_blog_post_space") # horizontal space on bottom
  )
})

##
# Render blogger content
##
output$blog_bloggers <- renderUI({
  # Dynamically create blogger information
  opt <- lapply(1:length(bloggers()), function(i){
    tags$div(
      class = "inner_bloggers_frame",
      tags$div(class = "inner_blogger_space"), # horizontal space on top
      tags$div(
        class = "inner_bloggers_content",
        # format:
        # name
        # occupation
        # description
        tags$h4(id = paste0("blogger_name",i), style = "padding:0;margin:3px 0;color:white", bloggers()[[i]]$name),
        tags$div(id = paste0("blogger_occupation",i), bloggers()[[i]]$occupation),
        tags$div(id = paste0("blogger_description",i), bloggers()[[i]]$description)
      ),
      tags$div(class = "inner_blogger_space") # horizontal space on bottom
    )
  })
  
  do.call(tagList, opt)
})
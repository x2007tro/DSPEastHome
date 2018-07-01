##
# blog section
##
div_blog <- tags$div(
  id = "outter_blog_frame",
  tags$div(class = "outter_blog_space"), # horizontal space on top
  tags$div(
    id = "outter_blog_content",  
    fluidRow(
      column(
        width = 8,
        tags$div(
          id = "blog_post_frame",
          tags$div(class = "inner_blog_space"), # horizontal space on top
          tags$div(
            id = "blog_post_meat", 
            uiOutput("blog_post")
          ),
          tags$div(class = "inner_blog_space") # horizontal space on bottom
        )
      ),
      column(
        width = 4,
        tags$div(
          id = "blog_nav_frame",
          tags$div(class = "inner_blog_space"), # horizontal space on top
          tags$div(
            id = "bloggers_content",
            tags$div(
              id = "bloggers_meat",
              tags$h3(class = "blog_post_l1_eq","Bloggers"),
              uiOutput("blog_bloggers")
            )
          ),
          tags$div(class = "inner_blog_space"), # horizontal space on top
          tags$div(
            id = "blog_nav_content",
            tags$div(
              id = "blog_nav_meat",
              tags$h3(class = "blog_post_l1_eq","Blog list"),
              uiOutput("blog_nav_list")
            )
          ),
          tags$div(class = "inner_blog_space") # horizontal space in middle
        )
      )
    )
  ),
  tags$div(class = "outter_blog_space") # horizontal space on bottom
)
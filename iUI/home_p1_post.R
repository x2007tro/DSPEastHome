##
# home_p1_post
##
div_home_p1_post <- tags$div(
  id = "panel1_frame",
  tags$div(
    id = "panel1_content",
    tags$div(
      id = "event_post_dt_frame",
      tags$div(
        id = "event_post_dt_content",
        uiOutput("opt_event_post_dt")
      )
    ),
    tags$div(
      id = "event_post_name_frame",
      tags$div(
        id = "event_post_name_content",
        uiOutput("opt_event_post_name")
      )
    ),
    tags$div(
      id = "event_post_note_frame",
      tags$div(
        id = "event_post_note_content",
        uiOutput("opt_event_post_loc")
      )
    )
  )
)
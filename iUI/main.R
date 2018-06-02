##
# Source all ui files
##
ui_files <- c("home_p1_post", "home_p2_joinus", "home_p3_event", "home_p4_schedule", "home_p5_map", "home_p6_copyright")
lapply(ui_files, function(f){
  source(paste0("./iUI/", f, ".R"), local = FALSE)
})

##
# Shiny ui
##
mainUI <- fluidPage(theme = shinythemes::shinytheme("simplex"),
  
  ##
  # load style
  ##
  tags$head(
    includeCSS("style.css")
  ),
  
  tags$div(
	id = "main_frame",
	navbarPage(
		"Data Science Practitioners East",
		##
		# Home tab
		##
		tabPanel(
			"Home",
			# Big event post
			fluidRow(
			  column(
			    width = 12,
			    align = "center",
			    style = "border:0px;",
			    div_home_p1_post   # from home_p1_post.R
			  )
			),
			# Join us
			fluidRow(
			  column(
			    width = 12,
			    align = "center",
			    style = "border:0px;",
			    div_home_p2_joinus   # from home_p2_joinus.R
			  )
			),
			# Event Where, when and about
			fluidRow(
			  column(
			    width = 12,
			    style = "border:0px;",
			    div_home_p3_event   # from home_p3_event.R
			  )
			),
			# Schedule panel
			fluidRow(
			  column(
			    width = 12,
			    align = "center",
			    style = "border:0px;",
			    div_home_p4_schedule   # from home_p4_schedule.R
			  )
			),
			# Google map panel
			fluidRow(
			  column(
			    width = 12,
			    style = "border:0px;",
			    div_home_p5_map   # from home_p5_map.R
			  )
			),
			# Copyright panel
			fluidRow(
			  column(
			    width = 12,
			    align = "center",
			    style = "border:0px;",
			    div_home_p6_copyright   # from home_p6_copyright.R
			  )
			)
		),
		
		##
		# About us
		##
		tabPanel(
			"About us"
		)
	)
  )
)

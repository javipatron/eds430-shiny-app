# dashboard header ------------------------------

#Create a new Header
header <- dashboardHeader(
  
title = "Fish Creek Watershed Lake Monitoring",
titleWidth = 400
)# End of new Header

# Create the sidebar
sidebar <- dashboardSidebar(
  
  sidebarMenu(
    
    menuItem(text = "Welcome",
              tabName= "welcome",
              icon = icon("star")),
    menuItem(text = "Dashboard",
             tabName= "dashboard",
             icon = icon("gauge"))
  
  
))# END of sidebar

# Create the body
body <- dashboardBody(
  
  # set theme ----
  fresh::use_theme("fresh_theme.css"),
  
  #tabItems ------
  tabItems(
    tabItem(tab = "welcome",
            
            # left-hand column=n
            column(width = 6,
                  
                   box(width = NULL,
                       
                       title = tagList(icon("water"),
                                       tags$strong("Monitoring Fish Creek Watershed")),
                       includeMarkdown("text/intro.md"),
                       tags$img(src = "watershed.jpeg",
                                alt = "here is some alternative text",
                                style = "max-width: 100%;"),
                       tags$h5(tags$em("Map Source:",
                                       tags$a(href = "http://www.fishcreekwatershed.org",
                                              "FCWO")),
                               style = "text-align: center;")
                       
                       
                       )#END left-box
                   
                   ),# END left-column
            
            # right-hand column
            column(width = 6,
                   
                   # top fluid row ----
                   fluidRow(
                     
                     box(width=NULL,
                         
                         title = tagList(icon("water"),
                                         tags$strong("Data Source")),
                         includeMarkdown("text/citation.md")
                         
                         )# END right-box
                     
                   ),#END top fluid row
                   
                   # bottom fluidRow
                   fluidRow(
                     
                     box(width = NULL,
                         
                         title = tagList(icon("water"),
                                         tags$strong("Disclaimer")),
                         includeMarkdown("text/disclaimer.md")
                         
                         )#END fluidbox
                     
                   )#END fluidRow
                   
                   
                   )#END right column
            
            ),# END welcome tabItem1
    
    tabItem(tab = "dashboard",
            
            #fluidRow -----
           fluidRow(
             
             # input box ---
             box(width = 4,
                 
                 title = tags$strong("Adjust Lake Parameter Ranges:",),
                 
                 #slider Input ----- 
                 sliderInput(inputId = "elevation_slider_input",
                             label = "Elevation (meters above SL):",
                             min = min(lake_data$Elevation),
                             max = max(lake_data$Elevation),
                             value = c(min(lake_data$Elevation), max(lake_data$Elevation)))
                 
                 ),# END input box
             
             
             #leaflet box ----
             
             box(width = 8,
                 
                 title = tags$strong("Monitored lakes within Fish Creek Watershed:"),
                 
                 # leaflet output -----
                 leafletOutput(outputId = "lake_map") |> withSpinner(type=1, color = "darkslategrey")#END leaflet output
                 
                 
                 )#END leadflet
             
           )# END fluidRow
      
            
    )# END welcome tabItem2
    
  )# END tabItem
) # END dashboardBody

# combine all -----------------------------
dashboardPage(header, sidebar, body)



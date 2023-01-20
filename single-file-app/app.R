# load package ---
library(shiny)
library(DT)

# ui ---
ui <- fluidPage(
  # add title ----
  tags$h1("My App Title"), #h1(Header 1 for the Title)
  # add a subtitle ----
  tags$p(tags$strong("Subtitle: Exploring Antartic Penguin Data")),
  
  # body mass sliderInput ----
  sliderInput(inputId = "body_mass_input", 
              label = "Select a range of body masses (g):",
              min = 0,
              max = 10000,
              value = c(1000, 7000)),
  
  # body mass plot output ----
  plotOutput(outputId = "bodyMass_scatterPlot"),
  
  #Year input
  checkboxGroupInput(inputId = "year_input",
                     label = "Select year(s) of interest:",
                     choices = c(unique(penguins$year)),
                     selected = c("2007", "2008")),
  
  #DT output --
  DT::dataTableOutput(outputId = "filter_year_penguins")
  
  # check box input
  
  #checkboxInput(inputId = "sex",
   #             label = "Select a type of sex:",
   #             value = c("male", "female"),
                
                #checkbox output
                
   #           dataTableOutput(outputId = "sex")
  
) # END fluidPage

# server ---
server <- function(input, output){
  
  #code to generate our plot here
  
  #filter ---
  body_mass_df <- reactive({
    
    penguins |> 
    filter(body_mass_g %in% input$body_mass_input[1]:input$body_mass_input[2]) 
      #filter(body_mass_g %in% input$sex[1]:input$sex[2])
    
  })
  #render scatter plot ---
  output$bodyMass_scatterPlot <- renderPlot({
    ggplot(na.omit(body_mass_df()),
           aes(x=flipper_length_mm, 
               y= bill_length_mm,
               color = species,
               shape = species,
               size = species)) +
      geom_point() +
      scale_size_discrete(range = c(1.5, 3, 1)) +
      scale_color_manual(values = c("Adelie" = "#FEA346", 
                                    "Chinstrap" = "darkblue", 
                                    "Gentoo" = "cyan4"))
  }) #End scatterPlot
  
  #filter years ---
  filtered_years <- reactive({
    penguins |> 
      filter(year %in% c(input$year_input))})
  
  #render DT ----
  output$filter_year_penguins <- DT::renderDataTable({
    DT::datatable(filtered_years())
  })
  
  
  
} # END Server

# combine ui & server ---
shinyApp(ui = ui, server = server)





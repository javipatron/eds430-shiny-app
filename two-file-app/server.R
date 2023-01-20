server <- function(input, output){
  
  #trout df ----
  trout_filtered_df <- reactive({
   
    validate(
      need(length(input$channel_type_input) > 0, 
           "Select at least one channel type."),
      need(length(input$section_input) > 0, 
           "Select at least one section.")
    )
    
    
     clean_trout |> 
      filter(channel_type %in% c(input$channel_type_input)) |> 
      filter(section %in% c(input$section_input))
    
  })
  
  
  #plot Trout ----
  output$trout_scatterplot <- renderPlot({
    ggplot(trout_filtered_df(), aes(x= length_mm, y = weight, color = channel_type)) +
      geom_point(alpha = 0.5, size = 2) +
      scale_color_manual(values = c("C" = "salmon",
                                    "R" = "purple",
                                    "S" = "gray15",
                                    "P" = "darkolivegreen",
                                    "SC" = "blue3",
                                    "I" = "yellow3",
                                    "IP" = "cyan4"))
  })
  
}

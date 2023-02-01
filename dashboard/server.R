server <- function(input, output){
  
  #filter lake data ----
  
  filter_lakes <- reactive({
    
     lake_data |> 
      filter(Elevation >= input$elevation_slider_input[1] & Elevation <= input$elevation_slider_input[2])
  })
  
  #build leadlet map ---
  output$lake_map  <- renderLeaflet({
    
    leaflet() |> 
      # add tiles
      addProviderTiles("Esri.WorldImagery") |> 
      
      # set view of AK
      setView(lng = -152,
              lat = 70,
              zoom = 6) |> 
      # add mini map
      addMiniMap(toggleDisplay = T, minimized = T) |> 
      
      # Add markers
      addMarkers(data = filter_lakes(),
                 lng = filter_lakes()$Longitude,
                 lat = filter_lakes()$Latitude,
                 popup = paste("Site Name:", filter_lakes()$Site, "<br>",
                               "Elevation:", filter_lakes()$Elevation, "meters (above SL)", "<br>",
                               "Avg Depth:", filter_lakes()$AvgDepth, "meters", "<br>",
                               "Avg Lake Bed Temp:", filter_lakes()$AvgTemp, "°C"))
    
    
  })
  
  
  
}

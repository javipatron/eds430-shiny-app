ui <- navbarPage(
  
  title = "Title",
  
  #Page 1: Intro tabPanel ----
  tabPanel(title = "About this app",
           
           "adding some text to test"
           
  ),
  
  #Page 2: Data tabPanel ----
  tabPanel(title = "Explore the Data",
           
           #Create a tab set pannel
           tabsetPanel(
             # trout tab ----
             tabPanel(title = "Trout",
                      
                      "here you add the body of the wizard with sidebar Layout",
                      
                      sidebarLayout(
                        
                        sidebarPanel(
                          #pickerInput from shinyWidges package
                          pickerInput(inputId = "channel_type_input",
                                      label = "Select channel type(s):",
                                      choices = unique(clean_trout$channel_type),
                                      selected = c("C", "S"),
                                      multiple = TRUE,
                                      options = pickerOptions(actionsBox = TRUE)
                                      ),# END pickerInput
                          #checkboxGroupButtons from the shinyWidges package
                          checkboxGroupButtons(inputId = "section_input",
                                               label = "Select a sampling section(s):",
                                               choices = unique(clean_trout$section),
                                               selected = c("clear cut forest"),
                                               individual = F,
                                               justified = T,
                                               checkIcon = list(yes = icon("ok",
                                                                           lib = "glyphicon"),
                                                                no = icon("remove", lib = "glyphicon")))
                        ), #END trout sidebarPanel
                        
                        #trout main Panel ----
                        mainPanel(
                          
                         plotOutput(outputId = "trout_scatterplot") |> 
                           withSpinner(type = 1,
                                       color = "darkslategrey"),
                          
                        ) #END trout mainPanel
                        
                      ) #END sidebarLayout
                      
             ), #END tab panel
             tabPanel(title = "Penguins",
                      
                      "penguins plot here",
                      
                      sidebarLayout(
                        
                        # penguin sidebar ---
                        sidebarPanel(
                          "penguin inputs here"
                        ), #END penguins sidebarPanel
                        
                        mainPanel(
                          
                          "penguin outputs here"
                          
                        ) # END penguin mainPanel
                      ) #END sidebar Layout
                      
             ) #END Penguins tabs
             
           ) #END tabset Pannel
           
  ) # END tab pannel
  
  ) # END navbar page

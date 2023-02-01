library(fresh)

create_theme(
  
  theme = "default",
  
  adminlte_color(
    light_blue = "darkslategray"
      ),#primary color of your shiny app

  adminlte_global(
    content_bg = "gray80"
      ),
  
  adminlte_sidebar(
    width = "400px",
    dark_bg = "yellow",
    dark_hover_bg = "cyan4",
    dark_color = "red"
  ),
  
  output_file = "dashboard/www/fresh_theme.css"
  
  )

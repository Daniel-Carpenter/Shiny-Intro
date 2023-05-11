# Libraries ----
library(shiny)
library(shinydashboard)
library(shinyjs)
library(tidyverse)
library(scales)

library(fresh) # For colors



# ===============================================================================
# Theme
# ===============================================================================

# source https://stackoverflow.com/questions/45016826/change-color-in-shinydashboard

# OPA Style Guide Brand Idea
opaBrand <- create_theme(

  # Use here: dashboardBody(use_theme(opaBrand))

  # Top Ribbon
  adminlte_color(
    light_blue = "#2D343B",
  ),

  # Left Side bar
  adminlte_sidebar(
    width = "300px",
    dark_bg = "#3F4953"
    # dark_hover_bg = "#3F4953",
    # dark_color = "#3F4953"
  ),

  # Page Background
  adminlte_global(
    content_bg = "#FAFAFA", # Page Background
    # box_bg = "#F2A896",
    # info_box_bg = "#F2A896"
  )
)

# ===============================================================================
# UI
# ===============================================================================

ui <- dashboardPage(


  #### Header ----
  dashboardHeader(
    title = "Title",
    titleWidth = 350
  ),
  #### Sidebar ----
  dashboardSidebar(
    width = 350,
    br(),
    h4("Select Your Inputs Here", style = "padding-left:20px"),

    # Input ----
    selectInput(
      inputId = "input_variable",
      label = "Select a Number",
      choices = c(1,2,3,4,5,6,7,8,9,10)
    ),

    # date_range_country Input ----
    dateRangeInput(
      inputId = "country",
      label = "Select Date Range"

    )

  ),
  #### Body ----
  dashboardBody(
    use_theme(themeUI),
    fluidRow(
      column(width = 12, plotOutput("tTestPlot", width = "100%", height = "100%"))
    )
  )
)

# ===============================================================================
# Server
# ===============================================================================

server <- function(input, output) {

}

shinyApp(ui, server)

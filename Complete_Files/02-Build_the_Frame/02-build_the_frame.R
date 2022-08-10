# Libraries ----
library(shiny)
library(shinydashboard)
library(shinyjs)
library(tidyverse)


getwd()
# Initialize Data ----
dat <- readRDS(file = "../02-Build_the_Frame//app-data//subregion_agg.rds")



# UI ----
ui <- dashboardPage(
  
  #### Header ----
  dashboardHeader(
    title = "COVID-19 Country Comparison",
    titleWidth = 350
  ),
  #### Sidebar ----
  dashboardSidebar(
    
    width = 350,
    br(),
    h4("Select Your Inputs Here", style = "padding-left:20px")
    
  ),
  #### Body ----
  dashboardBody(
    tabsetPanel(
      type = "pills", # "tabs"
      id = "tab_selected",
      tabPanel(
        title = "Country View"
      ),
      tabPanel(
        title = "Could add another tab here"
      )
    )
  )
)

server <- function(input, output) {
  
}

shinyApp(ui, server)













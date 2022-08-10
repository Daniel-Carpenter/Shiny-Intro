# Libraries ----
library(shiny)
library(shinydashboard)



# UI ----
ui <- fluidPage(
  title = "Welcome!",
  titlePanel("Title Here"),
  "Hello World",
  br(),
  
  selectInput(
    inputId = "first_input", # goes to print stmt
    label = "Select a Number",
    choices = c(1,2,3,4,5,6,7,8,9,10)
    #multiple = TRUE,
    #selected = 7
  ),
)

server <- function(input, output) {
  
  # Need observe for the reactive component
  observe({
    print( input$first_input ) # print to console, not the app
  })
  
}

shinyApp(ui, server)
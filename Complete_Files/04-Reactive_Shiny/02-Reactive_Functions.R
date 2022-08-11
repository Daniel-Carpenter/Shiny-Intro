# Load packages ----
library(shiny)
library(quantmod)

# Reactive makes it faster, don't have to re run every time

# Source helpers ----
#source("helpers.R")

# User interface ----
ui <- fluidPage(
  titlePanel("stockVis"),

  sidebarLayout(
    sidebarPanel(
      helpText("Select a stock to examine.

        Information will be collected from Yahoo finance."),
      textInput("symb", "Symbol", "SPY"),

      dateRangeInput("dates",
                     "Date range",
                     start = "2013-01-01",
                     end = as.character(Sys.Date())),

      br(),
      br(),

      checkboxInput("log", "Plot y axis on log scale",
                    value = FALSE)),

    mainPanel(plotOutput("plot"))
  )
)

# Server logic
server <- function(input, output) {

  # Using a reactive function will make it so that you do not have to re run this 
  # Part on each new selection
  dataInput <- reactive({
     Sys.sleep(5) # Does nothing for 5 seconds
     getSymbols(input$symb, src = "yahoo",
                from = input$dates[1],
                to = input$dates[2],
                auto.assign = FALSE)
   })
  
  # Do not do this
  # dataInput <- function(){
  #    #Sys.sleep(5)
  #    getSymbols(input$symb, src = "yahoo",
  #               from = input$dates[1],
  #               to = input$dates[2],
  #               auto.assign = FALSE)
  #  }

  output$plot <- renderPlot({

    chartSeries(dataInput(), theme = chartTheme("white"),
                type = "line", log.scale = input$log, TA = NULL)
    
  })

}

# Run the app
shinyApp(ui, server)

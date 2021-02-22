library(shiny)
shinyUI(fluidPage(
  titlePanel("IPCC Global Temperature"),
  sidebarLayout(
    sidebarPanel(radioButtons("radio1", label = h3("IPCC AR4 Scenarios"),
                              choices = list("Commit" = "commit", 
                                             "B1" = "b1", 
                                             "A1B" = "a1b", 
                                             "A2" = "a2"), 
                              selected = "commit"),
                 numericInput("num1", label = h3("Threshold temperature"), value = 1,
                              min=0, max=3, step=0.1),
                 hr(),
                 fluidRow(column(10, textOutput("thresholdyear")))
    ),
    mainPanel("Global temperature time series",
              plotOutput("timeplot")
    ),
    position="right"
  )
  
))
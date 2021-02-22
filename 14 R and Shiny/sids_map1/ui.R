library(shiny)
shinyUI(fluidPage(
  titlePanel("North Carolina SIDS dataset"),
  sidebarLayout(
    sidebarPanel(uiOutput("choose_variable")
    ),
    mainPanel(
              plotOutput("map")
              
    ),
    position="right"
  )
  
))
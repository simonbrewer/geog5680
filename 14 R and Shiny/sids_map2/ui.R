library(shiny)
shinyUI(fluidPage(
  titlePanel("North Carolina SIDS dataset"),
  sidebarLayout(
    sidebarPanel(uiOutput("choose_buttons"),
                 hr(),
                 # fluidRow(column(10, textOutput("variable"))),
                 # hr(),
                 selectInput("palette", label = h3("Select palette"), 
                             choices = list("Yellow/Orange/Red" = "YlOrRd", 
                                            "Blues" = "Blues", 
                                            "Greens" = "Greens", 
                                            "Purples" = "Purples", 
                                            "Greys" = "Greys"), 
                             selected = "Greens"),
                 numericInput("num1", label = h3("Number of breaks"), value = 5,
                              min=3, max=9, step=1),
                 checkboxInput("checkbox", label = "Log-transform?", value = FALSE)
    ),
    mainPanel(
              plotOutput("map")
              
    ),
    position="right"
  )
  
))
# COVID time series app
# S. Brewer 5/7/20

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Title goes here"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(uiOutput("choose_country"),
                     hr(),
                     uiOutput("choose_variable"),
                     hr(),
                     checkboxInput("logtrans", label = "Log-transform?", value = FALSE)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("linePlot")
        )
    )
))

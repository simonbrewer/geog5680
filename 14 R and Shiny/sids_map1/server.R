library(shiny)
library(rgdal)
library(classInt)
library(RColorBrewer)
source("helpers.R")

mapdata = readOGR("./sids2/sids2.shp")

shinyServer(function(input, output) {
  
  output$choose_variable <- renderUI({
    # Get the data set with the appropriate name
    colnames <- names(mapdata)
    # Find columns with numeric data
    numID = sapply(mapdata@data, is.numeric)
    colnames = colnames[numID]
    
    # Create the buttons and check the first by default
    selectInput("select", "Choose variable", 
                       choices  = colnames,
                       selected = colnames[1])
  })
  output$map <- renderPlot({
    if(is.null(input$select))
      return()
    make_map(mapdata, as.character(input$select), 
             nclr=5, pal="Greens")
  })
  
})
library(shiny)
library(rgdal)
library(classInt)
library(RColorBrewer)
source("helpers.R")

mapdata = readOGR("./sids2/sids2.shp")

shinyServer(function(input, output) {
  
  output$choose_buttons <- renderUI({
    # Get the data set with the appropriate name
    colnames <- names(mapdata)
    # Find columns with numeric data
    numID = sapply(mapdata@data, is.numeric)
    colnames = colnames[numID]
    
    # Create the buttons and check the first by default
    selectInput("buttons", "Choose variable", 
                       choices  = colnames,
                       selected = colnames[1])
  })
  output$variable <- renderPrint({
    input$buttons
  })
  output$map <- renderPlot({
    if(is.null(input$buttons))
      return()
    make_map(mapdata, as.character(input$buttons), 
             nclr=input$num1, pal=input$palette, logtrans=input$checkbox)
  })
  
})
library(shiny)
library(ggplot2)

ipcc = read.csv("./data/ipccScenario_1900_2100.csv")
shinyServer(function(input, output) {
  output$timeplot <- renderPlot({
    scenario = input$radio1
    scenario_med = paste(scenario,"Med",sep='')
    scenario_lo = paste(scenario,"Lo",sep='')
    scenario_hi = paste(scenario,"Hi",sep='')
    plot.df = data.frame(year = ipcc$yrs,
                         temp = ipcc[,scenario_med],
                         temp_lo = ipcc[,scenario_lo],
                         temp_hi = ipcc[,scenario_hi])
    x = ggplot(plot.df, aes(x=year, y=temp)) + geom_line(col="red") 
    x = x + geom_ribbon(aes(ymin=temp_lo, ymax=temp_hi), alpha=0.3, fill="red")
    x = x + ggtitle(paste("Scenario",scenario))
    print(x)
  })

  output$thresholdyear <- renderPrint({
    scenario = input$radio1
    threshold_temp = input$num1
    scenario_med = paste(scenario,"Med",sep='')
    exyears = ipcc$yrs[which(ipcc[,scenario_med] > threshold_temp)]
    if (length(exyears) >0) {
      min_year=min(exyears)
    } else {
      min_year=NA
    }
    return(min_year)
  })
    
    
})
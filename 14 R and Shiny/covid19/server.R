## Simple COVID-19 visualization app
## S. Brewer 5/7/20
## Note - need to run getData.R every day to update data source

library(shiny)
library(dplyr)
library(ggplot2)

## Load data
covid_dat = read.csv("./data/covid_dat.csv")
covid_dat$date = as.Date(covid_dat$date, format = "%Y-%m-%d")
covid_dat$doy = as.POSIXlt(covid_dat$date)$yday

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$choose_country <- renderUI({
        # Get the data set with the appropriate name
        countries <- sort(unique(covid_dat$country))
        
        # Create the buttons and check the first by default
        selectInput("country", "Choose country", 
                    choices  = countries,
                    selected = countries[1])
    })
    
    output$choose_variable <- renderUI({
        # Get the data set with the appropriate name
        variables <- c("confirmed", "deaths")
        
        # Create the buttons and check the first by default
        selectInput("variable", "Choose variable to plot", 
                    choices  = variables,
                    selected = variables[1])
    })
    
    # output$variable <- renderPrint({
    #     input$country
    # })
    
    output$linePlot <- renderPlot({
        
        if(is.null(input$country) | is.null(input$variable))
            return()
        plot_dat = covid_dat %>% 
            select(date, country, confirmed, deaths) %>% 
            filter(country == "United States")

        # plot(plot_dat$doy, plot_dat$deaths, type = 'h')
        p1 = ggplot(plot_dat, aes_string(x = "date", y = input$variable)) + geom_point()
        p1 = p1 + ggtitle("Country name here") + theme_bw()
        if (input$logtrans) {
            p1 = p1 + scale_y_log10()
        }
        print(p1)

    })

})

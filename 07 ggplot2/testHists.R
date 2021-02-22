temp = read.csv("Temperature.csv")

library(ggplot2)

ggplot(temp, aes(x = Salinity, fill = Year)) + geom_histogram(binwidth = 5)

ggplot(temp, aes(x = Salinity)) + geom_histogram() + facet_wrap(~Year)

tempval = ggplot(temp, aes(x = Station, y = Temperature))
tempval + geom_boxplot(aes(x = reorder(Station, Temperature, median, na.rm=TRUE)))

(temp$Year + temp$dDay3) / 365

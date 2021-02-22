## ggplot examples
library(ggplot2)

gap = read.csv("gapminderData5.csv")

## Oceania
gap = subset(gap, continent == "Oceania")

ggplot(gap, aes(x = year, y = lifeExp))

ggplot(gap, aes(x = year, y = lifeExp)) + geom_point()

ggplot(gap, aes(x = year, y = lifeExp, col = country)) + geom_point()

ggplot(gap, aes(x = year, y = lifeExp, col = country)) + geom_line()

ggplot(gap, aes(x = year, y = lifeExp, col = country)) + 
  geom_line() + ggtitle("Oceania life expectancy", "GapMinder")

ggplot(gap, aes(x = year, y = lifeExp, col = country)) + 
  geom_line() + ggtitle("Oceania life expectancy", "GapMinder") + 
  theme_bw()

## Other continents
gap = read.csv("gapminderData5.csv")

gap = subset(gap, continent != "Oceania")

ggplot(gap, aes(x = gdpPercap, y = lifeExp)) + geom_point()

ggplot(gap, aes(x = gdpPercap, y = lifeExp)) + geom_point() + 
  scale_x_log10("GDP per capita") + scale_y_continuous("Life expectancy")

ggplot(gap, aes(x = gdpPercap, y = lifeExp, col = continent)) + 
  geom_point() + scale_x_log10() + scale_y_continuous("Life expectancy")

ggplot(gap, aes(x = gdpPercap, y = lifeExp)) + 
  geom_point() + scale_x_log10() + scale_y_continuous("Life expectancy") + 
  facet_wrap(~continent)


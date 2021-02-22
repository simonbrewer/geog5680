library(COVID19)

covid_dat = covid19()
write.csv(covid_dat, "covid_dat.csv", row.names = FALSE)
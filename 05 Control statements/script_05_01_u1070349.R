##Modify Script
giss = read.csv("giss_temp.csv")
allyears = unique(giss$Year)
Yearly = as.numeric(factor(Yearly))
for (i in 1:131) {
  yearID = which(allyears == i)
  png(paste("giss_temp_",i,".png",sep=''))
  plot(giss$Month[yearID], giss$TempAnom[yearID], xlab="Month", ylab="Temperature Anomaly", xlim = range(giss$Month), ylim = range(giss$TempAnom))
  dev.off()
}

allyears = unique(giss$Year)
nyears = length(allyears)
for (i in 1:nyears) {
  yearID = which(giss$Year == allyears[i])
  # png(paste("giss_temp_",i,".png",sep=''))
  plot(giss$Month[yearID], giss$TempAnom[yearID], xlab="Month", ylab="Temperature Anomaly", xlim = range(giss$Month), ylim = range(giss$TempAnom))
  # dev.off()
}

for (i in 1881:2011) {
  yearID = which(giss$Year == i)
  # png(paste("giss_temp_",i,".png",sep=''))
  plot(giss$Month[yearID], giss$TempAnom[yearID], xlab="Month", ylab="Temperature Anomaly", xlim = range(giss$Month), ylim = range(giss$TempAnom))
  # dev.off()
}

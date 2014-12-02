if(!exists("dataFiltered")){
    source("readData.R")
    dataFiltered <- readData()
}
#plot 1
png(file="plot1.png", width = 480, height = 480)
hist(dataFiltered$Global_active_power, col="red", main="Global active power", xlab="Global active power (kilowatts)")
dev.off()
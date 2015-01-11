# Reading data from file if they haven't been already loaded to session
if(!exists("dataFiltered")){
    source("readData.R")
    dataFiltered <- readData() #loading and filtering data
}

# plot 1
png(file="plot1.png", width = 480, height = 480)
hist(dataFiltered$Global_active_power, col="red", main="Global active power", xlab="Global active power (kilowatts)")
dev.off()
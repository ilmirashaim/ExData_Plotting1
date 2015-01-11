#set locale for correct weekdays names
Sys.setlocale("LC_ALL", 'en_US.UTF-8')

# Reading data from file if they haven't been already loaded to session
if(!exists("dataFiltered")){
    source("readData.R")
    dataFiltered <- readData() #loading and filtering data
}

#plot3
png(file="plot3.png", width = 480, height = 480)
with(dataFiltered, {
    plot(Sub_metering_1~DateParsed,
         type='l', xlab='', ylab='Energy sub metering',
         col="black")
    points(Sub_metering_2~DateParsed,
           type='l',
           col="red")
    points(Sub_metering_3~DateParsed,
           type='l',
           col="blue")
})
legend("topright",
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd=1)

dev.off()
#set locale for correct weekdays names
Sys.setlocale("LC_ALL", 'en_US.UTF-8')

# Reading data from file if they haven't been already loaded to session
if(!exists("dataFiltered")){
    source("readData.R")
    dataFiltered <- readData() #loading and filtering data
}

#plot4
png(file="plot4.png", width = 480, height = 480)

mfrowdefault <- par()$mfrow
par(mfrow=c(2,2))

#1
with(dataFiltered, 
     plot(DateParsed, Global_active_power, 
          type='l', xlab='', ylab='Global Active Power (kilowatts)'))
#2
with(dataFiltered, 
     plot(DateParsed, Voltage, 
          type='l', xlab='datetime', ylab='Voltage'))
#3
with(dataFiltered, {
    plot(Sub_metering_1~DateParsed, type='l', xlab='',
         ylab='Energy sub metering', col="black")
    points(Sub_metering_2~DateParsed, type='l', col="red")
    points(Sub_metering_3~DateParsed, type='l', col="blue")
})
legend("topright", col = c("black", "red", "blue"), lwd=1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#4
with(dataFiltered, 
     plot(DateParsed, Global_reactive_power, 
          type='l', xlab='datetime', ylab='Global_reactive_power'))

par(mfrow=mfrowdefault)
dev.off()
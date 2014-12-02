#set locale for correct weekdays names
Sys.setlocale("LC_ALL", 'en_US.UTF-8')

if(!exists("dataFiltered")){
    source("readData.R")
    dataFiltered <- readData()
}

#plot2
png(file="plot2.png", width = 480, height = 480)
with(dataFiltered, 
     plot(DateParsed, Global_active_power, 
          type='l', xlab='', ylab='Global Active Power (kilowatts)'))
dev.off()
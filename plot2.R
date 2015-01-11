#set locale for correct weekdays names
Sys.setlocale("LC_ALL", 'en_US.UTF-8')

# Reading data from file if they haven't been already loaded to session
if(!exists("dataFiltered")){
    source("readData.R")
    dataFiltered <- readData() #loading and filtering data
}

#plot2
png(file="plot2.png", width = 480, height = 480)
with(dataFiltered, 
     plot(DateParsed, Global_active_power, 
          type='l', xlab='', ylab='Global Active Power (kilowatts)'))
dev.off()
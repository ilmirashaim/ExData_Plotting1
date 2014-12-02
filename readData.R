readData <- function(){
    if(!file.exists("exdata-data-household_power_consumption.zip")){
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "exdata-data-household_power_consumption.zip",
                      method="curl")
    }
    #reading the whole dataset
    data <- read.table(unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"), 
                       na.strings="?",
                       sep=";", header=TRUE,
                       stringsAsFactors = FALSE)
    
    #filtering for dates 2007-02-01 and 2007-02-02
    library(dplyr)
    data <- tbl_df(data)
    dataFiltered <- filter(data, Date %in% c("1/2/2007", "2/2/2007"))
    
    #converting Date column from string to POSIXct
    library(lubridate)
    dataFiltered <- mutate(dataFiltered, DateParsed = dmy_hms(paste(Date, Time)))
    dataFiltered
}
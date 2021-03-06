## Load necessary libraries.
library("readr")
library("dplyr")

## Read Household Power Consumption dataset from file
dataset<-read_delim("household_power_consumption.txt",  ";", col_names = TRUE, 
                    na = c("?", "NA"))

## Convert the Date variable to Date class
dataset$Date<-as.Date(dataset$Date, format="%d/%m/%Y")

## Subset the data from the dates 2007-02-01 and 2007-02-02
subsetData<-subset(dataset, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))

## Create a new variable with Date and Time
subsetData<-mutate(subsetData, DateTime=as.POSIXct(paste(Date, Time)))

## Construct the plot
with(subsetData, {
    plot(DateTime,Sub_metering_1,type="l", col="black", xlab="", ylab="Energy sub metering")
    lines(DateTime,Sub_metering_2,type="l", col="red")
    lines(DateTime,Sub_metering_3,type="l", col="blue")
    legend("topright", col = c("black","red", "blue"), 
           legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=1)
})

## Save it to a PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file = "plot3.png", width = 480, height = 480, units = "px")

## Close the PNG file device
dev.off()
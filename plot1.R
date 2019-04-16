## Load necessary libraries.
library("readr")

## Read Household Power Consumption dataset from file
dataset<-read_delim("household_power_consumption.txt",  ";", col_names = TRUE, 
                        na = c("?", "NA"))

## Convert the Date variable to Date class
dataset$Date<-as.Date(dataset$Date, format="%d/%m/%Y")

## Subset the data from the dates 2007-02-01 and 2007-02-02
subsetData<-subset(dataset, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))

## Construct the plot
hist(subsetData$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", 
     main="Global Active Power", ylim=range(0,1200))

## Save it to a PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")

## Close the PNG file device
dev.off()
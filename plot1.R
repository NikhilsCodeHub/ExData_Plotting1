# Plot1.R

# Using data from 2007-02-01 and 2007-02-02

library(dplyr)
library(lubridate)

# Read dataset
data<-read.table("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, header=TRUE, na.strings="?")

# Convert Date using dmy() from lubridate
data$Date<-dmy(data$Date)

# Convert data to dplyr dataframe
data<-tbl_df(data)

# filter data from given date range
data<-filter(data, Date>=ymd("2007-02-01") & Date<=ymd("2007-02-02"))


# open device png for plotting
png("plot1.png", width=480, height=480)
# Draw the required histogram
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
# Close device
dev.off()

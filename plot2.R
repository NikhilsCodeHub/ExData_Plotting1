# Plot2.R

# Using data from 2007-02-01 and 2007-02-02

library(dplyr)
library(lubridate)

# Read dataset
data<-read.table("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, header=TRUE, na.strings="?")

# Convert data to dplyr dataframe
data<-tbl_df(data)

# Convert Date using dmy() from lubridate
data$Date<-dmy(data$Date)

# filter data from given date range
data<-filter(data, Date>=ymd("2007-02-01") & Date<=ymd("2007-02-02"))

data<-mutate(data, weekday=wday(Date, label=TRUE), DateTime=ymd_hms(paste(Date, Time)))

# open device png for plotting
png("plot2.png", width=480, height=480)

# Draw the required plot
with(data, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)",xlab=""))

# Close device
dev.off()

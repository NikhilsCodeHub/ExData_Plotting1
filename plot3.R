# Plot3.R

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

data<-mutate(data, DateTime=ymd_hms(paste(Date, Time)))

data<-select(data, DateTime, Sub_metering_1:Sub_metering_3)

# open device png for plotting
png("plot3.png", width=480, height=480)

# Initialize the plotting system with type n
with(data, plot(DateTime, Sub_metering_1, type="n", ylab="Energy Sub Metering",xlab=""))

# Draw the required plot
with(data, lines(DateTime, Sub_metering_1, col="black"))
with(data, lines(DateTime, Sub_metering_2, col="red"))
with(data, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright",lty="solid", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close device
dev.off()

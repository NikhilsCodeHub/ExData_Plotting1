# Plot4.R

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


# open device png for plotting
png("plot4.png", width=480, height=480)

# Set Canvas for 4 base plots
par(mfrow=c(2,2))

# Draw Plot 1
with(data, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)",xlab=""))

# Draw Plot 2
with(data, plot(DateTime, Voltage, type="l", ylab="Voltage",xlab="datetime"))

# Draw Plot 3

# Initialize the plotting system with type n
with(data, plot(DateTime, Sub_metering_1, type="n", ylab="Energy Sub Metering",xlab=""))

# Draw the required plot
with(data, lines(DateTime, Sub_metering_1, col="black"))
with(data, lines(DateTime, Sub_metering_2, col="red"))
with(data, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright",lty="solid", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Draw Plot 4
with(data, plot(DateTime, Global_reactive_power, type="l", ylab="Global Reactive Power",xlab="datetime"))


# Close device
dev.off()

# Plot1.R

# Using data from 2007-02-01 and 2007-02-02

library(dplyr)
library(lubridate)

data<-read.table("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, header=TRUE, na.strings="?")

data$Date<-dmy(data$Date)

data<-tbl_df(data)

data<-filter(data, Date>=ymd("2007-02-01") & Date<=ymd("2007-02-02"))
data$Time<-hms(data$Time)

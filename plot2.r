Sys.setlocale("LC_TIME", "English")
library(chron)
d<-read.table("household_power_consumption.txt",sep=";",header = T,na.strings = "?")
d$Time<-times(d$Time)
d$Date<-as.Date(d$Date,'%d/%m/%Y')
d$Global_active_power<-as.numeric(d$Global_active_power)
m<-subset(d,(d$Date=="2007-02-01")|(d$Date=="2007-02-02"))
datetime<-strptime(paste(m$Date, m$Time, sep=" "), "%Y-%m-%d %H:%M:%S")
png("plot2.png",width=480,height=480)
plot(datetime,m$Global_active_power,type="l",ylab = "Global Active Power (kilowatts)",xlab="")
dev.off()
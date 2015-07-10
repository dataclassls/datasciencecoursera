library(sqldf)
dt<-read.csv.sql("household_power_consumption.txt",header=T, sep=";",sql="select * from file where Date in ('1/2/2007', '2/2/2007')")
datetime<-strptime(paste(dt[,1],dt[,2]),"%d/%m/%Y %H:%M:%S")


png("plot3.png", width=480, height=480)
plot(datetime,as.numeric(dt[,7]),type="l",xlab="",ylab="Energy sub metering")
lines(datetime,as.numeric(dt[,8]),type="l",col='red')
lines(datetime,as.numeric(dt[,9]),type="l",col='blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
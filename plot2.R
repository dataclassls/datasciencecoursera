library(sqldf)
dt<-read.csv.sql("household_power_consumption.txt",header=T, sep=";",sql="select * from file where Date in ('1/2/2007', '2/2/2007')")
datetime<-strptime(paste(dt[,1],dt[,2]),"%d/%m/%Y %H:%M:%S")


png("plot2.png", width=480, height=480)
plot(datetime,as.numeric(dt[,3]),type="l",xlab="",ylab="Global Active Power(kilowatts)")
dev.off()
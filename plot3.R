mydata<-read.table("./household_power_consumption.txt", header=TRUE,  sep=";") ## nrows=10 

mydata$Date<-as.Date(mydata$Date, format="%d/%m/%Y")

mydata_2<-subset( mydata, Date == "2007-02-01" | Date == "2007-02-02")
mydata_3<-mydata_2

mydata_3$Global_active_power<-as.character(mydata_3$Global_active_power)
mydata_3$Global_active_power<-as.numeric(mydata_3$Global_active_power)
mydata_3$Time<-as.character(mydata_3$Time)

mydate_time<-paste(mydata_3$Date, mydata_3$Time)
mydata_3$DateTime<-strptime(mydate_time, format="%Y-%m-%d %H:%M:%S", tz="")

par(cex.lab=0.8, cex.axis=0.8)
with(mydata_3, plot(DateTime, 
                    as.numeric(as.character(Sub_metering_1)),type="l",lwd=1, 
                    xlab="", ylab="Energy sub metering", 
                    main=""))

with(mydata_3, points(DateTime, 
                      as.numeric(as.character(Sub_metering_2)),type="l",lwd=1, 
                    xlab="", ylab="Energy sub metering", 
                    main="", col="red") )

with(mydata_3, points(DateTime, 
                      as.numeric(as.character(Sub_metering_3)),type="l",lwd=1, 
                      xlab="", ylab="Energy sub metering", 
                      main="", col="blue") )

legend("topright", lty=c(1,1,1),
       col=c("black", "red", "blue"), 
       bty="o", seg.len=1, cex=0.6, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", width = 480, height = 480)
dev.off()
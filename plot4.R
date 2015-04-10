rm(list=ls());
file<-"household_power_consumption.txt";
data<-read.table(file, header = TRUE, sep=";");
days <- data$Date == "1/2/2007" | data$Date == "2/2/2007";
data2<- data[days,];
x<-strptime(paste(as.character(data2$Date), as.character(data2$Time)), "%d/%m/%Y %H:%M:%S")
Sub_metering_1<-as.numeric(as.character(data2$Sub_metering_1));
Sub_metering_2<-as.numeric(as.character(data2$Sub_metering_2));
Sub_metering_3<-as.numeric(as.character(data2$Sub_metering_3));
gap=as.numeric(as.character(data2$Global_active_power));
grp=as.numeric(as.character(data2$Global_reactive_power));
vlt=as.numeric(as.character(data2$Voltage));

png(filename="plot4.png");
par(mfrow=c(2,2))

plot(x,gap,type="n",ylab="Global Active Power",xlab="")
lines(x,gap,col=1)

plot(x,vlt,type="n",ylab="Voltage",xlab="datetime")
lines(x,vlt,col=1)

plot(x,Sub_metering_1,type="n", xlab="", ylab="Energy sub metering");
lines(x,Sub_metering_1, col=1);
lines(x,Sub_metering_2, col=2);
lines(x,Sub_metering_3, col=4);
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c(1,2,4), lwd=1, bty="n")

plot(x,grp,type="n", xlab="datetime", ylab="Global_reactive_power");
lines(x,grp)

dev.off();

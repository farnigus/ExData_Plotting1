rm(list=ls());
file<-"household_power_consumption.txt";
data<-read.table(file, header = TRUE, sep=";");
days <- data$Date == "1/2/2007" | data$Date == "2/2/2007";
data2<- data[days,];
x<-strptime(paste(as.character(data2$Date), as.character(data2$Time)), "%d/%m/%Y %H:%M:%S")
Sub_metering_1<-as.numeric(as.character(data2$Sub_metering_1));
Sub_metering_2<-as.numeric(as.character(data2$Sub_metering_2));
Sub_metering_3<-as.numeric(as.character(data2$Sub_metering_3));

png(filename="plot3.png");

plot(x,Sub_metering_1,type="n", xlab="", ylab="Energy sub metering");
lines(x,Sub_metering_1, col=1);
lines(x,Sub_metering_2, col=2);
lines(x,Sub_metering_3, col=4);
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c(1,2,4), lwd=1)

dev.off();

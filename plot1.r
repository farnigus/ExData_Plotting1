rm(list=ls());
file<-"household_power_consumption.txt";
data<-read.table(file, header = TRUE, sep=";");
days <- data$Date == "1/2/2007" | data$Date == "2/2/2007";
data2<- data[days,];
hist(as.numeric(as.character(data2$Global_active_power)), main="Global Active Power", xlab="Global Active Power (kilowatts)", col = 2);
dev.copy(png, file="plot1.png");
dev.off();

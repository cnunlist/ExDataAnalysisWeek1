d <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE)
d$Date <- dmy(d$Date)
d <- tbl_df(d)
ds <- filter(d, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
ds$Timestamp <- as.POSIXct(paste(ds$Date, ds$Time))

png(file = "plot3.png", height=480, width=480)

plot(ds$Sub_metering_1~ds$Timestamp, type="l", ylab = "Energy sub metering", xlab = "")
lines(ds$Sub_metering_2~ds$Timestamp, col = "red")
lines(ds$Sub_metering_3~ds$Timestamp, col = "blue")
legend(x = "topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), col = c("black","red","blue"))

dev.off()
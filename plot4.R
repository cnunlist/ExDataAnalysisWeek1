d <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE)
d$Date <- dmy(d$Date)
d <- tbl_df(d)
ds <- filter(d, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
ds$Timestamp <- as.POSIXct(paste(ds$Date, ds$Time))
ds$Global_active_power = as.numeric(ds$Global_active_power)

png(file = "plot4.png", height=480, width=480)

par(mfcol = c(2,2))

plot(ds$Global_active_power~ds$Timestamp, type="l", ylab = "Global Active Power", xlab = "")

plot(ds$Sub_metering_1~ds$Timestamp, type="l", ylab = "Energy sub metering", xlab = "")
lines(ds$Sub_metering_2~ds$Timestamp, col = "red")
lines(ds$Sub_metering_3~ds$Timestamp, col = "blue")
legend(x = "topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n", lty = c(1,1,1), col = c("black","red","blue"))

plot(ds$Voltage~ds$Timestamp, type="l", ylab = "Voltage", xlab = "datetime")

plot(ds$Global_reactive_power~ds$Timestamp, type="l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()
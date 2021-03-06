# I am from Brazil, so I need to set the properly locale for the exercise
Sys.setlocale("LC_ALL","C")

if(!file.exists("exdata-data-household_power_consumption.zip")) {
        tmp <- tempfile()
        download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",tmp)
        file <- unzip(tmp)
        unlink(tmp)
}

# Importing only the data being used, fast and furious : )
data <- read.csv(file = "household_power_consumption.txt", sep = ";", header = TRUE, dec = ".", stringsAsFactors=FALSE)[c(66637:69516),]

# You know, data convertion insteat of using colClasses in the read.csv()
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Global_intensity <- as.numeric(data$Global_intensity)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$datetime <-strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")


# Play time. Plotting ... ... ...

# Plot 2
png(filename = "plot2.png", width = 480, height = 480)
plot(data$datetime,data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

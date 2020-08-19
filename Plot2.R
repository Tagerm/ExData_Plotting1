library(ggplot2)
##Working Directory
setwd(dirname(rstudioapi::getSourceEditorContext()$path))

##Read Data
household <- read.delim("./household_power_consumption.txt", sep = ";")
household$Date <- as.Date(household$Date, "%d/%m/%Y")
household$Global_active_power <- as.numeric(household$Global_active_power)
household$Time <- as.POSIXlt(household$Time, format = "%H:%M:%OS")
datime <- as.POSIXct(paste(household$Date, household$Time),
                     format="%Y-%m-%d %H:%M:%S")
householdd <- cbind(household, datime)
##Sorting
date1 <- which(householdd$Date == as.Date("2007-2-1"))
date2 <- which(householdd$Date == as.Date("2007-2-2"))
datesrows <- rbind(date1, date2)
data <- householdd[datesrows,]
datasort <- data[order(data$Date),]
nona <- na.omit(datasort)
##Plotting
png("plot2.png")
plot( nona$datime, nona$Global_active_power, type = "l", 
      ylab = "Global Active Power (Kilowatts)", xlab = "")
dev.off()

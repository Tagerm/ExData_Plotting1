##Working Directory
setwd(dirname(rstudioapi::getSourceEditorContext()$path))

##Read Data
household <- read.delim("./household_power_consumption.txt", sep = ";")
strptime(household$Time, format = "%H:%M:%S")
as.Date(household$Date, format = "%d/%m/%Y")

##Sorting
date1 <- which(household$Date == "1/2/2007")
date2 <- which(household$Date == "2/2/2007")
datesrows <- rbind(date1, date2)
data <- household[datesrows,]
datasort <- data[order(data$Date),]
glblact <- as.numeric(datasort$Global_active_power)
##Plotting
png("plot1.png")
hist(glblact, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", 
     col = "red", main = "Global Active Power")
dev.off()

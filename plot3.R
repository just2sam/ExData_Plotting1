# plot3.R
# Construct line chart 'Sub-metering'

# setup working directory
working_directory <- ""

if (nchar(working_directory) > 0){
  setwd(working_directory)
}

# create data folder if it not exist. to store the downloaded zip file.
if(!file.exists("data")){
  dir.create("data")
}
# assign filename to zip_file
zip_file <- "data/household_power_consumption.zip"

# download the zip_file
if(!file.exists(zip_file)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"  
  download.file(url=fileURL,destfile=zip_file) 
}

data <- read.csv2(unz(zip_file, filename="household_power_consumption.txt")
                , header = TRUE, na.strings = c("?"), dec=".")

# Display the structure of data
# str(data)
# 'data.frame':	2075259 obs. of  9 variables:

# use data viewer sample the data
# View(data)
# head(data)

# assignment require data from the dates 2007-02-01 and 2007-02-02
data <- subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")

# Display the structure of data
# str(data)
# 'data.frame':	2880 obs. of  9 variables:

# use data viewer sample the data
# View(data)
# head(data)

# Convert the Date and Time variables to Date/Time classes
data$Date <- as.character(data$Date)
data$Time <- as.character(data$Time)

data$Timestamp <- strptime(paste(data$Date,data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

# define output file as PNG file with a width of 480 pixels and a height of 480 pixels
png(filename="plot3.png",width = 480, height = 480)

with(data,{
  plot(Timestamp, Sub_metering_1, type="l",xlab="", ylab="Energy sub metering")
  lines(x=Timestamp, y=Sub_metering_2, col="red")
  lines(x=Timestamp, y=Sub_metering_3, col="blue")
  legend(x="topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), lwd=c(2.5,2.5), col=c("black","red","blue"))
})
# close the device
dev.off()



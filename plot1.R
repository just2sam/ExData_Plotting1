# plot1.R
# Construct histogram 'Global Active Power'

# setup working directory
working_directory <- ""
if (nchar(working_directory) > 0){
  setwd(working_directory)
}

# create data folder to store the downloaded zip file if it not exist.
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

# read data set from source
data <- read.csv2(unz(zip_file, filename="household_power_consumption.txt") , header = TRUE, na.strings = c("?"), dec=".")

# head(data)

# Display the structure of data
# str(data)
# 'data.frame':	2075259 obs. of  9 variables:

# use data viewer sample the data
# View(data)

# assignment require data from the dates 2007-02-01 and 2007-02-02
data <- subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")

# Display the structure of data
# str(data)
# 'data.frame':	2880 obs. of  9 variables:

# use data viewer sample the data
# View(data)

# define output file as PNG file with a width of 480 pixels and a height of 480 pixels
png(filename="plot1.png",width = 480, height = 480)
# construct a histogram with column in red, title as Global Active Power and x as Global Active Power (kilowatts)
with(data,hist(Global_active_power,  col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)"))
# close the device
dev.off()
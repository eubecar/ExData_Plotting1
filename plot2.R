plot2 <- function() {
  
# Load data
data <- read.table("household_power_consumption.txt",
                   na.strings = "?",
                   colClasses = c( rep( "character", 2 ) , rep( "numeric", 7 )),
                   sep = ";",
                   header = TRUE);

# Cast date and time strings into a date format
data$Date_Time <- strptime( paste( data$Date, data$Time ), "%d/%m/%Y %H:%M:%S" );

# Subset only data from Feb 01, 2007 and Feb 02, 2007
s_data <- subset( data, Date_Time >= "2007-02-01" &  Date_Time < "2007-02-03" );

# Generate plot2 in PNG format
png("plot2.png");
with( s_data, plot( Date_Time, Global_active_power, 
                    type = "l",
                    xlab="",
                    ylab="Global Active Power (kilowatts)"));
dev.off();

}

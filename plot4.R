plot4 <- function() {
  
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
  
  # Generate plot4 in PNG format
  png("plot4.png");
  par(mfrow=c(2,2));
  # Plot(1,1)
  with( s_data, plot( Date_Time, Global_active_power, 
                      type = "l",
                      xlab="",
                      ylab="Global Active Power"));
  # Plot(1,2)
  with( s_data, plot( Date_Time, Voltage, 
                      xlab="datetime",
                      type = "l") );
  # Plot(2,1)
  with( s_data, plot( Date_Time, Sub_metering_1, 
                      xlab="",
                      ylab="Energy sub metering",
                      type ="n" ) )
  with( s_data, lines( Date_Time, Sub_metering_1,
                       type = "l") );
  with( s_data, lines( Date_Time, Sub_metering_2,
                       type = "l", 
                       col = "red"));
  with( s_data, lines( Date_Time, Sub_metering_3,
                       type = "l", 
                       col = "blue"));
  legend("topright", 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col=c("black","red", "blue"), 
         lty=1,
         bty = "n");
  # Plot(2,2)
  with( s_data, plot( Date_Time, Global_reactive_power, 
                      xlab="datetime",
                      type = "l") );
  dev.off();
  
}




# DownloadATS_R
ATS recently updated there website. This is a function to download and Import ATS Collar data from the new site.
You will need to contact ATS to obtain a cutomer code the is unique to each account. When you have that the only other information to put into the function is the path of where you want to download the data to ending in the file name and .txt
Example: path <- "C:/folder path/FileName.txt"

The imported data will probably require some further processing, especially regarding the date and time columns. I left that processing out but you can use the following code to craete a datetime column:
# Arrange a datetime column
ATS.df$Hour = as.character(ATS.df$Hour)
ATS.df$Minute = as.character(ATS.df$Minute)

ATS.df$DateTime = paste0(ATS.df$Date, " ", ATS.df$Hour, ":", ATS.df$Minute ,"0")
ATS.df$DateTime = as.POSIXct(ATS.df$DateTime, format = "%m/%d/%Y %H:%M", tz = "UTC")

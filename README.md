# DownloadATS_R

ATS.df <- Download_ATS(CustID, path)

CustID is the customer ID that is unique to each account and can only be obtained by contacting ATS.
path is the location of the folder you want to download the data to. It must include a name for the file and end in .txt.
Example: path <- "C:/folder path/FileName.txt"


ATS recently updated there website. This is a function to download and import ATS collar data from the new site without having to log in.
You will need to contact ATS to obtain a cutomer code that is unique to each account. When you have that the only other information to put into the function is the path of where you want to download the data to, ending in the file name and .txt
Example: path <- "C:/folder path/FileName.txt"
Within the function I added a Sys.sleep(5) to pause the code and make sure there is enough time for the data to download before importing. If you have a very large amount of data this amount of time may not be sufficiant, though it seems to download quite fast. In that case you can go in and increase the amount of time it pauses.

The imported data will probably require some further processing, especially regarding the date and time columns. I left that processing out but you can use the following code to create a datetime column:

ATS.df$Hour = as.character(ATS.df$Hour)
ATS.df$Minute = as.character(ATS.df$Minute)

ATS.df$DateTime = paste0(ATS.df$Date, " ", ATS.df$Hour, ":", ATS.df$Minute ,"0")
ATS.df$DateTime = as.POSIXct(ATS.df$DateTime, format = "%m/%d/%Y %H:%M", tz = "UTC")

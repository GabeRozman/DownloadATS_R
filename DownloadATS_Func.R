# Function to Download and Import ATS Collar data
# CustID is the customer ID that is unique to each account and can only be obtained by contacting ATS 
# path is the location of the folder you want to download the data to. It must include a name for the file and end in .txt
# Example: path <- "C:/folder path/FileName.txt"
# Prepared by G. Rozman; May 19th, 2021; gabe.rozman@gmail.com

Download_ATS <- function(CustID, path) {
  #paste the Customer ID to the download url
  dn_url <- paste0("https://www.atsidaq.net/download_all_data/Download_all_data.aspx?dw=all", CustID)
  download.file(dn_url, path)
  # Pause the script in order to give time for the ATS data to download
  Sys.sleep(5)
  # Import ATS data
  ATS.df <- read.table(path, header = TRUE, sep = ",", dec = ".")
  return(ATS.df)
}

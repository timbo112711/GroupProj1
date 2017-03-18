## Case Study 1 
## Code for getting the data files for Case Study 1

##Libraries Required
install.packages("downloader")
install.packages("reshape2")

#Set working directory
#setwd("C:\\Users\\jdenney\\Documents\\CaseStudy1")
setwd("C:\\Intro_Doing_Data_Sicence\\CaseStudy1\\New")

#Intoduction
#The goal is to import, clean, tidy, and perform some analysis on economic performace and educational
#data for 190 countries in the world. This section will only import the raw data into the working
#directory in prepartion for the remaining steps.

#Set variables for downloader to use 
#This is location for data file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
destfile <- "C:\\Intro_Doing_Data_Sicence\\CaseStudy1\\New\\GDP.csv"
download.file(fileUrl,destfile)

filesList <- list.files(".")
print(filesList)
#Add download timestamp to data
dateDownloaded <- date()
print(dateDownloaded)

## Procedure to get second required data file
#This is location for data file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
destfile <- "C:\\Intro_Doing_Data_Sicence\\CaseStudy1\\New\\Educ.csv"
download.file(fileUrl,destfile)
filesList <- list.files(".")
print(filesList)
#Add download timestamp to data
dateDownloaded <- date()
print(dateDownloaded)


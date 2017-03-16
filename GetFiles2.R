# We may not need to have a a working diectory set, all the code will be on 
# GITHUB. We could just give code to read the csv file from our GITHUB page or the 
# original url given in the word dox and then that will allow all of the next steps to run. This 
# will aviod having to use a working directory to run throught the code

# For example, Use this code to bring in both excel files (Educ & GDP) in to R.
# This would be the absolute raw data that is brought into R. The DataCheck.R 
# script will make a temp dataframe so that the raw data doesn't get over written

GDP.RawData <- read.csv(url("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"))

Educ.RawData <- read.csv(url("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"))
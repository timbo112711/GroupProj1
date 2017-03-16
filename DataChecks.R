## Case Study 1
## Verificaion and Basic EDA on GDP and Educ datasets
# Open working copies of the datafiles
##Need to verify files exist in working directory

#setwd("C:\\Users\\TMccw\\OneDrive\\DataScience\\Intro_Doing_Data_Sicence\\CaseStudy1")

#Set the required libraries
library("dplyr", lib.loc="~/R/win-library/3.3")
#library("readxl", lib.loc="~/R/win-library/3.3")
library("tidyr", lib.loc="~/R/win-library/3.3")

#Make a working copy of the data
tempgdp<- read.csv("GDP.csv",skip=5,header = FALSE,col.names = c("CountryCode","EcoRank","Del","Economy","GDP","Del","Del","Del","Del","Del"))
#Remove the commas and change GDP to numeric value for sorting later
tempgdp$GDP <- as.numeric(gsub(",","",tempgdp$GDP))
#Convert Economy from factor as imported to character
tempgdp$Economy <- as.character(tempgdp$Economy)
#delete blank columns (could use loop, but easier to just explict name)
drop <-c("Del","Del.1","Del.2","Del.3","Del.4","Del.5")#list columns to drop
work.gdp <- tempgdp[,!names(tempgdp) %in% drop]
#Delete rows where CountryCode is blank
work.gdp <- subset(work.gdp,CountryCode != "")
#Delete rows where EcoRank is blank
work.gdp <- subset(work.gdp,EcoRank != "")
#Import educ data to working var 
work.educ <-read.csv("Educ.csv")
#head(work.educ)
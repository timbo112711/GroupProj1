---
title: "Report"
author: "Joseph Denney, Laurie Harris, and Timothy McWilliams"
date: "March 20, 2017"
output: html_document
---



## Introduction

Each national economy is categorized into one of four income groupings by The World Bank (www.worldbank.org.)  The categories include:  low, lower-middle, upper-middle and high.  The income group classification is intended to define how well the population of a country lives and is based on Gross National Income Per Capita (GNIPC).

The high-income category is further differentiated based on membership in the OECD (Organization for Economic Cooperation and Development.)  The organization states that its mission is to “promote policies that will improve the economic and social well-being of people around the world.”  (www.oecd.org) Current membership in the OECD includes 35 of the most advanced or emerging countries in the world.

This analysis will examine the Gross Domestic Product (GDP), as an indicator of economic value, and the World Bank’s income grouping, as a measurement of population wealth, for 190 countries.  Specifically, we will review the differences in average GDP for high-income countries that are members in the OECD and those that are not.  We will also identify countries that have high GDP while qualifying for the lower-middle income grouping based on income per capita.

## Data Gathering
To begin the analysis, we have obtained the GDP rankings for 190 countries from http://data.worldbank.org/data-catalog/GDP-ranking-table. We have also obtained the income group classifications for each country from http://data.worldbank.org/data-catalog/ed-stats.


```r
## Case Study 1 
## Code for getting the data files for Case Study 1

##Libraries Required
install.packages("downloader")
install.packages("reshape2")

#Set working directory
#setwd("C:\\Users\\jdenney\\Documents\\CaseStudy1")

#Intoduction
#The goal is to import, clean, tidy, and perform some analysis on economic performace and educational
#data for 190 countries in the world. This section will only import the raw data into the working
#directory in prepartion for the remaining steps.

#Set variables for downloader to use 
#This is location for data file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv "
destfile <- "C:\\Users\\jdenney\\Documents\\CaseStudy1\\GDP.csv"
download.file(fileUrl,destfile)

filesList <- list.files(".")
print(filesList)
#Add download timestamp to data
dateDownloaded <- date()
print(dateDownloaded)

## Procedure to get second required data file
#This is location for data file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv "
destfile <- "C:\\Users\\jdenney\\Documents\\CaseStudy1\\Educ.csv"
download.file(fileUrl,destfile)
filesList <- list.files(".")
print(filesList)
#Add download timestamp to data
dateDownloaded <- date()
print(dateDownloaded)
```

## Data Tidying and Merging
To ensure that our analysis considers relevant data for the 190 countries, some data tidying will be necessary.  We want to make sure our variables are consistently formatted and remove any fields that are not necessary for the analysis.


```r
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
```

Our next step is to merge the two data files, joining by the country code.


```r
# The code below will merge the two datasets together

#Verify working directory
#getwd()
#Ensure that both getfiles.R and datachecks.R have been executed

#Merge work.educ and work.gdp and display number of matched ids (rows)
merged.data <- merge(x=work.gdp,y=work.educ,by="CountryCode",all.x = TRUE)
#Sort the data by GDP, copying into a new dataframe
sorted.merged.data <- merged.data[ order(merged.data$GDP), ]
#Determine if there are any missing values in income group
sorted.merged.data$Income.Group <- as.character(sorted.merged.data$Income.Group)
sorted.merged.data[sorted.merged.data=="NA"] <- NA
missing.incomegroup <- sorted.merged.data[is.na(sorted.merged.data$Income.Group),]
#Summarize number of matching records and identify how many NAs there are for the income group.
cat("The number of NA values for the Income Group variable is equal to",nrow(missing.incomegroup),".The number of country IDs which match in both records is",(nrow(merged.data)-nrow(missing.incomegroup)),".  The analysis will continue with the matching records.")
#Identify the 13th country listed in ascending order of GDP.
cat("The 13th country listed by ascending GDP is", sorted.merged.data[13,3],".")
```

We note that there are 190 countries with GDP rankings and 189 matching countries with income groupings therefore, there is one country with an NA value because there is not an income group identified for it.  We have also sorted the data in ascending order of GDP.  To demonstrate the sorting, we have identified the country with the 13th GDP in our sorted data as St. Kitts and Nevis.

## Comparision of GDP Rankings
### High Income:  OEDC vs. non-OEDC
We would like to examine some differences among the countries in the high-income group. By definition, these countries are considered to have the highest GNIPC, meaning that the citizens of these countries live quite well.  Specifically, we would like to determine if there is a difference in the economic development of these high-income countries for members of the OEDC vs. non-members of the OEDC.  To do this, we compare the average GDP rankings for each group, where a lower ranking would indicate higher economic development (GDP).


```r
#This anaylsis is performed on the tidy data from the perivous parts (1,2,&3)
#Ensure that both getfiles.R, datachecks.R, and mergeddata.R have been executed

#Create subset with only the High income: nonOECD
NewIncomeGroupsnonOECD <- subset(sorted.merged.data, sorted.merged.data$Income.Group=="High income: nonOECD")
#Convert EcoRank to character, 
#We convert to character first becasue if we don't then the values for EcoRank change
NewIncomeGroupsnonOECD$EcoRank <- as.character(NewIncomeGroupsnonOECD$EcoRank)
#Convert EcoRank to numeric
NewIncomeGroupsnonOECD$EcoRank <- as.numeric(NewIncomeGroupsnonOECD$EcoRank)
#Calualte the mean
mean(NewIncomeGroupsnonOECD$EcoRank, na.rm = TRUE)


#Create subset with only the High income: OECD
NewIncomeGroupsOECD <- subset(sorted.merged.data, sorted.merged.data$Income.Group=="High income: OECD")
#Convert EcoRank to character,
#We convert to character first becasue if we don't then the values for EcoRank change
NewIncomeGroupsOECD$EcoRank <- as.character(NewIncomeGroupsOECD$EcoRank)
#Convert EcoRank to numeric
NewIncomeGroupsOECD$EcoRank <- as.numeric(NewIncomeGroupsOECD$EcoRank)
#Calualte the mean
mean(NewIncomeGroupsOECD$EcoRank)
#Display the avergae GDP ranking for high income: OECD & for high income: nonOECD
cat("The average GDP ranking for High income: OECD is", mean(NewIncomeGroupsOECD$EcoRank), ". The average GDP ranking for High income: NonOECD is", mean(NewIncomeGroupsnonOECD$EcoRank, na.rm = TRUE))
```

We note that the members of the OEDC appear to have higher levels of economic development, as their mean ranking is 32.97 compared to the mean ranking for non-OEDC countries of 91.91.  For this parameter, a lower valued ranking is associated with a higher GDP value.

##GDP for all countries
Additionally, we can illustrate GDP for the 190 countries in the plot below.


```r
# GDP for all countires color coded by income group
#This anaylsis is performed on the tidy data from the perivous parts (1,2,&3)

#Verify working directory
#getwd()
#Ensure that both getfiles.R and datachecks.R have been executed


#load in the ggplot2 package
library("ggplot2", lib.loc="~/R/win-library/3.3")

#Create a varible to store the plot in, 
#Use ggplot2 to plot the CountryCode(x-axis) by GDP(y-axis),
#Color code the GDP for each country by income group,
#Use the "+ geom_point" since there are only 1 observation per country
plot1 <- ggplot(merged.data, aes(CountryCode, GDP, color=Income.Group)) + geom_point()
#Call print with agrument plot1 to see the plot
print(plot1)
```

*render plot

##High GDP for low-middle income group
In contrast to the analysis of the high-income countries above, we would like to determine if there are any countries that have a higher level of economic development (GDP) but are considered to have a lower standard of living (GNIPC).  To explore this area of interest we will determine if there are any countries with a relatively high GDP that belong in the low-middle income group.  To begin we will stratify the countries into quintiles according to their GDP.  We will then determine if any countries in the 80th to 100th percentiles belong to the lower middle income group.


```r
##Data should be sorted by GDP value
##Cut into 5 distinct quintiles 
##Create a table that shows the number of countries within each GDP quintile
##compared to it's income grouping

#Verify working directory
#setwd("C:\\Users\\Laurie\\Documents\\CaseStudy1")
#ensure that getfiles.R and datachecks.r have been executed 
#this analysis should be performed on tidy data prepared in the prior steps
#ensure data is sorted in order of GDP
q.data <- sorted.merged.data[ order(sorted.merged.data$GDP),]
q.data <- subset(q.data,EcoRank != "")
#add function that will cut data into 5 distinct quintiles
quintile <- function(x) {
  cut(x,breaks=c(quantile(q.data$GDP, probs= seq(0, 1, by = 0.20), na.rm=TRUE)),
  labels=c("0-20","20-40","40-60","60-80","80-100"), include.lowest=TRUE)
}
#build quintiles by applying quintile function to data
q.data$quintile <- sapply(q.data$GDP,quintile)
#build table to categorize countries by income group and GDP quintile
QuintileTable <- table(q.data$Income.Group,q.data$quintile)
#view table
QuintileTable
#Display number of countries that are in the lower middle income group and 
#also in the highest quintile of GDP
cat("There are", QuintileTable[4,5], "countries that are in the Lower middle income category but among the 38 nations with the highest GDP.")
```

There are five countries out of 38 countries in the highest GDP quintile, that belong to the lower middle income group.  This demonstrates that although a country may have a relatively high economic development it's citizens' standard of living may remain lower, compared to other countries.

##Conclusion


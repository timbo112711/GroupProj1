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
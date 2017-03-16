# GDP for all countires color coded by income group
#This anaylsis is performed on the tidy data from the perivous parts (1,2,&3)

#Verify working directory
#getwd()
#Ensure that both getfiles.R, datachecks.R, and mergeddata.R have been executed


#load in the ggplot2 package
library("ggplot2", lib.loc="~/R/win-library/3.3")

#Create a varible to store the plot in, 
#Use ggplot2 to plot the CountryCode(x-axis) by GDP(y-axis),
#Color code the GDP for each country by income group,
#Use the "+ geom_point" since there are only 1 observation per country
plot1 <- ggplot(merged.data, aes(CountryCode, GDP, color=Income.Group)) + geom_point()
#Call print with agrument plot1 to see the plot
print(plot1)
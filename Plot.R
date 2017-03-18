# GDP for all countires color coded by income group
#This anaylsis is performed on the tidy data from the perivous parts (1,2,&3)

#Verify working directory
#getwd()
#Ensure that both getfiles.R, datachecks.R, and mergeddata.R have been executed


#load in the ggplot2 package
#function to change the notation to regular scientific
#from http://stackoverflow.com/questions/11610377/how-do-i-change-the-formatting-of-numbers-on-an-axis-with-ggplot

library("ggplot2", lib.loc="~/R/win-library/3.3")
fancy_scientific <- function(l) {
  # turn in to character string in scientific notation
  l <- format(l, scientific = TRUE)
  # quote the part before the exponent to keep all the digits
  l <- gsub("^(.*)e", "'\\1'e", l)
  # turn the 'e+' into plotmath format
  l <- gsub("e", "%*%10^", l)
  # return this as an expression
  parse(text=l)
}
#Create a varible to store the plot in, 
#Use ggplot2 to plot the CountryCode(x-axis) by GDP(y-axis),
#Color code the GDP for each country by income group,
#Use the "+ geom_point" since there are only 1 observation per country
plot1 <- ggplot(merged.data, aes(CountryCode, GDP, color=Income.Group)) + geom_point()
plot1 + ggtitle("Income Group Plot") + ylab("GDP Millions USD") + xlab("Country Code") +
  scale_y_continuous(labels=fancy_scientific)
#Call print with agrument plot1 to see the plot
ggsave("plot.png")
#print(plot1)


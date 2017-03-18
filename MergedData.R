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


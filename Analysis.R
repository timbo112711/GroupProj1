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



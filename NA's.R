## The number of NA's for each variable used in the analysis

# Total NA's for GDP from the sorted and merged dataset
sum(is.na(sorted.merged.data$GDP))


# Below is a subset of the sorted.merged.data data frame. 
# The subset is NewIncomeGroupsnonOECD
# Total NA's for EcoRank in Income.Group; High Income: NonOECD 
sum(is.na(NewIncomeGroupsnonOECD$EcoRank))


cat("There are", sum(is.na(NewIncomeGroupsnonOECD$EcoRank)), "NA's for the variable EcoRank and", sum(is.na(sorted.merged.data$GDP)), "NA's for the variable GDP." )

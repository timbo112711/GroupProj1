####################################################################
## Case Study 1: Gross Domestic Product (GDP), as an 
## indicator of economic value, and the World Bank’s income 
## grouping, as a measurement of population wealth, for 190 countries.
####################################################################
## Tim McWilliams, Joseph Denney, & Laurie Harris
## Created 13 March 2017
## Updated - 15 March 2017
####################################################################


# Gather the datasets

source("GetFiles.R")

# Clean the datasets

source("DataChecks.R")


# Merge the two cleaned datasets (GDP & Education) and then sort by GDP 
# and stored in dataframe called sorted.merged.data.

source("MergedData.R")

# Analysis on tidy/cleaned data
# Each *.R file below preforms the different analysis steps used to analyized the tidy/clean data. 

source("Analysis.R")
source("Plot.R")
source("Quintiles.R")

# Markown file containing:
# 1) the introcution of the project,
# 2) code & brief explanations,
# 3) code to answer the 5 questions,
# 4) and the conclustion to the project.

# NOTE: You can't simply source an Rmd file, however you can knit it useing the knit() function.
# Must install the package "knitr" if not already installed. Load the package with the library() fucntion.
# Then call the knit() on the Rmd file.

library(knitr)
knit("Report.Rmd")





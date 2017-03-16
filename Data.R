# Code to pull in datasets from current working diretory 
# Couldn't get GetFiles.R to run 

setwd("C:\\Users\\TMccw\\Dropbox\\CaseStudy1")
list.files()

# Pull files from working directory 
Educ <- read.csv("Educ.csv", header = TRUE, sep = "")
GDP <- read.csv("GDP.csv", header = TRUE, sep = "")

# Check to see if pulled in properly 
str(Educ)
str(GDP)

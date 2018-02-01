# Coursera---Getting-and-Cleaning-Data Project Work

####This file describes how run_analysis.R script works.

#####First, unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and rename the folder with "UCI HAR Dataset". Make sure the folder "UCI HAR Dataset" and the run_analysis.R script are both in the current working directory.

#####Second, use source("run_analysis.R") command in RStudio.

#####Third, you will find two output files are generated in the current working directory: merged_data.txt - it contains a data frame called tidyData with 1029968 dimension. data_with_means.txt : it contains a data frame called result with 18068 dimension.

#####Finally, use data <- read.table("data_with_means.txt") command in RStudio to read the file. Since we are required to get the average of each variable for each activity and each subject, and there are 6 activities in total and 30 subjects in total, we have 180 rows with all combinations for each of the 66 features.

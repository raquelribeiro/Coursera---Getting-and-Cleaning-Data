#Project Script
#Set directory path
setwd("C:/Users/pgnanesh.ORADEV/Documents/coursera/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset")

#Requirement 1:  Merges the training and the test sets to create one data set.
#Read the activity files
url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,destfile="./UCI HAR Dataset.zip")


trLabel <- read.table("./train/y_train.txt")
table(trLabel)
testLabel <- read.table("./test/y_test.txt") 
table(testLabel)

#Read the data files.
trData <- read.table("./train/X_train.txt")
dim(trData) 
head(trData)
testData <- read.table("./test/X_test.txt")
dim(testData) 

#Read the subject files.
trSubject <- read.table("./train/subject_train.txt")
testSubject <- read.table("./test/subject_test.txt")

#Merge the training and the test sets
#Concatenate the data tables.
mergeData <- rbind(trData, testData)
dim(mergeData) 
mergeLabel <- rbind(trLabel, testLabel)
dim(mergeLabel) 
mergeSubject <- rbind(trSubject, testSubject)
dim(mergeSubject)

#Requirement 2:Extracts only the measurements on the mean and standard 
# deviation for each measurement.
feature <- read.table("./features.txt")
dim(feature) 
meanStdIndices <- grep("mean\\(\\)|std\\(\\)", feature[, 2])
length(meanStdIndices)
mergeData <- mergeData[, meanStdIndices]
dim(mergeData) # 10299*66
names(mergeData) <- gsub("\\(\\)", "", feature[meanStdIndices, 2]) # remove "()"
names(mergeData) <- gsub("mean", "Mean", names(mergeData)) # capitalize M
names(mergeData) <- gsub("std", "Std", names(mergeData)) # capitalize S
names(mergeData) <- gsub("-", "", names(mergeData)) # remove "-" in column names 


#Requirement 3: Uses descriptive activity names to name the activities in the data set 
activity <- read.table("./activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))#gsub:replace function 
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
activityLabel <- activity[joinLabel[, 1], 2]
mergeLabel[, 1] <- activityLabel
names(mergeLabel) <- "activity"

#Requirement 4: Appropriately labels the data set with descriptive activity names.
names(mergeSubject) <- "subject"
tidyData <- cbind(mergeSubject, mergeLabel, mergeData)
dim(tidyData) 
write.table(tidyData, "merged_data.txt") # write out the 1st dataset

#Requirement 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
subjectLen <- length(table(mergeSubject))
activityLen <- dim(activity)[1] 
columnLen <- dim(tidyData)[2]
result <- matrix(NA, nrow=subjectLen*activityLen, ncol=columnLen) 
result <- as.data.frame(result)
colnames(result) <- colnames(tidyData)
row <- 1
for(i in 1:subjectLen) {
  for(j in 1:activityLen) {
    result[row, 1] <- sort(unique(mergeSubject)[, 1])[i]
    result[row, 2] <- activity[j, 2]
    bool1 <- i == tidyData$subject
    bool2 <- activity[j, 2] == tidyData$activity
    result[row, 3:columnLen] <- colMeans(tidyData[bool1&bool2, 3:columnLen])
    row <- row + 1
  }
}
head(result)
write.table(result, "data_with_means.txt") # write out the 2nd dataset

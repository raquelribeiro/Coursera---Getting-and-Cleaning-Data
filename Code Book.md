####This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.

The site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

####The data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

####The run_analysis.R script performs the following steps to clean the data:

i.	Read training data set
Read X_train.txt, y_train.txt and subject_train.txt from the "./data/train" folder and store them in trData,trLabel and trSubject variables respectively.

ii.	Read test data set
Read X_test.txt, y_test.txt and subject_test.txt from the "./data/test" folder and store them in testData, testLabeland testsubject variables respectively.

iii.	Concatenate test dataset to training dataset
Concatenate testData to trData to generate a 10299x561 data frame, mergeData; concatenate testLabel to trLabel to generate a 10299x1 data frame, mergeLabel; concatenate testSubject to trSubject to generate a 10299x1 data frame, mergeSubject.

iv.	Read features file
Read the features.txt file from the "/data" folder and store the data in a variable called feature. We only extract the measurements on the mean and standard deviation. This results in a 66 indices list. We get a subset of mergeData with the 66 corresponding columns.

v.	Clean the column names of the subset
Clean the column names of the subset. We remove the "()" and "-" symbols in the names, as well as make the first letter of "mean" and "std" a capital letter "M" and "S" respectively.

vi.	Read the activity_labels
Read the activity_labels.txt file from the "./data"" folder and store the data in a variable called activity.

vii.	Clean the activity names in the second column of activity
Clean the activity names in the second column of activity. We first make all names to lower cases. If the name has an underscore between letters, we remove the underscore and capitalize the letter immediately after the underscore.

viii.	Transform the values of joinLabel
Transform the values of mergeLabel according to the activity data frame.

ix.	Combine the joinSubject, joinLabel and joinData
Combine the mergeSubject, mergeLabel and mergeData by column to get a new cleaned 10299x68 data frame,tidyData. Properly name the first two columns, "subject" and "activity". The "subject" column contains integers that range from 1 to 30 inclusive; the "activity" column contains 6 kinds of activity names; the last 66 columns contain measurements that range from -1 to 1 exclusive.

x.	Write tidy dataset
Write the tidyData out to "merged_data.txt" file in current working directory.

xi.	Generate a second independent tidy data set for average of each measurement
Finally, generate a second independent tidy data set with the average of each measurement for each activity and each subject. We have 30 unique subjects and 6 unique activities, which result in a 180 combinations of the two. Then, for each combination, we calculate the mean of each measurement with the corresponding combination. So, after initializing the result data frame and performing the two for-loops, we get a 180x68 data frame.

xii.	Write the result out to "data_with_means.txt"
Write the result out to "data_with_means.txt" file in current working directory.

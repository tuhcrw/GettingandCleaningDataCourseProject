#CodeBook
A codebook is a type of document used for gathering and storing codes. Originally codebooks were often literally books, but today codebook is a byword for the complete record of a series of codes, regardless of physical format. Wikipedia

##Pre-requisits
Require a C:/assignment folder prior to running the script

##Columns and their values
activity: WALKING, WALKING_UPSTAIRS
, WALKING_DOWNSTAIRS, SITTING, STANDING, or LAYING

subject: Numbers 1 to 24 to denote each person recorded

The rest are columns that show the means of the recorded data:

tBodyAccMeanX     
tBodyAccMeanY     
tBodyAccMeanZ     
tBodyAccStdX     
tBodyAccStdY     
tBodyAccStdZ     
tGravityAccMeanX     
tGravityAccMeanY     
tGravityAccMeanZ     
tGravityAccStdX     
tGravityAccStdY     
tGravityAccStdZ     
tBodyAccJerkMeanX     
tBodyAccJerkMeanY     
tBodyAccJerkMeanZ     
tBodyAccJerkStdX     
tBodyAccJerkStdY     
tBodyAccJerkStdZ     
tBodyGyroMeanX     
tBodyGyroMeanY     
tBodyGyroMeanZ     
tBodyGyroStdX     
tBodyGyroStdY     
tBodyGyroStdZ     
tBodyGyroJerkMeanX     
tBodyGyroJerkMeanY     
tBodyGyroJerkMeanZ     
tBodyGyroJerkStdX     
tBodyGyroJerkStdY     
tBodyGyroJerkStdZ     
fBodyAccMeanX     
fBodyAccMeanY     
fBodyAccMeanZ     
fBodyAccStdX     
fBodyAccStdY     
fBodyAccStdZ     
fBodyAccJerkMeanX     
fBodyAccJerkMeanY     
fBodyAccJerkMeanZ     
fBodyAccJerkStdX     
fBodyAccJerkStdY     
fBodyAccJerkStdZ     
fBodyGyroMeanX     
fBodyGyroMeanY     
fBodyGyroMeanZ     
fBodyGyroStdX     
fBodyGyroStdY     
fBodyGyroStdZ
##Steps to obtain the data once downloaded:

Import into Training:
  UCI HAR Dataset/train/X_train.txt
  UCI HAR Dataset/train/Y_train.txt
  UCI HAR Dataset/train/subject_train.txt
Import into testing:
  UCI HAR Dataset/test/X_test.txt
  UCI HAR Dataset/test/Y_test.txt
  UCI HAR Dataset/test/subject_test.txt
Combine training & testing into allData using rbind

Upload UCI HAR Dataset/features.txt and import into features
  Using gsub rename certain text feaures, such as remove -() and add an initial capital to Mean and Std
  using grep find column numbers for all columns that end in MeanX|.*MeanY|.*MeanZ|.*StdX|.*StdY|.*StdZ and assign to colsweWant
  Remove all columns from features that are not in colsWeWant 
  Add two new columns to ColsWeWant
  Remove all columns from allData that are not in colsWeWant and add the two new column names from colsWeWant

Obtain Activiy names from UCI HAR Dataset/activity_labels.txt and load into table Activities
  convert all numbers from allData$activity to their corresponding lablel in the activities table using factor

Create a data table from allData
using lapply calculate the mean of the activity and subject
write the table as a tab delimited text file  
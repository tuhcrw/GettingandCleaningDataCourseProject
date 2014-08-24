setwd("c:/assignment")
#Download and extract the zip file

#From David Hoon at https://class.coursera.org/getdata-006/forum/thread?thread_id=43
target_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
target_localfile = "data/assignment/assignment.zip"
if (!file.exists(target_localfile)) {
  download.file(target_url, destfile = target_localfile) #may need modifying if binary etc
  library(tools)       # for md5 checksum
  sink("data/assignment/download_metadata.txt")
  print("Download date:")
  print(Sys.time() )
  print("Download URL:")
  print(target_url)
  print("Downloaded file Information")
  print(file.info(target_localfile))
  print("Downloaded file md5 Checksum")
  print(md5sum(target_localfile))
  sink()
  
  # unzip the file to the temporary directory
  unzip("data/assignment/assignment.zip", exdir="data/assignment", overwrite=TRUE)
  # show the files
  list.files("./data/assignment/UCI HAR Dataset")   
}

# 1. Merges the training and the test sets to create one data set.
####################################################################

#Load data sets into R
training = read.csv("data/assignment/UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
#Obtain dimensions so we know the amount of rows, this is a manual step, I'd like to know how to use the dim command within read.csv to automate the process somewhat
dim(training)

#Read in extra datasets starting on a new row
training[,562] = read.csv("data/assignment/UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
dim(training)
training[,563] = read.csv("data/assignment/UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)
dim(training)

#Repeat for Testing data
testing = read.csv("data/assignment/UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
dim(testing)
testing[,562] = read.csv("data/assignment/UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)
dim(testing)
testing[,563] = read.csv("data/assignment/UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)

#Combine/Merge the two using rbind 
allData = rbind(training, testing)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.

#I took Step 2 as: select only columns that end in "mean" or "std" in their title. 
####################################################################


# Read features.txt and clean up the data using gsub to ensure the variable names match the requirements in slide 16 Lecture 04_01  Editing Text Values
features = read.csv("data/assignment/UCI HAR Dataset/features.txt", sep="", header=FALSE)
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])

# Get a list of the column numbers ending in Mean or Std from features
colsWeWant <- grep(".*MeanX|.*MeanY|.*MeanZ|.*StdX|.*StdY|.*StdZ", features[,2])

# Remove the now unnecessary rows from features
features <- features[colsWeWant,]

# Add the last two columns (subject and activity)
colsWeWant <- c(colsWeWant, 562, 563)

# Remove the unwanted columns from allData by subsetting
allData <- allData[,colsWeWant]

#Last text clean up - remove all capitals
colnames(allData) <- tolower(colnames(allData))

# 4. Appropriately labels the data set with descriptive activity names
####################################################################

#Name the new columns
colnames(allData) <- c(features$V2, "activity", "subject") #Yey an easy one....I've got it wrong haven't I?

# 3. Uses descriptive activity names to name the activities in the data set
####################################################################

#Obtain the data for activities from the txt file
activities <- read.table("data/assignment/UCI HAR Dataset/activity_labels.txt",header=FALSE,colClasses="character")

#Rename the row data in allData using the data in activities 2nd column where it matches the first column
allData$activity <- factor(allData$activity,levels=activities$V1,labels=activities$V2)


# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(data.table)
#Create a data table from allData
DT <- data.table(allData)
tidy<-DT[,lapply(.SD,mean),by="activity,subject"]

#
write.table(tidy,file="data/assignment/tidy.txt",sep="\t",row.names = FALSE)
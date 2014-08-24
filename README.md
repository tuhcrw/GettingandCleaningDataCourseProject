#Read me FOR Getting and Cleaning Data Course Project

##INTRODUCTION

This Github repo contains my 'Getting and Cleaning Data Course Project' 

##Files included

Readme.md: This file you're reading explaining why and what
run_analysis.r: the source code to clean the data
CodeBook.md: My incremental steps to create my data
tidy.txt: An independant tidy data set with the average of each variable for each activity and subject

##The Raw Data Set

The data comes from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

It is data from 'wearable computing' which is apparently one of the most exciting areas in all of data science right now. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## What the script does
Stage 1: Download and unzip the data from a predetermined location
Stage 2: Load the data sets form the unzipped file in stage 1, 
Stage 3: Append the data from training files, append the data from the test files, merge them both together
Stage 4: clean up the column name text ready to meet the requirements outlined in slide 16 of Lecture 04_01, removing the -() from all column names
Stage 5: Obtain all column names that end in MeanX, MeanY, MeanZ, StdX, StdY, or Stdz (previously Mean-()X for example)
Stage 6: remove all columns we no longer need from our raw data
Stage 7: Add two new columns, subject and Activity
Stage 7: rename the data for Activity from a number to the corresponding Activity description from the activity_labels.txt
Stage 8: Create a tidy data set
Stage 9: Export the tidy data set

# Getting-and-Cleaning-Data-Project
## Project for the "Getting and Cleaning Data" course of Coursera

Objective of the project
You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

## How to run this script
Follow the steps below to run this script and get the output-

1. Download the script to a filderand ensure that you make it your current working directory in Rstudio
2. Download the data for the project from the link above
3. Extract the data and ensure that it is labelled as "UCI HAR Dataset" in the current working directory
4. Run ```source("run_analysis.R")``` to run the script and generate ```tidy_data.txt``` in the the current working directory

##Dependencies
The script depends on the following libraries which are installed automatically-

1. ```data.table```
2. ```reshape2```


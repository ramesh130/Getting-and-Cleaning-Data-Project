## Pre-requisite
## Libraries
if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("reshape2")) {
  install.packages("reshape2")
}

require("data.table")
require("reshape2")

## Download the file from
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## Unzip the file

## List files
##list.files("./UCI HAR Dataset")

## You should create one R script called run_analysis.R that does the following. 

## 1. Merges the training and the test sets to create one data set.
train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject <- rbind(train, test)

train <- read.table("./UCI HAR Dataset/train/X_train.txt")
test <- read.table("./UCI HAR Dataset/test/X_test.txt")
X <- rbind(train, test)

train <- read.table("./UCI HAR Dataset/train/y_train.txt")
test <- read.table("./UCI HAR Dataset/test/y_test.txt")
Y <- rbind(train, test)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("./UCI HAR Dataset/features.txt")
reqFeatures <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, reqFeatures]

## 3. Uses descriptive activity names to name the activities in the data set
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
Y[,1] = activities[Y[,1], 2]

## 4. Appropriately labels the data set with descriptive variable names. 
names(X) <- features[reqFeatures, 2]
names(X) <- gsub("-mean\\(\\)","Mean", names(X))
names(X) <- gsub("-std\\(\\)","Std", names(X))
names(Y) <- "activity"
names(subject) <- "subject"

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
combinedData <- cbind(subject, Y, X)
idLabels = c("subject", "activity")
dataLabels = setdiff(colnames(combinedData), idLabels)
meltData = melt(combinedData, id = idLabels, measure.vars = dataLabels)
tidyData = dcast(meltData, subject + activity ~ variable, mean)
write.table(tidyData, file = "./tidy_data.txt", row.name=FALSE)

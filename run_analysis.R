#!/usr/bin/env Rscript
# Create R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one dataset.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the dataset
# 4. Appropriately labels the dataset with descriptive variable names. 
# 5. From the dataset in step 4, creates a second, independent tidy dataset with the average of each variable for each activity and each subject.

# Here is the data for this project
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# Here is the description
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

# Initital working directory
Init <- function(workDirStr = "./") {
    setwd(workDirStr)
}

Init()

## get packages
library(plyr)

## Download data
"Checks for data directory and creates one if it doesn't exist"
if (!file.exists("data")) {
	message("Creating data directory")
	dir.create("data")
}
if (!file.exists("data/UCI HAR Dataset")) {
# download the data
# don't do this everytime 
	fileurl <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	download.file(fileurl, destfile="./UCI_HAR_data.zip", method="curl")
	unzip("UCI_HAR_data.zip", exdir="data")
}

# 1.  Read all the data from  data/UCI_HAR_Dataset
train.X <- read.table("data/UCI_HAR_Dataset/train/X_train.txt")
train.Y <- read.table("data/UCI_HAR_Dataset/train/y_train.txt")
train.subject <- read.table("data/UCI_HAR_Dataset/train/subject_train.txt")

test.X <- read.table("data/UCI_HAR_Dataset/test/X_test.txt")
test.Y <- read.table("data/UCI_HAR_Dataset/test/y_test.txt")
test.subject <- read.table("data/UCI_HAR_Dataset/test/subject_test.txt")

features <- read.table("data/UCI_HAR_Dataset/features.txt")

activityLabels <- read.table("data/UCI_HAR_Dataset/activity_labels.txt")

## Now Merge data
merged.X <- rbind(train.X, test.X)
merged.Y <- rbind(train.Y, test.Y)
merged.subject <- rbind(train.subject, test.subject)

names(merged.subject)<-c("subject")
names(merged.Y)<- c("activity")
names(merged.X)<- features$V2

dataCombine <- cbind(merged.X, merged.Y)
data <- cbind(dataCombine,merged.subject)

# 2. extract mean and SD

subfeatures<-features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]
featureNames<-c(as.character(subfeatures), "subject", "activity" )
data<-subset(data,select=featureNames)


# 3. Activity Names and Lable
data$activity <- factor(data$activity, labels=c("WALKING", "WALKING UPSTAIRS", "WALKING DOWNSTAIRRS", "SITTING", "STANDING", "LAYING"))
names(data)


# 4. Create tidydata
td<-aggregate( . ~subject + activity, data, mean)
td<-td[order(td$subject,td$activity),]

# 5  save dataset from #4
write.table(td, file = "tidydata.txt",row.name=FALSE)
  

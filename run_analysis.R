## Getting and Cleaning Data course project
## Created by GEOX on 4/21/2015
## Last modified by GEOX on 4/25/2015

##    The Goals of this project are:
## 1) Merges the training and the test sets to create one data set.
## 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3) Uses descriptive activity names to name the activities in the data set
## 4) Appropriately labels the data set with descriptive variable names. 
## 5) From the data set in step 4, creates a second, independent tidy data set with the
##    average of each variable for each activity and each subject.

## For more infomation (experiment description, data descriptions, how to run and etc.), 
## please refer to the codebook.md file in the repo.

library(dplyr)

## --------- Download & Unzip the source data --------------------------------------------

url <- "https://d396qusza40orc.cloudfront.net/
getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
localFile <- "raw.zip"

if (!file.exists(localFile)) {
    download.file(url, localFile)
    unzip(localFile)
}

## ------- Read raw data, merge them into one with activity and parameters names  --------
## NOTE: Goal 1, 3 and 4 are completed in this part of codes

# --- Read 8 source data from local drive
features <- read.table("UCI HAR Dataset/features.txt")                # Measurement names
lables <- read.table("UCI HAR Dataset/activity_labels.txt")           # 6 types activities 

xTest <- read.table("UCI HAR Dataset/test/X_test.txt")                # Test set
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")             # Training set

yTest <- read.table("UCI HAR Dataset/test/Y_test.txt")                # Test labels
yTrain <- read.table("UCI HAR Dataset/train/Y_train.txt")             # Training labels

subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")    # Test subjects
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt") # Training subjects

# --- Merge data source
measurements <- rbind(xTest, xTrain)                      # Merge test & train measurements
names(measurements) <- as.character(features[,2])         # Variable names added to col

activityCode <- rbind(yTest, yTrain)                      # Merge test & train codes
activity <- inner_join(activityCode, lables, by="V1")[,2] # Link codes with descriptions
names(activity) <- "activity"

subject <- rbind(subjectTest, subjectTrain)               # Merge test & train subjects
names(subject) <- "subject"

dataAll <- cbind(subject, activity, measurements)         # Merge all data
rm(list = setdiff(ls(), "dataAll"))                       # Remove all data but the "dataAll"            

## ------- Extracts only the mean and std for each measurement ---------------------------
## NOTE: since "meanFreq" and angle mean (last 6 cols) are not real arithmetic mean,
##       the code determined mean and std by "mean()" and "std()"

meanCols <- grep("mean\\(\\)",colnames(dataAll))       # Get index for mean()
stdCols <- grep("std\\(\\)",colnames(dataAll))         # Get index for std()

dataAll.sub <- dataAll[, c(1:2, meanCols, stdCols)]    # Subset by wanted cols, with col 1:2
                                                       # (subject and activity)

## ------- Create a new dataset with the average of each variable, activity and subject --

dataSummary <- dataAll.sub %>% 
    group_by(subject, activity) %>% 
    summarise_each(funs(mean))                         # Create summary table         

names(dataSummary) <- gsub("BodyBody", "Body", 
                           names(dataSummary))         # "BodyBody" is wordy, "Body" is OK
names(dataSummary) <- gsub("\\(\\)", "", 
                           names(dataSummary))         # "()" is useless now, remove it

write.table(dataSummary, "tidy_data.txt", sep=",", row.name=FALSE)    # Save the file

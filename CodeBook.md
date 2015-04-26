CodeBook: Getting and Cleaning Data Course Project
==================================================

This is the CodeBook for R script [run_analysis.R](run_analysis.R). This is the script for project of coursera course "Getting and Cleaning Data".

## Project Background
One of the most exciting areas in all of data science right now is wearable computing - see [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/) for example. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

## Data Source
* [Experiment](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
* [Data Source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Source File Descriptions
* File "features.txt" contains the measurement parameter names.
* File "activity_labels.txt" contains the activity id (1 to 6) and the corresponding activity names.
* Files "subject_train.txt" and "subject_test.txt" contain testing and training subjects for each measurements. The subjects here are the participants ID.
* Files "X_train.txt" and "X_test.txt" contain the testing and training data set. These are the actual measurement data.
* Files "y_train.txt" and "y_test.txt" contain the activity code.


## Experiment Details
* There are 30 people in this study. They are divided into two groups: 7 in testing group and 21 in training. 
* There are 6 exercises for the participants in the study. They are walking, walking upstairs, walking downstairs, sitting, standing and laying.
* Each exercises are repeated multiple times.
* There are two readings of each measurements: acceleratormeter and gyroscope. 
* The body acting data are in X, Y and Z three directions.
* Raw data are per-processed to provide accelerations and angular velocities.
* Mean and standard deviation data are also available in the raw data.

## Before Running the Script
* Download R package `dplyr`.
* Use `setwd` to set the working directory to the source file location. 

## Script Summary
1. The script download and Unzip the source data file form above url.
2. It read raw data files, merge them into one big data frame. 
3. Add parameters names to the column names of all measurements. Convert activity codes to activity names. (NOTE: goals 1, 3 and 4 from the project requirements are all accomplished here.)
4. Extracts only the mean and standard deviation value for each measurement.
5. Create a new data set with the average of each variable, activity and subject. The column names are cleaned by removing the "()". Also, "BodyBody" is changed to "Body" to make the column names more concise.

## Variable names
* subject:  the ID of the subjects. They are participants of this study. It is from 1 to 30.
* activity: activity (exercises) names studied in this project. There are 6 exercises for the participants in the study. They are walking, walking upstairs, walking downstairs, sitting, standing and laying.
* measurement parameters names (e.g., **tBodyAcc-mean-X**, **fBodyAcc-std-Y**) built as follows:
	* "The begin **"t"** means time-space data and **"f"** means frequency-space data.
	* **"Body"** means forces acting on the body and **"Gravity"** means forces due to gravity
	* **"Acc"** means acceleration
	* **"AccJerk"** means acceleration derivative in Jerk signals
	* **"Gyro"** means angular velocity
	* **"GyroJerk"** means angular velocity derivative in Jerk signals
	* **"Mag"** means magnitude
	* **"mean"** is the mean (average)
	* **"std"** is the standard deviation
	* **"X,", "Y" and "Z"** means three directions 


## Output
The script writes a comma-delimited file `"tidy_data.txt"` to the working directory. This is a tidy and clean summary of the raw data set.
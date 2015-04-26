Getting and Cleaning Data Course Project
========================================

This is a course project from the coursera course "Getting and Cleaning Data". There are three files in this repo:

* [README.md](README.md) This file
* [run_analysis.R](run_analysis.R) The R script which get, merge and clean the data
* [CodeBook.md](CodeBook.md) The book that describe the output data of the script "run_analysis.R"

## Project Background
One of the most exciting areas in all of data science right now is wearable computing - see [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/) for example. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

## Data Source
* [Experiment](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
* [Data Source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Before Running the Script
* Download R package `dplyr`.
* Use `setwd` to set the working directory to the source file location. 

## Script Summary
1. The script download and Unzip the source data file form above url.
2. It read raw data files, merge them into one big data frame. 
3. Add parameters names to the column names of all measurements. Convert activity codes to activity names.
4. Extracts only the mean and standard deviation value for each measurement.
5. Create a new data set with the average of each variable, activity and subject.

## Output
The script writes a comma-delimited file "tidy_data.txt" to the working directory. This is a tidy and clean summary of the raw data set. For more information about the codes and output file, please refer to the [CodeBook.md](CodeBook.md) file. 

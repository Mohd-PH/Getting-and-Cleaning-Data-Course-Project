# Getting-and-Cleaning-Data-Course-Project
This is a project for the course Getting and Cleaning Data in coursera


R version used to the run this script is `R version 3.6.3 (2020-02-29)`



# Project Objectives

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# Project Files
This project has 2 main files and 1 missing folder
Name | Description
|----|-----|
/data | This is a missing folder containing the raw data from [UCI Machine learning repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#), you should download the data and put it in the data folder before running the code 
[run_analysis.R](run_analysis.R) | This R file has 2 functions, getmergedset and run_analysis, for description what they do please refer to the CodeBook.md
[CodeBook.md](CodeBook.md) | A mark down file describing what have been done to the raw dataset to make a tidy set.

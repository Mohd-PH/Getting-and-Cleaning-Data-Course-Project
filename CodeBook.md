# Code Book
R version used in this project `R version 3.6.3 (2020-02-29)`

The aim of this project is to make a tidy set of data from raw data

The raw data can be found on [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#)

By running the `run_analysis` function it will start by calling the `getmergeddata` function which will start merging the two data sets (train and test) together, adding the subject id and activity type columns

The two data sets (train/X_train.txt and test/X_test.txt) will be loaded along with the features.txt as a table.
feautres table will act as a column names to the two data sets

It will set a new column to each data set defining the set, either training or test

The activity type will be loaded from (train/y_train.txt and test/y_test.txt) and merged as a new column to the according set with the name activitytype as integers in the range 1-6

The subject doing the actvitiy will be loaded from (train/subject_train.txt and test/subject_train.txt) and merged as a new column to the according set with the name subject as integers of IDs

Then the two datasets will be merged into one dataset

Then it will excludes any data not measuring a mean or standered deviation by using this regex on the features vector `(mean|std)\\(`

Then the subject column will be coerced into factor class

Then the activitytype column will be descriptively named according to the (activity_labels.txt) file


At the end the merged dataset will be returned to the `run_analysis` function


`run_analysis` will set the global variable `mergedset` to the merged set

Then it will group the merged set to activity type and subject and set the grouped set to `groupedset` variable

Then it will calculate the average of the grouped set and set it to the global enviroment as `groupedsetaverage` variable
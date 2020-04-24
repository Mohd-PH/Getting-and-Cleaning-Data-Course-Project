library(dplyr)
run_analysis <- function(){
  mergedset <<- getmergeddata()
}


getmergeddata <- function(){
  ## Load the data files
  features <- readLines("data/features.txt")
  trainingset <- read.table("data/train/X_train.txt")
  testset <- read.table("data/test/X_test.txt")
  trainingsetactivitytype <- read.table("data/train/y_train.txt")
  testsetactivitytype <- read.table("data/test/y_test.txt")
  trainingsetsubjects <- read.table("data/train/subject_train.txt")
  testsetsubjects <- read.table("data/test/subject_test.txt")
  
  ## Set column names according to the features txt file
  names(trainingset) <- features
  names(testset) <- features
  
  
  ## Change data.frames class to tbl to be used in dplyr
  trainingset <- as.tbl(trainingset)
  testset <- as.tbl(testset)
  
  
  ## Add a column describing the set before merging
  trainingset <- mutate(trainingset, set = "training")
  testset <- mutate(testset, set = "test")
  
  ## Add column to describing the activity type
  trainingset <- mutate(trainingset, activitytype = trainingsetactivitytype[,1])
  testset <- mutate(testset, activitytype = testsetactivitytype[,1])
  
  ## Add column to describing the subject
  trainingset <- mutate(trainingset, subject = trainingsetsubjects[,1])
  testset <- mutate(testset, subject = testsetsubjects[,1])
  
  ## Merge the two tbl
  mergedset <- bind_rows(trainingset, testset) 
  
  
  ## Set the subject as a factor
  mergedset$subject <- as.factor(mergedset$subject)
  
  ## return the merged data
  mergedset
}
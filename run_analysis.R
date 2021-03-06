library(dplyr)
run_analysis <- function(){
  mergedset <<- getmergeddata()
  
  
  ## Group the merged set by activity type and subject to calculate the average
  groupedset <- group_by(mergedset, activitytype, subject)
  
  ## calculate the average of the grouped set and set it to the global enviroment
  groupedsetaverage <<- summarize_all(grouped, list(mean = mean))
  groupedsetaverage
  
  
}


getmergeddata <- function(){
  ## Load the data files
  features <- readLines("data/features.txt")
  meanstdfeatures <- features[grep("(mean|std)\\(", features)]
  activitylabels <- read.table("data/activity_labels.txt")[,2]
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
  
  ## Only select mean std activitytype and subject columns
  mergedset <- select(mergedset, all_of(meanstdfeatures), activitytype, subject)
  
  ## Set the subject as a factor
  mergedset$subject <- as.factor(mergedset$subject)
  
  ## Set a descriptive activity names to the activitytype column
  mergedset <- mutate(mergedset, activitytype = activitylables[activitytype])
  
  ## return the merged data
  mergedset
}
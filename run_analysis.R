library(dplyr)
run_analysis <- function(){
  
  ## Load the data files
  features <- readLines("data/features.txt")
  trainingset <- read.csv("data/train/X_train.txt", sep="", header = FALSE)
  testset <- read.csv("data/test/X_test.txt", sep="", header = FALSE)
  
  
  ## Set column names according to the features txt file
  names(trainingset) <- features
  names(testset) <- features
  
  
  ## Change data.frames class to tbl to be used in dplyr
  trainingset <- as.tbl(trainingset)
  testset <- as.tbl(testset)
  
  
  ## Add a column describing the set before merging
  trainingset <- mutate(trainingset, set = "training")
  testset <- mutate(testset, set = "test")
  
  
  ## Merge the two tbl
  mergedset <- bind_rows(trainingset, testset) 
  
  
  ### Set global variables for testing purposes

  mergedset <<- mergedset
  
}
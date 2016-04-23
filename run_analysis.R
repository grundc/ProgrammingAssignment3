
# Setting my work directory

 setwd("./R")

# Setting the file names for the raw data test & train

testFile <- "./data/X_test.txt"
trainFile <- "./data/X_train.txt"

# Setting the file names for activities of each line in the raw data (test & train)

TestFileActivities <- "./data/Y_test.txt"
TrainFileActivities <- "./data/Y_train.txt"

# Setting the file name for the columns

ColumnNames <- "./data/features.txt"

# Setting the file name for activity labels 

Activities <-  "./data/activity_labels.txt"

# As I will use dplyr

library(dplyr)

# I created a function "createDescriptiveDataSet " that is preparing the data

createDescriptiveDataSet <- function(rawDataFile, DataActivityFile, ActivityLabelFile, ColumnNamesFile) {
	
	ColumnNames <- readLines(ColumnNamesFile)
	
	Activities <-  read.table(ActivityLabelFile, col.names=c("ActivityID","ActivityLabel"))

	FileActivities <- readLines(DataActivityFile)
	rawDataSet <- readLines(rawDataFile)
	rawDataSet_list <- strsplit(rawDataSet , " ")
	rm(rawDataSet)
	rawDataSet_list <- lapply(rawDataSet_list, function(x) {x[x != ""]} )
	rawData_frame <- do.call(rbind.data.frame, rawDataSet_list)
	rm(rawDataSet_list)
	colnames(rawData_frame) <- ColumnNames

	rawData_frame$ActivityID <- FileActivities 

	rawData_frame <- merge(rawData_frame, Activities, by.x="ActivityID", by.y="ActivityID")	
	rawData_frame <- select(rawData_frame, starts_with("Activity"), contains("mean()"), contains("std()"))
	
	columnsToBeConverted <- c(grep("mean()", names(rawData_frame), fixed=T),grep("std()", names(rawData_frame), fixed=T))

	for (i in columnsToBeConverted)
	{
		rawData_frame[,i] <- as.numeric(rawData_frame[,i])
	}
	
	rawData_frame
}

# Calling the function "createDescriptiveDataSet" 2 times for test and train

testDataOutput <- createDescriptiveDataSet( testFile , TestFileActivities ,Activities , ColumnNames )
trainDataOutput <- createDescriptiveDataSet( trainFile , TrainFileActivities ,Activities , ColumnNames)

# Combining both data sets to one resultset

totalresult <- rbind(testDataOutput , trainDataOutput )

# Cleaning up 

rm(testDataOutput)
rm(trainDataOutput)

# creating a summary "mean" for each column based on activity label

summary <- totalresult %>% select(-1) %>% group_by (ActivityLabel) %>% summarize_each(funs(mean))











# Code Book for Samsung data anaylsis


## Script and Sources

The script "run_analysis.R" consumes file provide under the following source:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The files in detail:

RAW measurements

 * X_test.txt
 * X_train.txt

ACTIVITIES for measurments:

 * Y_test.txt
 * Y_train.txt

SUBJECT of measurment:

 * subject_test.txt
 * subject_train.txt

COLUMN NAMES for measurement:

 * features

ACTIVITY LABELS:

 * activity_labels.txt

The file assumes, that the data files are located in a directory "./data" relative the
current working directory.
The script will do the follwing steps:

1.) Reading raw data and split into columns 
2.) Adding column names
3.) Adding activityID to raw data
4.) Adding SubjectID ro raw data
5.) Merge Activity-Label data with raw data and add activity label to result set
6.) selecting only columns with "mean()" and "std()" together with activity and subject
7.) convert measure columns into numeric columns
8.) Combine both resulting data sets from test data and train data into one result set
9.) Total resultset will be grouped by activity and subject and an avg calculation will be applied on each of the measure columns
10.) The resulting data set will be written to a file named "samsung_data.csv"


## Resultset "samsung_analysis.csv"

Grouping columns:

"ActivityLabel"                   
"SubjectID"  

Original measurments but as avg calculation:
    
"1 tBodyAcc-mean()-X"             
"2 tBodyAcc-mean()-Y"            
"3 tBodyAcc-mean()-Z"             
"41 tGravityAcc-mean()-X"         
"42 tGravityAcc-mean()-Y"         
"43 tGravityAcc-mean()-Z"        
"81 tBodyAccJerk-mean()-X"        
"82 tBodyAccJerk-mean()-Y"        
"83 tBodyAccJerk-mean()-Z"        
"121 tBodyGyro-mean()-X"         
"122 tBodyGyro-mean()-Y"          
"123 tBodyGyro-mean()-Z"          
"161 tBodyGyroJerk-mean()-X"      
"162 tBodyGyroJerk-mean()-Y"     
"163 tBodyGyroJerk-mean()-Z"      
"201 tBodyAccMag-mean()"          
"214 tGravityAccMag-mean()"       
"227 tBodyAccJerkMag-mean()"     
"240 tBodyGyroMag-mean()"         
"253 tBodyGyroJerkMag-mean()"     
"266 fBodyAcc-mean()-X"           
"267 fBodyAcc-mean()-Y"          
"268 fBodyAcc-mean()-Z"           
"345 fBodyAccJerk-mean()-X"       
"346 fBodyAccJerk-mean()-Y"       
"347 fBodyAccJerk-mean()-Z"      
"424 fBodyGyro-mean()-X"          
"425 fBodyGyro-mean()-Y"          
"426 fBodyGyro-mean()-Z"          
"503 fBodyAccMag-mean()"         
"516 fBodyBodyAccJerkMag-mean()"  
"529 fBodyBodyGyroMag-mean()"     
"542 fBodyBodyGyroJerkMag-mean()" 
"4 tBodyAcc-std()-X"             
"5 tBodyAcc-std()-Y"              
"6 tBodyAcc-std()-Z"              
"44 tGravityAcc-std()-X"          
"45 tGravityAcc-std()-Y"         
"46 tGravityAcc-std()-Z"          
"84 tBodyAccJerk-std()-X"         
"85 tBodyAccJerk-std()-Y"         
"86 tBodyAccJerk-std()-Z"        
"124 tBodyGyro-std()-X"           
"125 tBodyGyro-std()-Y"           
"126 tBodyGyro-std()-Z"           
"164 tBodyGyroJerk-std()-X"      
"165 tBodyGyroJerk-std()-Y"       
"166 tBodyGyroJerk-std()-Z"       
"202 tBodyAccMag-std()"           
"215 tGravityAccMag-std()"       
"228 tBodyAccJerkMag-std()"       
"241 tBodyGyroMag-std()"          
"254 tBodyGyroJerkMag-std()"      
"269 fBodyAcc-std()-X"           
"270 fBodyAcc-std()-Y"            
"271 fBodyAcc-std()-Z"            
"348 fBodyAccJerk-std()-X"        
"349 fBodyAccJerk-std()-Y"       
"350 fBodyAccJerk-std()-Z"        
"427 fBodyGyro-std()-X"           
"428 fBodyGyro-std()-Y"           
"429 fBodyGyro-std()-Z"          
"504 fBodyAccMag-std()"           
"517 fBodyBodyAccJerkMag-std()"   
"530 fBodyBodyGyroMag-std()"      
"543 fBodyBodyGyroJerkMag-std()" 

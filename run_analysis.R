## Part 1 - Merge the training and test sets into a single data set.

## Read the train data from 3 files into a single data frame:
## 
## features - contains the 561 measurements (columns) for 7352 observations 
##            (rows). File is ./train/X_test.txt
## activities - each line contains the code for the activity being executed 
##              during each of the 7352 train observations. 
##              File is ./train/y_test.txt
## subjects - each line contains the id of the subject for each one of the 
##            7352 train observations
##            File is ./train/X_test.txt
file<-"/Users/Huascar/Getting & Cleaning Data/train/y_train.txt"
activities<-read.table(file, col.names = c("ActivityCode"))
file<-"/Users/Huascar/Getting & Cleaning Data/train/subject_train.txt"
subjects<-read.table(file, col.names = c("Subject"))
file<-"/Users/Huascar/Getting & Cleaning Data/train/X_train.txt"
features<-read.table(file)
## Bind into a sigle data frame
fullData<-cbind(subjects, activities, features)

## Read the test data from 3 files into a single data frame:
## 
## features - contains the 561 measurements (columns) for 2947 observations 
##            (rows). File is ./test/X_test.txt
## activities - each line contains the code for the activity being executed 
##              during each of the 2947 observations. 
##              File is ./test/y_test.txt
## subjects - each line contains the id of the subject for each one of the 
##            2947 observations
##            File is ./test/X_test.txt

file<-"/Users/Huascar/Getting & Cleaning Data/test/y_test.txt"
activities<-read.table(file, col.names = c("ActivityCode"))
file<-"/Users/Huascar/Getting & Cleaning Data/test/subject_test.txt"
subjects<-read.table(file, col.names = c("Subject"))
file<-"/Users/Huascar/Getting & Cleaning Data/test/X_test.txt"
features<-read.table(file)
## Bind everything into a sigle data frame
fullData<-rbind(fullData, cbind(subjects, activities, features))

## Part 2 - Extracts only the measurements on the mean and standard deviation 
##          for each measurement. 

## Read the file with the name of the measurements (features) and give these 
## names to the measurement columns in the fullData. We will use these names in 
## order to find the columns that have means and standard deviations.
file<-"/Users/Huascar/Getting & Cleaning Data/features.txt"
measurementNames<-read.table(file, stringsAsFactors = FALSE)
## Rename the columns in the fullData data frame with the measurements names
names(fullData)[3:563]<-measurementNames[,2]
## Indentify which columns have Mean or Std in its name
cols<-(grepl("std", names(fullData), ignore.case=TRUE) |
       grepl("mean", names(fullData), ignore.case=TRUE))
## Remember to keep columns 1 and 2 (Subject and ActivityCode)
cols[1:2]<-TRUE
tidyData1 <- fullData[,cols]

## Part 3 - Uses descriptive activity names to name the activities in the data 
##          set

## Read the file with the activities codes and names
file<-"/Users/Huascar/Getting & Cleaning Data/activity_labels.txt"
activities<-read.table(file, col.names = c("ActivityCode", "ActivityName"))
## Merge activities with tidyData1
tidyData1 <- arrange(join(activities, tidyData1), ActivityCode)

## Part 4 - Appropriately label the data set with descriptive variable names

## Improve understanding of column names by removing parenthesis. To keep 
## good readability of column names, will not remove uppercase letters. 
names(tidyData1)<-gsub("\\(","",names(tidyData1))
names(tidyData1)<-gsub("\\)","",names(tidyData1))

## Parts 1 - 4: write tidyData1 file as a txt file in order to upload to
##              Coursera
file<-"~/Getting & Cleaning Data/GettingCleaningDataProject/tidyData1.txt"
write.table(tidyData1, 
            file="./tidyData1.txt",
            row.names = FALSE)

## Part 5 - Creates a second, independent tidy data set with the average of 
##          each variable for each activity and each subject. 



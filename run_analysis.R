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

## Merge activities with tidyData1 using plyr package
library(plyr)
tidyData1 <- arrange(join(activities, tidyData1), ActivityCode)

## Part 4 - Appropriately label the data set with descriptive variable names

## Improve understanding of column names by removing parenthesis and
## substituting commas for dashes. Also substitute the word "angle" in the last
## column names for "angleOf-"
## To keep good readability of column names, will not remove uppercase letters. 
## There's not much more I can do since I don't fully understand the 
## measurements or facilities used.
names(tidyData1)<-gsub("\\(","",names(tidyData1))
names(tidyData1)<-gsub("\\)","",names(tidyData1))
names(tidyData1)<-gsub("\\,","-",names(tidyData1))
names(tidyData1)<-gsub("angle","angleOf-",names(tidyData1))

## Write tidyData1 file as a txt file in order to upload to Coursera
file<-"/Users/Huascar/Getting & Cleaning Data/tidyData1.txt"
write.table(tidyData1, 
            file=file,
            row.names = FALSE)

## Part 5 - Creates a second, independent tidy data set with the mean of 
##          each variable for each activity and each subject. 

## Use data.table library to apply function mean to all columns aggregated by
## ActivityName and Subject columns
library(data.table)
tidyData1 <- as.data.table(tidyData1)
tidyData2<-tidyData1[, lapply(.SD, mean), by=c("ActivityName","Subject"), 
                     .SDcols=4:89]

## To make clear that the measurements now are means, include "meanOf-" at the 
## beginning of the column names
names(tidyData2)[3:88]<-sub("","meanOf-",names(tidyData2)[3:88])

## Write tidyData1 file as a txt file in order to upload to Coursera
file<-"/Users/Huascar/Getting & Cleaning Data/tidyData2.txt"
write.table(tidyData2, 
            file=file,
            row.names = FALSE)


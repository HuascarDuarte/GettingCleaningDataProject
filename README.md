Getting and Cleaning Data Project
==========================

Introduction
--------------------------

Repo for Getting &amp; Cleaning Data Course Project. This README.md explains how the **run_analysis.R** script work. This script reads, cleans and creates a tidy data set from the Human Activity Recognition Using Smartphones Dataset. Details of the data coming from this data set and the contents of the tidy data se created can be found in the [CodeBook.md](https://github.com/HuascarDuarte/GettingCleaningDataProject.git/CodeBook.md) file.
  
  
  This script does the following:  
1. Merges the training and the test sets to create one data set.  
2. Extracts only the measurements on the mean and standard deviation for each measurement.   
3. Uses descriptive activity names to name the activities in the data set.  
4. Appropriately labels the data set with descriptive variable names. A new data file with this tidy data is than created.   
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.  

Part 1 - Merge the training and test sets into a single data set
--------------------------------------

### Train data
The train data comes from the following txt files:  
* __Features:__ The file **/train/X_train.txt** contains the 561 measurements or features (columns) for 7352 observations (rows). Description of each measurement or feature can be found in the [CodeBook.md](https://github.com/HuascarDuarte/GettingCleaningDataProject.git/CodeBook.md) file.  

* __Activities:__ Each of the 7352 lines of the **/train/y_train.txt** file contains the code for the activity being executed for each of the 7352 train observations in the features file.  

* __Subjects:__ Each of the 7352 lines of the **/train/subject_train.txt** file contains the id of the subject (actual person) who was executing the activity for each of the 7352 train observations in the features file.  

These files are formatted as blank separated text files without header. They are read with the `read.table()` command into data frames which are then column bound together to create the `fullData` data frame, containing the train subjects, activities and measurements. 

### Test data
Similar to the train data, the test data comes from 3 txt files:  
* __Features:__ The file **/test/X_test.txt** contains the 561 measurements or features (columns) for the 2947 test observations (rows). Description of each measurement or feature can be found in the [CodeBook.md](https://github.com/HuascarDuarte/GettingCleaningDataProject.git/CodeBook.md) file.  

* __Activities:__ Each of the 2947 lines of the **/test/y_test.txt** file contains the code for the activity being executed for each of the 2947 test observations in the features file.  

* __Subjects:__ Each of the 2947 lines of the **/test/subject_test.txt** file contains the id of the subject (actual person) who was executing the activity for each of the 2947 test observations in the features file.  

These files are also formatted as blank separated text files without header. They are read with the `read.table()` command into data frames which are then column bound together and then row bound to the `fullData` data frame, created with the train data.  

At this point, the `fullData` data frame contains all data for the train and tests subjects, activities and measurements.


Part 2 - Extracts only the mean and standard deviation measurements for each observation
-----------------------------------

The name of each of the 561 measurements can be found in the file **features.txt**. The approach adopted is to extract the measurements that contain either the strings "mean" or "std" in their names.  
* The features file with the name of the measurements (features) is read.  

* The names of the 561 measurements columns in the `fullData` data frame are then replaced by the names coming from the features file.  

* The column names of the `fullData` data frame that contain either "mean" or "std" in their names are identified.  

* The `tidyData1` data frame is created containing these columns as well as the Subject and ActivityCode columns.  


Part 3 - Uses descriptive activity names to name the activities in the data set
--------------------------------------

At this point, the `tidyData1` data frame contains only the activity code (ranging from 1 to 6) in the column named ActivityCode. A new column will be created in the this data frame with the name of the activity (ActivityName) which comes from the **activity_labels.txt** file.  
* We first read the **activity_labels.txt** into a data frame being careful to use the same column name for activity code as in the `tidyData1` data frame (ActivityCode).  

* We then use the `arrange` function of the `plyr` library to easily merge the `tidyData1` data frame with the activities data frame, using the common ActivityCode column, into the `tidyData1` data frame.   

So now, the `tidyData1` data frame contains columns with both the activity codes (ActivityCode) and activity names (ActivityName).  


Part 4 - Appropriately label the data set with descriptive variable names
---------------------------------------

We will now attempt to improve the understanding and readability of the columns names of `tidyData1` data frame by:  

* Removing parenthesis from column names;  

* Substituting commas for dashes;  

* Substituting the word "angle", in the name of the last few columns, for "angleOf-".  

* To keep good readability of column names, uppercase letters will __not__ be removed.  

There is not much to be done in this step of the project, since the measurements (or features) used are not fully understood. 

At this point, the `tidyData1` data frame contains: (1) a subset of the full train and test data with only the columns that contains means and standard deviations of the measurements, (2) a column with the name of the activities measured and (3) column names supposedly easier to understand.  

This data frame is than saved as a blank separated text file (`tidyData1.txt`), using the `write.table()` command. 

Part 5 - Creates a second, independent tidy data set with the mean of each variable for each activity and each subject
-----------------------------------------

It is now necessary to summarize the measurement columns by taking their mean for each activity and subject. The easiest way to do that is by using the `data.table` library to take the mean of the columns without having to strugle with their names.  

* After reading the `data.table` library, the `tidyData1` data frame is converted to a data table;  

* The function `mean()` is applied to all 86 measurement columns of the `tidyData1` data table, summarized by the ActivityName and Subject columns, creating the `tidyData2` data frame;  

* This data frame now contains one line for each of the 6 activities and each of the 30 subjects, totalizing 160 lines, and the mean of 86 measurements for each line;  

* To make clear that the measurements now are means, we include the string "meanOf-" at the beginning of each of the column names. 

Now the `tidyData2` contains the summarized data set asked for. A blank separated text file (`tidyData2.txt`) is then created from this data frame, using the `write.table()` function, in order to be uploaded to the Coursera site.

The End
======================
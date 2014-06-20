Code Book
========================================================

This document describes the source data, the transformations performed on this source data and the contents of the file `tidyData2.txt`.  

Source
----------------

The `tidyData2.txt` was created based on the **Human Activity Recognition Using Smartphones Dataset Version 1.0** created by: 

> Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.  
> Smartlab - Non Linear Complex Systems Laboratory  
> DITEN - Università degli Studi di Genova.  
> Via Opera Pia 11A, I-16145, Genoa, Italy.  
> activityrecognition@smartlab.ws  
> www.smartlab.ws  

This data set was created from experiments that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.   

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.  

For each record it was provided:  

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

We used the following files from the data set:

* **features.txt:** List of all features.

* **activity_labels.txt:** Links the class labels with their activity name.

* **train/X_train.txt:** Training set.

* **train/y_train.txt:** Training labels.

* **test/X_test.txt:** Test set.

* **test/y_test.txt:** Test labels.

* **train/subject_train.txt** and **test/subject_test.txt**: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

Transformations
------------------------

The `tidyData2.txt` file was created by:  
* Merging the test and train data sets; 
* Extracting only the measurements where the `mean()` or the `std()` function were applied;  
* Adding a column with the activity name; and  
* Taking the mean of all measurements summarized by the activity name and the subject who performed the activity.

The details of the transformations applied can be found in the [README.md](https://github.com/HuascarDuarte/GettingCleaningDataProject.git/) file.

Contents
------------------------

The `tidyData2.txt` is a blank separated text file with header that contains for each of 6 activities of each of 30 subjects (totalizing 180 lines) the mean of the following data:  
* Mean and Std of tBodyAcc-XYZ  
* Mean and Std of tGravityAcc-XYZ  
* Mean and Std of tBodyAccJerk-XYZ  
* Mean and Std of tBodyGyro-XYZ  
* Mean and Std of tBodyGyroJerk-XYZ  
* Mean and Std of tBodyAccMag  
* Mean and Std of tGravityAccMag  
* Mean and Std of tBodyAccJerkMag  
* Mean and Std of tBodyGyroMag  
* Mean and Std of tBodyGyroJerkMag  
* Mean and Std of fBodyAcc-XYZ  
* Mean and Std of fBodyAccJerk-XYZ  
* Mean and Std of fBodyGyro-XYZ  
* Mean and Std of fBodyAccMag  
* Mean and Std of fBodyAccJerkMag  
* Mean and Std of fBodyGyroMag  
* Mean and Std of fBodyGyroJerkMag  
* gravityMean-XYZ  
* tBodyAccMean  
* tBodyAccJerkMean  
* tBodyGyroMean  
* tBodyGyroJerkMean  

This information comes from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.   

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).   

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).  

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.  

This data set has the following 88 columns:

1. "ActivityName"
2. "Subject"
3. "meanOf-tBodyAcc-mean-X"
4. "meanOf-tBodyAcc-mean-Y"
5. "meanOf-tBodyAcc-mean-Z"
6. "meanOf-tBodyAcc-std-X"
7. "meanOf-tBodyAcc-std-Y"
8. "meanOf-tBodyAcc-std-Z"
9. "meanOf-tGravityAcc-mean-X"
10. "meanOf-tGravityAcc-mean-Y"
11. "meanOf-tGravityAcc-mean-Z"
12. "meanOf-tGravityAcc-std-X"
13. "meanOf-tGravityAcc-std-Y"
14. "meanOf-tGravityAcc-std-Z"
15. "meanOf-tBodyAccJerk-mean-X"
16. "meanOf-tBodyAccJerk-mean-Y"
17. "meanOf-tBodyAccJerk-mean-Z"
18. "meanOf-tBodyAccJerk-std-X"
19. "meanOf-tBodyAccJerk-std-Y"
20. "meanOf-tBodyAccJerk-std-Z"
21. "meanOf-tBodyGyro-mean-X"
22. "meanOf-tBodyGyro-mean-Y"
23. "meanOf-tBodyGyro-mean-Z
24. "meanOf-tBodyGyro-std-X"
25. "meanOf-tBodyGyro-std-Y"
26. "meanOf-tBodyGyro-std-Z"
27. "meanOf-tBodyGyroJerk-mean-X"
28. "meanOf-tBodyGyroJerk-mean-Y"
29. "meanOf-tBodyGyroJerk-mean-Z"
30. "meanOf-tBodyGyroJerk-std-X"
31. "meanOf-tBodyGyroJerk-std-Y"
32. "meanOf-tBodyGyroJerk-std-Z"
33. "meanOf-tBodyAccMag-mean"
34. "meanOf-tBodyAccMag-std"
35. "meanOf-tGravityAccMag-mean"
36. "meanOf-tGravityAccMag-std"
37. "meanOf-tBodyAccJerkMag-mean"
38. "meanOf-tBodyAccJerkMag-std"
39. "meanOf-tBodyGyroMag-mean"
40. "meanOf-tBodyGyroMag-std"
41. "meanOf-tBodyGyroJerkMag-mean"
42. "meanOf-tBodyGyroJerkMag-std"
43. "meanOf-fBodyAcc-mean-X"
44. "meanOf-fBodyAcc-mean-Y"
45. "meanOf-fBodyAcc-mean-Z"
46. "meanOf-fBodyAcc-std-X"
47. "meanOf-fBodyAcc-std-Y"
48. "meanOf-fBodyAcc-std-Z"
49. "meanOf-fBodyAcc-meanFreq-X"
50. "meanOf-fBodyAcc-meanFreq-Y"
51. "meanOf-fBodyAcc-meanFreq-Z"
52. "meanOf-fBodyAccJerk-mean-X"
53. "meanOf-fBodyAccJerk-mean-Y"
54. "meanOf-fBodyAccJerk-mean-Z"
55. "meanOf-fBodyAccJerk-std-X"
56. "meanOf-fBodyAccJerk-std-Y"
57. "meanOf-fBodyAccJerk-std-Z"
58. "meanOf-fBodyAccJerk-meanFreq-X"
59. "meanOf-fBodyAccJerk-meanFreq-Y"
60. "meanOf-fBodyAccJerk-meanFreq-Z"
61. "meanOf-fBodyGyro-mean-X"
62. "meanOf-fBodyGyro-mean-Y"
63. "meanOf-fBodyGyro-mean-Z"
64. "meanOf-fBodyGyro-std-X"
65. "meanOf-fBodyGyro-std-Y"
66. "meanOf-fBodyGyro-std-Z"
67. "meanOf-fBodyGyro-meanFreq-X"
68. "meanOf-fBodyGyro-meanFreq-Y"
69. "meanOf-fBodyGyro-meanFreq-Z"
70. "meanOf-fBodyAccMag-mean"
71. "meanOf-fBodyAccMag-std"
72. "meanOf-fBodyAccMag-meanFreq"
73. "meanOf-fBodyBodyAccJerkMag-mean"
74. "meanOf-fBodyBodyAccJerkMag-std"
75. "meanOf-fBodyBodyAccJerkMag-meanFreq"
76. "meanOf-fBodyBodyGyroMag-mean"
77. "meanOf-fBodyBodyGyroMag-std"
78. "meanOf-fBodyBodyGyroMag-meanFreq"
79. "meanOf-fBodyBodyGyroJerkMag-mean"
80. "meanOf-fBodyBodyGyroJerkMag-std"
81. "meanOf-fBodyBodyGyroJerkMag-meanFreq"
82. "meanOf-angleOf-tBodyAccMean-gravity"
83. "meanOf-angleOf-tBodyAccJerkMean-gravityMean"
84. "meanOf-angleOf-tBodyGyroMean-gravityMean"
85. "meanOf-angleOf-tBodyGyroJerkMean-gravityMean"
86. "meanOf-angleOf-X-gravityMean"
87. "meanOf-angleOf-Y-gravityMean"
88. "meanOf-angleOf-Z-gravityMean"
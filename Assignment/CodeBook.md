Code Book
========================================================

## Data Collection

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.. 

## Source of Data

- [Data Set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 

- [Description of Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


## Data Transformation

Following data transformations are carried out by the `run_Analysis.R` script.

1. The data sets were read separately. First read was done on Subject Dataset for both train and test files. The 2nd read was on Y dataset for both test and train which gave the activity id associated with the test and train value.
2. Features were read in the next step. This gave us the variable column names.
3. The X Data Set (train and test) containing the measures was read and column names obtained from step 2 were assigned to the measures.
4. Activity Labels were read next and stored in internal table.
5. The data sets obtained in step2 were than subset to get columns having only "mean" and "std" terms in them. I only chose the above columns as the exercise asked us to pick columns for mean and standard deviation and in my opinion this is how it should be.
6. The data sets for train and test obtained from the above steps were than merged to create a single data set for each internal table. One data set each for X, Y, Labels and Subject.
7.Created a table with the Activity and Subject ID assigned to X dataset and assigned Activity Labels to final dataset.
8. Appropriately labelled the data set with descriptive activity names by removing special characters like "." and also removing the double occurrence of "Body" in column headers using gsub() function.
9. Melted the dataset using reshape2 package by specifying activityId, activityName and subject Id as the only ID variables and rest all as measure variables.
10. Re casted the melted dataset with activityName and subjectId as the  ID variables and `mean` as the aggregation function.
11. Saved the output in a new file called "new_tidy_data.txt" using write.table() function.

## Data Variable Explanation

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals (and used in this assignment) are:
- mean(): Mean value
- std(): Standard deviation

## Variables generated in the output file
Data Columns

1. **activityName**: Activity being performed
2. **subjectID**: ID indicating the subject from whom data was collected
3. tBodyAccMeanX
4. tBodyAccMeanY
5. tBodyAccMeanZ
6. tBodyAccStdX
7. tBodyAccStdY
8. tBodyAccStdZ
9. tGravityAccMeanX
10. tGravityAccMeanY
11. tGravityAccMeanZ
12. tGravityAccStdX
13. tGravityAccStdY
14. tGravityAccStdZ
15. tBodyAccJerkMeanX
16. tBodyAccJerkMeanY
17. tBodyAccJerkMeanZ
18. tBodyAccJerkStdX
19. tBodyAccJerkStdY
20. tBodyAccJerkStdZ
21. tBodyGyroMeanX
22. tBodyGyroMeanY
23. tBodyGyroMeanZ
24. tBodyGyroStdX
25. tBodyGyroStdY
26. tBodyGyroStdZ
27. tBodyGyroJerkMeanX
28. tBodyGyroJerkMeanY
29. tBodyGyroJerkMeanZ
30. tBodyGyroJerkStdX
31. tBodyGyroJerkStdY
32. tBodyGyroJerkStdZ
33. tBodyAccMagMean
34. tBodyAccMagStd
35. tGravityAccMagMean
36. tGravityAccMagStd
37. tBodyAccJerkMagMean
38. tBodyAccJerkMagStd
39. tBodyGyroMagMean
40. tBodyGyroMagStd
41. tBodyGyroJerkMagMean
42. tBodyGyroJerkMagStd
43. fBodyAccMeanX
44. fBodyAccMeanY
45. fBodyAccMeanZ
46. fBodyAccStdX
47. fBodyAccStdY
48. fBodyAccStdZ
49. fBodyAccJerkMeanX
50. fBodyAccJerkMeanY
51. fBodyAccJerkMeanZ
52. fBodyAccJerkStdX
53. fBodyAccJerkStdY
54. fBodyAccJerkStdZ
55. fBodyGyroMeanX
56. fBodyGyroMeanY
57. fBodyGyroMeanZ
58. fBodyGyroStdX
59. fBodyGyroStdY
60. fBodyGyroStdZ
61. fBodyAccMagMean
62. fBodyAccMagStd
63. fBodyAccJerkMagMean
64. fBodyAccJerkMagStd
65. fBodyGyroMagMean
66. fBodyGyroMagStd
67. fBodyGyroJerkMagMean
68. fBodyGyroJerkMagStd

END
========================================================


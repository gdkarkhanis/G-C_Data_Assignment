Code Book for GKar_Tidy_Data
========================================================

Link to Github Repo for Code Book README file
Contents:
- Data Collection for "run.analysis.R"
- Output file printout "GKar_new_tidy_data.txt"
- How script works - explained in hash-tag comments
- Variables - List of Activity names and Activities Performed

### Method of Data Collection

Thirty human subjects ranging in age from 19 to 48 were outfillted with measurement devices: accelerometers and gyroscopes. The devices recorded 3 measurements of Axial Linear Acceleration and 3 measurements of Axial Angular Velocity, both at 50Hz constant data recording rate. Each subject performed 6 activities (1) WALKING, (2) WALKING_UPSTAIRS, (3) WALKING_DOWNSTAIRS, (4) SITTING, (5) STANDING, and (6)LAYING, while wearing a smartphone (Samsung Galaxy S II) on the waist. The experiments were video-recorded in order to label the data manually. The data collected were randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data, and 30% of the volunteers for the test data. 

The measurements devices were pre-processed with noise filters and  sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal (gravitational and body motion components), were separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. A vector of features was obtained by calculating variables from the time and frequency domain. from each window. 


### Data Source - Provided by Couresera Link to UCI Machine Learning Repository - Human Activity Recognition Using Smartphones Data Set - By Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghi, Luca Oneto and Xavier Parra.

- [Data Set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 

- [Description of Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


### Data Transformation

Transformations performed by the `run_Analysis.R` script.

1. The first Test and Train data were recorded and read separately. The second reading was on Y dataset for both sets giving activity id for related test and train values.

2. Features were read in the next step. This gave the variable column names.

3. Train & Test X Data Set with measures was read and column names obtained from step 2 were assigned to the measures.

4. Activity Labels were read next and stored in internal table.

5. The data sets obtained in step2 were then subset to get columns having only "mean" and "std" terms in them. 

6. Single dataset was created by merging train and test data obtained from the above steps for each internal table. One data set each for X, Y, Labels and Subject.

7. Table was created with Activity and Subject ID assigned to X dataset and assigned Activity Labels to final dataset.

8. Using the gsub() function data and activity description names were cleaned including the removal or characters like "." and repeat of words like "Body" in column headers. 

9. Dataset we melted using reshape2 package by specifying activityId, activityName and subject Id as the only ID variables. All others as measure variables.

10. Melted dataset with activityName and subjectId and recasted as the  ID variables and `mean` as the aggregation function.

11. Output was saved in a new file called "GKar_new_tidy_data.txt" using write.table() function.

### Data Variables Explanation

Features selected for this database come from the accelerometer (3 XYZ signals) and gyroscope (3 XYZ signals), namely tAcc-XYZ and tGyro-XYZ. 

Signals were recorded at 50Hz constant rate with prefix "t" for time stamp. Signals were filtered to remove noise, using a median filter and a 3rd order low pass Butterworth filter with corner frequency of 20 Hz. 

Acceleration signal was separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with corner frequency of 0.3 Hz. 

Body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. The 'f' to distinguish frequency domain signals. 

These signals were used to estimate variables of the feature vector for each pattern. Specifically, XYZ is used to denote 3-axial signals in three dimensions.

The set of variables that were estimated from these signals (and used in this assignment) are:
- mean(): Mean value
- std(): Standard deviation

## Variables generated in the output file: Data Columns

1. **activityName**: Activity being performed
2. **subjectID**: Subject from person data was collected
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


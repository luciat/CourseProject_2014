This code book describes the variables, the data, and any transformations or work that was performed to clean up the data.

Data Set Information:

The experiments have been carried out with a group of 30 volunteers  from 19 to 48 years. The activities each person performed were: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING and they  wore a smartphone (Samsung Galaxy S II) on the waist while doing this activities. Using its embedded accelerometer and gyroscope the 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

The dataset was downloaded from UCI repository and includes files like:
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Subjects who performed the activity for each training window sample. Its range is from 1 to 30. 
- 'train/subject_test.txt': Subjects who performed the activity for each testing window sample. Its range is from 1 to 30. 

Run_analysy.R:

This script does the work described below:

The training and testing data sets are read into two tables and then merged to form the complete set, with 561 variables and 10299 rows. The features names are read from the features data set.

Then the variables to be used to extract the columns with measurements on the mean and standard deviation are selected and the columns of interest are extracted. The new set, called extractSet, contains 79 variables. 

The next step is reading the activity names and the activities perfomed by the subjects (from the training and testing data sets) and merging these activity data in a single set.

Then the activity labels are replaced with descriptive  activity names and the subjects (training and testing sets) are read and merged.

The final step creates a tidy data set with the columns Activity, Subject and the average of each variable for each activity and each subject and 180 rows (30 subjects times 6 activities). The tidy data set is exported to directory UCI HAR Dataset with the name avgSet.txt. 

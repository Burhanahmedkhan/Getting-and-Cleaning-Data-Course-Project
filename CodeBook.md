
# Code book

This document provides information about the generated sets by the script run_analysis.R, provided in this repository

## Orginal Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II). Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

The dataset includes the following files:
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


## The R script, run_analysis.R, does the following:

- Download file from the Internet and extract zip archives

- Merge the training and the test sets to create one data set

- Extract only the measurements on the mean and standard deviation for each measurement. 

- Add labels the data set with descriptive variable names

- Make syntactically valid names

- Add activity column to the data set

- Add subject column to the data set

- create tidy data set with the average of each variable for each activity and each subject

- The end result is write in the file tidyData.txt



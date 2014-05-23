## The data in this dataset is part of the UCI HAR Dataset of movement data from 30 subjects (20 training, 10 test subjects) performing 6 activities.
### The complete data contains raw measurement data contained in the Inertial Signals folder that was not used for this analysis; only the 79 variables from this dataset for which a mean and standard deviation were calaculated were included in the final tidy data. There are multiple mean and standard deviation measurements for each subject performing each activity.

#### The activities are as follows:

* walking
* walkingUpstairs
* walkingDownstairs
* sitting
* standing
* laying

#### The variables in the tidy data set are the measurements on the mean and standard deviation ("Std") of the following measurements.

* timeBodyAcc (for each direction X,Y, and Z)
* timeGravityAcc (for each direction X,Y, and Z)
* timeBodyAccJerk (for each direction X,Y, and Z)
* timeBodyGyro (for each direction X,Y, and Z)
* timeBodyGyroJerk (for each direction X,Y, and Z)
* timeBodyAccMag
* timeGravityAccMag
* timeBodyAccJerkMag
* timeBodyGyroMag
* timeBodyGyroJerkMag
* frequencyBodyAcc (for each direction X,Y, and Z)
* frequencyBodyAccJerk (for each direction X,Y, and Z)
* frequencyBodyGyro (for each direction X,Y, and Z)
* frequencyBodyAccMag
* frequencyBodyAccJerkMag
* frequencyBodyGyroMag
* frequencyBodyGyroJerkMag

#### In the above list, "Acc" refers to acceleration and "Mag" refers to magnitude.

#### The output of this analysis is a data frame that is 81 columns (consisting of the subject number, activity, and the 79 mean and Std variables) by 180 rows (a row for each combination of subject and activity). 

#### As stated, the original dataset contains multiple mean and Std measurements for each subject performing each activity. This analysis calculates the mean for each of the multiple measurements. The steps taken to clean up this data are as follows:


* The first step of processing adds descriptive variable names to the X (measurement) files for the test and training groups.
* The original data is split between 6 text files - a subject number list, activity list (called Y), and measurements list (called X), each of these for the test and training groups.  The second step of the analysis combines these into a single data frame.
* The next step gives descriptive names to the activity and subject column.
* The next step removes illegal characters and spaces from the column names and formats them to be more human readable with new words beginning with a capital letter.
* The next step assigns descriptive names to the activities.
* The next step orders the rows first by subject number, then by activity.
* The next step reshapes the data frame into long format in order to perform summary statististics.
* The next step reshapes the data back to wide format while calculating the mean of all of the measurements for each of the 180 subject and variable combinations.
* The final step saves the data as a 81 column by 180 row tab dataframe.

README
========================================================

### In order to run this script, the UCI HAR Dataset should be in the working directory and the package "reshape2" should be downloaded.
#### Description of each analysis step:

* load the reshape2 package
* read test subject ID
* read test subject activity code list
* read test subject measurement data
* read training subject ID
* read training subject activity code list
* read training subject measurement data
* read the file with the list of names of the variables
* name the columns of the test subject data
* name the columns of the training subject data
* combine columns of Test subject, activity and data
* combine columns of training subject, activity and data
* combine rows of test and training data to form one large data frame
* add descriptive name to 1st column
* add descriptive name to 2nd column
* subset columns to only those that calulate a mean or std
* remove punctuation from column names
* the next 8 lines change the column names to a more human readable form and fix a duplication of the word "Body" in some entries
* change the class of the activity entries from integer to character
* the next 6 lines give descriptive names to the activities
* order the data set by subject and activity
* reshape data to long format
* reshape data with only the mean of each measurement for each subject and activity
* save the final data frame as a tab delimited text text file.
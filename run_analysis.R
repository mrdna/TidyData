library(reshape2)
subTest <- read.table("./UCI HAR Dataset/test/subject_test.txt") 
  ##read test subject ID
yTest <- read.table("./UCI HAR Dataset/test/Y_test.txt") 
  ##read test subject activity code list
xTest <- read.table("./UCI HAR Dataset/test/X_test.txt") 
  ##read test subject measurement data
subTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt") 
  ##read training subject ID
yTrain <- read.table("./UCI HAR Dataset/train/Y_train.txt") 
  ##read training subject activity code list
xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt") 
  ##read training subject measurement data
variables <- read.table("./UCI HAR Dataset/features.txt") 
  ##read the file with the list of names of the variables
names(xTest) <- variables[,2] 
  ##name the columns of the test subject data
names(xTrain) <- variables[,2] 
  ##name the columns of the training subject data
Test1 <- cbind(subTest,yTest,xTest) 
  ##combine columns of Test subject, activity and data
Train1 <- cbind(subTrain,yTrain,xTrain) 
  ##combine columns of training subject, activity and data
Data <- rbind(Test1,Train1) 
  ##combine rows of test and training data to form one large data frame
colnames(Data)[1] <- "subject" 
  ##adds descriptive name to 1st column
colnames(Data)[2] <- "activity"
  ##adds descriptive name to 2nd column
Data2 <- Data[, c(1,2,3:8,43:48,83:88,123:128,163:168,203,204,216,217,229,230,242,243,255,256,268:273,296:298,347:352,375:377,426:431,454:456,505,506,515,518,519,528,531,532,541,544,545,554)] 
  ##subset columns to only those that calulate a mean or std
names(Data2) <- gsub(pattern="[[:punct:]]", names(Data2), replacement="") 
  ##remove punctuation from column names
names(Data2) <- gsub("tBody","timeBody",names(Data2),) 
  ##The next 8 lines change the column names to a more human readable form
names(Data2) <- gsub("tGravity","timeGravity",names(Data2),)
names(Data2) <- gsub("BodyBody","Body",names(Data2),)  
  ##replaces duplication of the word Body in some names
names(Data2) <- gsub("fBody","FrequencyBody",names(Data2),)
names(Data2) <- gsub("fGravity","FrequencyGravity",names(Data2),)
names(Data2) <- gsub("mean","Mean",names(Data2),)
names(Data2) <- gsub("std","Std",names(Data2),)
Data2[,2] <- as.character(Data2[,2]) 
  ## change the class of the activity entries from integer to character
Data2$activity <- sub("1","walking",Data2$activity,) 
  ##The next 6 lines give descriptive names to the activities
Data2$activity <- sub("2","walkingUpstairs",Data2$activity,)
Data2$activity <- sub("3","walkingDownstairs",Data2$activity,)
Data2$activity <- sub("4","sitting",Data2$activity,)
Data2$activity <- sub("5","standing",Data2$activity,)
Data2$activity <- sub("6","laying",Data2$activity,)
Data3 <- Data2[order(Data2$subject,Data2$activity),] 
  ##orders the data set by subject and activity
DataMelt <- melt(Data3,id=c("subject","activity")) 
  ##Reshape data to long format
DataCast <- dcast(DataMelt,subject+activity~variable, mean) 
  ##reshape data with only the mean of each measurement for each subject and activity
write.table(DataCast, "TidyData.txt", sep="\t") 
  ##save the final data frame as a tab delimited text text file.
# Getting-and-Cleaning-Data-Course-Project
This repository contains the script, codebook, and other associated documents with the course project.

## Course project description
 As mentioned in the submission page of the project, the purpose of this project is to demonstrate the student's ability to collect, work with, and clean a data set. The final goal is to prepare tidy data that can be used for later analysis. It is required to submit: 
 1. a tidy data set 
 2. a link to a github repository containing the script for performing the analysis. 
 3. a code book that describes the variables, the data, and any transformation carried out to clean up the data.
 
## Background and data
One of the most exciting areas in the field of data science right now is wearable computing. Different companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data used in this project represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

The use of the data set is acknowledged from the following publication:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012. 

The specific data used in this project are downloaded from following link (accessed 21 October 2015):
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Project requirements
Student should create one R script called run_analysis.R that does the following.   
1. Merges the training and the test sets to create one data set.  
2. Extracts only the measurements on the mean and standard deviation for each measurement.   
3. Uses descriptive activity names to name the activities in the data set.  
4. Appropriately labels the data set with descriptive variable names.  
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  

## Steps taken to meet the requirements  
The analysis that are performed to mmet the requirement are explained in the followings. 

### Preprations  
There is one library that is needed to be loaded which is the reshape2, that is loaded in the begining of the scrip.    

The working directrory is assumed to be set to the folder containing the unzipped file downloaded from the link that was provided in the project page (cited above). The working directory is tehrefore `~/UCI HAR Dataset`.

### Part 1. Merge the training and the test sets to create one data set.  
First the data are read into RStudio using the `read.table()` command. 
```
# data from the test set:
X_test <- read.table("test/X_test.txt")
subject_test <- read.table("test/subject_test.txt")
y_test <- read.table("test/y_test.txt")

# data of the train set
X_train <- read.table("train/x_train.txt")
subject_train <- read.table("train/subject_train.txt")
y_train <- read.table("train/y_train.txt")
```
`X_test` and `X_train` data sets are the measurement data for all the variables. The activity labels are stored in the `y_test` and `y_train` data sets. And the data defining the subject of the test are stored in `subject_test` and `subject_train` data sets. 

Thereafter, the measurement data are merged using the `rbind()` command. Similarly, labels and subjects are merged together. Then the `cbind()` command is used to bind them together and compose the `tidyData` data frame. 
```
mergedData <- rbind(X_test, X_train)
mergedLabels <- rbind(y_test, y_train)
mergedSubject <- rbind(subject_test, subject_train)

tidyData <- cbind(mergedSubject, mergedLabels, mergedData)
```
The name of the variables are read from the `features.txt` file and after being converted to character are used to name the columns in the dataframe. 
```
featureNames <- as.character(read.table("features.txt")$V2)
names(tidyData) <- c("subject", "activityid", featureNames)
```
Now we have a data frame `tidyData` that contains the data in a wide format. The column names are also assigned. 

### Part 2. Extract only the measurements on the mean and standard deviation for each measurement.  
In order to extract the measurements on the mean and standard deviation, I have considered only the variables in which `mean()` and `std()` are in the name. For instance variable named `angle(X,gravityMean)` is not considered as an average of a measurement. The `grepl()` command is used to get a logical vector of the variable names that contain either `mean()` or `std()`. This vector is used to subset the `tidyData` data frame. Also, the two first column that are the subject and the activityid are included in the resulting dataframe `tidyDataMeanStd`. 
```
tidyDataMeanStd <- tidyData[, c(TRUE, TRUE, grepl("mean\\(\\)|std\\(\\)", featureNames, ignore.case = T))]
```
### Part 3. Use descriptive activity names to name the activities in the data set.  
The activity labels are read from the `activity_labels.txt` file and are trimmed to conform with the guidlines in the course notes. The upper case characters are replaced with lower case and "_" characters are removed. 
```
activityLabels <- read.table("activity_labels.txt")
names(activityLabels) <- c("label", "activity")
activityLabels[,2] <- tolower(activityLabels[,2])
activityLabels[,2]<- gsub("_","", activityLabels[,2])
 
td <- merge(tidyDataMeanStd, activityLabels, by.x = "activityid", by.y = "label")
```
Then the `activityLabels` and `tidyDataMeanStd` are merged to create a data frame called `td` that has the descriptive activity names. 

### Part 4. Appropriately labels the data set with descriptive variable names.  
As the column names are previously assigned to the data frame, the only thing that is needed is to remove the capital letters (to prevent the possible debugging issues) and other unnecessary characters in the variable names. Following the guidlines given during the class: 
Names of variables should be
- All lower case when possible
- Descriptive
- Not duplicated
- Not have underscores, dots or whitespaces
Therefore, I assume that the `features.txt` are descriptive enuogh and only the undesired characters are removed.
```
names(td) <- gsub("\\(|\\)", "", names(td))
names(td) <- gsub("-", "", names(td))
names(td) <- tolower(names(td))
```
### Part 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable  
First the dataframe td that was created in the previous parts is melted to a long format based on "activityid", "subject", and "activity" variables as the identifiers. 
```
td2 <- melt(td, id.vars = c("activityid", "subject", "activity"))
```
Then the `dcast()` command is used to create a wide data frame with the aggregation function of `mean`. 
```
td3 <- dcast(td2, subject + activityid + activity ~ variable, fun.aggregate = mean)
```

## Output file 
The tidy data set created as the result of the above steps is written into a txt file using the followings: 
```
write.table(td3, file = "output.txt", row.names = F)
```
To read the data into R the following command should be used: 
```
read.table("output.txt", header = T) 
```





library(reshape2)
setwd("D:/Data Science/Getting and Cleaning Data/Course Project/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")
# read the data of the test set
# as mentioned in the assignment page: The code should have a file run_analysis.R in the main directory that can be run as 
# long as the Samsung data is in your working directory. 
X_test <- read.table("test/X_test.txt")
subject_test <- read.table("test/subject_test.txt")
y_test <- read.table("test/y_test.txt")
# read the data of the train set
X_train <- read.table("train/x_train.txt")
subject_train <- read.table("train/subject_train.txt")
y_train <- read.table("train/y_train.txt")
# row-bind the test set and train set 
mergedData <- rbind(X_test, X_train)
mergedLabels <- rbind(y_test, y_train)
mergedSubject <- rbind(subject_test, subject_train)
# putting all together in one dataset
tidyData <- cbind(mergedSubject, mergedLabels, mergedData)

# read the feature names from the txt file, and convert it to character
featureNames <- as.character(read.table("features.txt")$V2)
# naming the columns in the dataset
names(tidyData) <- c("subject", "activityid", featureNames)
##########################################################################
# 2. Extract only the measurements on the mean and standard deviation for each measurement.
#     Based on the question in hand I have extracted only those variables that contain 
#     "mean()" or "std()". For instance, angle(X,gravityMean) is not considered as an average of a measurement.
#     The two first columns (subject and activityid) are also included.
tidyDataMeanStd <- tidyData[, c(TRUE, TRUE, grepl("mean\\(\\)|std\\(\\)", featureNames, ignore.case = T))]
##########################################################################
# 3. Use descriptive activity names to name the activities in the data set
# read the activitity labels & name the columns
activityLabels <- read.table("activity_labels.txt")
names(activityLabels) <- c("label", "activity")
# convert the capital letters to comply with the guidlines
activityLabels[,2] <- tolower(activityLabels[,2])
activityLabels[,2]<- gsub("_","", activityLabels[,2])
# merge the tidyDataMeanStd and activityLables
td <- merge(tidyDataMeanStd, activityLabels, by.x = "activityid", by.y = "label")
##########################################################################
# 4. Appropriately label the data set with descriptive variable names. 
# removing the undesired characters and capital letters from feature names
names(td) <- gsub("\\(|\\)", "", names(td))
names(td) <- gsub("-", "", names(td))
names(td) <- tolower(names(td))
##########################################################################
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
# for each activity and each subject.
# first convert the dataframe to a long one with three id variables 
td2 <- melt(td, id.vars = c("activityid", "subject", "activity"))
# then cast the melted dataframe to a wide dataframe with the averages as the aggregation function
td3 <- dcast(td2, subject + activityid + activity ~ variable, fun.aggregate = mean)
# write the dataframe to a txt file 
write.table(td3, file = "output.txt", row.names = F)

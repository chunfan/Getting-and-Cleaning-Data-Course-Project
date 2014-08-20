## Load data ####################################################################
# load feature name
featureName <- read.table("./UCI HAR Dataset/features.txt", 
                          colClasses="character")
# load activit labels
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt", 
                             colClasses="character")

# load training set
trainingDataX <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainingDataY <- read.table("./UCI HAR Dataset/train/y_train.txt", 
                            colClasses="factor")

# load training subject
trainingSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt", 
                              colClasses="factor")

# load test set
testDataX <- read.table("./UCI HAR Dataset/test/X_test.txt")
testDataY <- read.table("./UCI HAR Dataset/test/y_test.txt", 
                        colClasses="factor")

# load test subject
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt", 
                          colClasses="factor")

## Use descriptive activity names to name the activities ########################
trainingDataY <- sapply(trainingDataY, function(x) activityLabels[x, 2])
testDataY <- sapply(testDataY, function(x) activityLabels[x, 2])

## Merge the training and test sets #############################################
# merge training and test input data
data <- rbind(trainingDataX, testDataX)
# merge the subject into data
data <- cbind(rbind(trainingSubject, testSubject), data)
# merge the activity labels into data
data <- cbind(data, factor(rbind(trainingDataY, testDataY)))

## Labels the data set with descriptive variable names ##########################
names(data) = c("subject", featureName[,2], "activity")

## Extracts only the mean and standard deviation for each measurement ########### 
data <- data[,c("subject", grep("mean", featureName[,2], value=TRUE), 
                grep("std", featureName[,2], value=TRUE), "activity")]

## Remove old variables #########################################################
rm(activityLabels, featureName, testDataX, testDataY, testSubject, 
   trainingDataX, trainingDataY, trainingSubject)

## Creates a second, independent tidy data set with the average #################
## of each variable for each activity and each subject.         #################
# Split data according to subject and activity
s <- split(data, interaction(data$subject, data$activity))
# find the mean value for each variable in each element in split list, s
meanS <- data.frame(t(sapply(s, function(x) colMeans(x[,2:(ncol(x)-1)]))))
# append ".average" into feature name
names(meanS) <- sapply(names(meanS), function(x) paste(x,".average", sep=""))
# form the tidy data: [Subject, Activiy, Average Values]
tidyData <- cbind(subject=factor(rep(levels(data$subject), each=nlevels(data$activity))), 
                  activity=factor(rep(levels(data$activity),times=nlevels(data$subject))),
                  meanS)
write.table(tidyData, file="tidyData.txt", row.name=FALSE)


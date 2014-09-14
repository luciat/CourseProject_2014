# Reads training and testing data sets
trainSet <- read.table("./UCI HAR Dataset/train/X_train.txt", sep="")
testSet <- read.table("./UCI HAR Dataset/test/X_test.txt", sep="")

# Joins the training and testing data sets
completeSet <- rbind(trainSet, testSet)

# Reads features names for the measurements 
colNames <- read.table("./UCI HAR Dataset/features.txt")
colNames <- as.vector(colNames$V2)

# Selects features to extract columns with measurements on the mean and standard deviation
cMeans <- grep("mean", colNames )
cStd <- grep("std", colNames )
cols <- c(cMeans, cStd)
oCols <- order(cols)
cols <- cols[oCols]
colNames <- colNames[cols]
nCol <- length(colNames)

# Extracts data set selected columns
extractSet <- completeSet[cols]
nSetRows <- nrow(completeSet)

# Read activity names
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
activityLabels <- as.vector(activityLabels$V2)

# Read activities performed by the subjects
activityTrainSet <- read.table("./UCI HAR Dataset/train/y_train.txt")
activityTestSet <- read.table("./UCI HAR Dataset/test/y_test.txt")

# Join the training and testing activities
activitySet <- rbind(activityTrainSet, activityTestSet)
activitySet <- as.vector(activitySet$V1)

# Names activities
activityNameSet <- activityLabels[activitySet]

# Read subjects who performed the measured activities
subjectTrainSet <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subjectTestSet <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Join the training and testing subjects
subjectSet <- rbind(subjectTrainSet, subjectTestSet)
subjectSet <- as.vector(subjectSet$V1)

# Names variables columns
colnames(extractSet, do.NULL = FALSE)
colnames(extractSet) <- colNames

# Creates the new data table
na <- length(activityLabels)
subjects <- unique(subjectSet)
ns <- length(subjects)
avgSet <- data.frame(matrix(NA, nrow=na*ns, ncol=nCol+2))
names <- c("Activity", "Subject")
vNames <- c(names, colNames)
colnames(avgSet) <- vNames

# Computes the average of each variable for each activity and each subject
ind <- 1
for (indA in 1:na) {
        for (indS in 1:ns) {
                avgSet$Activity[ind] <- activityNameSet[indA]
                avgSet$Subject[ind] <- indS
                vInd <- c(activitySet==indA & subjectSet==indS)
                for (indC in 1:nCol) {
                        avgSet[ind, indC+2] <- mean(extractSet[vInd, indC])
                }
                ind <- ind+1
        }
}
write.table(avgSet, "avgSet.txt", row.name=FALSE)


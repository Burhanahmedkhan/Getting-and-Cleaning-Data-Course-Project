library(dplyr)


# Download file from the Internet and extract zip archives
if(file.exists("Dataset.zip")) file.remove("Dataset.zip")
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "Dataset.zip")
unzip(zipfile = "Dataset.zip")


# Read a file in table format 
X_train <- read.table(file = "../UCI HAR Dataset/train/X_train.txt", header = FALSE)
y_train <- read.table(file = "../UCI HAR Dataset/train/y_train.txt", header = FALSE)
subject_train <- read.table(file = "../UCI HAR Dataset/train/subject_train.txt", header = FALSE)
X_test <- read.table(file = "../UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_test <- read.table(file = "../UCI HAR Dataset/test/y_test.txt", header = FALSE)
subject_test <- read.table(file = "../UCI HAR Dataset/test/subject_test.txt", header = FALSE)
features <- read.table(file = "../UCI HAR Dataset/features.txt", header = FALSE)
activity_labels <- read.table(file = "../UCI HAR Dataset/activity_labels.txt", header = FALSE)


#  Merge the training and the test sets to create one data set.
dataMerged <- union_all(x = X_train, y = X_test)

#  Extract only the measurements on the mean and standard deviation for each measurement. 
dataMerged <- dataMerged[, c(grep(pattern = "mean()|std()", x = features$V2))]

# Add labels the data set with descriptive variable names. 
colnames(dataMerged) <- grep(pattern = "mean()|std()", x = features$V2, value = TRUE)

# Make syntactically valid names
colnames(dataMerged) <- make.names(names = colnames(dataMerged))

# Add activity column to the data set
y_data <- union_all(x = y_train, y = y_test)
y_data_lab <- inner_join(x = y_data, y = activity_labels, "V1")
dataMerged <- cbind(activity = y_data_lab$V2, dataMerged)

# Add subject column to the data set
subject <- union_all(x = subject_train, y = subject_test)
dataMerged <- cbind(subject = subject$V1, dataMerged)

# create tidy data set with the average of each variable for each activity and each subject
tidyData <- dataMerged %>% 
  group_by(subject, activity) %>% 
  summarize_all(c("mean"))

# Tidy data output
write.table(tidyData, "tidyData.txt", sep="\t")

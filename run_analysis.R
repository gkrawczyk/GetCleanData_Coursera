library(plyr)

######### download and unzip dataset

file <- "get_clean_data.zip"

if(!file.exists(file)) {
    file_Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(file_Url, file)
}

if (!file.exists("UCI HAR Dataset")) { 
    unzip(file) 
}

######### reading test and train dataset

x_test <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)

x_train <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)

######### merging test and train dataset

x_data <- rbind(x_test, x_train)
y_data <- rbind(y_test, y_train)
subject_data <- rbind(y_test, y_train)

######### setting names to datasets and selecting only mean and std

features <- read.table("UCI HAR Dataset/features.txt", head = FALSE)
names(x_data) <- features[ ,2]
names(y_data) <- c("activity")
names(subject_data) <- c("subject")

mean_std <- grep("-(mean|std)\\(\\)", features[, 2])

x_data <- x_data[, mean_std]

######### setting descriptive activity names to name the activities in the dataset

activities <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)

y_data[, 1] <- activities[y_data[, 1], 2]

######### merging all data

all_data <- cbind(x_data, y_data, subject_data)

######### average of each variable for each activity and each subject based on the dataset

avg_data <- aggregate(. ~subject + activity, all_data, mean)

######### writing the tidydata to file

write.table(avg_data, file = "tidy.txt", row.name = FALSE)



















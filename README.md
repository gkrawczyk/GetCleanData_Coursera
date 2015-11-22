# Getting and Cleaning Data - Course Project

Repository hosts the R code and documentation files for the Data Science's track course "Getting and Cleaning Data"
The R script, run_analysis.R, does the following:

1. Downloads and unzips datasets
2. Reads test and train datasets
3. Merges test and train datasets into one dataset
4. Setts names from features.txt 
5. Selects only mean and std variables
6. Setts descriptive activity names to name the activities in the data set
7. Merges all datasets into one
8. Creates average of each variable for each activity and each subject based on the dataset
9. Wrinting dataset from step 8 into "tidy.txt"

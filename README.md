#Getting and Cleaning Data
#Course Project

There's a file called run_analysis.R that is a R script that does the following:

- it merges the training and the test datasets to create one data set
- it extracts the measurements on the mean and standard deviation for each measurement
- it uses descriptive activity names to name the activities in the data set
- it appropriately labels the dataset with descriptive activity names
- it creates another independent tidy dataset with the average of each variable for each activity and each subject

To work with this script, you must first download the data source and put into a folder on your local drive. 
Then You'll have a "UCI HAR Dataset" folder.
Put the "run_analysis.R" script in the parent folder of "UCI HAR Dataset", then set it as your working directory using setwd() function in RStudio.
Run the "run_analysis.R" script, then it will generate a new file "output.txt" in your "UCI HAR Dataset" directory.

Dependencies

"run_analysis.R" file will help you to install the dependencies automatically. It depends on data.table

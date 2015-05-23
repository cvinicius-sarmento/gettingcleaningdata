# gettingcleaningdata
Repo to keep the files of the Coursera 'Getting and Cleaning Data' project.

Content:
* 1 script file (run_analysis.R)
* 1 CodeBook describing the dataset the script above generates.

## Running the script
The script uses data collected from the accelerometers from the Samsung Galaxy S smartphone. 
The implemented algorithm does the following steps:
* It merges the training and the test sets to create one data set (unifiedDS.txt);
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject (tidyDS.txt).

It assumes that the Samsung data is in your working directory. However, if you want to allow the script to download the files to your working directory you can uncomment the initial lines of the script. 

### Required Packages 
* `plyr`

### Script output
2 files:
* `unifiedDS.txt`: the data set of the merged training and test sets with the measurements on the mean and standard deviation
* `tidyDS.txt`: the data set with the average of each variable for each activity and each subject


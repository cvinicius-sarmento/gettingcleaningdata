# gettingcleaningdata
Repo to keep files of the Coursera 'Getting and Cleaning Data' project.

Content:
* 1 script file (run_analysis.R)
* 1 CodeBook describing the dataset the script above generates.

## Running the script
The script uses data from collected from the accelerometers from the Samsung Galaxy S smartphone. 
The implemented algorithm does the following steps:
* It merges the training and the test sets to create one data set;
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

It's not necessary to download the data. The script downloads the data and unzips the files to manipulate them.
In case you already have the files in your computer you can comment the code that downloads the zip data and you can set the appropriate path of the files.




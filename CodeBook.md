## The script
The script uses data from collected from the accelerometers from the Samsung Galaxy S smartphone. 
The output is an independent tidy data set with the average of each selected variable for activity and subject from the data of input.
For more information see README.md file.

## Data sets
### Input
The data sets used as the input of the script is downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The script assumes you have the following files in your workplace:
* `activity_labels.txt`
* `features.txt`
* `subject_test.txt`
* `subject_train.txt `
* `X_test.txt`
* `X_train.txt`
* `y_test.txt`
* `y_train.txt`

If you want to allow the script to download the files to your working directory you can uncomment the initial lines of the script. 

#### Files (description from README.txt)
* `features.txt`: List of all features - the names of the variables used in the dataset.
* `activity_labels.txt`: Links the class labels with their activity name.
* `X_train.txt`: Training set.
* `y_train.txt`: Training labels.
* `X_test.txt`: Test set.
* `y_test.txt`: Test labels.
* `subject_test.txt` and `subject_train.txt ` the sequence of subjects from whom were collected the testing and training data.

### Output data set
* `unifiedDS.txt`: the training and the test sets merged.
* `tidyDS.txt`: data set with the average of each variable for each activity and each subject of the unified data set.

#### Variables
* `subject`: id of a person that participate in the experiment
* `activity`: one of the following activities measured in the experiment `[WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING]`

The other variables describe features that come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 

The signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

`tBodyAcc-XYZ`
`tGravityAcc-XYZ`
`tBodyAccJerk-XYZ`
`tBodyGyro-XYZ`
`tBodyGyroJerk-XYZ`
`tBodyAccMag`
`tGravityAccMag`
`tBodyAccJerkMag`
`tBodyGyroMag`
`tBodyGyroJerkMag`
`fBodyAcc-XYZ`
`fBodyAccJerk-XYZ`
`fBodyGyro-XYZ`
`fBodyAccMag`
`fBodyAccJerkMag`
`fBodyGyroMag`
`fBodyGyroJerkMag`

The set of variables that were estimated from these signals are: 

`mean()`: Mean value
`std()`: Standard deviation

The other variables of the original dataset were discarded. More information see the original documentation available in https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip



## download the data for the project
download.file(url='https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip', method='wget', destfile = 'dataProject.zip')
if (!file.exists("./dataProject")){dir.create("dataProject")}
unzip("./dataProject.zip", files = NULL, list = FALSE, overwrite = TRUE,
      junkpaths = FALSE, exdir = "./dataProject", unzip = "internal",
      setTimes = FALSE)

## setting the paths the folders
folder <- paste('./dataProject', 'UCI HAR Dataset', sep = '/')
folderTest <- paste('./dataProject', 'UCI HAR Dataset', 'test', sep = '/')
folderTrain <- paste('./dataProject', 'UCI HAR Dataset', 'train', sep = '/')

##Activity labels
activityLabels <- read.table(file = paste(folder,'activity_labels.txt',sep='/'), header = F, sep = ' ', col.names = c('index','feature'), colClasses = c('integer', 'character')) 

## merging test and training data

##subject files
subject_test <- read.table(file = paste(folderTest, 'subject_test.txt',sep='/'), header = F, colClasses = c('integer')) 
subject_train <-read.table(file = paste(folderTrain, 'subject_train.txt',sep='/'), header = F, colClasses = c('integer')) 
subject <- rbind(subject_test, subject_train)
rm(subject_test)
rm(subject_train)
colnames(subject)<-'subject'

## activities files
activity_test <- read.table(file = paste(folderTest, 'y_test.txt',sep='/'), header = F, colClasses = c('integer'), col.names = c('id')) 
activity_train <- read.table(file = paste(folderTrain, 'y_train.txt',sep='/'), header = F, colClasses = c('integer'), col.names = c('id')) 
activity <- rbind(activity_test, activity_train)
rm(activity_test)
rm(activity_train)


activity<-activityLabels[activity[,1],2]
rm(activityLabels)
names(activity)<-'Activity'
activity <- factor(activity)

## features
feature <- read.table(file = paste(folderTest, 'X_test.txt',sep='/'), header = F, colClasses = c(rep('numeric', 561))) 
feature_train <- read.table(file = paste(folderTrain, 'X_train.txt',sep='/'), header = F, colClasses = c(rep('numeric', 561))) 
feature<-rbind(feature,feature_train)
rm(feature_train)

  ##labeling columns
feature_names <-  read.table(file = paste(folder, 'features.txt',sep='/'), header = F, colClasses = c('integer', 'character'), col.names = c('id','name')) 
colnames(feature)<- feature_names$name
rm(feature_names)

## final dataset
dataset<- cbind(subject,activity)
dataset <- cbind(dataset, feature[,grepl('(mean|std)\\(',colnames(feature))])


rm(activity, feature,subject)
write.table(dataset, file = 'unifiedDS.txt','','')

#tidy dataSet
tidyDataSet <- dataset[FALSE,]
tidyDataSetAux <- dataset[1,]
numSubjects<-length(unique(dataset$subject))
numActivity<-length(levels(dataset$activity))
for(i in 1:numSubjects){
  for(j in 1:numActivity){
    datasetJ<-subset(dataset, subject==i & activity==levels(activity)[j])
    if(nrow(datasetJ) > 0){
      tidyDataSetAux[1,1]<-i
      tidyDataSetAux[1,2]<-levels(dataset$activity)[j]
      tidyDataSetAux[1,3:length(colnames(datasetJ))]<-sapply(datasetJ[,3:length(colnames(datasetJ))],mean)
      tidyDataSet <- rbind(tidyDataSet,tidyDataSetAux)
    }
  }
}


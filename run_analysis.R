filename <- "human_activity.zip"

## Download and unzip the dataset:
if (!file.exists(filename)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
        download.file(fileURL, filename, mode="wb")
}  
if (!file.exists("UCI HAR Dataset")) { 
        unzip(filename) 
}

## geting data

actlabel<-read.table("UCI HAR Dataset/activity_labels.txt")

train <- read.table("UCI HAR Dataset/train/X_train.txt")
trainAct <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainSub <- read.table("UCI HAR Dataset/train/subject_train.txt")
trainall<-cbind(trainSub,trainAct,train)

test <- read.table("UCI HAR Dataset/test/X_test.txt")
testAct <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSub <- read.table("UCI HAR Dataset/test/subject_test.txt")
testall<-cbind(testSub,testAct,test)

allData<-rbind(trainall,testall)


allData[,2]<-factor(allData[,2],levels=actlabel[,1],labels=as.character(actlabel[,2]))


## geting features
features<-read.table("UCI HAR Dataset/features.txt")

## assign column names

colnames(allData)<- c("subject","activity",as.character(features[,2]))

## subset table to get only mean and std
allDataMeanStd<-subset(allData,select=c(1:2,(grep("-mean|-std", colnames(allData))))
                       
## Rename Column Names                       
featurename<-gsub('-mean', 'Mean', colnames(allDataMeanStd))
featurename<-gsub('-std', 'Std', featurename)
featurename<-gsub('[-()]', '', featurename)
colnames(allDataMeanStd)<-c(featurename)

## get tidy data
library(reshape2)
allDataStack<-melt(allDataMeanStd,id = c("subject", "activity"))
allDataSplit<-dcast(allDataStack,subject + activity ~ variable, mean)

##output to a text file
write.table(allDataSplit, "tidy.txt", row.names = FALSE, quote = FALSE)


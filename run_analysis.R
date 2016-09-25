#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Getting and Cleaning Data - Course Project
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# clear loaded data
rm(list=ls())

# required packages
packages <- c("dplyr")
sapply(packages, require, character.only = TRUE, quietly = TRUE)
rm(packages)

# set workig directory
        # uncomment if you want to change it
setwd("./ProgrammingAssignment3")

# test for required directories
pth <- "./data"
if (!file.exists(pth)) {
        dir.create(pth)
}

# set parameters for download data archive
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filename <- "Dataset.zip"

if (!file.exists(file.path(pth,filename))) {
        download.file(url = url,destfile = file.path(pth,filename))
}

# unzip files (every time)
unzip(file.path(pth,filename), files = NULL, list = FALSE, 
      overwrite = TRUE, junkpaths = FALSE, exdir = pth, 
      unzip = "internal", setTimes = FALSE)

pthUNzip <- file.path(pth,"UCI HAR Dataset")

rm(list = c("filename","url"))

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# prepare dataset

# read train files
data_XTRAIN <- read.table(file = file.path(pthUNzip,"train/X_train.txt"),
                     header = F)
data_YTRAIN <- read.table(file = file.path(pthUNzip,"train/y_train.txt"),
                 header = F)
data_SUBTRAIN <- read.table(file = file.path(pthUNzip,"train/subject_train.txt"),
                       header = F)
# read test files
data_XTEST <-read.table(file = file.path(pthUNzip,"test/X_test.txt"),
                   header = F)
data_YTEST <- read.table(file = file.path(pthUNzip,"test/Y_test.txt"),
                    header = F)
data_SUBTEST <- read.table(file = file.path(pthUNzip,"test/subject_test.txt" ),
                                      header = F)

#read features
data_FEATURES <- read.table(file = file.path(pthUNzip,"features.txt"),header = F)

# read labels
labels_ACTIVITY <- read.table(file = file.path(pthUNzip,"activity_labels.txt"),
                         header = F)

rm(pthUNzip)
# assigning names to datasets
colnames(data_XTRAIN) <- data_FEATURES[,2]
colnames(data_YTRAIN) <- "activityid"
colnames(data_SUBTRAIN) <- "subjectid"


colnames(data_XTEST) <- data_FEATURES[,2]
colnames(data_YTEST) <- "activityid"
colnames(data_SUBTEST) <- "subjectid"

colnames(labels_ACTIVITY) <- c("activityid","activitytype")


# merging data
data_ALL <- rbind(cbind(data_XTRAIN,data_YTRAIN, data_SUBTRAIN), 
                  cbind(data_XTEST,data_YTEST,data_SUBTEST))

# extracting columns with means and std
data_MEANSTD<- subset(data_ALL,select = c(as.character(data_FEATURES$V2
                [grep("mean\\()|std\\()",data_FEATURES$V2)]),
                "activityid","subjectid"))

# assing names to activity codes
data_MEANSTD <- select(merge(x=data_MEANSTD, y = labels_ACTIVITY, 
                             by="activityid"), -activityid)


# label the data set with descriptive variable names.

vcolnames <- colnames(data_MEANSTD)
vcolnames<-gsub("^t", "time_", vcolnames) #time for t
vcolnames<-gsub("^f", "frequency_", vcolnames) #frequency for f
vcolnames<-gsub("Gyro", "Gyroscope", vcolnames) #Gyroscope for Gyro
vcolnames<-gsub("Mag", "Magnitude", vcolnames) #Magnitude for Mag
vcolnames<-gsub("Acc", "Accelerator", vcolnames) #Accelerator for Acc
vcolnames<-gsub("BodyBody", "Body", vcolnames) #Body for BodyBody
vcolnames<-gsub("\\()", "", vcolnames) #remove parenthesis 
vcolnames<-tolower(vcolnames) 
colnames(data_MEANSTD) <- vcolnames

#From the data clean full dataset, create a second, independent tidy data set 
#with the average of each variable for each activity and each subject.

data_GROUP <- summarise_each(group_by(data_MEANSTD,subjectid,activitytype),
                              funs(mean))
write.table(x = data_GROUP,file = file.path(pth,"tidydata.txt"), row.names = 
                    F,col.names = T, sep = "\t",quote = T)
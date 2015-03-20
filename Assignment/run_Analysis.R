### One R script called run_analysis.R
### Working directory set in C drive
setwd("C:\\Users\\hp\\datasciencecoursera")
### Read & Create Initial Data

### Read Data from "test" and "train"
subject_data_test <- read.table("./Assignment/test/subject_test.txt", header=F, col.names=c("subjectId"))
subject_data_train <- read.table("./Assignment/train/subject_train.txt", header=F, col.names=c("subjectId"))

### Read Activity Id from y_test and y_train 
y_data_test <- read.table("./Assignment/test/y_test.txt", header=F, col.names=c("activityId"))
y_data_train <- read.table("./Assignment/train/y_train.txt", header=F, col.names=c("activityId"))

### Read features from the features file.
feat_data<-read.table("./Assignment/features.txt", header=F, as.is=T, col.names=c("measureId", "measureName"))

### Read test & train data & assign col headers from features dataframe
x_data_test<- read.table("./Assignment/test/x_test.txt", header=F, col.names=feat_data$measureName)
x_data_train<- read.table("./Assignment/train/x_train.txt", header=F, col.names=feat_data$measureName)

### Read Activity Labels
activity_labels <- read.table("./Assignment/activity_labels.txt", header=F, as.is=T, col.names=c("activityId", "activityName"))
activity_labels$activityName <- as.factor(activity_labels$activityName)

### <--Extract Mean & SD before merge 
### <--Subset then merge

### Names of subset columns are required. 
### subset_data stores column id's of columns 
### where mean() and std() appear 
subset_data <- grep(".*mean\\(\\)|.*std\\(\\)", feat_data$measureName)

### Subset Data. Filter data based on column id's
x_data1 <- x_data_test[,subset_data]
x_data2 <- x_data_train[,subset_data]

### Merge two X Data Sets into one single dataset
x_data<-rbind(x_data1, x_data2)

### Merge two Y Data Sets into one single dataset
y_data<-rbind(y_data_test, y_data_train)

### Merge subject data sets
subject_data<-rbind(subject_data_test, subject_data_train)

### <--Descriptive Activity names to name the activities in the data set

### Create table with the Activity and Subject ID assigned to X dataset
x_data$activityId <- y_data$activityId
x_data$subjectId <- subject_data$subjectId

### Assigning Activity Labels to final dataset
x_final <- merge(x_data, activity_labels)

### <--Label the data set with descriptive activity names
### Clean Column Names & remove special characters and create new headers
cnames <- colnames(x_final)
cnames <- gsub("\\.+mean\\.+", cnames, replacement="Mean")
cnames <- gsub("\\.+std\\.+",  cnames, replacement="Std")
cnames <- gsub(".*BodyBody",  cnames, replacement="Body")
colnames(x_final) <- make.names(cnames, unique=TRUE)
names(x_final)

### <--Create independent tidy data set with the average 
### of each variable for each activity and each subject

### Separate the ID and Measure Columns to Melt Data
id_data = c("activityId", "activityName", "subjectId")
measure_data= setdiff(colnames(x_final), id_data)

### Melt the dataset to calculate mean on Activity~Subject
library(reshape2)
melted_data <- melt(x_final, id=id_data, measure.vars=measure_data)
        
### Recast by calculating mean for each Subject~Activity combination
final_file<-dcast(melted_data, activityName + subjectId ~ variable, mean)    

### Create and save the tidy data file in the working directory
write.table(final_file, "GKar_new_tidy_data.txt")

### END
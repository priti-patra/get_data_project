#loads package reshape2
library(reshape2)

#Gets required file in working directory
if (!file.exists("UCI HAR Dataset")) {
	if (!file.exists("dataset.zip")) {
		fileUrl<-"http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
		dest<-"getdata-projectfiles-UCI HAR Dataset.zip"
		download.file(fileUrl,dest)
	}
	unzip("getdata-projectfiles-UCI HAR Dataset.zip")
}	


#Step1:Merges the training and the test sets to create one data set merged_feature_activity_subject

feature_test<-read.table("./UCI HAR dataset/test/X_test.txt")
feature_train<-read.table("./UCI HAR dataset/train/X_train.txt")
feature_merged_train_test<-rbind(feature_train,feature_test)

activity_test<-read.table("./UCI HAR dataset/test/Y_test.txt")
activity_train<-read.table("./UCI HAR dataset/train/y_train.txt")
activity_merged_train_test<-rbind(activity_train,activity_test)

subject_train<-read.table("./UCI HAR dataset/train/subject_train.txt")
subject_test<-read.table("./UCI HAR dataset/test/subject_test.txt")
subject_merged_train_test<-rbind(subject_train,subject_test)

merged_feature_activity_subject<-cbind(feature_merged_train_test,activity_merged_train_test,subject_merged_train_test)

#dim(merged_feature_activity_subject)
#[1] 10299 563
colnames(merged_feature_activity_subject)[562:563]<-c("activity","subject") 
features<-read.table("./UCI HAR dataset/features.txt")
names(merged_feature_activity_subject)[1:nrow(features)]<-as.vector(features$V2)

#Step2: Extracts only the measurements on the mean and standard deviation for each measurement
idx<-grepl("mean\\(\\)|std\\(\\)",features$V2,ignore.case=TRUE)

#sum(idx)
#[1] 66
measurement_data<-merged_feature_activity_subject[,-which(!idx) ]
#dim(measurement_data)
# 10299	68

#Step3: Uses descriptive activity names to name the activities in the data set
activity_labels<-read.table("./UCI HAR dataset/activity_labels.txt",stringsAsFactors=FALSE)
measurement_data$activity<-factor(activity_labels$V2[measurement_data$activity],levels=activity_labels$V2)

#Step4: Appropriately labels the column names of data set with descriptive names
##by replacing (),-,... and making it lower case and restricting occurence of word "body"
#to only one in a name string and changing suject column to factor type
col_names<-sapply(colnames(measurement_data), function(x) gsub("\\(\\)|\\-|\\.", "" ,x))
col_names<-tolower(col_names)
colnames(measurement_data)<- sapply(col_names, function(x) gsub("(body)+", "body", x)) 
measurement_data$subject<- factor(measurement_data$subject)

#Step5:Creates a tidy data set with the average of each variable for each activity and each subject+

melt_data<-melt(measurement_data,id=c("activity","subject"))
tidy_data<-dcast(melt_data, subject + activity ~ variable,fun.aggregate=mean)

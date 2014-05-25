library(reshape2)

if (!file.exists("UCI HAR Dataset")) {
	if (!file.exists("dataset.zip")) {
		fileUrl<-"http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
		dest<-"getdata-projectfiles-UCI HAR Dataset.zip"
		download.file(fileUrl,dest)
	}
	unzip("getdata-projectfiles-UCI HAR Dataset.zip")
}	


#Step1:

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

#Step2
idx<-grepl("mean\\(\\)|std\\(\\)",features$V2,ignore.case=TRUE)

#sum(idx)
#[1] 66
measurement_data<-merged_feature_activity_subject[,-which(!idx) ]
#dim(measurement_data)
# 10299	68

#Step3
activity_labels<-read.table("./UCI HAR dataset/activity_labels.txt",stringsAsFactors=FALSE)
measurement_data$activity<-factor(activity_labels$V2[measurement_data$activity],levels=activity_labels$V2)

#Step4
##To replace (),-,... with .
col_names<-sapply(colnames(measurement_data), function(x) gsub("\\(\\)|\\-|\\.", "" ,x))
##To convert names to lower case
names(measurement_data)<-tolower(col_names)


#Step5

melt_data<-melt(measurement_data,id=c("activity","subject"))
tidy_data<-dcast(melt_data, subject + activity ~ variable,fun.aggregate=mean)

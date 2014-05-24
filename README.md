This repository contains following files
  * run_analysis.R
  * CodeBook.md
  * tidy_data.txt
  * README.md

INSTRUCTIONS:

* We have to run the script file using following command in R console provided Samsung data  folder "UCI HAR Dataset" is in working directory
   **source("run_analysis.R")**
* The script file "run_analysis.R" returns followings in given order.

    * **merged_feature_activity_subject**: This contains merged data from training and test sets of features ,activity and subject.It contains 10299 columns and 563 rows
    * **measurement_data**: This retrieved only the measurements data on the mean and standard deviation for each measurement by searching only for mean() and std(). It contains 66 such measurement columns and an activity and a subject column(Totally 68 columns)
      
    * **meaurement_data$activity**: This contains descriptive activity names to name the activities in the data set by assigning labels from activity_labels which takes labels from activity_labels.txt 
    * **names(measurement_data)** :   Columns of the data set contains descriptive names by removing (),.,- and converting into lowercase
    * **tidy_data** :This is a second, independent tidy data set with the average of each variable for each activity and each subject   
  
* The script also returns some intermediate data
  * feature_test: It retrieves test features data form x_test.txt file of test directory
  * feature_train: It retrieves train features data form x_train.txt file of train directory
  * feature_merged_train_test: It contains merged train features and test features data 
  
  * activity_test: It retrieves test activity data form y_test.txt file of test directory
  
  * activity_train: It retrieves train activity data form y_train.txt file of train directory
  * activity_merged_train_test: It contains merged train activity and test activity data
  * subject_test: It retrieves test subject data form subject_test.txt file of test directory
  * subject_train: It retrieves train subject data form subject_train.txt file of train directory
  * subject_merged_train_test: It contains merged train subject and test subject data
  * features: It retrieves feature names from features.txt
  * idx : It is a logical vector indicating position of std() and mean() in features
  

  
    
    
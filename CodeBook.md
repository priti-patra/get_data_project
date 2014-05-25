
**Input Data: "UCI HAR Dataset"** which contains    

>list.files("./UCI HAR Dataset")   
[1] "activity_labels.txt" "features.txt"  	"features_info.txt"    
[4] "README.txt"		  "test"			"train"

To get tidy_data, performed a number of tranformation
* Read feature data for training set  and testing set from train/x_train.txt and test/x_test.txt respectively into **feature_train** and **feature_test** data.frame using read.table
* Then merrge the feature data of train and test using **rbind** to get **feature_merged_train_test**
* Read activity data for training set  and testing set from train/y_train.txt and test/y_test.txt respectively into **activity_train** and **activity_test** data.frame using read.table
* Then merrge the activity data of train and test using rbind to get **activity_merged_train_test**

* Read subject data for training set  and testing set from train/subject_train.txt and test/subject_test.txt respectively into **subject_train** and **subject_test** data.frame using read.table
* Then merrge the subject data of train and test using **rbind** to get **subject_merged_train_test**

* Then merge the feature_merged_train_test, activity_merged_train_test, subject_train_test using **cbind**  to get **merged_feature_activity_subject**
console output:
>\>dim(merged_feature_activity_subject)  
    [1] 10299 563
* Get feature  names  from feature.txt using read.table and assign them to feature columns and last two columns as activity and subject

* Then retrive the index of  the measurements on the mean and standard deviation for each measurement using grepl to search for mean() or std() in **idx logical vector**
console output:
>\>sum(idx)  
  [1] 66

* Then use idx vector to exclude non required data  and include reuired measurement feature along with activity and subject in **measurement_data**
>\>dim(measurement_data)  
 10299  68
* Then retrieve activity_labels from activity_labels.txt using read.table  
* Then use activity labels to assign descriptive names to activities of measurement_data
* Then assign appropiate names to columns of measurement data by removing (),-,. from names and making names lower case , restricting occurence of body only once in a name string and  converting subject column to factor type
* The script file "run_analysis.R" returns followings in given order.
* Finally  get tidy_data with average of each variable for each activity and each subject using melt and dcast of reshape2 package

**Output data : tidy_data**   
>\> dim(tidy_data)
[1] 180 68

>\>levels(tidy_data$subject)   
 [1] "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10" "11" "12" "13" "14" "15" "16"  
[17] "17" "18" "19" "20" "21" "22" "23" "24" "25" "26" "27" "28" "29" "30"

>\>levels(tidy_data$activity)    
[1] "WALKING"            "WALKING_UPSTAIRS"   "WALKING_DOWNSTAIRS" "SITTING"             
[5] "STANDING"           "LAYING"            

So there are  30 subject levels and 6 activity levels.So there are 180 unique pair of subject and activity for each measurement features

**Columns of tidy_data:** '
>\>names(tidy_data)    
 [1] "subject"                  "activity"                 "tbodyaccmeanx"           
 [4] "tbodyaccmeany"            "tbodyaccmeanz"            "tbodyaccstdx"            
 [7] "tbodyaccstdy"             "tbodyaccstdz"             "tgravityaccmeanx"        
[10] "tgravityaccmeany"         "tgravityaccmeanz"         "tgravityaccstdx"         
[13] "tgravityaccstdy"          "tgravityaccstdz"          "tbodyaccjerkmeanx"       
[16] "tbodyaccjerkmeany"        "tbodyaccjerkmeanz"        "tbodyaccjerkstdx"        
[19] "tbodyaccjerkstdy"         "tbodyaccjerkstdz"         "tbodygyromeanx"          
[22] "tbodygyromeany"           "tbodygyromeanz"           "tbodygyrostdx"           
[25] "tbodygyrostdy"            "tbodygyrostdz"            "tbodygyrojerkmeanx"      
[28] "tbodygyrojerkmeany"       "tbodygyrojerkmeanz"       "tbodygyrojerkstdx"       
[31] "tbodygyrojerkstdy"        "tbodygyrojerkstdz"        "tbodyaccmagmean"         
[34] "tbodyaccmagstd"           "tgravityaccmagmean"       "tgravityaccmagstd"       
[37] "tbodyaccjerkmagmean"      "tbodyaccjerkmagstd"       "tbodygyromagmean"        
[40] "tbodygyromagstd"          "tbodygyrojerkmagmean"     "tbodygyrojerkmagstd"     
[43] "fbodyaccmeanx"            "fbodyaccmeany"            "fbodyaccmeanz"           
[46] "fbodyaccstdx"             "fbodyaccstdy"             "fbodyaccstdz"            
[49] "fbodyaccjerkmeanx"        "fbodyaccjerkmeany"        "fbodyaccjerkmeanz"       
[52] "fbodyaccjerkstdx"         "fbodyaccjerkstdy"         "fbodyaccjerkstdz"        
[55] "fbodygyromeanx"           "fbodygyromeany"           "fbodygyromeanz"          
[58] "fbodygyrostdx"            "fbodygyrostdy"            "fbodygyrostdz"           
[61] "fbodyaccmagmean"          "fbodyaccmagstd"           "fbodyyaccjerkmagmean"     
[64] "fbodyaccjerkmagstd"   "fbodygyromagmean"     "fbodygyromagstd"     
[67] "fbodygyrojerkmagmean" "fbodygyrojerkmagstd" 

**Descriptions of columns of tidy data**   
 * **activity**: Refers to activity performed by each subject wearing a smartphone (Samsung Galaxy S II) on the waist
 * **subject** : Refers to identifier of volunteer who carried out experiment
 * **tbodyaccmeanx**: Refers to body linear accelartion mean in x axis of time domain
 * **tbodyaccmeany**: Refers to body linear accelartion mean in y axis of time domain
 * **tbodyaccmeanz**: Refers to body linear accelartion mean in z axis of time domain
 * **tbodyaccstdx**: Refers to body linear acceleration standard deviation in x axis of time domain  
 * **tbodyaccstdy**: Refers to body linear acceleration standard deviation in y axis of time domain
 * **tbodyaccstdz**: Refers to body linear acceleration standard deviation in z axis of time domain
 * **tgravityaccmeanx**: Refers to gravitational linear acceleration mean in x axis of time domain
 * **tgravityaccmeany**: Refers to gravitational linear acceleration mean in y axis of time domain
 * **tgravityaccmeanz**: Refers to gravitational linear acceleration mean in z axis of time domain
 * **tgravityaccstdx**: Refers to gravitational linear acceleration standard deviation in x axis of time domain
 * **tgravityaccstdy**: Refers to gravitational linear acceleration standard deviation in y
 axis of time domain
 * **tgravityaccstdz**: Refers to gravitational linear acceleration standard deviation in z axis of time domain
 * **tbodyaccjerkmeanx**: Refers to body linear acceleration mean derived in time domain to obtain jerk signal in x direction
 * **tbodyaccjerkmeany**: Refers to body linear acceleration mean derived in time domain to obtain jerk signal in y direction
 * **tbodyaccjerkmeanz**: Refers to body linear acceleration mean derived in time domain to obtain jerk signal in z direction
 * **tbodyaccjerkstdx**: Refers to body linear acceleration standard deviation derived in time domain to obtain jerk signal in x direction
 * **tbodyaccjerkstdy**: Refers to body linear acceleration standard deviation derived in time domain to obtain jerk signal in y direction
 * **tbodyaccjerkstdz**: Refers to body linear acceleration standard deviation derived in time domain to obtain jerk signal in z direction
 * **tbodygyromeanx**: Refers to body angular velocity mean in x axis of time domain
 * **tbodygyromeany**: Refers to body angular velocity mean in y axis of time domain
 * **tbodygyromeanz**: Refers to body angular velocity mean in z axis of time domain
 * **tbodygyrostdx**: Refers to body angular velocity standard deviation in x axis of time domain
 * **tbodygyrostdy**: Refers to body angular velocity standard deviation in y axis of time domain
 * **tbodygyrostdz**: Refers to body angular velocity standard deviation in z axis of time domain
 * **tbodygyrojerkmeanx**: Refers to body angular velocity mean derived in time domain to obtain jerk signal in x axis
 * **tbodygyrojerkmeany**: Refers to body angular velocity mean derived in time domain to obtain jerk signal in y axis
 * **tbodygyrojerkmeanz**: Refers to body angular velocity mean derived in time domain to obtain jerk signal in z axis
 * **tbodygyrojerkstdx**: Refers to body angular velocity standard deviation derived in time domain to obtain jerk signal in x axis 
 * **tbodygyrojerkstdy**: Refers to body angular velocity standard deviation derived in time domain to obtain jerk signal in y axis
 * **tbodygyrojerkstdz**: Refers to body angular velocity standard deviation derived in time domain to obtain jerk signal in z axis
 * **tbodyaccmagmean**: Refers to body linear acceleration magnitude mean using Euclidean norm in time domain
 * **tbodyaccmagstd**: Refers to body linear acceleration magnitude standard deviation using Euclidean norm in time domain
 * **tgravityaccmagmean**: Refers to graviatinal acceleration magnitude mean using Euclidean norm in time domain
 * **"tgravityaccmagstd**: Refers  to graviatinal acceleration magnitude standard deviation using Euclidean norm in time domain
 * **tbodyaccjerkmagmean** :Refers to body linear acceleration magnitude mean using Euclidean norm to obtain jerk signal in time domain
 * **tbodyaccjerkmagstd** :Refers to body linear acceleration magnitude standard deviation using Euclidean norm to obtain jerk signal in time domain
 * **tbodygyromagmean** :Refers to body angular velocity magnitude mean using Euclidean norm in time domain
 * **tbodygyromagstd** :Refers to body angular velocity magnitude standard deviation using Euclidean norm in time domain
 * **tbodygyrojerkmagmean** :Refers to body angular velocity magnitude mean using Euclidean norm to obtain jerk in time domain
 * **tbodygyrojerkmagstd** :Refers to body angular velocity magnitude standard deviation using Euclidean norm to obtain jerk signal in time domain
 * **fbodyaccmeanx**: Refers to body linear accelartion mean in x axis of frequency domain
 * **fbodyaccmeany**: Refers to body linear accelartion mean in y axis of frequency domain
 * **fbodyaccmeanz**: Refers to body linear accelartion mean in z axis of frequency domain
 * **fbodyaccstdx**: Refers to body linear acceleration standard deviation in x axis of frequency domain  
 * **fbodyaccstdy**: Refers to body linear acceleration standard deviation in y axis of frequency domain
 * **fbodyaccstdz**: Refers to body linear acceleration standard deviation in z axis of frequency domain
 * **fbodyaccjerkmeanx**: Refers to body linear acceleration mean derived in frequency domain to obtain jerk signal in x direction
 * **fbodyaccjerkmeany**: Refers to body linear acceleration mean derived in frequency domain to obtain jerk signal in y direction
 * **fbodyaccjerkmeanz**: Refers to body linear acceleration mean derived in frequency domain to obtain jerk signal in z direction
 * **fbodyaccjerkstdx**: Refers to body linear acceleration standard deviation derived in frequency domain to obtain jerk signal in x direction
 * **fbodyaccjerkstdy**: Refers to body linear acceleration standard deviation derived in frequency domain to obtain jerk signal in y direction
 * **fbodyaccjerkstdz**: Refers to body linear acceleration standard deviation derived in frequency domain to obtain jerk signal in z direction
 * **fbodygyromeanx**: Refers to body angular velocity mean in x axis of frequency domain
 * **fbodygyromeany**: Refers to body angular velocity mean in y axis of frequency domain
 * **fbodygyromeanz**: Refers to body angular velocity mean in z axis of frequency domain
 * **fbodygyrostdx**: Refers to body angular velocity standard deviation in x axis of frequency domain
 * **fbodygyrostdy**: Refers to body angular velocity standard deviation in y axis of frequency domain
 * **fbodygyrostdz**: Refers to body angular velocity standard deviation in z axis of frequency domain
 * **fbodyaccmagmean**: Refers to body linear acceleration magnitude mean using Euclidean norm in frequency domain
 * **fbodyaccmagstd**: Refers to body linear acceleration magnitude standard deviation using Euclidean norm in frequency domain
 * **fbodyaccjerkmagmean** :Refers to body linear acceleration magnitude mean using Euclidean norm to obtain jerk signal in frequency domain
 * **fbodyaccjerkmagstd** :Refers to body linear acceleration magnitude standard deviation using Euclidean norm to obtain jerk signal in frequency domain
 * **fbodygyromagmean** :Refers to body angular velocity magnitude mean using Euclidean norm in frequency domain
 * **fbodygyromagstd** :Refers to body angular velocity magnitude standard deviation using Euclidean norm in frequency domain
 * **fbodygyrojerkmagmean** :Refers to body angular velocity magnitude mean using Euclidean norm to obtain jerk signal in frequency domain
 * **fbodygyrojerkmagstd** :Refers to body angular velocity magnitude standard deviation using Euclidean norm to obtain jerk signal in frequency domain
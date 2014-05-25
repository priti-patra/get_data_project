
**Input Data: "UCI HAR Dataset"** which contains    
console output:   
list.files("./UCI HAR Dataset")   

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
>dim(merged_feature_activity_subject)  
[1] 10299 563
* Get feature  names  from feature.txt using read.table and assign them to feature columns and last two columns as activity and subject

* Then retrives the index of  the measurements on the mean and standard deviation for each measurement using grepl to search for mean() or std() in **idx logical vector**
console output:
>sum(idx)  
[1] 66

* Then used idx vector to exclude non required data  and include reuired measurement feature along with activity and subject in **measurement_data**
>dim(measurement_data)  
 10299  68
* Then retrieves activity_labels from activity_labels.txt using read.table  
* Then use activity labels to assign descriptive names to activities of measurement_data
* Then assign appropiate names to columns of measurement data by removing (),-,. from names and making names lower case 
* The script file "run_analysis.R" returns followings in given order.
* Finally  get tidy_data with average of each variable for each activity and each subject using melt and dcast of reshape2 package

**Output data : tidy_data**   
> dim(tidy_data)
[1] 180 68

**Columns of tidy_data:** '
>names(tidy_data)    
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
[61] "fbodyaccmagmean"          "fbodyaccmagstd"           "fbodybodyaccjerkmagmean" 
[64] "fbodybodyaccjerkmagstd"   "fbodybodygyromagmean"     "fbodybodygyromagstd"     
[67] "fbodybodygyrojerkmagmean" "fbodybodygyrojerkmagstd" 


# Code Book for Tidy Data Extracted from UCI HAR Dataset

This tidy dataset is extracted and processed from [UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 

## Original Dataset: UCI HAR Dataset
The original dataset contains 561 features (input variables), 1 activity label (output variable) and 1 subject ID for each data points in both training set (7352 data points) and test set (2947 data points). The details of the dataset are described in **README.txt** and **features_info.txt** in the original dataset.

## Data Processing
The tidy dataset was formed from processing the original data from UCI HAR dataset. The processing was performed using an R script **run_analysis.R**. Below details the processing step carried out in the script.

1. **featureName**, which contains the name of the input variables, were read from **features.txt**.

2. **activityLabels**, which contains the list of names used in the output variables (labels), were read from **activity_label.txt**.

3. **trainingDataX**, which contains the input feature values from the training dataset, were read from **x_train.txt**.

4. **trainingDataY**, which contains the output labels from the training dataset, were read from **y_train.txt**.

5. **trainingSubject**, which contains the subject identity in the training dataset, were read from **subject_train.txt".

6. **testDataX**, which contains the input feature values from the test dataset, were read from **x_test.txt**.

7. **testDataY**, which contains the output labels from the test dataset, were read from **y_test.txt**.

8. **testSubject**, which contains the subject identity in the test dataset, were read from **subject_test.txt".

9. The variables **trainingDataY** and **testDataY** use integer code to represent the activity. To make the variables more descriptive, the integer code were replaced by activity name (in character) contained in **activityLabels**.

10. **trainingDataX** and **testDataX** were stacked vertically. 

11. **trainingDataY** and **testDataY** were stacked vertically. 

12. **trainingSubject** and **testSubject** were stacked vertically. 

13. The stacked **trainingSubject** and **testSubject**, **trainingDataX** and **testDataX**; and stacked **trainingDataY** and **testDataY** were combined horizontally to form the new data frame, **data**.

14. The columns of the new data frame were named as "subject", 561 feature names in **featureName** and "activity", respectively.

15. Extracts columns in which their feature name contain "mean" and "std".

16. Replace the data frame, **data** with new data frame with only the extracted columns.

17. Split **data** according to both subject ID (in Column "subject" of **data**) and activity (in Column "activity" of **data**) into a list of 180 data frames, **S**. Each data frame contains data for a particular activity generated from a particular subject. For example, data frame 1 in **S** contains data from Subject 1 doing activity "LAYING".

18. For each data frame in list **s**, mean values were calculated for each column of input features. 

19. A new list of data frames, **meanS** were formed from the column mean values for each activity and subject.

20. The feature name for each column of all the data frames in **meanS** were appended with ".average".

21. A data frame, **tidyData** is formed by combining all data frames in **meanS**. To indicate their origin, two columns "subject" and "activity" which indicates the respective subject ID and activity were added to the tidy data.

22. The tidy dataset, **tidyData** were written into a .txt file named **tidyData.txt**.

## Variables
The resulting **tidyData** contains 81 features and 180 rows. 

The 81 features are: 

### [1] "subject"     
- class: character/factor
- values: "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30" 
- This variable contains the ID that identifies the subject whom the motion signals were generated from.                            

### [2] "activity"  
- class: character/factor  
- values: "LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS"
- This variable describes the motion performed by the subject that generated the motion signal.                             

### [3] "tBodyAcc-mean()-X.average" 
- class: numeric
- This variable contains the average of the mean value of the body acceleration value in X-axis for the subject in [1] and motion in [2]. 
       
### [4] "tBodyAcc-mean()-Y.average"    
- class: numeric
- This variable contains the average of the mean value of the body acceleration value in Y-axis for the subject in [1] and motion in [2]. 
    
### [5] "tBodyAcc-mean()-Z.average"       
- class: numeric
- This variable contains the average of the mean value of the body acceleration value in Z-axis for the subject in [1] and motion in [2]. 

### [6] "tGravityAcc-mean()-X.average"  
- class: numeric
- This variable contains the average of the mean value of the gravity acceleration value in X-axis for the subject in [1] and motion in [2]. 
    
### [7] "tGravityAcc-mean()-Y.average"      
- class: numeric
- This variable contains the average of the mean value of the gravity acceleration value in Y-axis for the subject in [1] and motion in [2]. 

### [8] "tGravityAcc-mean()-Z.average" 
- class: numeric
- This variable contains the average of the mean value of the gravity acceleration value in Z-axis for the subject in [1] and motion in [2]. 
     
### [9] "tBodyAccJerk-mean()-X.average"  
- class: numeric
- This variable contains the average of the mean value of the body jerk in X-axis for the subject in [1] and motion in [2]. 

### [10] "tBodyAccJerk-mean()-Y.average" 
- class: numeric
- This variable contains the average of the mean value of the body jerk in Y-axis for the subject in [1] and motion in [2]. 
     
### [11] "tBodyAccJerk-mean()-Z.average"   
- class: numeric
- This variable contains the average of the mean value of the body jerk in Z-axis for the subject in [1] and motion in [2]. 
  
### [12] "tBodyGyro-mean()-X.average" 
- class: numeric
- This variable contains the average of the mean value of the body angular velocity value in X-axis for the subject in [1] and motion in [2]. 
      
### [13] "tBodyGyro-mean()-Y.average"   
- class: numeric
- This variable contains the average of the mean value of the body angular velocity value in Y-axis for the subject in [1] and motion in [2]. 
    
### [14] "tBodyGyro-mean()-Z.average"  
- class: numeric
- This variable contains the average of the mean value of the body angular velocity value in Z-axis for the subject in [1] and motion in [2]. 
     
### [15] "tBodyGyroJerk-mean()-X.average" 
- class: numeric
- This variable contains the average of the mean jerk of the body angular velocity in X-axis for the subject in [1] and motion in [2]. 
    
### [16] "tBodyGyroJerk-mean()-Y.average" 
- class: numeric
- This variable contains the average of the mean jerk of the body angular velocity in Y-axis for the subject in [1] and motion in [2]. 
       
### [17] "tBodyGyroJerk-mean()-Z.average" 
- class: numeric
- This variable contains the average of the mean jerk of the body angular velocity  in Z-axis for the subject in [1] and motion in [2]. 
       
### [18] "tBodyAccMag-mean().average"  
- class: numeric
- This variable contains the average of the mean magnitude (Euclidean norm) of the body acceleration value for the subject in [1] and motion in [2]. 
        
### [19] "tGravityAccMag-mean().average"  
- class: numeric
- This variable contains the average of the mean magnitude (Euclidean norm) of the gravity acceleration value for the subject in [1] and motion in [2]. 
     
### [20] "tBodyAccJerkMag-mean().average"  
- class: numeric
- This variable contains the average of the mean magnitude (Euclidean norm) of the body jerk for the subject in [1] and motion in [2]. 
  	
### [21] "tBodyGyroMag-mean().average" 
- class: numeric
- This variable contains the average of the mean magnitude (Euclidean norm) of the body angular velocity value for the subject in [1] and motion in [2]. 
          
### [22] "tBodyGyroJerkMag-mean().average"  
- class: numeric
- This variable contains the average of the mean jerk magnitude (Euclidean norm) of the body angular velocity for the subject in [1] and motion in [2]. 
   
### [23] "fBodyAcc-mean()-X.average"  
- class: numeric
- This variable contains the average of the mean value of the body acceleration frequency domain value in X-axis for the subject in [1] and motion in [2]. 
       
### [24] "fBodyAcc-mean()-Y.average" 
- class: numeric
- This variable contains the average of the mean value of the body acceleration frequency domain value in Y-axis for the subject in [1] and motion in [2]. 
         
### [25] "fBodyAcc-mean()-Z.average"  
- class: numeric
- This variable contains the average of the mean value of the body acceleration frequency domain value in Z-axis for the subject in [1] and motion in [2]. 
       
### [26] "fBodyAcc-meanFreq()-X.average"
- class: numeric
- This variable contains the average of the mean frequency value of the body acceleration in X-axis for the subject in [1] and motion in [2]. 
      
### [27] "fBodyAcc-meanFreq()-Y.average" 
- class: numeric
- This variable contains the average of the mean frequency value of the body acceleration in Y-axis for the subject in [1] and motion in [2]. 
      
### [28] "fBodyAcc-meanFreq()-Z.average" 
- class: numeric
- This variable contains the average of the mean frequency value of the body acceleration in Z-axis for the subject in [1] and motion in [2]. 
      
### [29] "fBodyAccJerk-mean()-X.average"  
- class: numeric
- This variable contains the average of the mean jerk value of the body acceleration frequency domain value in X-axis for the subject in [1] and motion in [2]. 
       
### [30] "fBodyAccJerk-mean()-Y.average"   
- class: numeric
- This variable contains the average of the mean jerk value of the body acceleration frequency domain value in Y-axis for the subject in [1] and motion in [2]. 
    
### [31] "fBodyAccJerk-mean()-Z.average"  
- class: numeric
- This variable contains the average of the mean jerk value of the body acceleration frequency domain value in Z-axis for the subject in [1] and motion in [2]. 
      
### [32] "fBodyAccJerk-meanFreq()-X.average" 
- class: numeric
- This variable contains the average of the mean of the body jerk frequency domain value in X-axis for the subject in [1] and motion in [2]. 
     
### [33] "fBodyAccJerk-meanFreq()-Y.average"   
- class: numeric
- This variable contains the average of the mean of the body jerk frequency domain value in Y-axis for the subject in [1] and motion in [2]. 
   
### [34] "fBodyAccJerk-meanFreq()-Z.average"   
- class: numeric
- This variable contains the average of the mean of the body jerk frequency domain value in Z-axis for the subject in [1] and motion in [2]. 
   
### [35] "fBodyGyro-mean()-X.average"   
- class: numeric
- This variable contains the average of the mean jerk of the body angular velocity frequency domain value in X-axis for the subject in [1] and motion in [2]. 
       
### [36] "fBodyGyro-mean()-Y.average"
- class: numeric
- This variable contains the average of the mean jerk of the body angular velocity frequency domain value in Y-axis for the subject in [1] and motion in [2]. 
         
### [37] "fBodyGyro-mean()-Z.average"  
- class: numeric
- This variable contains the average of the mean jerk of the body angular velocity frequency domain value in Z-axis for the subject in [1] and motion in [2]. 
        
### [38] "fBodyGyro-meanFreq()-X.average"  
- class: numeric
- This variable contains the average of the mean frequency of the body angular velocity in X-axis for the subject in [1] and motion in [2]. 
      
### [39] "fBodyGyro-meanFreq()-Y.average"   
- class: numeric
- This variable contains the average of the mean frequency of the body angular velocity in Y-axis for the subject in [1] and motion in [2]. 
      
  
### [40] "fBodyGyro-meanFreq()-Z.average" 
- class: numeric
- This variable contains the average of the mean frequency of the body angular velocity in Z-axis for the subject in [1] and motion in [2]. 
          
### [41] "fBodyAccMag-mean().average"   
- class: numeric
- This variable contains the average of the mean magnitude (Euclidean norm) of the body acceleration frequency domain signal for the subject in [1] and motion in [2]. 
          
### [42] "fBodyAccMag-meanFreq().average"  
- class: numeric
- This variable contains the average of the mean magnitude (Euclidean norm) of the body acceleration frequency for the subject in [1] and motion in [2]. 
  
### [43] "fBodyBodyAccJerkMag-mean().average"  
- class: numeric
- This variable contains the average of the mean magnitude (Euclidean norm) of the body jerk frequency domain signal for the subject in [1] and motion in [2]. 
   
### [44] "fBodyBodyAccJerkMag-meanFreq().average" 
- class: numeric
- This variable contains the average of the magnitude (Euclidean norm) of the mean body jerk frequency for the subject in [1] and motion in [2]. 
 
### [45] "fBodyBodyGyroMag-mean().average"    
- class: numeric
- This variable contains the average of the mean magnitude (Euclidean norm) of the body angular velocity frequency domain signal for the subject in [1] and motion in [2]. 
  
### [46] "fBodyBodyGyroMag-meanFreq().average"  
- class: numeric
- This variable contains the average of the mean magnitude (Euclidean norm) of the body angular velocity frequency for the subject in [1] and motion in [2]. 
  
### [47] "fBodyBodyGyroJerkMag-mean().average"  
- class: numeric
- This variable contains the average of the mean magnitude (Euclidean norm) of the body angular velocity jerk frequency domain signal for the subject in [1] and motion in [2]. 
  
### [48] "fBodyBodyGyroJerkMag-meanFreq().average"
- class: numeric
- This variable contains the average of the mean magnitude (Euclidean norm) of the body angular velocity jerk frequency for the subject in [1] and motion in [2]. 
  
### [49] "tBodyAcc-std()-X.average" 
- class: numeric
- This variable contains the average of the standard deviation value of the body acceleration value in X-axis for the subject in [1] and motion in [2]. 
         
### [50] "tBodyAcc-std()-Y.average"   
- class: numeric
- This variable contains the average of the standard deviation value of the body acceleration value in Y-axis for the subject in [1] and motion in [2]. 
        
### [51] "tBodyAcc-std()-Z.average"   
- class: numeric
- This variable contains the average of the standard deviation value of the body acceleration value in Z-axis for the subject in [1] and motion in [2]. 
   
### [52] "tGravityAcc-std()-X.average"    
- class: numeric
- This variable contains the average of the standard deviation value of the gravity acceleration value in X-axis for the subject in [1] and motion in [2]. 
      
### [53] "tGravityAcc-std()-Y.average"   
- class: numeric
- This variable contains the average of the standard deviation value of the gravity acceleration value in Y-axis for the subject in [1] and motion in [2]. 
   
### [54] "tGravityAcc-std()-Z.average" 
- class: numeric
- This variable contains the average of the standard deviation value of the gravity acceleration value in Z-axis for the subject in [1] and motion in [2]. 
       
### [55] "tBodyAccJerk-std()-X.average" 
- class: numeric
- This variable contains the average of the standard deviation value of the body jerk in X-axis for the subject in [1] and motion in [2]. 
    
### [56] "tBodyAccJerk-std()-Y.average"  
- class: numeric
- This variable contains the average of the standard deviation value of the body jerk in Y-axis for the subject in [1] and motion in [2]. 
        
### [57] "tBodyAccJerk-std()-Z.average"     
- class: numeric
- This variable contains the average of the standard deviation value of the body jerk in Z-axis for the subject in [1] and motion in [2]. 
   
### [58] "tBodyGyro-std()-X.average"    
- class: numeric
- This variable contains the average of the standard deviation value of the body angular velocity value in X-axis for the subject in [1] and motion in [2]. 
   
### [59] "tBodyGyro-std()-Y.average"      
- class: numeric
- This variable contains the average of the standard deviation value of the body angular velocity value in Y-axis for the subject in [1] and motion in [2]. 
    
### [60] "tBodyGyro-std()-Z.average" 
- class: numeric
- This variable contains the average of the standard deviation value of the body angular velocity value in Z-axis for the subject in [1] and motion in [2]. 
           
### [61] "tBodyGyroJerk-std()-X.average"  
- class: numeric
- This variable contains the average of the standard deviation of jerk of the body angular velocity in X-axis for the subject in [1] and motion in [2]. 
      
### [62] "tBodyGyroJerk-std()-Y.average"  
- class: numeric
- This variable contains the average of the standard deviation of jerk of the body angular velocity in Y-axis for the subject in [1] and motion in [2]. 
      
### [63] "tBodyGyroJerk-std()-Z.average"     
- class: numeric
- This variable contains the average of the standard deviation of jerk of the body angular velocity  in Z-axis for the subject in [1] and motion in [2]. 
   
### [64] "tBodyAccMag-std().average"  
- class: numeric
- This variable contains the average of the standard deviation of magnitude (Euclidean norm) of the body acceleration value for the subject in [1] and motion in [2]. 
      
### [65] "tGravityAccMag-std().average" 
- class: numeric
- This variable contains the average of the standard deviation of magnitude (Euclidean norm) of the gravity acceleration value for the subject in [1] and motion in [2]. 
         
### [66] "tBodyAccJerkMag-std().average"    
- class: numeric
- This variable contains the average of the standard deviation of magnitude (Euclidean norm) of the body jerk for the subject in [1] and motion in [2]. 
   
### [67] "tBodyGyroMag-std().average"     
- class: numeric
- This variable contains the average of the standard deviation of magnitude (Euclidean norm) of the body angular velocity value for the subject in [1] and motion in [2]. 
   
### [68] "tBodyGyroJerkMag-std().average" 
- class: numeric
- This variable contains the average of the standard deviation of jerk magnitude (Euclidean norm) of the body angular velocity for the subject in [1] and motion in [2]. 
    
### [69] "fBodyAcc-std()-X.average" 
- class: numeric
- This variable contains the average of the standard deviation value of the body acceleration frequency domain value in X-axis for the subject in [1] and motion in [2]. 
            
### [70] "fBodyAcc-std()-Y.average"
- class: numeric
- This variable contains the average of the standard deviation value of the body acceleration frequency domain value in Y-axis for the subject in [1] and motion in [2]. 
           
### [71] "fBodyAcc-std()-Z.average"  
- class: numeric
- This variable contains the average of the standard deviation value of the body acceleration frequency domain value in Z-axis for the subject in [1] and motion in [2]. 
       
### [72] "fBodyAccJerk-std()-X.average" 
- class: numeric
- This variable contains the average of the standard deviation frequency value of the body acceleration in X-axis for the subject in [1] and motion in [2]. 
        
### [73] "fBodyAccJerk-std()-Y.average"      
- class: numeric
- This variable contains the average of the standard deviation of frequency value of the body acceleration in Y-axis for the subject in [1] and motion in [2]. 
      
### [74] "fBodyAccJerk-std()-Z.average" 
- class: numeric
- This variable contains the average of the standard deviation of frequency value of the body acceleration in Z-axis for the subject in [1] and motion in [2]. 
      
### [75] "fBodyGyro-std()-X.average"     
- class: numeric
- This variable contains the average of the standard deviation of jerk value of the body acceleration frequency domain value in X-axis for the subject in [1] and motion in [2]. 
    
### [76] "fBodyGyro-std()-Y.average"    
- class: numeric
- This variable contains the average of the standard deviation of jerk value of the body acceleration frequency domain value in Y-axis for the subject in [1] and motion in [2]. 
    
### [77] "fBodyGyro-std()-Z.average"  
- class: numeric
- This variable contains the average of the standard deviation of jerk value of the body acceleration frequency domain value in Z-axis for the subject in [1] and motion in [2]. 
       
### [78] "fBodyAccMag-std().average"  
- class: numeric
- This variable contains the average of the standard deviation of magnitude (Euclidean norm) of the body acceleration frequency domain signal for the subject in [1] and motion in [2]. 
       
### [79] "fBodyBodyAccJerkMag-std().average"
- class: numeric
- This variable contains the average of the standard deviation of magnitude (Euclidean norm) of the body jerk frequency domain signal for the subject in [1] and motion in [2]. 
      
### [80] "fBodyBodyGyroMag-std().average"    
- class: numeric
- This variable contains the average of the standard deviation of magnitude (Euclidean norm) of the body angular velocity frequency domain signal for the subject in [1] and motion in [2]. 
   
### [81] "fBodyBodyGyroJerkMag-std().average"  
- class: numeric
- This variable contains the average of the standard deviation of magnitude (Euclidean norm) of the body angular velocity jerk frequency domain signal for the subject in [1] and motion in [2]. 
  
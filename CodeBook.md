---
title: "CodeBook.md"
author: "demetr"
date: "26 сентября 2015 г."
output: html_document
---
## Description from original dataset:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


## Tiny dataset

Analysis of this data was performed by script run_analysis.R. You can read instructions how to use it in README.md.

Here is the description of all variables in the resulted dataset:

* `Subject` - id of subject who perform activity. Possible values: 1..30.
* `Activity` - type of activity. All further variables was calculated as average of all measurments by subject and activity. Possible values: 
  * `WALKING`
  * `WALKING_UPSTAIRS`
  * `WALKING_DOWNSTAIRS`
  * `SITTING`
  * `STANDING`
  * `LAYING`
* `tBodyAcceleration_Mean_X` - body linear acceleration by X, mean value
* `tBodyAcceleration_Mean_Y` - body linear acceleration by Y, mean value
* `tBodyAcceleration_Mean_Z` - body linear acceleration by Z, mean value
* `tGravityAcceleration_Mean_X` - gravity linear acceleration by X, mean value
* `tGravityAcceleration_Mean_Y` - gravity linear acceleration by Y, mean value
* `tGravityAcceleration_Mean_Z` - gravity linear acceleration by Z, mean value
* `tBodyAccelerationJerk_Mean_X` - body linear acceleration by X derived in time (Jerk signal), mean value
* `tBodyAccelerationJerk_Mean_Y` - body linear acceleration by Y derived in time (Jerk signal), mean value       
* `tBodyAccelerationJerk_Mean_Z` - body linear acceleration by Z derived in time (Jerk signal), mean value
* `tBodyAngularVelocity_Mean_X` - angular velocity by X, mean value
* `tBodyAngularVelocity_Mean_Y` - angular velocity by Y, mean value
* `tBodyAngularVelocity_Mean_Z` - angular velocity by Z, mean value
* `tBodyAngularVelocityJerk_Mean_X` - angular velocity by X derived in time (Jerk signal), mean value
* `tBodyAngularVelocityJerk_Mean_Y` - angular velocity by Y derived in time (Jerk signal), mean value
* `tBodyAngularVelocityJerk_Mean_Z` - angular velocity by Y derived in time (Jerk signal), mean value
* `tBodyAccelerationMagnitude_Mean` - body acceleration magnitude, mean value
* `tGravityAccelerationMagnitude_Mean` - gravity acceleration --> magnitude, mean value
* `tBodyAccelerationJerkMagnitude_Mean` - body acceleration magnitude derived in time (Jerk signal), mean value
* `tBodyAngularVelocityMagnitude_Mean` - angular velocity magnitude, mean value
* `tBodyAngularVelocityJerkMagnitude_Mean` - angular velocity derived in time --> magnitude, mean value
* `fBodyAcceleration_Mean_X` - body linear acceleration by X, mean value, after Fast Fourier Transform (FFT)
* `fBodyAcceleration_Mean_Y` - body linear acceleration by Y, mean value, after Fast Fourier Transform (FFT)
* `fBodyAcceleration_Mean_Z` - body linear acceleration by Z, mean value, after Fast Fourier Transform (FFT)
* `fBodyAccelerationJerk_Mean_X` - body linear acceleration by X derived in time (Jerk signal), mean value, after Fast Fourier Transform (FFT)
* `fBodyAccelerationJerk_Mean_Y` - body linear acceleration by Y derived in time (Jerk signal), mean value, after Fast Fourier Transform (FFT)
* `fBodyAccelerationJerk_Mean_Z` - body linear acceleration by Z derived in time (Jerk signal), mean value, after Fast Fourier Transform (FFT)
* `fBodyAngularVelocity_Mean_X` - angular velocity by X, mean value, after Fast Fourier Transform (FFT)
* `fBodyAngularVelocity_Mean_Y` - angular velocity by Y, mean value, after Fast Fourier Transform (FFT)
* `fBodyAngularVelocity_Mean_Z` - angular velocity by Z, mean value, after Fast Fourier Transform (FFT)
* `fBodyAccelerationMagnitude_Mean` - body acceleration magnitude, mean value, after Fast Fourier Transform (FFT)
* `fBodyBodyAccelerationJerkMagnitude_Mean` - body linear acceleration derived in time (Jerk signal) --> magnitude, mean value, after Fast Fourier Transform (FFT)
* `fBodyBodyAngularVelocityMagnitude_Mean` - angular velocity magnitude, mean value, after Fast Fourier Transform (FFT)
* `fBodyBodyAngularVelocityJerkMagnitude_Mean` - angular velocity derived in time --> magnitude, mean value, after Fast Fourier Transform (FFT)
* `tBodyAcceleration_StandatdDeviation_X` - body linear acceleration by X, standard deviation
* `tBodyAcceleration_StandatdDeviation_Y` - body linear acceleration by Y, standard deviation
* `tBodyAcceleration_StandatdDeviation_Z` - body linear acceleration by Z, standard deviation
* `tGravityAcceleration_StandatdDeviation_X` - gravity linear acceleration by X, mean value
* `tGravityAcceleration_StandatdDeviation_Y` - gravity linear acceleration by Y, standard deviation
* `tGravityAcceleration_StandatdDeviation_Z` - gravity linear acceleration by Z, standard deviation
* `tBodyAccelerationJerk_StandatdDeviation_X` - body linear acceleration by X derived in time (Jerk signal), standard deviation
* `tBodyAccelerationJerk_StandatdDeviation_Y` - body linear acceleration by Y derived in time (Jerk signal), standard deviation
* `tBodyAccelerationJerk_StandatdDeviation_Z` - body linear acceleration by Z derived in time (Jerk signal), standard deviation
* `tBodyAngularVelocity_StandatdDeviation_X` - angular velocity by X, standard deviation
* `tBodyAngularVelocity_StandatdDeviation_Y` - angular velocity by Y, standard deviation
* `tBodyAngularVelocity_StandatdDeviation_Z` - angular velocity by Z, standard deviation
* `tBodyAngularVelocityJerk_StandatdDeviation_X` - angular velocity by X derived in time (Jerk signal), standard deviation
* `tBodyAngularVelocityJerk_StandatdDeviation_Y` - angular velocity by Y derived in time (Jerk signal), standard deviation
* `tBodyAngularVelocityJerk_StandatdDeviation_Z` - angular velocity by Z derived in time (Jerk signal), standard deviation
* `tBodyAccelerationMagnitude_StandatdDeviation` - body acceleration magnitude, standard deviation
* `tGravityAccelerationMagnitude_StandatdDeviation` - gravity acceleration --> magnitude, standard deviation
* `tBodyAccelerationJerkMagnitude_StandatdDeviation` - body acceleration magnitude derived in time (Jerk signal), standard deviation
* `tBodyAngularVelocityMagnitude_StandatdDeviation` - angular velocity magnitude, standard deviation
* `tBodyAngularVelocityJerkMagnitude_StandatdDeviation` - angular velocity derived in time --> magnitude, standard deviation
* `fBodyAcceleration_StandatdDeviation_X` - body linear acceleration by X, standard deviation, after Fast Fourier Transform (FFT)
* `fBodyAcceleration_StandatdDeviation_Y` - body linear acceleration by Y, standard deviation, after Fast Fourier Transform (FFT)
* `fBodyAcceleration_StandatdDeviation_Z` - body linear acceleration by Z, standard deviation, after Fast Fourier Transform (FFT)
* `fBodyAccelerationJerk_StandatdDeviation_X` - body linear acceleration by X derived in time (Jerk signal), standard deviation, after Fast Fourier Transform (FFT)
* `fBodyAccelerationJerk_StandatdDeviation_Y` - body linear acceleration by Y derived in time (Jerk signal), standard deviation, after Fast Fourier Transform (FFT)
* `fBodyAccelerationJerk_StandatdDeviation_Z` - body linear acceleration by Z derived in time (Jerk signal), standard deviation, after Fast Fourier Transform (FFT)
* `fBodyAngularVelocity_StandatdDeviation_X` - angular velocity by X, standard deviation, after Fast Fourier Transform (FFT)
* `fBodyAngularVelocity_StandatdDeviation_Y` - angular velocity by Y, standard deviation, after Fast Fourier Transform (FFT)
* `fBodyAngularVelocity_StandatdDeviation_Z` - angular velocity by Z, standard deviation, after Fast Fourier Transform (FFT)
* `fBodyAccelerationMagnitude_StandatdDeviation` - body acceleration magnitude, standard deviation, after Fast Fourier Transform (FFT)
* `fBodyBodyAccelerationJerkMagnitude_StandatdDeviation` - body linear acceleration derived in time (Jerk signal) --> magnitude, standard deviation, after Fast Fourier Transform (FFT)
* `fBodyBodyAngularVelocityMagnitude_StandatdDeviation` - angular velocity magnitude, standard deviation, after Fast Fourier Transform (FFT)
* `fBodyBodyAngularVelocityJerkMagnitude_StandatdDeviation` - angular velocity derived in time --> magnitude, standard deviation, after Fast Fourier Transform (FFT)
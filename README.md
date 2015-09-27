---
title: "README"
author: "demetr"
date: "26 сентября 2015 г."
output: html_document
---

# General information

This repository contains toolset to download and clean data "Human Activity Recognition Using Smartphones Data Set".

There are several files here:

* CodeBook.md - contains information about variables (default filtering)
* README.md - this file, contains general information, information how to run script and how to change settings
* run_analysis.R - script file

## Here is the description of the initial dataset:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

# Script file how to

* Script requires `data.table` package. Please install it prior to analysis.
* By the purpose of course project you can get tiny dataset by entering following commands:
```R
source("run_analysis.R")
data <- getTinyActivityData()
```
This commands will trigger download, merging and filtering dataset and applying mean to all filtered variables except Subject and Activity. In result you will have wide dataset with variables described in CodeBook.md.

* By default script uses activity_data folder to download and unpack data. You can change this by setting free variable `activityData.DataDir`.
* Free variable `activityData.URL` keeps link to downloading data. You are free to change it.
* In case you already downloaded dataset you can skip download phase by defining `activityData.ArchiveName` and `activityData.DataSetPath` free variables and setting parameter `skipDownloading` to TRUE:
```R
source("run_analysis.R")
activityData.ArchiveName <- "./activity_data/HAR Dataset [2015-09-26].zip"
activityData.DataSetPath <- "./activity_data/data_set[2015-09-26]/"
data <- getTinyActivityData(skipDownloading = TRUE)
```
* Also you can skip unpacking phase as well by defining `activityData.DataSetPath` and setting both `skipDownloading` and `skipUnpacking` to TRUE:
```R
source("run_analysis.R")
activityData.DataSetPath <- "./activity_data/data_set[2015-09-26]/"
data <- getTinyActivityData(skipDownloading = TRUE, skipUnpacking = TRUE)
```
* Parameter `columnFilter` can be used to override default filtering options. I.e.  
```R
getTinyActivityData(columnFilter = c("WeightedAverageFrequency"))
```
will return information about "weighted average of the frequency components to obtain a mean frequency" (filtered by default).

* Parameter FUN can be used to override applied function.

## Other useful functions:
* `getAllVariables` can be used to read all variables from paticular dataset:
```R
test <- getAllVariables("test")
```
* `decorateMeasurment` and `interialSignalColumnNameDecorator` can be overriden in case you want to change variables naming.
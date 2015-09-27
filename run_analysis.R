require(data.table)

# Human Activity Recognition Using Smartphones Data Set URL.
activityData.URL = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# This dir will be used for keeping data.
activityData.DataDir = "./activity_data"

# Path to downloaded data.
activityData.DataSetPath = character()
# Date of the last syncing.
activityData.SyncTime = Sys.Date()

###############################################################################################
# Templates
###############################################################################################
# e.g. activity_data/data_set[2015-09-10]/UCI HAR Dataset/features.txt
activityData.pathTemplate.features = "%1$s/UCI HAR Dataset/features.txt"
# e.g. activity_data/data_set[2015-09-10]/UCI HAR Dataset/activity_labels.txt
activityData.pathTemplate.activityLabels = "%1$s/UCI HAR Dataset/activity_labels.txt"
# e.g. activity_data/data_set[2015-09-10]/UCI HAR Dataset/test/X_test.txt
activityData.pathTemplate.X = "%1$s/UCI HAR Dataset/%2$s/X_%2$s.txt"
# e.g. activity_data/data_set[2015-09-10]/UCI HAR Dataset/test/y_test.txt
activityData.pathTemplate.y = "%1$s/UCI HAR Dataset/%2$s/y_%2$s.txt"
# e.g. activity_data/data_set[2015-09-10]/UCI HAR Dataset/test/subject_test.txt
activityData.pathTemplate.subject = "%1$s/UCI HAR Dataset/%2$s/subject_%2$s.txt"
# e.g. activity_data/data_set[2015-09-10]/UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt
activityData.pathTemplate.inertialSignals = "%1$s/UCI HAR Dataset/%2$s/Inertial Signals/%3$s_%4$s_%2$s.txt"

###############################################################################################
# Support functions
###############################################################################################

# Downloads and unzips data pointed by activityData.URL
downloadActivityData <- function() {
  dir.create("./activity_data", showWarnings = FALSE)
  activityData.SyncTime <<- Sys.Date()
  
  activityData.ArchiveName <- paste(
    activityData.DataDir,
    "/HAR Dataset [", 
    as.character(activityData.SyncTime),
    "].zip",
    sep = "")
  download.file(activityData.URL, activityData.ArchiveName)

  activityData.DataSetPath <<- paste(
    activityData.DataDir,
    "/data_set[", 
    as.character(activityData.SyncTime),
    "]/",
    sep = "")
  
  unzip(activityData.ArchiveName, exdir = activityData.DataSetPath, setTimes = TRUE)
}

# This function is used to merge all values in paticular dataset to the one data.frame
# Arguments:
# dataset - dataset name
# inertialSignals.type - extracted types
# inertialSignals.dimension - extracted dimension
getAllVariables <- function(dataset = character(),
                            inertialSignals.type = c("body_acc", "body_gyro", "total_acc"),
                            inertialSignals.dimension = c("x", "y", "z")) {
  signals <- getSubject(dataset)
  signals <- cbind(signals, getActivityDataY(dataset))
  signals <- cbind(signals, getActivityDataX(dataset))
  for (type in inertialSignals.type) {
    for (dimension in inertialSignals.dimension) {
      signal <- getInterialSignal(dataset, type, dimension)
      signals <- cbind(signals, signal)
    }
  }
  signals
}

# Extracts all features.
getActivityDataX  <- function(dataset = character()) {
  fileName <- sprintf(activityData.pathTemplate.X,
                      activityData.DataSetPath,
                      dataset)
  message("Reading ", fileName)
  activityDataX <- read.table(fileName)
  
  fileName <- sprintf(activityData.pathTemplate.features,
                      activityData.DataSetPath)
  message("Reading ", fileName)
  features <- read.table(fileName)
  
  setnames(activityDataX, decorateMeasurment(as.character(features[[2]])))
  activityDataX
}

decorateMeasurment <- function(columnName = character()) {
  decoratedColumnName <- gsub("mean()", "Mean", columnName, fixed = TRUE)
  decoratedColumnName <- gsub("std()", "StandatdDeviation", decoratedColumnName, fixed = TRUE)
  decoratedColumnName <- gsub("mad()", "MedianAbsoluteDeviation", decoratedColumnName, fixed = TRUE)
  decoratedColumnName <- gsub("max()", "Max", decoratedColumnName, fixed = TRUE)
  decoratedColumnName <- gsub("min()", "Min", decoratedColumnName, fixed = TRUE)
  decoratedColumnName <- gsub("sma()", "SignalMagnitudeArea", decoratedColumnName, fixed = TRUE)
  decoratedColumnName <- gsub("energy()", "Energy", decoratedColumnName, fixed = TRUE)
  decoratedColumnName <- gsub("iqr()", "InterquartileRange", decoratedColumnName, fixed = TRUE)
  decoratedColumnName <- gsub("entropy()", "SignalEntropy", decoratedColumnName, fixed = TRUE)
  decoratedColumnName <- gsub("arCoeff()", "AutorregresionCoefficients", decoratedColumnName, fixed = TRUE)
  decoratedColumnName <- gsub("correlation()", "CorrelationCoefficient", decoratedColumnName, fixed = TRUE)
  decoratedColumnName <- gsub("maxInds()", "IndexFrequency", decoratedColumnName, fixed = TRUE)
  decoratedColumnName <- gsub("meanFreq()", "WeightedAverageFrequency", decoratedColumnName, fixed = TRUE)
  decoratedColumnName <- gsub("skewness()", "SkewnessFrequency", decoratedColumnName, fixed = TRUE)
  decoratedColumnName <- gsub("kurtosis()", "KurtosisFrequency", decoratedColumnName, fixed = TRUE)
  decoratedColumnName <- gsub("bandsEnergy()", "EnergyFrequency", decoratedColumnName, fixed = TRUE)
  decoratedColumnName <- gsub("angle", "Angle", decoratedColumnName, fixed = TRUE)

  decoratedColumnName <- gsub("Acc", "Acceleration", decoratedColumnName, fixed = TRUE)
  decoratedColumnName <- gsub("Gyro", "AngularVelocity", decoratedColumnName, fixed = TRUE)
  decoratedColumnName <- gsub("Mag", "Magnitude", decoratedColumnName, fixed = TRUE)
  
  decoratedColumnName <- gsub("-", "_", decoratedColumnName, fixed = TRUE)
}

# Extracts activity data (and set descriptive activity names).
getActivityDataY  <- function(dataset = character()) {
  fileName <- sprintf(activityData.pathTemplate.y,
                      activityData.DataSetPath,
                      dataset)
  message("Reading ", fileName)
  activityDataY <- read.table(fileName)
  
  fileName <- sprintf(activityData.pathTemplate.activityLabels,
                      activityData.DataSetPath)
  message("Reading ", fileName)
  activityLabels <- read.table(fileName)
  activityLabels <- as.character(activityLabels[[2]])
  activityDataY[1] <- factor(activityDataY[[1]], labels = activityLabels)
  
  setnames(activityDataY, c("Activity"))
  activityDataY
}

# Extracts information about tested subjects.
getSubject <- function(dataset, inertialSignals.type, inertialSignals.dimension) {
  fileName <- sprintf(activityData.pathTemplate.subject,
                      activityData.DataSetPath,
                      dataset)
  message("Reading ", fileName)
  subject <- read.table(fileName)
  setnames(subject, c("Subject"))
  subject
}

# Extracts all interial signals data.
getInterialSignal <- function(dataset, inertialSignals.type, inertialSignals.dimension) {
  fileName <- sprintf(activityData.pathTemplate.inertialSignals,
          activityData.DataSetPath,
          dataset,
          inertialSignals.type,
          inertialSignals.dimension)
  message("Reading ", fileName)
  signal <- read.table(fileName)
  setnames(signal, sapply(
    colnames(signal),
    function(x) interialSignalColumnNameDecorator(inertialSignals.type, inertialSignals.dimension, x)))
  signal
}

# Rename settings 

activityData.columnNameTemplate.inertialSignals.type <- list(
  body_acc = "AccelerationSignalWithoutGravity",
  body_gyro = "AngularVelocity",
  total_acc = "AccelerationSignal")

interialSignalColumnNameDecorator <- function(inertialSignals.type, inertialSignals.dimension, colName) {
  paste(
    activityData.columnNameTemplate.inertialSignals.type[[inertialSignals.type]],
    "Axis",
    inertialSignals.dimension,
    colName,
    sep = "_")
}

# Filters data frame to keep only columns we need.
filterActivityData <- function(data = data.frame(), activityData.filter) {
  names <- colnames(data)
  colToFilter <- c("Subject", "Activity")
  for (filter in activityData.filter) {
    colToFilter <- append(colToFilter, names[grepl(filter, names, fixed = T)])
  }
  data[colToFilter]
}

# Main function.
# parameters:
# skipDownloading - if you want to skip downloading 
# columnFilter - which columns should be in resulted data.frame
# FUN - any function to be calculated by subject and activity
getTinyActivityData <- function(skipDownloading = FALSE, columnFilter = c("_Mean", "StandatdDeviation"), FUN = mean) {
  
  if (!skipDownloading) {
    downloadActivityData()
  }
  
  test <- getAllVariables("test")
  train <- getAllVariables("train")
  
  allData <- rbind(test, train)
  
  filteredData <- filterActivityData(allData, activityData.filter = columnFilter)
  
  means <- data.table(filteredData)[, lapply(.SD, FUN), by = c("Subject", "Activity")]
}
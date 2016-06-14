run_analysis <- function(){

	setwd("UCI HAR Dataset/test")

	##Read test data
	datatest <- data.frame(read.table("X_test.txt"))

	##Read test labels
	labeltest <- data.frame(read.table("y_test.txt"))

	##Read test subjects
	subjecttest <- data.frame(read.table("subject_test.txt"))

	setwd("../train")

	##Read train data
	datatrain <- data.frame(read.table("X_train.txt"))

	##Read train labels
	labeltrain <- data.frame(read.table("y_train.txt"))

	##Read train subjects
	subjecttrain <- data.frame(read.table("subject_train.txt"))

	##1. Merges the training and the test sets to create one data set
	mydata <- rbind(datatest, datatrain) 

	mylabels <- rbind(labeltest, labeltrain)
	mysubjects <- rbind(subjecttest, subjecttrain)

	##Read features (measures)
	setwd("../")
	features <- data.frame(read.table("features.txt"))
	
	##Read activity labels
	activities <- data.frame(read.table("activity_labels.txt"))

	##2.Extracts only the measurements on the mean and standard deviation 
	##for each measurement.
	pattern <- "-mean()|-std()" 
	mydata <- mydata[,grep(pattern, features$V2)]

	##3.Uses descriptive activity names to name the activities 
	##in the data set
	datawithsubjects <- cbind(mysubjects, mydata)
	datawithlabels <- cbind(mylabels,datawithsubjects )
	
	names(datawithlabels)[1] <- "activity"
	names(datawithlabels)[2] <- "subject"
	datawithlabels$activity <- activities$V2[ match(datawithlabels$activity, activities$V1)]


	#4.Appropriately labels the data set with descriptive variable names. 
	variables <- features$V2[grep(pattern, features$V2)]
	variables <- gsub("()","",variables)
	names(datawithlabels)[3:ncol(datawithlabels)] <- variables

	##5.From the data set in step 4, creates a second, 
	##independent tidy data set with the average of each variable 
	##for each activity and each subject
	
	newdata <- aggregate( formula = .~activity+subject, data=datawithlabels, FUN =mean)
	names(newdata) <- names(datawithlabels)

	##Output:
	newdata
	
}
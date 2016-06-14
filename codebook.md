run_analysis.R does the following:
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Variables:
mydata : initial data combining both test and train data sets
datawithsubjects : enlarged (added column) dataset with the subject information
datawithlabels: enlarged dataset (added column) with activity information in addition to the data with subjects
newdata : the tidy dataset containing mean of all variables grouped by activity and subject. This data is the output of the run_analysis.R

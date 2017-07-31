# DataCleaningAssignment
Final course project for the Getting and Cleaning Data Coursera course. 

The R script, run_analysis.R, runs the code that retieves and processses the data. It does the following:

* Retrieves dataset from directory that has the folder with the dataset
* Gets the training and test data within the folder properly labeled
* binds/merges the training and test data and then gets only the mean and std required
* Creates tidy datasets that consist of the average (mean) value of each variable for each subject and activity pair and also the mean of the activities per subject

  The end result is shown in the file tidy.txt and averages.txt
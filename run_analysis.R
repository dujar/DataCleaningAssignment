#The submitted data set is tidy.
#The Github repo contains the required scripts.
#GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
#The README that explains the analysis files is clear and understandable.
#The work submitted for this project is the work of the student who submitted it.


#Merges the training and the test sets to create one data set.
#Extracts only the measurements on the mean and standard deviation for each measurement.
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names.
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


test <- list.files("./UCI HAR Dataset/test")

test.f <- list.files("./UCI HAR Dataset/test/Inertial Signals")
test.f

train <- list.files("./UCI HAR Dataset/train")
train.f <- list.files("./UCI HAR Dataset/train/Inertial Signals")
train.f
pathtest <- "./UCI HAR Dataset/test/Inertial Signals"
pathtrain <- "./UCI HAR Dataset/train/Inertial Signals"

for (i in 1:length(train.f)){
  assign(train.f[i], data.table(read.table(paste(pathtrain,train.f[i],sep="/"))))
}

body_acc_x_train.txt
?read.table

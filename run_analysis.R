#The submitted data set is tidy.
#The Github repo contains the required scripts.
#GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
#The README that explains the analysis files is clear and understandable.
#The work submitted for this project is the work of the student who submitted it.

library(data.table)
library(reshape2)
# Read files. Must have data in working directory.
test.d <- list.files("./UCI HAR Dataset/test")[-1]
train.d <- list.files("./UCI HAR Dataset/train")[-1]
pathtest <- "./UCI HAR Dataset/test/"
pathtrain <- "./UCI HAR Dataset/train/"

#Extracts only the measurements on the mean and standard deviation for each measurement.
for(i in 1:length(train.d)){
  assign(gsub(".txt","",train.d[i]), data.table(read.table(paste(pathtrain,train.d[i],sep=""),stringsAsFactors = F)))
  assign(gsub(".txt","",test.d[i]), data.table(read.table(paste(pathtest,test.d[i],sep=""),stringsAsFactors = F)))
}
features        <- data.table(read.table("./UCI HAR Dataset/features.txt",stringsAsFactors = F))
activity_labels <- data.table(read.table("./UCI HAR Dataset/activity_labels.txt",stringsAsFactors = F))

# Use descriptive activity names to name the activities in the data set
activity_train <- data.table(Activity = activity_labels$V2[y_train[,V1]])
activity_test  <- data.table(Activity = activity_labels$V2[y_test[,V1]])

# Appropriately labels the data set with descriptive variable names. 
names(subject_train) <- "Subject"
names(subject_test) <- "Subject"
names(X_train) <- features[,V2]
names(X_test) <- features[,V2]
#binding the data together
library(dplyr)

train <- bind_cols(subject_train, activity_train, X_train)
test  <- bind_cols(subject_test, activity_test, X_test)

# Merge the training and the test sets to create one data set.
data  <- rbind(train, test)

# Extract only the measurements on the mean and standard deviation for each measurement. 
# - get columns with names containing "mean()" or "std()"
cols <- c(1,2, grep("(mean|std)\\(\\)", colnames(data)))
tidyData <- data[,cols, with=F]
write.table(tidyData, file="tidydata.txt", row.name=FALSE) 

# Create a second, independent tidy data set with the average of each variable for each activity and each subject.
avgdata <- tidyData[,lapply(.SD,mean,na.rm=T),by=c("Subject","Activity")]
write.table(avgdata, file="averages.txt", row.name=FALSE) 


#







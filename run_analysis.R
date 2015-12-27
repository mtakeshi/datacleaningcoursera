#set directory
setwd("./UCI HAR Dataset")
#package
install.packages("data.table")
library(data.table)
#load activity labels and features
act_labels <- read.table("./activity_labels.txt")[,2]
features <- read.table("./features.txt")[,2]
#logical vector with mean and std measurements
extracted_features <- grepl("mean|std", features)
#load x/y/subject tests
xtest <- read.table("./test/X_test.txt")
ytest <- read.table("./test/y_test.txt")
subj_test <- read.table("./test/subject_test.txt")
names(xtest) = features
#filter xtest extracting only mean/std measurements using logical vector
xtest <- xtest[,extracted_features]
#assign ytest labels
ytest[,2] <- act_labels[ytest[,1]]
names(ytest) = c("act_id", "act_label")
names(subj_test) = "subject"
#bind vectors
test <- cbind(as.data.table(subj_test), ytest, xtest)

#load x/y/subject trains
xtrain <- read.table("./train/X_train.txt")
ytrain <- read.table("./train/y_train.txt")
subj_train <- read.table("./train/subject_train.txt")
names(xtrain) = features
#filter xtrain extracting only mean/std measurements using logical vector
xtrain <- xtrain[,extracted_features]
#assign ytrain labels
ytrain[,2] <- act_labels[ytrain[,1]]
names(ytrain) = c("act_id", "act_label")
names(subj_train) = "subject"
#bind vectors
train <- cbind(as.data.table(subj_train), ytrain, xtrain)

#merge test and train
data = rbind(test, train)
labels = c("subject", "act_id", "act_label")
data_labels = setdiff(colnames(data), labels)
data2 = melt(data, id = labels, measure.vars = data_labels)
#apply mean to dataset with dcast
output_data = dcast(data2, subject + act_label ~ variable, mean)
#create output
write.table(output_data, file = "./output.txt", row.names = FALSE)

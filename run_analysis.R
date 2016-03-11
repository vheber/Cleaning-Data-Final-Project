# get data sets from current directory
dt1 <- read.table("X_test.txt", header = F)
y1 <- read.table("Y_test.txt", header = F)
sub1 <- read.table("subject_test.txt", header = F)
colnames(y1) <- "class"

dt2 <- read.table("X_train.txt", header = F)
y2 <- read.table("Y_train.txt", header = F)
sub2 <- read.table("subject_train.txt", header = F)
colnames(y2) <- "class"

dt3 <- read.table("features.txt", header = F)
dt4 <- read.table("activity_labels.txt", header = F)
colnames(dt4) <- c("class", "activity")

# Step 1 - Merge Training & Test Data Sets
dt5 <- rbind(dt1, dt2)

# Step 4 - Label the data set with descriptive variable names
colnames(dt5) <- dt3[,2]

# Step 2 - get columns that are mean() or std()
collist <- grepl("std[(][)]|mean[(][)]", dt3[,2])
dt6 <- dt5[,collist]

# Step 3 - Give the activities descriptive names
y3 <- rbind(y1, y2)
sub3 <- rbind(sub1, sub2)
colnames(sub3) <- "subject"

dt7 <- cbind(dt6, y3, sub3)
dt8 <- data.frame(dt7[,1:66], subject=dt7[,68], activity=dt4[match(dt7$class, dt4$class), 2])

# Step 5 - Create a summary of average of each variable/activity/subject
dt9 <- aggregate(dt8[,1:66], dt8[,67:68], mean)

# Step 6 - write data table as .txt file
write.table(dt9, file="meanresults.txt", row.name = FALSE)
# Cleaning-Data-Final-Project

## How the script works (run_analysis.R) 
First, it reads the data, activities, and subject labels from the working directory with read.table() and colnames().  
Then it combines the Training and Test data sets with rbind().  
Then it labels the combined data set with variable names from features.txt by using colnames().  
Next, it subsets only the columns for mean() and std() measurements by using grepl().  
Then it labels the activities by name, using rbind().  
Next, it takes the mean of each column for each subject and activity, by using aggregate() and mean().  
Finally, it writes the resulting data table as meanresults.txt, using write.table() and row.name = FALSE.  

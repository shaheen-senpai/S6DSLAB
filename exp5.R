# Load required libraries
library(dplyr)

# Step 1: Combine two sample data frames using merge()
# Sample data frames
df1 <- data.frame(ID = c(1, 2, 3, 4, 5),
                  Name = c("John", "Alice", "Bob", "Charlie", "David"),
                  Age = c(25, 30, 35, 40, 45))
df1

df2 <- data.frame(ID = c(3, 4, 5, 6, 7),
                  Gender = c("M", "F", "M", "F", "M"),
                  Salary = c(50, 55, 60, 65, 70))
df2

# Merge data frames by "ID" column
merged_df <- merge(df1, df2, by = "ID")
merged_df

# Step 2: Find the factorial of row sum and write it to a text file
# Calculate row sum and factorial
merged_df$row_sum <- rowSums(merged_df[, c("Age", "Salary")])
merged_df$factorial <- factorial(merged_df$row_sum)

# Write the merged data frame to a text file
write.table(merged_df, file = "merged_data.txt", sep = "\t", row.names = FALSE)

# Step 3: Use apply() to find the max value of each row and column
# Find max value of each row
row_max <- apply(merged_df[, c("Age", "Salary")], 1, max)

# Find max value of each column
col_max <- apply(merged_df[, c("Age", "Salary")], 2, max)

# Print the results
cat("Max value of each row:", row_max, "\n")
cat("Max value of each column:", col_max, "\n")

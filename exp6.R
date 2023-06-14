# Generate two vectors of data
x <- c(1, 2, 3, 4, 5)
y <- c(2, 4, 6, 8, 10)

# Calculate Pearson's correlation coefficient
correlation <- cor(x, y, method = "pearson")

# Print the correlation coefficient
cat("cor ")
print(correlation)

# Calculate the variance of x
variance <- var(x)

# Print the variance
cat("variance ")
print(variance)

# Calculate the covariance between x and y
cat("co-variance ")
covariance <- cov(x, y)

# Print the covariance
print(covariance)

# Create a contingency table from two nominal variables
# (replace the data with your own nominal variables)
var1 <- c("A", "B", "A", "B", "A", "B")
var2 <- c("X", "Y", "Y", "X", "X", "Y")
table <- table(var1, var2)
print(table)

# Perform chi-squared test for association
result <- chisq.test(table)

# Print the result
print(result)


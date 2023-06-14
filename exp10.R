# Sample dataset
x <- c(1, 2, 3, 4, 5)  # Independent variable
y <- c(3, 5, 7, 9, 11)  # Dependent variable

# Perform linear regression
model <- lm(y ~ x)

# Print the model summary
summary(model)

# Make predictions
new_x <- c(6, 7, 8)  # New values of x for prediction
predictions <- predict(model, data.frame(x = new_x))
print(predictions)

# Plot the data and regression line
plot(x, y, pch = 16, col = "blue", xlab = "x", ylab = "y", main = "Linear Regression")
abline(model, col = "red", lwd = 2)

# Add predicted values to the plot
points(new_x, predictions, pch = 16, col = "green")
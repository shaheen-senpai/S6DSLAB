# Load the required libraries
library(dplyr)
library(ggplot2)

# Create sample data
set.seed(123)
n <- 100  # Number of observations
x1 <- rnorm(n)  # Independent variable 1
x2 <- rnorm(n)  # Independent variable 2
y <- rbinom(n, 1, plogis(2 + x1 - x2))  # Dependent variable (binary)
data <- data.frame(x1, x2, y)
head(data)

# Fit logistic regression model
model <- glm(y ~ x1 + x2, data = data, family = binomial)

# Print the model summary
summary(model)

# Make predictions on new data
new_data <- data.frame(x1 = c(1.2, -0.5), x2 = c(3.8, -0.3))
predictions <- predict(model, newdata = new_data, type = "response")

# Display the predictions
print(predictions)

# Add predictions to the original data frame
data$predicted <- predict(model, type = "response")

# Visualize the data and decision boundary
ggplot(data, aes(x = x1, y = x2, color = factor(y))) +
  geom_point() +
  geom_point(data = new_data, aes(x = x1, y = x2), color = "black", size = 3, shape = 4) +
  geom_abline(intercept = coef(model)["(Intercept)"] / (-coef(model)["x2"]),
              slope = -coef(model)["x1"] / coef(model)["x2"],
              linetype = "dashed") +
  scale_color_manual(values = c("blue", "red"), labels = c("0", "1")) +
  labs(title = "Logistic Regression", x = "x1", y = "x2")

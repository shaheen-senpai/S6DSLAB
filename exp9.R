# Generate sample data
set.seed(123)
x <- cbind(x1 = rnorm(50, 0, 3), x2 = rnorm(50, 0, 3))
head(x)

# Number of clusters
k <- 3

# Run k-means algorithm
result <- kmeans(x, centers = k)

# Add cluster assignments to the data
x <- data.frame(x, cluster = factor(result$cluster))
head(x)

# Print the final cluster assignments and centroids
cat("Cluster Assignments:", result$cluster, "\n")
cat("Centroids:", result$centers, "\n")

# Create scatter plot
ggplot(data = as.data.frame(x), aes(x = x1, y = x2, color = cluster)) +
geom_point(size = 3) +
scale_color_manual(values = c("blue", "red", "green")) +
labs(title = "K-means Clustering", x = "X1", y = "X2")

# Create scatter plot
plot(x$x1, x$x2, col = x$cluster, pch = 16, main = "K-means Clustering", xlab = "X1", ylab = "X2")
legend("topleft", legend = levels(x$cluster), col = c("blue", "red", "green"), pch = 16)

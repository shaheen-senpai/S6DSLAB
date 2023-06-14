library(datasets)
library(caTools)
library(party)
library(dplyr)
library(magrittr)
 
data("readingSkills")
head(readingSkills)

# Split the data into training and test sets
sample_data = sample.split(readingSkills, SplitRatio = 0.8)
train_data <- subset(readingSkills, sample_data == TRUE)
test_data <- subset(readingSkills, sample_data == FALSE)

# Create a decision tree model
model<- ctree(nativeSpeaker ~ ., train_data)
plot(model)

# Make predictions on the test set
# testing the people who are native speakers and those who are not
predict_model<-predict(model, test_data)
print(predict_model)

# creates a table to count how many are classified as native speakers and how many are not
m_at <- table(test_data$nativeSpeaker, predict_model)
m_at

# Calculate the accuracy of the model
ac_Test <- sum(diag(m_at)) / sum(m_at)
print(paste('Accuracy for test is found to be', ac_Test))



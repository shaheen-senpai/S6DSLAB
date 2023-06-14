library(caTools)
library(e1071)
library(ggplot2)


dataset = read.csv('/home/oem/shaheen/Social_Network_Ads.csv')
head(dataset)

# Taking columns 3-5
dataset = dataset[3:5]
head(dataset)

# Encoding the target feature as factor
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

# split the dataset into training and test sets
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)

training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# svm classifier
classifier = svm(formula = Purchased ~ .,
                 data = training_set,
                 type = 'C-classification',
                 kernel = 'linear')


y_pred = predict(classifier, newdata = test_set[-3])
head(y_pred)


# Making the Confusion Matrix
cm = table(test_set[, 3], y_pred)
cm

# ploting the training set results
ggplot() +
  geom_point(aes(x = training_set$Age, y = training_set$EstimatedSalary,
                 color = training_set$Purchased),
             data = training_set) +
  scale_color_manual(values = c('red', 'green')) +
  geom_abline(intercept = classifier$coefs[1],
              slope = classifier$coefs[2],
              color = 'blue') +
  ggtitle('SVM (Training set)') +
  xlab('Age') +
  ylab('Estimated Salary')


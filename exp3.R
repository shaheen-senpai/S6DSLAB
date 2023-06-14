data <- read.csv("/home/oem/shaheen/demo.csv")
getmode <- function(v) {  #mode function
   uniqv <- unique(v)
   uniqv[which.max(tabulate(match(v, uniqv)))]
}

print(mean(data$number))
print(median(data$number))
print(getmode(data[['sex']]))
print(var(data$age))
print(sd(data$age))
print(fivenum(data$age))

#boxplot(x, data, notch, varwidth, names, main)
boxplot(data$number,data$age)

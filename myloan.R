gewwd()
setwd("C:/R/R_workspace")
data <-read.csv("myloan.csv", header=TRUE)


View(data)

install.packages("reshape")
library(reshape)

set.seed(234567)

datasplit <- sample(2, nrow(data), replace=TRUE, prob=c(0.7, 0.3))

trainData <- data[datasplit==1,]

testData <- data[datasplit==2,]

rawData <- Response ~ Age + Experience + Income +CCAvg + Family + Mortgage

trainModel <- ctree(rawData, data=trainData)
table(predict(trainModel), trainData$Response)
print(trainModel)

plot(trainModel)
plot(trainModel, type="simple")


testModel <- predict(trainModel, newdata=testData)
table(testModel, testData$Response)

getwd()
setwd("C:/R/R_workspace")
data <-read.csv("mydata_classification.csv", header=FALSE)

View(data)


install.packages("reshape")
library(reshape)

data <- rename(data, c(V1="total", V2="price", V3="period", V4="variety", V5="response"))
View(data)

#원본 데이터에서 7:3으로 70(학습데이터) 30(검증데이터)그룹에서 샘플링시 랜덤한 데이터가 그룹핑되도록 만들기위해 초기값을 설정해줍니다.
#메모리에 랜던함수에서 난수값 설정시 초기값을 설정해 줍니다.
set.seed(1234)

#원하는 스타일로 부분집합 추출,
#2는 2개로 나눌때 data의 데이터를 prob(확률)로 70, 30%로 나누기
datasplit <- sample(2, nrow(data), replace=TRUE, prob=c(0.7, 0.3))
#1번째 그룹의 데이터를 trainD로 저장
trainData <- data[datasplit==1,]
#2변째 그룹의 데이터를 
testData <- data[datasplit==2,]

#반응여부를 총거래 금액 + 가격 + 기간 + 상품구매 다양성을 가지고 구해달라는 공식
#~ total + price + period+ variety: ~(틸드기호) 우측에 영향변수/종속변수/설명변수
#response: 결과변수
rawData <- response ~ total + price + period+ variety

#trainD 의 70%데이터로 학습
trainModel <- ctree(rawData, data=trainData)
table(predict(trainModel), trainData$response)
print(trainModel)


plot(trainModel)
plot(trainModel, type="simple")


testModel <- predict(trainModel, newdata=testData)

table(testModel, testData$response)


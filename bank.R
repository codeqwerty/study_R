getwd()
setwd("C:/R/R_workspace")

#데이터 읽어오기
bank <- read.csv("bank.csv", header=F)
View(bank)

#reshape패키지 설치 및 로드
install.packages("reshape")
library(reshape)

#자동으로 붙여주는 header의 이름을 변경
result <- rename(bank, c(V1="sales", V2="adevent", V3="admodel", V4="adcost"))
View(result)


plot(result)
#상관분석, Correlation
cor(result, method="pearson")

#Correlation Diagram
install.packages("corrgram")
library(corrgram)


corrgram(result)
corrgram(result, upper.panel=panel.conf)
corrgram(result, lower.panel=panel.conf)
#0.8이상 나와야 관련이 높다고 할 수 있습니다.
#0.6 어느정도 있다.
#0.4 관련이 낮다
#0.4 이하는 관련없다.


install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)
chart.Correlation(result, histogram=, pch="+")

#sales: 종속변수
#~: 틸드
#adevent + admodel + adcost: 설명변수
#data=result: result 데이터 사용

out <- lm(sales ~ adevent + admodel + adcost, data=result)
out
summary(out)

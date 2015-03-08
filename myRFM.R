getwd()

##계층적(탐색적) 군집분석

# 패키지 설치
install.packages("cluster")

#메모리로 로딩
library(cluster)

#데이터파일 읽어오기
data <- read.csv("myRFM.csv", header=TRUE)

#데이터 출력
View(data)

#hclust()기능함수로 군집분석
#dist:distance(거리), 비슷한 속성은 가깝게, 이질속성은 멀게 위치시킴
#method="ave": 평균거리
result2 <- hclust(dist(data), method="ave")
result2
# 군집분석 데이터를 그래프로 표시
plot(result2, hang=-1, labels=result2$ID)
result2$order



##K-means 비계층적(확인적) 군집분석

#4개의 그룹으로 군집을 나눠서 분석 
result3 <- kmeans(data, 4)
result3
result3$cluster
data$group <- result3$cluster
data
View(data)


plot(data[c("Frequency", "Monetary")], col=result3$cluster)
points(result3$centers[,c("Frequency", "Monetary")], col=1:3, pch=8, cex=2)



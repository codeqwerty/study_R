getwd()

### 파일 읽어들이기
data <- read.csv("mycustomer.csv", header=TRUE)
data

dim(data)
View(data)
plot(data)
names(data)

### 인구통계학 변수만 추출
#두개변수만 별도 선별해서 demo에 저장
demo <- data[c("gender", "age")]
demo <- data[c(1, 2)]
head(demo)

### 라이프스타일 변수만 추출
life <- data[c("family", "income", "marital", "education")]
life <- data[c(3:6)]
head(life)

### 구매이력(고객행동&고객성과) 변수만 추출
customer <- data[c("period", "mailing", "recent", "total")]
customer <- data[c(7:10)]
head(customer)


##### 구매이력 데이테에서 샘플링 100개 하는 방법
choice <- sample(1:nrow(customer), 100)
choice

#100명의 데이터
customer100 <- customer[choice, ]
customer100

### 100개 구매이력 데이터를 이용한 군집분석
install.packages("cluster")
library(cluster)

out <- hclust(dist(customer100), method="ave")
plot(out, hang=-1, labels=out$ID)
out$order

### K-means 군집분석
out2 <- kmeans(customer100, 3)
out2
out2$cluster
customer100$group <- out2$cluster
customer100
View(customer100)

plot(customer100[c("total", "recent")], col=out2$cluster)
points(out2$centers[,c("total", "recent")], col=1:3, pch=8, cex=2)


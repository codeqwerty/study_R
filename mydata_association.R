getwd()

연관분석 알고리즘을 가지고 있는 arules 패키지 설치
install.packages("arules")
library(arules)


#장바구니 분석
#sep=", "  구분기호(seprate), 
# 준비된 파일에서 콤마(,) 단위로 저장되어 있는 데이터를 읽어 들여 result라는 객체에 저장함
#, 콤마 옆에 한 칸을 띠어야 함

data <- read.transactions("mydata_association.csv", format="basket", sep=", ")
data

summary(data)

#image(data)
image(data)

# 데이터중 앞의 6개만 출력
image(head(data))

#20~35번 데이터 출력
image(data[c(20:35)])




#result를 data.frame형태로 출력
as(data, "data.frame")

#apriori(): association priority, 빈번한 규칙을 찾는 기능함수
#data의 데이터를 가지고 
#supp=0.1, suppo=support, 10%(0.1) 정도는 나와야 의미있는 규칙이라고 지정
#conf=0.1, confi=confidence

rules <- apriori(data, parameter=list(supp=0.1, conf=0.1))

#규칙 검색
inspect(rules)

#supp값을 낮추거나 높이거나 하면서 좋은 규칙을 찾습니다.
rules <- apriori(data, parameter=list(supp=0.3, conf=0.1))
inspect(rules)




## 연관규칙을 시각적으로 보여주는 패키지
install.packages("arulesViz")
library(arulesViz)

#plot에 rules 주면 시각화됨
plot(rules)
plot(rules, method="grouped")
plot(rules, method="graph", control=list(type="items"))

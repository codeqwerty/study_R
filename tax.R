
setwd("c:/R/study_R")
setwd("C:/R/R_workspace")
getwd()

#### 토픽분석
### 텍스트마이닝

##실습데이터 및 패키지 준비
#한글을 분석해주는 패키지 설치
#자바 실행환경에서 설치가능
install.packages("KoNLP")

#단어 구름을 만들어 주는 기능의 패키지 설치
install.packages("wordcloud")

#팔레드 기능
#워드클라우드 단어들에 색상을 입히는 기능
install.packages("RColorBrewer")

#rJava 로드 오류시 수행
#Sys.setenv(JAVA_HOME="C:/Program Files/Java/jre1.8.0_40")

library(KoNLP)
library(wordcloud)
library(RColorBrewer)



## 한글사전 설정 및 텍스트 파일 로딩
# 세종 사전을 쓰겠다는 의미
useSejongDic()

# 분석에 필요한 단어 추가
mergeUserDic(data.frame("세액공제", "ncn"))
mergeUserDic(data.frame("환급금", "ncn"))
mergeUserDic(data.frame("자기검증", "ncn"))

# 데이터 읽어오기
# encoding="UTF-8": 문자의 인코딩 형태 지정
mytext <- file("tax.txt", encoding="UTF-8")

# mytext에 있는 데이터를 라인단위로 짤라서 myline에 저장
myline <- readLines(mytext)

#연결된 파일 닫기
close(mytext)

head(myline, 5)
tail(myline, 5)



## 단어추출
#sapply()문장단위에서 단어별로 추출해달라
#extractNoun: 단어단위
myword <- sapply(myline, extractNoun, USE.NAMES=F)
myword

# 하나로 합침
result <- unlist(myword)

head(result, 20)


## 단어추출 > 조건지정
#Filter(): 필터링 기능함수
#nchar(x) >=2:  character number, 글자의 갯수가 2글짜 이상이면 사용
result2 <- Filter(function(x) {nchar(x) >=2}, result)

head(result2, 20)

result3 <- Filter(function(x) {nchar(x) == 3}, result)

head(result3, 20)

# 범위 지정해서 필터링
result4 <- Filter(function(x) {nchar(x) >= 2 & nchar(x) <= 4}, result)

head(result4, 20)



## 단어추출 > 정제작업
#최초 작성된 워드클라우드에서 파악된 비중요 단어들을 제거함
#gsub(): result2에서 "것"이란 단어가 있으면 ""으로 바꿔달라는 의미
#global substitute(대체)

result2 <- gsub("것", "", result2)
result2 <- gsub("저", "", result2)
result2 <- gsub("원", "", result2)

#\\n: 개행
#\\d+: 숫자
#\\.: .
result2 <- gsub("\\n", "", result2)
result2 <- gsub("\\d+", "", result2)
result2 <- gsub("\\.", "", result2)

head(result2, 20)

# 전처리한 결과 파일로 저장
write(unlist(result2), "myresult.txt")
myword <- read.table("myresult.txt")

# 객수 확인
nrow(myword)

# 데이터의 빈도수를 카운트
wordcount <- table(myword)

#내림차순, 상위 20개 확인
head(sort(wordcount, decreasing=T), 20)



## 워드클라우드 구현
#워드클라우드를 만드는 기능을 가진 wordcloud 패키지의 RColorBrewer를 메모리에 업로드 시카가
#RColorBrewer패키지의 brewer.pal(): 워드클라우드 작성시 이를 구성하는 단어들마다의 색상을 부여해 줍니다.
palete <- brewer.pal(9, "Set1")


#워드클라우드 형식의 그림데이터를 표현하기 위한 별도의 그래픽구현 창을 생성합니다.
#R스튜디오의 돋보기버튼 눌렀을때와 동일한 효과
x11( )



#Wordcloud함수의 세부 인자(옵션)값을 조정하여
#워드클라우드에서 중요키워드를 파악합니다.
#wordcount: 뿌려줄 단어
#freq=wordcount: 빈도로 사용
#scale=c(5, 1): 출력되는 단어들간의 크기 비율, 큰글씨 5 작은 글씨 1
#rot.per=0.5, 단어들간의 간격을 조절하는 설정값, 회전
#min.freq=4: 단어의 언급횟수를 의미, 빈도수가 4개 이상인것만 출력
#random.order=F: 뿌려줄때 순서
#random.color=T: 색깔
#colors=palete: 색깔 패턴 지정
wordcloud(  
  names(wordcount),
  freq=wordcount,
  scale=c(5, 1),
  rot.per=0.5,
  min.freq=4,
  random.order=F,
  random.color=T,
  colors=palete
  )


## 토픽 시각화
a <- head(sort(wordcount, decreasing=T), 20)
pie(a, col=rainbow(10), radius=1)

pct <- round(a/sum(a)*100, 1)
names(a)
lab <- paste(names(a), "\n", pct, "%")
pie(a, mail="연말정산 주요문의사항", col=rainbow(10), cex=0.8, labels=lab)

par(new=T)
pie(a, radius=0.6, col="white", labels=NA, border=NA)

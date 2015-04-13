############################################
#                                          #
#  데이터그램 R 기초 실습 예제  #
#                                          #
현재 커서라인 실행 Ctrl + Enter
여러 라인은 블럭 지정 후 Ctrl + Enter
############################################

###################
##### Phase 1 #####
###################

# 데이터셋 읽어오기 1 - CSV (read.csv)
data = read.csv("train.csv", header=TRUE)

head(data)


# 데이터셋 읽어오기 2 - txt (read.delim, #)
#delim구분자로 구분되었다는 것
data_2 = read.delim("sampledata.txt", header=TRUE, sep="#")
head(data_2)


# 데이터셋 특성 요약 명령어 1 - nrow
#읽어온것 특성 확인하기
nrow(data)


# 데이터셋 특성 요약 명령어 2 - ncol
ncol(data)


# 데이터셋 특성 요약 명령어 3 - length
#1부터 10까지 데이터
#앞의 데이터 길이 확인

tmp=c(1:10)
length(tmp)



# 데이터셋 특성 요약 명령어 4 - head
head(data)
head(data, 10)



# 데이터셋 특성 요약 명령어 4 - tail 
tail(data)

# 데이터셋 특성 요약 명령어 5 - summary
#각 칼럼의 기술 통계정보가 나옵니다.
summary(data)


# 데이터셋 특성 요약 명령어 6 - str
#structure, 데이터 의 구조 확인
str(data)


# column별 특성 파악 명령어 1 - min
#data데이터의 temp칼럼중 최소값 확인하기
min(data$temp)

# column별 특성 파악 명령어 2 - max
#최고 기온확인하기
max(data$temp)


# column별 특성 파악 명령어 3 - mean
#평균값 확인하
mean(data$temp)


# column별 특성 파악 명령어 4 - sd
#표준편차
sd(data$temp)


# column별 특성 파악 명령어 5 - sum
#합계 구하기
sum(data$count)


# 데이터셋 파악하기 1 - fix
#데이터를 한번에 스프레드 시트 형식으로 볼수 있습니다.
#실행시 새로운 창에 엑셀처러 데이터가 보여지게 됩니다.
#데이터가 너무 크면 RStudio가 사망할 수 있습니다.
#이 창을 띄우고 있으면 다른 명령어가 실행되지 않습니다.
#데이터 확인하고 해당 창을 닫는 습관을 들이시기 바랍니다.

fix(data)


# 데이터셋 파악하기 2 - table

table(data$weather)


# 데이터셋 파악하기 3 - plot
그래프 그리기
plot(data$count)


# 함수 사용법 확인방법 3가지 - ?function

#방법1 - ?
?plot

#방법2 - help (?와 동일한 명령함수)
help(plot)

#방법3 - Google 검색
#구글에서 "how to plot in R"로 검색
#검색어 입력 후 끝에 "in R" 붙여서 검색하면 아주 상세한 설명과 그림으로 된 내용을 확인할 수 있습니다.


# 숫자와 문자 - ""
#숫자는 그냥 입력하면 됩니다.
#문자는 ""안에 입력해야 문자로 인식됩니다.
codedragon
"codedragon"

# 문자형 변수 정의
str <- codedragon
str = "codedragon"
str


# 특정 column 번호를 사용하여 추출하는 방법

# 데이터 지정 형식은 데이터명[열, 행]
data[,3]
# 3번 행의 데이터만 나옵니다.

str(data)
data[ 4]
# 특정 column 이름을 사용하여 추출하는 방법
data에 모든 열의 "temp" 데이터 추출
data[, "temp"]
dta[, 6]

# 특정 row 번호를 사용하여 추출하는 방법
data[10, ]

# 특정 column에 값을 일괄 삽입하는 방법
데이터가 잘못되어 특정 칼럼이 누락되어 삽입할 경우
data에 temp의 값을 100도로 넣기
data$temp =100
데이터 확인
head(data)
# 특정 row에 값을 일괄 삽입하는 방법
warning 실행은 되는데 경고하는 것
data[3, ]=100
문자인데 숫자를 입력해서 경고가 나옵니다.
head(data)

# 특정 column과 row에 값을 삽입하는 방법
data[4, 6]=20000
head(data)
# 지정 column 범위에 값을 삽입하는 방법
지정 컬럼 한번에 바꾸기
3번째 컬럼부터 5번째 컬럼의 값을 777로 수정
data[, c(3:5)]=777


# 지정 row 범위에 값을 삽입하는 방법
data[3, 6]= 444
head(data)
# 지정 column 범위와 지정 row 범위에 값을 삽입하는 방법
data[3:5, 5:6]=12345
head(data)

# R의 자료구조 1 - c
combine해서 c로 묶어주는 것, 보자기로 싸는 것
# R의 자료구조 2 - matrix
개별 포장하여 쌓아놓은 것
# R의 자료구조 3 - data.frame
잘 정렬이된 데이터, 데이터 분석할 때 이것으로 처리됨
# R의 자료구조 4 - list
R분석에서는 그래프 표시시에 제한적으로 사용

# 데이터셋 저장하기 - write.csv
csv로 보통 저장하는 것이 일반적입니다.
row.names=FALSE
row.names=TRUE가 기본
write.csv(data, "data_result.csv", row.names=FALSE)

열번호도 저장되는 코드를 다시 수정해야되는 불상사가 발생
write.csv(data, "data_result.csv", row.names=TRUE)
aa = read.csv("data_result.csv")
head(aa)
# 텍스트 데이터 다루기 1 - substr
data= read.csv("train.csv", header=TRUE)
head(data)

hour = substr(data$datatime, 12, 13)
12번째 부터 13번째가지 시간을 나타내고 있습니다.
# 텍스트 데이터 다루기 2 - paste0
여러개의 문자를 공백없이 묶어주는 함수
past0("오늘은", "좋은날")
past0("오늘은_ ", "좋은날")

data[1,1] = paste0(past0("오늘은_ ", "좋은날"))


###################
##### Phase 2 #####
데이터를 만들어 보기
데이터 형식 통일
계산을위해 데이터 형식 변환하기
###################

# 데이터셋 읽어오기
data = read.csv("train.csv", header=TRUE)
head(data)

# 내가 원하는 데이터셋 만들기 1 - seq
내가 원하는 숫자를 원하는 단위로 단들어 줍니다.
seq(1, 10, by=1)
1:10

seq(1, 10, by=2)
seq(1, 11, by=2)

seq(1, 11, by=2.2)

repete, 반복
rep(2, 10)

여러개 반복
1에서 부터 7을 10번 반복하
rep(1:7, 10)

# 내가 원하는 데이터셋 만들기 2 - rnorm기
랜덤 숫자 생성(정규분포를 따르는)

?rnorm
rnorm(20, mean =1, sd=2)

plot(1:20, rnorm(20, mean =1, sd=2))

# 내가 원하는 데이터셋 만들기 3 - paste0


# 내가 원하는 데이터셋 만들기 4 - as.numeric
numbers = c("1", "2", "3")
numbers

numbers + 1
문자기 때문에 Error가 납니다
문자를 숫자로 만들기
numbers = as.numeric(numbers)
numbers
numbers +1


# 내가 원하는 데이터셋 만들기 5 - as.character
numbers


numbers = c(01, 02, 03, 24)
numbers

문자로 변환하기
numbers = c("01", "02", "03", "24")

다시 숫자 입력
numbers = c(01, 02, 03, 24)
numbers

문자로 변환하기
numbers = as.caracter(number)


# 내가 원하는 데이터셋 만들기 6 - as.matrix
c(2:9)

matrix( c(2:9), nrow=4, ncol=2)

12 34 순차적으로 데이터 셋이 만들어 집니다.
matrix = matrix( c(2:9), nrow=4, ncol=2, byrow=TRUE)
matrix

'matrix가 아닌것 matrix로 만들기'
as.matrix(numbers)

# 내가 원하는 데이터셋 만들기 7 - as.data.frame
as.data.frame(matrix)


# column별 특성 파악 명령어 - quantile
numbers = c(1:99)
numbers

?quantile
quantile(numbers, 0, 5)
quantile(numbers, 0, 2)

quantile(numbers, probs = c(0.2, 0.5, 1))

# column별 특성 파악 명령어 - sapply + class
head(data)

data의 class확인
sapply(data, class)


# column별 특성 파악 명령어 - sapply + sum
sapply(data[, 6:7], sum)

atemp 체감온도


# column별 특성 파악 명령어 - sapply + mean
sapply(data[, 6:7], mean)

# R 부려먹기 1 - for
abc 2부터 8까지의 숫자 입력하기
for(n in 2:8){
  print(n)
}

# R 부려먹기 1.1 - for, print
중간에 잘학 있는지  확인하기
차례차례 보여주게 됩니다. 수행완료 보여주는게 아니라
for(n in 2:8){
  data = read.csv("train.csv")
  flush.console()
  print("--------------")
  print(n)
}

# R 부려먹기 2 - 논리연산자
컬럼 이름 확인하기
colnames(data)

data$weather

table(data$weather)
weather = data[(data$weather==2) | (data$weather==3), 1:7 ]
head(weather)

fix(weather)
table(weatehr$weather)

# R 부려먹기 3 - if
조건 설정

test = 55
if(test < 40){
  print("less")
}

if(test < 40){
  print("less")
}else{
  print("more")
}


# 데이터셋 파악하기 1 - boxplot
boxplot(data$temp)

# 또 다른 방법의 객체 할당(or 저장) - assign
문자를 그대로 객체처럼 인식해서 넣어주기
for문 돌리면서 여러개의 값을 만들고 넣고 저장할 때 필수
반복적인 작업을 할 때 pate0와 assign은 필수

for( n in 1:4){
  tmp1 = paste0("str_", n)
  print(tmp1)
}

?assign
for( n in 1:4){
  tmp1 = paste0("str_", n)
  
  assign(tmp1, n)
  
  print(tmp1)
}

str_1

str_2

str_3

str_4


# 연습문제(반복문,핸들링,성공적) - for/paste0/print/write



###################
##### Phase 3 #####
###################




############################################
#                                          #
#  �����ͱ׷� R ���� �ǽ� ����  #
#                                          #
���� Ŀ������ ���� Ctrl + Enter
���� ������ ���� ���� �� Ctrl + Enter
############################################

###################
##### Phase 1 #####
###################

# �����ͼ� �о���� 1 - CSV (read.csv)
data = read.csv("train.csv", header=TRUE)

head(data)


# �����ͼ� �о���� 2 - txt (read.delim, #)
#delim�����ڷ� ���еǾ��ٴ� ��
data_2 = read.delim("sampledata.txt", header=TRUE, sep="#")
head(data_2)


# �����ͼ� Ư�� ��� ���ɾ� 1 - nrow
#�о�°� Ư�� Ȯ���ϱ�
nrow(data)


# �����ͼ� Ư�� ��� ���ɾ� 2 - ncol
ncol(data)


# �����ͼ� Ư�� ��� ���ɾ� 3 - length
#1���� 10���� ������
#���� ������ ���� Ȯ��

tmp=c(1:10)
length(tmp)



# �����ͼ� Ư�� ��� ���ɾ� 4 - head
head(data)
head(data, 10)



# �����ͼ� Ư�� ��� ���ɾ� 4 - tail 
tail(data)

# �����ͼ� Ư�� ��� ���ɾ� 5 - summary
#�� Į���� ��� ��������� ���ɴϴ�.
summary(data)


# �����ͼ� Ư�� ��� ���ɾ� 6 - str
#structure, ������ �� ���� Ȯ��
str(data)


# column�� Ư�� �ľ� ���ɾ� 1 - min
#data�������� tempĮ���� �ּҰ� Ȯ���ϱ�
min(data$temp)

# column�� Ư�� �ľ� ���ɾ� 2 - max
#�ְ� ���Ȯ���ϱ�
max(data$temp)


# column�� Ư�� �ľ� ���ɾ� 3 - mean
#��հ� Ȯ����
mean(data$temp)


# column�� Ư�� �ľ� ���ɾ� 4 - sd
#ǥ������
sd(data$temp)


# column�� Ư�� �ľ� ���ɾ� 5 - sum
#�հ� ���ϱ�
sum(data$count)


# �����ͼ� �ľ��ϱ� 1 - fix
#�����͸� �ѹ��� �������� ��Ʈ �������� ���� �ֽ��ϴ�.
#����� ���ο� â�� ����ó�� �����Ͱ� �������� �˴ϴ�.
#�����Ͱ� �ʹ� ũ�� RStudio�� ����� �� �ֽ��ϴ�.
#�� â�� ���� ������ �ٸ� ���ɾ ������� �ʽ��ϴ�.
#������ Ȯ���ϰ� �ش� â�� �ݴ� ������ ���̽ñ� �ٶ��ϴ�.

fix(data)


# �����ͼ� �ľ��ϱ� 2 - table

table(data$weather)


# �����ͼ� �ľ��ϱ� 3 - plot
�׷��� �׸���
plot(data$count)


# �Լ� ���� Ȯ�ι�� 3���� - ?function

#���1 - ?
?plot

#���2 - help (?�� ������ �����Լ�)
help(plot)

#���3 - Google �˻�
#���ۿ��� "how to plot in R"�� �˻�
#�˻��� �Է� �� ���� "in R" �ٿ��� �˻��ϸ� ���� ���� ������ �׸����� �� ������ Ȯ���� �� �ֽ��ϴ�.


# ���ڿ� ���� - ""
#���ڴ� �׳� �Է��ϸ� �˴ϴ�.
#���ڴ� ""�ȿ� �Է��ؾ� ���ڷ� �νĵ˴ϴ�.
codedragon
"codedragon"

# ������ ���� ����
str <- codedragon
str = "codedragon"
str


# Ư�� column ��ȣ�� ����Ͽ� �����ϴ� ���

# ������ ���� ������ �����͸�[��, ��]
data[,3]
# 3�� ���� �����͸� ���ɴϴ�.

str(data)
data[ 4]
# Ư�� column �̸��� ����Ͽ� �����ϴ� ���
data�� ��� ���� "temp" ������ ����
data[, "temp"]
dta[, 6]

# Ư�� row ��ȣ�� ����Ͽ� �����ϴ� ���
data[10, ]

# Ư�� column�� ���� �ϰ� �����ϴ� ���
�����Ͱ� �߸��Ǿ� Ư�� Į���� �����Ǿ� ������ ���
data�� temp�� ���� 100���� �ֱ�
data$temp =100
������ Ȯ��
head(data)
# Ư�� row�� ���� �ϰ� �����ϴ� ���
warning ������ �Ǵµ� ����ϴ� ��
data[3, ]=100
�����ε� ���ڸ� �Է��ؼ� ����� ���ɴϴ�.
head(data)

# Ư�� column�� row�� ���� �����ϴ� ���
data[4, 6]=20000
head(data)
# ���� column ������ ���� �����ϴ� ���
���� �÷� �ѹ��� �ٲٱ�
3��° �÷����� 5��° �÷��� ���� 777�� ����
data[, c(3:5)]=777


# ���� row ������ ���� �����ϴ� ���
data[3, 6]= 444
head(data)
# ���� column ������ ���� row ������ ���� �����ϴ� ���
data[3:5, 5:6]=12345
head(data)

# R�� �ڷᱸ�� 1 - c
combine�ؼ� c�� �����ִ� ��, ���ڱ�� �δ� ��
# R�� �ڷᱸ�� 2 - matrix
���� �����Ͽ� �׾Ƴ��� ��
# R�� �ڷᱸ�� 3 - data.frame
�� �����̵� ������, ������ �м��� �� �̰����� ó����
# R�� �ڷᱸ�� 4 - list
R�м������� �׷��� ǥ�ýÿ� ���������� ���

# �����ͼ� �����ϱ� - write.csv
csv�� ���� �����ϴ� ���� �Ϲ����Դϴ�.
row.names=FALSE
row.names=TRUE�� �⺻
write.csv(data, "data_result.csv", row.names=FALSE)

����ȣ�� ����Ǵ� �ڵ带 �ٽ� �����ؾߵǴ� �һ�簡 �߻�
write.csv(data, "data_result.csv", row.names=TRUE)
aa = read.csv("data_result.csv")
head(aa)
# �ؽ�Ʈ ������ �ٷ�� 1 - substr
data= read.csv("train.csv", header=TRUE)
head(data)

hour = substr(data$datatime, 12, 13)
12��° ���� 13��°���� �ð��� ��Ÿ���� �ֽ��ϴ�.
# �ؽ�Ʈ ������ �ٷ�� 2 - paste0
�������� ���ڸ� ������� �����ִ� �Լ�
past0("������", "������")
past0("������_ ", "������")

data[1,1] = paste0(past0("������_ ", "������"))


###################
##### Phase 2 #####
�����͸� ����� ����
������ ���� ����
��������� ������ ���� ��ȯ�ϱ�
###################

# �����ͼ� �о����
data = read.csv("train.csv", header=TRUE)
head(data)

# ���� ���ϴ� �����ͼ� ����� 1 - seq
���� ���ϴ� ���ڸ� ���ϴ� ������ �ܵ�� �ݴϴ�.
seq(1, 10, by=1)
1:10

seq(1, 10, by=2)
seq(1, 11, by=2)

seq(1, 11, by=2.2)

repete, �ݺ�
rep(2, 10)

������ �ݺ�
1���� ���� 7�� 10�� �ݺ���
rep(1:7, 10)

# ���� ���ϴ� �����ͼ� ����� 2 - rnorm��
���� ���� ����(���Ժ����� ������)

?rnorm
rnorm(20, mean =1, sd=2)

plot(1:20, rnorm(20, mean =1, sd=2))

# ���� ���ϴ� �����ͼ� ����� 3 - paste0


# ���� ���ϴ� �����ͼ� ����� 4 - as.numeric
numbers = c("1", "2", "3")
numbers

numbers + 1
���ڱ� ������ Error�� ���ϴ�
���ڸ� ���ڷ� �����
numbers = as.numeric(numbers)
numbers
numbers +1


# ���� ���ϴ� �����ͼ� ����� 5 - as.character
numbers


numbers = c(01, 02, 03, 24)
numbers

���ڷ� ��ȯ�ϱ�
numbers = c("01", "02", "03", "24")

�ٽ� ���� �Է�
numbers = c(01, 02, 03, 24)
numbers

���ڷ� ��ȯ�ϱ�
numbers = as.caracter(number)


# ���� ���ϴ� �����ͼ� ����� 6 - as.matrix
c(2:9)

matrix( c(2:9), nrow=4, ncol=2)

12 34 ���������� ������ ���� ����� ���ϴ�.
matrix = matrix( c(2:9), nrow=4, ncol=2, byrow=TRUE)
matrix

'matrix�� �ƴѰ� matrix�� �����'
as.matrix(numbers)

# ���� ���ϴ� �����ͼ� ����� 7 - as.data.frame
as.data.frame(matrix)


# column�� Ư�� �ľ� ���ɾ� - quantile
numbers = c(1:99)
numbers

?quantile
quantile(numbers, 0, 5)
quantile(numbers, 0, 2)

quantile(numbers, probs = c(0.2, 0.5, 1))

# column�� Ư�� �ľ� ���ɾ� - sapply + class
head(data)

data�� classȮ��
sapply(data, class)


# column�� Ư�� �ľ� ���ɾ� - sapply + sum
sapply(data[, 6:7], sum)

atemp ü���µ�


# column�� Ư�� �ľ� ���ɾ� - sapply + mean
sapply(data[, 6:7], mean)

# R �η��Ա� 1 - for
abc 2���� 8������ ���� �Է��ϱ�
for(n in 2:8){
  print(n)
}

# R �η��Ա� 1.1 - for, print
�߰��� ���� �ִ���  Ȯ���ϱ�
�������� �����ְ� �˴ϴ�. ����Ϸ� �����ִ°� �ƴ϶�
for(n in 2:8){
  data = read.csv("train.csv")
  flush.console()
  print("--------------")
  print(n)
}

# R �η��Ա� 2 - ����������
�÷� �̸� Ȯ���ϱ�
colnames(data)

data$weather

table(data$weather)
weather = data[(data$weather==2) | (data$weather==3), 1:7 ]
head(weather)

fix(weather)
table(weatehr$weather)

# R �η��Ա� 3 - if
���� ����

test = 55
if(test < 40){
  print("less")
}

if(test < 40){
  print("less")
}else{
  print("more")
}


# �����ͼ� �ľ��ϱ� 1 - boxplot
boxplot(data$temp)

# �� �ٸ� ����� ��ü �Ҵ�(or ����) - assign
���ڸ� �״�� ��üó�� �ν��ؼ� �־��ֱ�
for�� �����鼭 �������� ���� ����� �ְ� ������ �� �ʼ�
�ݺ����� �۾��� �� �� pate0�� assign�� �ʼ�

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


# ��������(�ݺ���,�ڵ鸵,������) - for/paste0/print/write



###################
##### Phase 3 #####
###################



# Kaggle Competition
# Personalize Expedia Hotel Searches - ICDM 2013
# �Ⱓ : 2013.09 ~ 2013.11 (����!)
# ���� : 337��
# ��� : $25000

getwd()
setwd("C:/R/workspace/caggle_001")


memory.limit(size = 16000)
train = read.csv("kaggle_m4_train.csv", header = TRUE)
nrow(train)
head(train)
colnames(train)

# srch_id : �˻� ���̵�(search_id)
# date_time : �˻��� �ð�
# site_id : ���� expedia ����Ʈ ��ȣ (30�� �̻�)
# visitor_location_country_id : ������(search_id)�� ���� ��ȣ
# visitor_hist_starrating : ������(search_id)�� �����ߴ� ȣ�ڵ��� ���� ���, null ���� ù ��������
# visitor_adr_usd : ������(search_id)�� �����ߴ� ȣ�ڵ��� 1�ڴ� ���ݵ��� ���, null ���� ù ��������
# prop_contry_id : ȣ���� ��ġ�� ������ id
# prop_id : ȣ�� id
# prop_starrating : ȣ�� ����
# prop_review_score : ȣ�� ���� ����, 0~5�� ���� ����, 0���� ���� ����, NULL�� ���� ȹ�� �Ұ�
# prop_brand_bool : 1 - Ư�� ȣ�� �׷� �Ҽ�, 0 - ���� ȣ��
# prop_location_score1 : ù ���� ȣ�ڷν��� ��ȣ�� (0~ 7 ����) ???
# prop_location_score2 : �� ��° ���� ȣ�ڷν��� ��ȣ�� (0 ~ 1 ����...) ???
# prop_log_historical_price : ���� ����(?)�Ⱓ ������ ��� ����ݾ��� �αװ�, 0�̸� ������ ���� ��
# position : ȣ�� �˻��� ȭ�鿡 ����Ǵ� �ش� ȣ���� ��ġ (train �����ͼ� ���� �����Ǵ� column)
# priced_usd : ȣ�� �˻��� ȭ�鿡 ����Ǵ� �ش� ȣ�� ���ں� (�� ���󸶴� ����, ������ ���� ������ �ٸ�)
# promotion_flag : ����������� ���� 1, �ƴϸ� 0
# srch_destination_id : �˻��� �Է��� �������� id
# srch_length_of_stay : �˻��� �Է��� �����ϼ�
# srch_booking_window : �˻������� ������ ������ �ϼ�
# srch_adult_count : �˻��� �Է��� �����ο�(����)
# srch_children_count : �˻��� �Է��� �����ο�(�Ƶ�)
# srch_room_count : �˻��� �Է��� �� ����
# srch_saturday_night_bool : �˻��� �Է��� �����Ͽ� ������� ���ԵǸ� 1, �׿� 0
# srch_query_affinity_score : ���ͳ� �˻����� Ư��(?) ȣ���� Ŭ���ؼ� ���� Ȯ��(����?)�� �α� ��. NULL�� ������ ����.
# orig_destination_distance : �˻� �������� ���̵��� ������ġ�� �˻� ȣ���� ������ �Ÿ�. NULL�� �Ÿ��� ������ �� ���� ���.
# random_bool : �������� ���� ���(??ȣ�ڰ˻����??)�� ��� �� ��� - 1, �Ϲ����� ���� ����� ����� ��� - 0
# comp1_rate : ����� ���� ���� �����̸� 1, ������ ������ 0, ������ ������ -1, ������ ������ null
# comp1_inv : ������� �Ź��� ������ 1, ���� �Ź��� ���ų� ������� �Ź��� ���� �� 0, ������ ������ null
# comp1_rate_percent_diff : ����� �Ź� ���ݰ� Expedia �Ź� ������ ���� ��з� ����. (� �����Ͱ� �����ΰ�?? Expedia's price is denominator?)
# click_bool : Ŭ�� ����(??)  train only!
# gross_bookings_usd : �޷��� ȯ��� �ش� �ŷ�(����)�� �Ѿ�  train only!
# booking_bool : ���� ����  train only!

############################################################################
# ��ǥ!!!!�������� ȭ�鿡 ����� ��ǰ(����)���� ������ ���ʴ�� �ű�� ��. #
############################################################################

bench_order = read.csv("kaggle_m4_testOrderBenchmark.csv", header = TRUE)
bench_random = read.csv("kaggle_m4_randomBenchmark.csv", header = TRUE)

head(bench_order)  # ���⿹�� 1
head(bench_random)  # ���⿹�� 2

test[ test$srch_id == 2, "prop_id"]

# Id�� prop_id(PropertyId) ��Ī ��Ű��.

# �� column�� ���¸� �� ��.
# ���� column�� ���� �м��� ���� �� ��.
# ���� column�� ���� �м��� �������� �� ��.
# Ư�� column�� ���� column���� ���踦 ������ �� ��.
# Ư�� ������ �ִٰ� �ǽɵǴ� column�� clustering �غ� ��.


####################
# ���� column �м� #
####################

# srch_id : �˻� ���̵�(search_id)
nrow(train)
length(unique(train$srch_id))
nrow(train) / length(unique(train$srch_id)) # id�� ��� �����ǰ ����.. �� 25��..

# date_time : �˻��� �ð�
as.character(train$date_time[c(1, nrow(train))]) # as.character�� ���� ������ factor������ ��û��.
date_data = data.frame(date = as.numeric(substr(gsub("-", "", train$date_time), 1, 8)))
head(date_data)
rownames(date_data) = NULL
date_data_2 = data.frame(date = sort(unique(date_data$date), decreasing = FALSE))
head(date_data_2, 3)
tail(date_data_2, 3)
nrow(date_data_2)
fix(date_data_2)
# ��ȣ��.. �̰� 8����ġ ��������.

# ������ ������ �� ��
date_data = data.frame(date = as.numeric(substr(gsub("-", "", train$date_time), 1, 8)))
date_data_table = data.frame(table(sort(date_data$date, decreasing = FALSE)))
date_data_table = transform( date_data_table, Var1 = as.numeric(as.character(date_data_table$Var1)))
# fix(date_data_table)
head(date_data_table)
plot(1:nrow(date_data_table), date_data_table$Freq, type = "l")
# ���� ������ �� �� ����/�ָ� �Ǵ� ���Ͽ� ���� ������ ���� ��.


# site_id : ���� expedia ����Ʈ ��ȣ (30�� �̻�)
site_id = data.frame(table(train$site_id))
library("ggplot2")
ggplot(site_id, aes(x = 1:nrow(site_id), y = site_id$Freq)) + geom_point(size = 5)

# fix(site_id) # 34�� ����Ʈ... 34�� ����?
# ���߿� ���� + ������ ����.. <--- üũ, ���� ���!!

# visitor_location_country_id : ������(search_id)�� ���� ��ȣ
# ���� ������ �� ��
visitor_location_country_id = data.frame(table(train$visitor_location_country_id))
visitor_location_country_id = transform(visitor_location_country_id, Var1 = as.numeric(as.character(visitor_location_country_id$Var1)))
plot(visitor_location_country_id, type = "l")
# fix(visitor_location_country_id)

# visitor_hist_starrating : ������(search_id)�� �����ߴ� ȣ�ڵ��� ���� ���, null ���� ù ��������
# ������ ������ ������ �� ��
visitor_hist_starrating_table = data.frame( visitor_hist_starrating = table(train$visitor_hist_starrating) )
nrow(visitor_hist_starrating_table)
head(visitor_hist_starrating_table)
# fix(visitor_hist_starrating_table)
plot(visitor_hist_starrating_table[1:(nrow(visitor_hist_starrating_table)-1), ], type = "l")

# visitor_hist_adr_usd : ������(search_id)�� �����ߴ� ȣ�ڵ��� 1�ڴ� ���ݵ��� ���, null ���� ù ��������
# ������ ������ ������ �� �� 
# ������ �� ��

visitor_hist_adr_usd = data.frame( visitor_hist_adr_usd = table(train$visitor_hist_adr_usd) )
nrow(visitor_hist_adr_usd)
head(visitor_hist_adr_usd)
# fix(visitor_hist_adr_usd) # �Ҽ���... ó���� �����ұ�?...
sapply(visitor_hist_adr_usd, class)
colnames(visitor_hist_adr_usd) = c("usd", "freq")
visitor_hist_adr_usd = transform(visitor_hist_adr_usd, usd = as.character(usd)) # Ư�� column�� �Ӽ��� �ٲ��ִ� �Լ�
visitor_hist_adr_usd = transform(visitor_hist_adr_usd, usd = as.numeric(usd)) # Ư�� column�� �Ӽ��� �ٲ��ִ� �Լ�
visitor_hist_adr_usd = visitor_hist_adr_usd[order(visitor_hist_adr_usd$usd),] # ����
rownames(visitor_hist_adr_usd) = NULL
head(visitor_hist_adr_usd)

purchase_sum = sum(visitor_hist_adr_usd$freq[1:(nrow(visitor_hist_adr_usd)-1)])
n_purchase_sum = visitor_hist_adr_usd$freq[nrow(visitor_hist_adr_usd)]
purchase_sum / (n_purchase_sum + purchase_sum) # ���� ������ 5.1%

v_usd = visitor_hist_adr_usd[1:(nrow(visitor_hist_adr_usd)-1), ]
colnames(v_usd)
v_usd = transform(v_usd, usd = round(usd, -1))
v_usd = aggregate(x = v_usd[, 2], by = list(v_usd$usd), FUN = "sum")
head(v_usd)
plot(v_usd)

# prop_contry_id : ȣ���� ��ġ�� ������ id
prop_country = data.frame( table(train$prop_country_id) )
nrow(prop_country)
head(prop_country)
barplot(table(train$prop_country_id) )
max(prop_country[,2])
max(as.numeric(as.character(prop_country[,1]))) # 230�� ����.

prop_country = prop_country[order(prop_country[,2], decreasing = TRUE), ]
head(prop_country)

# ������ ������ �� ��
prop_country[, 3] = data.frame( portion = round(prop_country[, 2]/sum(prop_country[,2]), 3))
head(prop_country)
plot(prop_country[, c(1, 3)])

# prop_id : ȣ�� id
# ȣ�� ������ �� ��.
length(unique(train$prop_id))

# prop_starrating : ȣ�� ����
# ���� ������ �� ��
library("ggplot2")
star = data.frame( table(train$prop_starrating))
ggplot(star, aes(x = star[,1], y = star[,2])) + geom_bar(stat = "identity", fill = "pink")

# prop_review_score : ȣ�� ���� ����, 0~5�� ���� ����, 0���� ���� ����, NULL�� ���� ȹ�� �Ұ�
# ������ ������ ������ �� ��
review = data.frame( table(train$prop_review_score) )
review
ggplot(review, aes(x = review[,1], y = review[,2])) + geom_bar(stat = "identity", fill = "pink")


# prop_brand_bool : 1 - Ư�� ȣ�� �׷� �Ҽ�, 0 - ���� ȣ��
# ǥ�� �׸� ��
brand = data.frame( table(train$prop_brand_bool) )
brand

# prop_location_score1 : ù ���� ȣ�ڷν��� ��ȣ�� (0~ 7 ����) ???
# ������ ������ �� ��
location_1 = data.frame( table(train$prop_location_score1) )
location_1
plot(location_1)

# prop_location_score2 : �� ��° ���� ȣ�ڷν��� ��ȣ�� (0 ~ 1 ����...) ???
# ������ ������ �� ��
location_2 = data.frame( table(train$prop_location_score2) )
location_2
plot(location_2)
max(location_2[, 2])
colnames(location_2)
location_2[ location_2$Freq == max(location_2[, 2]), ]
plot(location_2[ 1:(nrow(location_2)-1), ])

# prop_log_historical_price : ���� ����(?)�Ⱓ ������ �ش� ���ھ��� ��� ����ݾ��� �αװ�, 0�̸� ������ ���� ��
# ������ �� ��
price = data.frame( table(train$prop_log_historical_price) )
nrow(price)
head(price)
max(price$Freq)
plot(price[2:nrow(price),])

max(price[2:nrow(price), "Freq"])
price[ price$Freq == 177720, ] # 6.21 �̻��� ���� �� �ϳ��� ó���ع��� �� ����.
exp(6.21)
plot(price[2:(nrow(price)-1),])

# �ٽ� ������ ���Ͽ�(?) ���� ���Ⱚ�� �����Ͽ� ������ �ٽ� �� ��
price_2 = data.frame(Var1 = exp(as.numeric(as.character(price[, 1]))), Freq = price[, 1])
head(price_2)
plot(price_2[2:(nrow(price_2)-1),])


# position : ȣ�� �˻��� ȭ�鿡 ����Ǵ� �ش� ȣ���� ��ġ (train �����ͼ� ���� �����Ǵ� column)
library("ggplot2")
sub = data.frame(table(train$position))
ggplot(sub, aes(x = sub[, 1], y = sub[, 2])) + geom_bar(stat="identity")


# price_usd : ȣ�� �˻��� ȭ�鿡 ����Ǵ� �ش� ȣ�� ���ں� (�� ���󸶴� ����, ������ ���� ������ �ٸ�)
sub = data.frame(table(train$price_usd))
head(sub)
tail(sub) # ��û�� ����..�̱� �ѵ�.. �̰� �̻�ġ ���� ���� �ȵ�;;;;
# �ϴ� �α׸� ���� ���� �ݿø��� �սô�..

sub = transform(sub, Var1 = as.numeric(as.character(sub$Var1)))
sapply(sub, class)

sub[, 1] = round(log10(sub[, 1]+1), 1)
head(sub)
tail(sub)

library("ggplot2")
rownames(sub) = NULL
sub = aggregate(sub[, 2], by = list(sub[, 1]), FUN = "sum")
head(sub)
ggplot(sub, aes(x = sub[, 1], y = sub[, 2])) + geom_line()

# promotion_flag : ����������� ���� 1, �ƴϸ� 0
sub = data.frame(table(train$promotion_flag))
sub

# srch_destination_id : �˻��� �Է��� �������� id
sub = data.frame(table(train$srch_destination_id))
sub
plot(sub)
ggplot(sub, aes(x = sub[, 1], y = sub[, 2])) + geom_bar()


# srch_length_of_stay : �˻��� �Է��� �����ϼ�
sub = data.frame(table(train$srch_length_of_stay))
sub
plot(sub)


# srch_booking_window : �˻��ϰ� ������ ���� ���� �ϼ�..
sub = data.frame(table(train$srch_booking_window))
sub
plot(sub)


# srch_adults_count : �˻��� �Է��� �����ο�(����)
sub = data.frame(table(train$srch_adults_count))
sub
plot(sub)


# srch_children_count : �˻��� �Է��� �����ο�(�Ƶ�)
sub = data.frame(table(train$srch_children_count))
sub
plot(sub)

# srch_room_count : �˻��� �Է��� �� ����
sub = data.frame(table(train$srch_room_count))
sub
library("ggplot2")
ggplot(sub, aes(x = sub[, 1], y = sub[, 2])) + geom_bar(stat = "identity")


# srch_saturday_night_bool : �˻��� �Է��� �����Ͽ� ������� ���ԵǸ� 1, �׿� 0
sub = data.frame(table(train$srch_saturday_night_bool))
sub
library("ggplot2")


# srch_query_affinity_score : ���ͳ� �˻����� Ư��(?) ȣ���� Ŭ���ؼ� ���� Ȯ��(����?)�� �α� ��. NULL�� ������ ����.
sub = data.frame(table(train$srch_query_affinity_score))
sub
head(sub)
tail(sub)
sub = sub[-nrow(sub), ]
sum(sub[, 2])

sub = transform( sub, Var1 = as.numeric(as.character( sub$Var1 )) )
sub[, 1] = round(sub[, 1], 0) 
head(sub)
sub = aggregate(sub[, 2], by = list(sub[, 1]), FUN = "sum")
nrow(sub)
head(sub)
plot(sub)

# orig_destination_distance : �˻� �������� ���̵��� ������ġ�� �˻� ȣ���� ������ �Ÿ�. NULL�� �Ÿ��� ������ �� ���� ���.
sub = data.frame(table(train$orig_destination_distance))
sub
sub = transform( sub, Var1 = as.numeric(as.character( sub$Var1 )) )
sub[, 1] = round(sub[, 1], -1) 
head(sub)
tail(sub)
sub = aggregate(sub[, 2], by = list(sub[, 1]), FUN = "sum")
plot(sub)

# random_bool : �������� ���� ���(??ȣ�ڰ˻����??)�� ��� �� ��� - 1, �Ϲ����� ���� ����� ����� ��� - 0
sub = data.frame(table(train$random_bool))
sub

# comp1_rate : ����� ���� ���� �����̸� 1, ������ ������ 0, ������ ������ -1, ������ ������ null
sub = data.frame(table(train$comp1_rate))
sub

# comp1_inv : ������� �Ź��� ������ 1, ���� �Ź��� ���ų� ������� �Ź��� ���� �� 0, ������ ������ null
sub = data.frame(table(train$comp1_inv))
sub

# comp1_rate_percent_diff : ����� �Ź� ���ݰ� Expedia �Ź� ������ ���� ��з� ����. (� �����Ͱ� �����ΰ�?? Expedia's price is denominator?)
sub = data.frame(table(train$comp1_rate_percent_diff))
sub
sub = transform( sub, Var1 = as.numeric(as.character( sub$Var1 )) )
sub[, 1] = sub[, 1]/100
head(sub)

sub = sub[ order(sub[, 1]), ]
head(sub)

rownames(sub) = NULL
head(sub)
tail(sub)
sub = sub[ -nrow(sub), ]
nrow(sub)
plot(sub)

sub[, 1] = log10(sub[, 1])
plot(sub, type = "l")

# click_bool : Ŭ�� ����(??)  train only!
sub = data.frame(table(train$click_bool))
sub

# booking_bool : ���� ����  train only!
sub = data.frame(table(train$booking_bool))
sub


# gross_bookings_usd : �޷��� ȯ��� �ش� �ŷ�(����)�� �Ѿ�  train only!
sub = data.frame(table(train$gross_bookings_usd))
sapply(sub, class)
# ���ڸ� ���ڷ� �ٲٱ� ���� �ڵ�
sub = transform( sub, Var1 = as.numeric(as.character( sub$Var1 )) )
head(sub)
tail(sub)
nrow(train)

sub = sub[ -nrow(sub), ]
sub[, 1] = round(sub[, 1], -1)
head(sub)
tail(sub)

sub = sub[ order(sub$var1),]
head(sub)
tail(sub)

sub = aggregate(sub[,2], by = list(sub[, 1]), FUN = "sum")
plot(sub)

sub[, 1] = log10(sub[, 1])
plot(sub)


##############
# clustering 

sub_2 = data.frame( usd = train$gross_bookings_usd )
head(sub_2)
sub_2 = data.frame( usd = sub_2[ sub_2[, 1] != "NULL" , ] )
sub_2 = transform( sub_2, usd = as.numeric(as.character(sub_2$usd)) )
kmeans = kmeans(sub_2[, 1], 7)
kmeans

kmeans$betweenss
kmeans$totss
kmeans$center

# > kmeans$center
# [,1]
# 1 127107.4220
# 2    176.0385
# 3   2858.9296
# 4   6694.4415
# 5    588.7633
# 6   1357.5476
# 7  43772.5214

sub_2[, "kmeans"] = kmeans$cluster
head(sub_2)

sub_2 = sub_2[ order(sub_2$usd), ]
head(sub_2)
rownames(sub_2) = NULL

# ���ݴ� ���� ����
sub_2_unique = unique(sub_2)
head(sub_2_unique)

sub_2_table = data.frame(table(sub_2$usd))
sapply(sub_2_table, class)
sub_2_table = transform( sub_2_table, Var1 = as.numeric(as.character(sub_2_table$Var1)))
head(sub_2_table)

sub_3 = cbind(sub_2_table, sub_2_unique[, 2])
head(sub_3)
colnames(sub_3) = c("usd", "freq", "cluster")
head(sub_3)

library("ggplot2")
ggplot(sub_3, aes( x = log10(sub_3$usd+1), y = sub_3$freq, colour = sub_3$cluster)) + geom_point()  

# > kmeans$center
# [,1]
# 1 127107.4220
# 2    176.0385
# 3   2858.9296
# 4   6694.4415
# 5    588.7633
# 6   1357.5476
# 7  43772.5214


#######################################################
# �������� �����ϰǵ�...                              #
# ȣ������ / �������� / ��������                      # 
# 3���� �����ͼ¿��� train ������ ���� ����� �� ��.. #
#######################################################


####################
# ���� column �м� #
####################

# date_time : ���Ϻ��� �����ؼ� �� ��.

head(train[, "date_time"])
# 2013�� 4�� 4�� ���� �ֳ�?... 

sub = data.frame( date_time = train$date_time, week_day = 0)
sub_2 = sub
sub_2[, 1] = substr( sub_2$date_time, 1, 10)
sub_2 = unique(sub_2)
sub_2[, c("year", "month", "day")] = c( as.numeric(substr(sub_2$date_time, 1, 4)), as.numeric(substr(sub_2$date_time, 6, 7)), as.numeric(substr(sub_2$date_time, 9, 10)))
sub_2 = sub_2[ order(sub_2$year, sub_2$month, sub_2$day), ]
head(sub_2)
# fix(sub)

nrow(sub_2)
(nrow(sub_2)-4)/7
c(4:7, rep(c(1:7), 34))
length(c(4:7, rep(c(1:7), 34)))

sub_2$week_day = c(4:7, rep(c(1:7), 34))
rownames(sub_2) = NULL
colnames(sub_2)[1] = "date_time_2"
head(sub_2)

head(sub)
sub[, "date"] = substr(sub$date_time, 1, 10)
colnames(sub)[1] = "date_time_1"
head(sub)

library("dplyr")
sub = left_join( sub, sub_2, by = c("date" = "date_time_2"  )) # ����� �����ɸ��� ����
head(sub)

sub = sub[, c(1, 4)]
head(sub)

sub_table = data.frame(table(sub$week_day.y))

library("ggplot2")
ggplot(sub_table, aes(x = Var1, y = Freq)) + geom_bar( stat = "identity", fill = "#A1B3C5")


# site_id

colnames(train)

sub = train[, c("site_id", "prop_country_id", "visitor_location_country_id", "date_time")]
head(sub)

sub[, "hour"] = as.numeric( substr( sub$date_time, 12,13) )
head(sub)

sub = sub[, -4]
head(sub)

sub_table = data.frame( table(train$site_id) )
sub_table = sub_table[ order( sub_table$Freq, decreasing = TRUE ), ]
head(sub_table, 10)

plot(log10(sub_table[, 2])) # ��.... ���� ������ ������ �ֱ� ������... 5���� Ƽ��� ������?..

head(sub_table, 10)
sub_id = sub[ sub$site_id == 18, ]
sub_table_2 = data.frame(table(sub_id$prop_country_id))
sub_table_2 = sub_table_2[ order(sub_table_2$Freq, decreasing = TRUE) , ]
sub_table_3 = data.frame(table(sub_id$visitor_location_country_id))
sub_table_3 = sub_table_3[ order(sub_table_3$Freq, decreasing = TRUE) , ]

head(sub_table_2, 3)
head(sub_table_3, 3)

# ��, site 5���� 219�� �����̴�.
# ��� ������ �ؿܿ��� ���� ��������� Expedia.com ����Ʈ�� �̿� �Ѵٴ� ���� �Ͽ�
# site_id�� visitor_location_country_id ���� ���� ���� ������ ��Ī���Ѿ� �Ѵ�.


# prop_starrating

colnames(train)

sub = train[, c("prop_id", "prop_starrating", "prop_country_id", "price_usd")]
head(sub)

sub_2 = sub[, c(2, 4)]
head(sub_2)
sub_aggregate = aggregate(sub_2$price_usd, by = list(sub_2$prop_starrating), FUN = "mean")
sub_aggregate

ggplot(sub_aggregate, aes(x = Group.1, y = x)) + geom_bar( stat = "identity", fill = "#A1B3C5")

sub_table = data.frame( table(train$prop_country_id) )
sub_table = sub_table[ order(sub_table$Freq, decreasing = TRUE), ]
head(sub_table, 3)

hotel_id = 219
sub_219_aggregate = aggregate(sub[ sub$prop_country_id == hotel_id, "price_usd"], by = list(sub_2[ sub$prop_country_id == hotel_id, "prop_starrating"]), FUN = "mean")
sub_219_aggregate

hotel_id = 100
sub_100_aggregate = aggregate(sub[ sub$prop_country_id == hotel_id, "price_usd"], by = list(sub_2[ sub$prop_country_id == hotel_id, "prop_starrating"]), FUN = "mean")
sub_100_aggregate

hotel_id = 55
sub_55_aggregate = aggregate(sub[ sub$prop_country_id == hotel_id, "price_usd"], by = list(sub_2[ sub$prop_country_id == hotel_id, "prop_starrating"]), FUN = "mean")
sub_55_aggregate

sub_cbind = data.frame( star = c(0:5), A = sub_219_aggregate[, 2], B = sub_100_aggregate[, 2], c = sub_55_aggregate[, 2])
sub_cbind

library("reshape2")
sub_melt = melt(sub_cbind, id = "star")

ggplot(sub_melt, aes( x = star, y = value,fill = variable)) + 
  geom_bar(stat = "identity", position = "dodge")
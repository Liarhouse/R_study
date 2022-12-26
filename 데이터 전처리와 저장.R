# 데이터 전처리와 저장
# 실습데이터: titanic
## 데이터 로딩
ttnc <- read.csv('titanic.csv')
str(ttnc)
View(ttnc)
boxplot(ttnc$age)
head(ttnc)

summary(ttnc)

names(ttnc)
# 필요한 컬럼만 뽑아서 새로운 데이터 프레임 생성
df <- ttnc[, c('X', 'pclass', 'survived', 'sex', 'age', 'sibsp', 'parch', 'embarked')]

str(df)
summary(df)
table(df$embarked)
mean(df$age)

# Factor형 변환
ttnc$pclass <- as.factor(ttnc$pclass)
ttnc$survived <- as.factor(ttnc$survived)
ttnc$sex <- as.factor(ttnc$sex)
ttnc$embarked <- as.factor(ttnc$embarked)

# 범주형 데이터의 건수
table(ttnc$embarked)
ttnc$embarked <- ifelse(is.na(ttnc$embarked),'Southampton', ttnc$embarked)
df$age <- ifelse(is.na(df$age),28,ttnc$age)
# 1등실 탑승 고객 추출
df[df$pclass=='1st',]

# pclass별 생존 및 사망 비율 시각화
## 객실 등급별 생존율
library(dplyr)
library(ggplot2)
qplot(survived, data=df, fill=pclass)
qplot(survived, data=df, fill=sex)
qplot(survived, data=df, fill=embarked)
qplot(age, data = df)
boxplot(df$age)$stats

# system.time(): 처리속도를 보여주는 함수
df <- data.frame(x = runif(2.6e+07), y= rep(letters, each=10000))
system.time(x <- df[df$y == 'C', ])
install.packages('data.table')
library(data.table)
?data.table
dt <- as.data.table(df)
system.time(x <- dt[dt$y == 'C', ])


ttnc_df <- as.data.table(ttnc)
class(ttnc_df)
str(ttnc_df)
head(ttnc_df)
key <- 'pclass'
setkeyv(ttnc_df, key)
ttnc_df[,.(name, survived)]
ttnc_df[J('1st')]
?read.csv
busan_tour<-read.csv('busan tour.csv', header=T, byrow=F,sep="|", )
View(busan_tour)

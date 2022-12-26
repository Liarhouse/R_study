# vector: 1차원 가변길이 배열
vector(length = 5)
a<-c(1, 2, 3, 4, 5)
x<-10
x


## indexing(인덱싱)과 slicing(슬라이싱)
### 벡터명[index]
a[3]
a[c(2,3,4)]
a[2:4]

### Fancy Index(팬시 인덱스)
### 주어진 조건에 만족하는 값(요소)만 추찰하는 기능
### 비교(관계)연산자: ==, !=, >, >=, <, <=
### 논리 연산자: &(and), |(or), !(not)
x<-1:10
x

x[x>5]

seq(1,10,2)
seq(0,1,length.out=11)

rep(1:3, times=3)
rep(10, 5)
rep(1:3,each=3)

y<-seq(10)
y

a <- c(1,2,3)
b <- c(4,2,8)

a==b

xx<-c('a','b','c','d','e')
xx

# 문자열 결합
paste(xx[1], xx[2])

# 짝수번째 위치에 해당하는 요소 추출
yy<-11:20

yy[c(2, 4, 6, 8, 10)]
yy %% 2

# matrix
## 행(row, 관측값, 샘플)
## 열(column, 속성, 변수, feature)
## table(표)
## matrix(data,nrow,ncol,byrow=T,dimnames=NULL)
m<-matrix(1:9, nrow=3)
m
## 행렬명[행인덱스, 열인덱스]
m[2,]
m[2,3,drop=F]
m[2:3,2:3]

m1 <- matrix(1:9, nrow=3, byrow=T,
             dimnames=list(c('행1','행2','행3'),
                           c('열1','열2','열3')))
m1

## m1 행렬의 요소의 값이 4이상인 것만 추출하시오.
m1[m1>=4]
## 행 - 추출하는 샘플, 열 - 속성
m1[m1[,2]>4,]


# array
## array(값, dim=c(행의 개수, 열의 개수, 면의 개수), dimnames=NULL)
## dimnames는 반드시 list타입으로 지정해야 한다.
array(1:27, dim=c(3,3,3))
array(1:27, dim=c(3,3,3), dimnames=list(c('행1','행2','행3'),
                                        c('열1','열2','열3'),
                                        c('페이지1','페이지2','페이지3')))
# data.frame

# list
# data.frame
## 데이터프레임은 여러개의 벡터의 집합
name <- c('홍길동', '유관순', '장보고')
age <- c(22,19,25)
gender <- factor(c('M','F','M'))
blood <- factor(c('A','O','B'))

df <- data.frame(name,age,gender,blood)
df

## 데이터 프레임 요소에 접근
### 속성값을 출력하는 $이용
### 배열요소의 접근 방법인 [행인덱스, 열인덱스]
### [조건식]

birth=read.csv(file='C:/K_digital/source/data/birth.csv',fileEncoding="euc-kr")
str(birth)
plot(birth)
tbirth=read.csv(file='C:/K_digital/source/data/tbirth.csv',fileEncoding="euc-kr")
str(tbirth)
library(ggplot2)
library(dplyr)
ggplot(data=birth, aes(x=country,y=X2021),color=continent) + geom_col()
summary(birth)
tbirth[1:10,1:226]
tbirth[1:10,1:226]=as.numeric(unlist(tbirth[1:10,1:226]))
mpg<-as.data.frame((ggplot2::mpg))
summary(tbirth)

## 간단한 그래프를 빠르게 그리기위해 ggplot 패키지에서 제공하는 qplot
## qplot: 상자수염, 히스토그램, 선그래프, 막대그래프, 차트, 산점도
qplot(data=mpg, x=hwy)
qplot(data=mpg, x=cty)
qplot(data=mpg, x=drv,y=hwy)
qplot(data=mpg, x=drv, y=hwy, geom='line')
qplot(data=mpg, x=drv, y=hwy, geom='boxplot')
qplot(data=mpg, x=drv, y=hwy, geom='boxplot',colour=drv)

names(tbirth)
str(mpg)
raw<-mpg[c(mpg$cty,mpg$hwy),]
str(raw)
raw$total<-(raw$cty+raw$hwy)/2
head(raw)
raw$test<-ifelse(raw$total>=20,'pass','fail')

table(raw$test)
qplot(raw$test)
barplot(table(raw$test))
str(raw)
str(mpg)
## 연비에 따른 자동타의 등급을 부여하는 작업
## grade: A, B, C, D
## 30이상이면, A, 20이상이면 B, 그 외에는 C
raw$grade<-ifelse(raw$total>=30,'A',ifelse(raw$total>=20,'B','C'))
head(raw)        
qplot(raw$grade)

install.packages("reshape")
library(reshape)
# ggplot2::midwest
## 미국 동부중부 437개 지역의 인구통계정보를 가지고 있는 데이터 셋
str(midwest)
mw=as.data.frame(ggplot2::midwest)
str(mw)

## Q1. poptotal변수를 total로 popasian변수를 asian으로 변경
mw <- rename(mw, c(poptotal="total",popasian='asian'))
names(mw)
## Q2. total, asian 변수를 이용해 '전체 인구 대비 아시아 인구 백분율' 파생변수를 만들고, 히스토그램을 통해 도시들이 어떻게 분포되어있는지 분석하시오.
mw$asianrate <- mw$asian/mw$total*100
str(mw)
ggplot(data=mw,aes(state, asianrate),fill='state') + geom_boxplot()
qplot(mw$county,mw$asianrate,geom=histogram)
## Q3. 아시아 인구 백분율 전체 평균을 구하고, 평균을 초과하면 'large', 그 외에는 'small'로 부여하는 파생변수를 생성하시오.
avg=mean(mw$asianrate)
mw$asianper <- ifelse(mw$asianrate > avg, 'large', 'small')
str(mw)
## Q4. 'large'와 'small'에 해당하는 지역이 얼마나 되는지 빈도표와 빈도막대그래프를 만들어 분석하시오.
table(mw$asianper)
barplot(table(mw$asianper))

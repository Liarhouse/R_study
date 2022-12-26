# 탐색적 데이터 분석을 위한 데이터 핸들링(데이터 탐색)

## Base R에 내장된 데이터 셋의 목록을 확인하는 함수
data()
library(help=datasets)

## 데이터셋에 대한 도움말
?iris

## iris 데이터셋의 구조 확인
str(iris)

## iris 데이터셋의 내용을 데이터프레임 형태로 추출
View(iris)

### head(data, n), tail(data, n)
head(iris) # 기본적으로 6개의 행 추출
head(iris, 10)

# 내장데이터셋을 사용할 때


m <- matrix(1:8, ncol=2, dimnames=list(c('spring', 'summer', 'fall', 'winter'), c('male','female')))
m
m_up=m[1,] + m[2,]
m_down=m[3,] + m[4,]
m_neo=rbind('상반기'=m_up, '하반기'=m_down)
m_neo


# subset(데이터프레임, 조건, 추출할 열)
## iris 데이터 Sepal.Length가 7보다 큰 데이터를 추출
iris[iris$Sepal.Length > 7,]
subset(iris, Sepal.Length > 7)

## Sepal.Length가 7보다 크고 Petal.Length가 6.6보다 작거나 같은 데이터
iris[iris$Sepal.Length > 7 & iris$Petal.Length <= 6.6, ]
subset(iris, Sepal.Length > 7 & Petal.Length <= 6.6)

# doBy: 특정 값을 이용하여 추출하는 함수를 제공하는 패키지
install.packages('doBy')
library(doBy)

## summaryBy(): 특정 조건에 따라 요약을 하는 함수
summary(iris)
### 사분위수
quantile(iris$Sepal.Length)
summaryBy(Sepal.Width + Sepal.Length ~ Species, iris)
summaryBy(Sepal.Width + Sepal.Length ~ Species, iris, FUN = median)
x <- c(23,28,17,15,22,30)

xx <- order(x)
xx
sort(x,)

library(dplyr)
median_species <- sapply(split(iris$Sepal.Length, iris$Species), median, na.rm=T)

median_species

iris <- within(iris,{
  Sepal.Length <- ifelse(is.na(Sepal.Length),median_species[Species], Sepal.Length)
})

# aggregate(데이터, 그룹조건, 함수)
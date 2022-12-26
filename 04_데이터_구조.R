# R의 자료구조
## vector(), matrix(), Array(), data.frame(), list()
## 1. 벡터(vector)
## scalar(스칼라) : 크기만 가지고 있는 물리량, 1개의 원소만 가지고 있는 자료형
## vector(벡터) : 크기와 방향, 1개 이상의 원소를 담는 자료형
## 벡터를 생성 : c(), start:stop(콜론), seq()
## 벡터의 인덱스는 1부터 시작
## 하나의 벡터에는 하나의 자료형만 담을 수 있다.
## 벡터연산에 주로 사용되는 내장함수

# 벡터 생성
x <- c(1, 2, 3, 4)
y <- c(1,3,5,7,9)
x

# x의 정보확인, 자료구조
str(x)

x <- 10
x

1:7
7:1
y <- c(1, "hi", 2)
y
str(y)
x <- 1:7

# vector(legnth=n) : 요소가 n개인 빈 벡터를 생성
vector(length=5)
c(1:5)
c(1,2,3,c(4:6))

y=c()
y=c(y, c(1:3))
y=c(y, c(4:6))

# seq : 순열
# seq(from=처음값, to=마지막값, by=증가값)

x = seq(from=1, to=5, by=1)
y = seq(1,10,2)

z = seq(0, 1, 0.1)
z

w = seq(0, 1, length.out=12)
w

# rep(벡터, times = 반복획수)
x <- rep(c(1:3), times=2)
x

# rep(벡터, each=개별요소반복)
y = rep(c(1:3), each=2) 
y

# 벡터 내 특정 요소 선택 : 벡터명[인덱스]
x = 1:10
x

# x의 두번째 요소
x[2]
# x의 두번째 요소를 제외한 나머지
x[c(-2,-3,-4)]
# x의 세번째 요소에 30으로 변경
x[3] <- 30
x의 요소 중에 2~4까지 요소 추출
x[2:4]
x[c(1,3,5)]

# append(원본팩터, 추가할 팩터, 추가할 위치)
append(x, 500, 1)
x <- c('A', 'B', 'C')
y <- c('D', 'E')
z <- append(x, y)
z
z <- append(x, y, 0)
z

# 벡터의 연산 : 같은 위치의 요소끼리 연산을 수행한다
x <- c(1:4)
y <- c(5:8)
z = x+y
z

z=x-y
z

z = x*y
z

x <- c(1,2,3)
y <- c(5,6)
z = x + y
z
z = x - y
z
z = y / z
z

x = c(1:4)
z = x * 2
z

x <- 1:10
x > 5

# all : 모두
# any : 어느거 하나라도

all(x>5)
any(x>5)


# head(), tail()
x = 1:20
head(x)
tail(x)

head(x,3)
tail(x,3)

# 집합 : 합집합(union), 교집합(intersect), 차집합(setdiff), 비교(setequal)
x = c(1,2,3)
y = c(3,4,5)
z = c(3,1,2)

union(x,y)

# 베이스 R이 제공하는 기본 데이터 목록을 확인하는 명령
data()

help(iris)

head(iris)
tail(iris)

# 기초 통계량
summary(iris)
str(iris)

View(iris)
help(ChickWeight)
help(cars)
help(women)

val <- c(1,2,3,4,5,6,7,8,9)
val
summary(val)
xy = rnorm(30)
xy

# 원소의 개수
length(val)
mean(val)
var(val)
sd(val)
range(val)

?abs
sin(1)
sin(2)

# 데이터 유형 : mode()
xx = c(0.2, -1, 2, -0.5)
xx
mode(xx)

yy = 1:9
max(yy)
min(yy)
median(yy)

xx = 1:10
median(xx)

## NULL, NA, NaN
sqrt(-3)
x = c(1,3,NA,4,20,7,NA)
x
mean(x)
mean(x, na.rm=T)

grade = c('하하', '중하', '중', '중상', '상상')
oo = factor(grade, levels=c('하하', '중하', '중', '중상', '상상'), ordered=T)
oo
help(array)

x = array(1:27, dim=c(3, 3, 3), dimnames=list(c('행1', '행2', '행2'),
                                              c('열1', '열2', '열3'), c('면1', '면2', '면3')))
x

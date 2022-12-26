# 리스트(List): 각 요소의 타입이 일치하지 않은 벡터
## list()
## R이 제공하는 모든 자료구조를 담을 수 있다.
## 파이썬의 자료형인 사전과 같이 변수와 값을 쌍으로 담는다.

Hong = list(kor.name = "홍길동", 
            eng.name = "Gil-dong",
            age = 43,
            married = T,
            num.child = 2,
            child.ages = c(13,10))
Hong
Hong$age

Hong$child.ages[2]
str(Hong)

# 리스트도 벡터의 인덱스를 사용할 수 있지만 [[]]
Hong[[2]]
Hong[[3]]
Hong[c(1,2)]

is.list(Hong)

x = list(a = 1:10,
         b = exp(-3:3),
         logic = c(T, F, F, T))
x
?exp

lapply(x, mean)
x

# 데이터프레일(Data Frame)
## 여러 개의 벡터들의 집합
## 데이터 분석에서 가장 널리 사용되는 구조
## 2차원 행렬의 의미, 서로 다른 자료형을 담을 수 있다.
## data.frame()
id = c('F1', 'F2', 'F3')
name = c('aaa', 'bbb', 'ccc')
age = c(32, 27, 25)
blood.type = c('A', 'O', 'B')

df = data.frame(id, name, age, blood.type)
df
str(df)
df2 = data.frame(id, name, age, blood.type, stringsAsFactors = T)
df2
str(df2)

df3 = data.frame(names=c('홍길동', '장보고'), ages=c(32, 28))
df3
str(df3)

# 데이터프레임 데이터에 접근
## 데이터프레임[행, 열]
df

# 2행 3열
df[2, 3]
df[c(2,3), 3]

# age, blood.type
df[,c(3,4)]

df[, c('age', 'blood.type')]
# 이름만 추출
df$name
df$age

sum(df$age)

# 총 행수
nrow(iris)

# 총 열수
ncol(iris)

# iris 데이터셋의 앞에 3개의 데이터만 확인
head(iris, 3)

# 기술통계분석(기초통계분석)
summary(iris)
summary(df)
min(iris$Sepal.Width)
quantile(iris$Sepal.Length)

# 데이터 탐색
View(iris)

# subset: 조건에 해당하는 데이터를 추출
# subset(data.frame, condition, select)
# iris에서 Sepal.Length가 7보다 큰 데이터를 추출
subset(iris, Sepal.Length>7)
# Sepal.Length가 7보다 크고, Petal.Length 6.6보다 같거나 작은 데이터를 조회
subset(iris, Sepal.Length>7 & Petal.Length>=6.6)
subset(iris, Sepal.Length>7 | Petal.Length>=6.6)

# Sepal.Length가 7.2보다 크고, Petal.Length가 6.5보다 작거나 같은 요소 중 Sepal.Length와 품종 추출
subset(iris, Sepal.Length>7.2 & Petal.Length<=6.5, c(Sepal.Length, Species))

# setosa 품종에 대한 구조 확인
str(subset(iris, Species == 'setosa'))

nrow(subset(iris, Species == 'setosa'))

# nrow : 행렬만 사용 가능
# NROW : 벡터와 행렬 모두 사용가능

# %in% : 포함여부를 판단하는 연산자
'a' %in% c('a', 'b', 'c')

# 집합 : union(합집합), intersect(교집합), setdiff(차집합)
union(c('a','b','c'), c('a','d'))
intersect(c('a','b','c'), c('a','d'))
setdiff(c('a','b','c'), c('a','d'))

# 집합간의 비교연산
setequal(c('a','b','c'), c('a','d'))
setequal(c('a','b','c'), c('a','c','b','c'))

# all, any(전부, 어느것 하나하도)
x = 1:10
x > 5

all(x>5)
any(x>5)

# apply(행렬데이터, 방향, 연산함수)
# 방향: 1(행단위), 2(열단위)
xx = array(1:12, c(3,4))
xx

apply(xx, 1, mean)
apply(xx, 2, sum)

# sample(): 벡터나 배열에서 샘플 추출
yy = array(1:12, c(3,4))
yy

sample(yy)
sample(yy, 10)

sample(1:45, 6)
sample(1:15, 20, rep=T)

# 데이터프레임 생성
a = data.frame(x=c(1,2,3,4,5), y=c(2,4,6,8,10))
a

b = data.frame(x=c(1,2,3,4,5), y=c(2,4,6,8,10),
               z=c('M', 'F', 'M', 'F', 'M'))
b

# 기존 데이터프레임에 새로운 열 추가
b$v = c(3,6,8,12,15)
b

# 예전에 데이터프레임 생성시 문자는 factor, 4.0버전부터 기본형은 문자
df = data.frame(name=c('장보고', '이순신',
                       '홍길동'),
                ages=c(32,18,19))
df
str(df)

# 데이터프레임명$변수명
b

b$x
# 데이터프레임에서 하나의 열을 얻어오면 벡터타입이 된다.
# drop=FALSE
b[ , 'x', drop=F]
b[1,]

df2
df2$gender = c('M', 'F', 'M')
df2
df2$name

df2[,2]

subset(df, name=='장보고')

subset(df, name=='이순신', c(ages,name))

# 데이터프레임의 속성명을 변수명으로 변경 : attach
cars
str(cars)
attach(cars)
speed
dist
detach(cars)

# with(): 데이터프레임에 다양한 함수를 적용할때 함께 사용하면 데이터프레임$를 사용하지 않아도 됨
with(cars, mean(speed))

# 속도가 20을 초과하는 데이터만 추출하시오
subset(cars, speed>20)
with(cars, speed>20)

# SQL 익숙한 사람들은 sql을 이용할 수 있다
# 패키지 설치
install.packages("sqldf")

# 패키지 로딩
library(sqldf)
?longley
sqldf("select GNP, Year, Unemployed from longley where GNP > 400")

# 정렬(sort)와 order()
## order(x, TRUE-내림차순, FALSE-오름차순, na.last)
## TRUE - 맨 끝에, FALSE - 맨 앞에

df
df$ages
order(df$ages)

# 나이를 기준으로 오름차순 정렬
df[order(df$ages), ]
df[order(df$ages, decreasing = T), ]

sort(df$ages)

# 그룹함수: 특정 열을 기준으로 그룹을 묶어 계산, 집계함수
# aggregate(formula, data, function)
# formula: 집계할 열 ~ 집계기준열
# cbind(집계할 열1, 집계할열2..) ~ 기준열1 + 기준열2...

emp = data.frame(
  dept=c('개발부','개발부', '개발부', '개발부', '영업부', '영업부','영업부', '영업부'), position=c('과장', '과장', '차장', '차장', '과장', '과장', '차장', '차장'), name=c('aaa', 'bbb', 'ccc', 'ddd', 'eee', 'fff', 'ggg', 'hhh'), sal=c(5600, 5100, 7500, 7300, 4900, 5500, 6000, 6700), time=c(15, 18, 18, 12, 17, 20, 8, 19))
)

#  부서별 급여평균
aggregate(sal ~ dept, emp, mean)

# 부서별 급여 및 근무시간의 평균
aggregate(cbind(sal,time)~dept, emp, mean)

# 부서와 직급별로 급여의 평군
aggregate(sal ~ position+dept, emp, mean)
aggregate(sal ~ dept+position, emp, mean)

# na.rm: 옵션
# na.omit(): 데이터프레임에서 결측값을 제거

Titanic
str(Titanic)

# airquality
# Ozone = ?
str(airquality)
mean(airquality[,'Ozone'], na.rm=T)
mean(airquality$Ozone, na.rm = T)
O = na.omit(airquality)
O
mean(O$Ozone)

# merge(): 여러 개의 데이터프레임을 병합할 때 사용하는 함수
name = c('홍길동', '장보고', '이순신')
age = c(22,30,19)
gender = factor(c('M', 'F', 'M'))
p1 = data.frame(name, age, gender)
p1

blood.type = factor(c('A', 'O', 'B'))
p2 = data.frame(name, blood.type)
p2
p3 = merge(p1, p2, by='name')
p3

name1 = c('철수', '춘향', '길동')
name2 = c('민수', '춘향', '길동')
df1 = data.frame(name1, age, gender)
df2 = data.frame(name2, blood.type)
df = merge(df1,df2, by.x='name1', by.y='name2')
df
df = merge(df1,df2, by.x='name1', by.y='name2', all = T)
df

# 리스트: 데이터프레임보다 넓은 자료구조
## list(oop1, oop2,....)

x = list(name= 'foo', height=70)
x

# 리스트는 객체마다 크기와 타입이 달라도 가능하다.
x=list(name='foo', height=c(1,3,5))
x

# 리스트 안에 리스트를 중첩
list(a=list(val=c(1,2,3), b=list(val=c(1,2,3,4))))
x$name
x$height

x[[1]]
x[[2]]

x[1]
x[2]

a = c(1,2,3,4,5)
b = c(T,F,T,T,F,T)
c = data.frame(name=c('aaa','bbb','ccc'), age=c(23,41,39))
var_list=list(v1=a,v2=b,v3=c)
var_list

names(var_list)

names(var_list)[3] = 'df_1'

names(var_list) = c('item1', 'item2', 'item3')
var_list

# 리스트의 요소 개수
str(var_list)
length(var_list)

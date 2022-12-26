# 할당: = 좌변에 우변의 값을 대입한다. 또는 할당한다.
a = 2
print(a)

# ==: 논리연산자
a == 2
a != 2

b = c(1,2,3,4,5)
print(b)

# seq(from, to, by)
x = seq(1, 10, 1)
x

x1 = seq(1, 10, by=2)
x1

x2 = seq(10,1)
x2

# start:end
x3 = 1:10
x3

x4 = 10:1
x4

# rep(반복할 값, 반복횟수) times, each
y1 = rep(1, 10)
y1

y2 = rep(c(1, 10), 2)
y2

y3 = rep(c(1,10), each=2)
y3

x <- c(1, 2.5, 3.2)

fruit <- c(5,3,2)
names(fruit) <- c('apple', 'orange', 'peach')
fruit
fruit <- setNames(c(5,3,2), c('apple', 'orange', 'peach'))

# setNames: 객체에 이름을 부여할 때 사용하는 함수
fruit <- setNames(c(5,3,2), c('apple', 'orange', 'peach'))

# str(): 데이터구조, 자료형, 크기
# typeof() or mode(): 단순히 자료형을 알아내는 함수
typeof(x)

# is.datatype: 형 확인
is.double(x)

# as.datatype: 형 변환
mode(y)
typeof(y)
as.double(y)
is.numeric(y)

typeof(w)
mode(w)

# typeof(): 벡터를 구성하고 있는 요소의 타입을 알려주는 함수
# is.double(): 실수인지 논리값으로 알려주는 함수
# as.double(): 실수 벡터로 변환하는 함수
# is.numeric(): 숫자 벡터인지 알려주는 함수
# as.numeric(): 숫자 벡터로 변환하는 함수
# length(): 벡터의 길이를 변환하는 함수

#새로운 벡터를 생성할 때 주로 사용하는 함수
a = c(1, 2, 3)
b = c(5, 6)
x = c(a, 4, b)
x

# 벡터의 인덱스 범위를 벗어나는 위치에 값을 할당하면 빈자리는 결측치 처리
a[7] = 2
a

# append(): 기존의 벡터에 새로운 값을 추가해 새로운 벡터를 생성
append(x, 99, after=3) # x의 세번쨰 요소 뒤에 99삽입

append(x,-99, after=0)

x = seq(from=0, to=1, by=0.1)
y = seq(1, 1, 11)
z = 1:10
5:-5


x = 1:3; y=c(2, 2, 2)
x + y
x-y
x*y
x/y
x^y

z = rep(2,5)
x+z

# 벡터와 스칼라
y - 3
y - rep(3, length(y))

x = 1:10; y=rep(5,10)
z = x < 5
sum(z)

z = x <= 5
sum(z)

x == 5
x != 5
y
(x > 5) & (y <2)
(x > 5) | (y <2)

# R은 다양한 수학/통계 함수를 제공함
# rnorm(): 정규분포를 따르는 난수를 발생기키는 함수
x = rnorm(10)
x

max(x)
min(x)
sum(x)
prod(x)
mean(x)
median(x)
range(x) # 범위 - 최대값과 최소값의 차이
quantile(x) # 사분위수

quantile(x, probs=c(0.2,0.7))
var(x) # 분산
sd(x) # 표준편차

x
y
cov(x,y) # 공분산
cor(x,y) # 상관계수
sort(x)
rank(x)
order(x)
x[order(x)]

cumsum(x) # 누적합
cumprod(x) # 누적곱
cummax(x) # 누적 최댓값
cummin(x) # 누적 최솟값

# 성분별 최댓값
pmax(x, y, z)
pmin(x, y, z)

# 결축값 NA
x = c(1,2,3,NA,5)
sum(x)
is.na(x) # 결측치 여부를 논리값으로 알려주는 함수

sum(x, na.rm=T)

x = -10:10
x
x[3]
x[c(1,3,5)]
x[-1] # 1번쨰 요소를 제외하고 추출
x[-c(1,3,5)]

y = x[x<0]
y

# 보간법: 결측값을 다른 값으로 대체하는 방법
x = c(1, 2, 3, NA, 5)
# 결측값을 빼고 출력하는 방법

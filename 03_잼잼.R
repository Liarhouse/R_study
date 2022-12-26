# 산술연산, 계산기처럼 활용
# 연산자 : +,-,*,3,%/%,%%,**(^)
# 비교(관계)연산자 : TRUE(T) or FALSE(F)
# <, <=, >, >=, ==, !=
# 논리연산자 : !(not), |(or), ||(or), &(and), &&(and)
# R 자료형 : 숫자형(int, num, cpix)
# 문자형 : chr, "" or ''
# 범수형 : factor
# 특수상수(값) : NULL, NA(missing value)-결측값
## Inf, -Inf
# NaN : Not a Number, 0/0, Inf/-Inf-연산이 불가능한 값
# R의 자료형을 확인하는 함수
## class(x), is.integer(x), is.numeric(x)
# is.complex(x)-복소수, is.character(x), is.na(x)
# R 데이터형을 변환함수
## as.factor(x), as.integer(x), as.numeric(x)
## as.character(x), as.matrix(x), as.array(x)

x <- 1
# 숫자형 - 정수형, 실수형, 복소수

?is.numeric

is.integer(x)
x <- 1L
is.integer(x)
is.double(x)
is.numeric(x)
x <- 1
is.double(x)
is.integer(x)
as.integer(x)
as.double(x)

# 변수제거
rm(x)
rm(a)

x



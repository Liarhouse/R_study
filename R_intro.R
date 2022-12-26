## R 자료구조
# 자료형: 수치형, 문자형, 논리형, 복소수형
# 자료구조 : 변수 => 벡터(vector) => 행렬(matrix) => 데이터프레임 => 리스트
# 변수할당: 변수명 <- 값(권장), 값 -> 변수명, 변수명 - 값
# 팩터(factor) : 범주형 데이터 - 서열형, 명목형
## factor(벡터자료, levels, ordered)

# vector: 값들의 집합, 1개 이상의 데이터를 담고 있는 자료구조
## 1차원 배열, 가변길이 배열, c(), start:end, seq(from, to, by), rep()
## length(), max(), min, mean(), range()-최솟값과 최댓값 사이의 값, ranke(), sort(), sum(), sd()...

# 배열(행렬, matrix): 2차원 배열, 행(관측값)과 열 속성, 변수)
## array(), matrix(), rbind(), cbind()

# R base에서 제공하는 기본 데이터셋 목록을 확인하는 함수
data()

# women:
women

# cars:
## 데이터 구조 확인하는 함수
str(cars)

# iris
str(iris)

plot(women)
plot(cars, col='blue', xlab='속도', ylab='거리', pch=17)

?plot
help(plot)

# 데이터의 내용확인: head(), tail()
head(iris, 10)
tail(iris)
plot(iris)

plot(iris$Petal.Width, iris$Petal.Length, col=iris$Species)

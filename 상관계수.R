# 상관분석
## 변수 간의 관련성을 분석하는 방법으로 하나의 변수가 다른 변수와 관련성이 있는지를 분석하는 방법
## 회귀분석 전에 변수간에 관련성을 분석하는 용도로 사용된다.
## 가설검정전에 수행한다.
## 상관계수: 피어슨 상관계수(일반적으로 많이 사용됨)와 스피어맨 상관계수가 있음
## 상관계수 r의 변하는 정도를 -1 ~ 1 사이의 값으로 나타낸다.

# 산점도 (scatter plot)
## 두 양적 자료 간에 관계를 살펴보기 위한 시각화
windows()
plot(cars$speed, cars$dist)

# 상관계수
## 상관계수를 구할 때 모수적 방법인 Pearson이 있고,
## 비모수적인 방법으로 Kendall, Spearman이 있다.
## 모수적 방법: 모집단이 정규분포를 갖는다는 가정하에 분석
## 비모수적 방법: 모집단 분포에 대한 가정없이 분석
cor(cars$speed, cars$dist, method = 'pearson')

# 상관분석
## 두 양적 자료 간의 관련성(직선의 관계=선형의 관계)가 있는지를 검정하는 통계분석 방법
### 귀무가설: 관련성이 없다.
### 대립가설: 관련성이 있다.
cor.test(cars$speed, cars$dist, method = 'pearson')

# 산점행렬도: pairs(데이터프레임 형태의 자료형)
str(iris)
windows()
plot(iris[,1:4])
pairs(iris[,1:4])

# 상관계수 행렬
## 여러 개의 양적 자료 간에 상관계수를 구하는 것
cor(iris[,1:4])

# rcorr(): 여러 개의 양적 자료에 대한 상관계수와 유의확률을 한번에 구해주는 함수. 단, 데이터의 형태는 행렬(matrix)이어야 한다.

install.packages("Hmisc")

Hmisc::rcorr(as.matrix(iris[,1:4]), type = 'pearson')

# 상관계수의 시각화
result = cor(iris[,1:4])

# 패키지 설치
install.packages("corrplot")
??corrplot
windows()
corrplot::corrplot(result, method='circle')
corrplot::corrplot(result, method='pie')
?corrplot


# 단순회귀분석
result<-lm(cars$dist ~ cars$speed, data=cars)
summary(result)

# 회귀방적식
## dist(제동거리) = 3.9324 * speed - 17.5791

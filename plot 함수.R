# plot(): 산점도(scatter plot)

x <- 1:10
y <- x^2
plot(x,y, xlim=c(3,9),ylim=c(20,100))
# xlab, ylab: x, y축 이름
# main: 차트 제목
# pch: 점의 종류
# cex: 점의 크기
# col: 색상
# xlim, ylim: x, y축 값의 범위
# type: 그래프유형
# lty: 선유형

# 축이름과 그래프 제목
plot(x,y,xlab='x축 이름',ylab='y축 이름',main='차트 제목')
# 점의 종류
example("points")
# 점의 종류
?pch

# 점의 크기
x = rep(1:5, rep(5,5))
y = rep(5:1, 5)
plot(x,y,cex=.5)

# type: 그래프 유형
# par:(mfrow()): 그래프 배열
par(mfrow=c(2,3))
x = 1:10
y = x^2

plot(x,y,type='l',main="lines",lty='solid')
plot(x,y,type='h',main="histogram")
plot(x,y,type='n',main="no ploting")
plot(x,y,type='b',main="points and lines")
plot(x,y,type='s',main="stair step")
plot(x,y,main="default")

# cars: 자동차의 속도와 제동거리의 관계
# layout()
m = matrix(c(1,1,2,3), ncol=2,byrow=T)
m
layout(mat=m)
plot(cars, main='scatter plot of cars data')
hist(cars$speed, col='lightblue', border='white')
hist(cars$dist, col='darkgray', border='white')

# points(): 점을 그리는 함수
## plot() 함수 아래에 기존에 그려진 그래프에 점을 추가할 때
plot(iris$Sepal.Length, iris$Sepal.Width, cex=.5, pch=20,
     xlab='Length', ylab='Width', main = 'iris')
points(iris$Petal.Length,iris$Petal.Width, cex=.5, pch='+', col='green')

# lines(): 꺾은 선 그래프를 그리는 함수
## plot 함수와 함께 사용하여 꺾은선을 추가할 때 사용
## 시계열 데이터: 시간의 흐름을 측정한 데이터
x = seq(from = 0, to = 2*pi, by = 0.1)
y = sin(x)

plot(x,y,type = 'n') # dotted, 점
lines(x,y,lty=3)

# abline(): 직선을 그리는 함수
plot(x,y)
# lty='blank' == lty=0
# lty='solid' == lty=1
# lty='dashed' == lty=2
# lty='dotted' == lty=3
# lty='dotdash' == lty=4
# lty='longdash' == lty=5
abline(v=3, lty=2)
abline(h=0, lty=3)
abline(a = -1, b = 1, col = 'red') #y=-1+x

# curve(): 곡선을 그리는 함수
curve(expr=sin, from = 0, to = 2*pi)

# text(x좌표, y좌표, labels='표시할문자', adj=NULL)
# adj: 텍스트의 위치를 지정하는 옵션
## (0,0) 우측상단, (0,1) 우측하단, (1,0) 좌측상단, (1,1) 좌측하단
text()
?text

plot(4:6, 4:6, type='n')
text(5,5,'X')
text(5,5,'바보',adj=c(0,0))
text(5,5,'뭘봐',adj=c(0,1))
text(5,5,'꺼져',adj=c(1,0))
text(5,5,'멍충',adj=c(1,1))

# polygon(): 다각형을 그리는 함수
## 신뢰구간 같은 범위 값을 표현할 때 유용하다.
data = seq(-pi, pi, length.out = 12)
x = cos(data)
y = sin(data)
plot(1:6, type = 'n', main = 'polygon', axes = F)

x1=x+2
x2 = y+4.5
polygon(x1,x2)
text(2,5.7,adj=0.5,'default')

y1=x+2
y2 = y+2
polygon(y1,y2,col='gold')
text(2,2.7,adj=0.5,'gold')

# legend(x좌표, y좌표, 표시할 범례)
# left, right

# boxplot(): 데이터의 분포를 그려주는 그래프
boxplot(iris$Sepal.Width)
## 이상치(outlier) 값을 판단
## 이상치: 정상범위를 벗어난 값
## 정상범위의 기준: IQR(InterQuartile Range) x 1.5
## IQR: 3Q - 1Q
## 최대이상치 = Q3 + IQR * 1.5
## 최소이상치 = Q1 - IQR * 1.5

# $stats: 기초통계값(min, 1Q, median, 3Q, max)
boxplot(iris$Sepal.Width)$stats

# $n: 통계량
boxplot(iris$Sepal.Width)$n

# $out: 이상점
boxplot(iris$Sepal.Width)$out

# hist()
hist(iris$Sepal.Width)

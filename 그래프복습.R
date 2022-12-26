# 히스토그램 : hist()
?hist

## 데이터 생성
set.seed(1)
data = rnorm(100, 170, 5)

hist(data)

# 시각화 결과를 별도의 창으로 표시
windows()


# 수치데이터 요약보고서(기술통계분석)
summary(data)

x <- hist(data, 
          breaks = seq(150, 190, 2),
          col = 'red',
          main = 'my histogram',
          xlab = 'height(cm)',
          axes = F)
x

# y축 최대값
max(x$counts)

# 축설정
## x축 눈금 설정
x_axis_tick <- seq(150, 190, by=2)
x_axis_tick
axis(side = 1, at = x_axis_tick)


## y축 눈금 설정
y_axis_tick <- seq(0, max(x$counts), by=2)
axis(side = 2, at = y_axis_tick)

# 범례 설정
?legend
legend('topright', 'height', fill='red')


# 질적 자료(범주형 데이터)를 요약하는 시각화
## Bar Chart : barplot()
# Beer Preference
beer <- c(3, 4, 1, 1, 3, 4, 3, 3, 1, 3, 2, 1, 2, 1, 2, 3, 2, 
          3, 1, 1, 1, 1 ,4 ,3, 1)

# (1) Domestic can (2) Domestic bottle (3) Microbrew (4) Import
windows()

# 범주형 데이터의 건수(도수분포표)
barplot(table(beer))

# 상대 도수

table(beer)

table(beer) / length(beer)

?barplot
barplot(table(beer) / length(beer), col = c("lightblue", "mistyrose",
                                            "lightcyan", "lavender"),
        names.arg = c("Domestic\n can", 'Domestic\n bottle', 
                      'Microbrew\n', 'Import\n'),
        ylab = 'Relative frequency', main = 'Beer Prefrence Survey')



# Pie Chart : pie()
beer.counts <- table(beer)
pie(beer.counts)

names(beer.counts) <- c("Domestic\n can", 'Domestic\n bottle', 
                      'Microbrew\n', 'Import\n')
pie(beer.counts, col = c('blue', 'red', 'white', 'black'))

pie3D(beer.counts, main = 'Beer Prefrence Survey', 
      labels = names(beer.counts),
      labelcex = 0.9, explode = 0.2, radius = 2, 
      col = c('red', 'blue', 'yellow', 'brown'))

?pie3D


# 양적 자료를 요약할 때 사용하는 시각화
## stem()

data <- c(2, 3, 16, 23, 14, 12, 4, 13, 2, 0, 0, 0, 6, 28, 31, 14, 4, 8)
stem(data)

## 히스토그램
hist(rnorm(1000), xlab = 'data')

## 히스토그램의 밀도함수 표현
x <- rnorm(1000)
hist(x, probability = T, xlab = 'data', col = 'gray', border = 'white')

# 밀도 함수를 표현하는 곡선
z <- seq(from=-3, to=3, by=0.01)
lines(z, dnorm(z), col=2)



# 산점도(산포도) : scatter plot : plot()

plot(cars$speed, cars$dist, col='blue', pch='+', 
     ylab = '제동거리', xlab = '속도',
     ylim = c(-20, 140))


# with() : $를 사용하지 않도록 하는 함수(시각화에서 주로 사용)

with(cars, plot(speed, dist, col='blue', pch=20, 
                ylab = '제동거리', xlab = '속도',
                ylim = c(-20, 140)))



# 데이터 탐색
# 기술통계량: 데이터를 요약해서 대표값 추출

# 식당의 배달시간을 측정한 값을 이용해서 기초통계를 파악
storeA = c(20,21,23,22,26,28,35,35,41,42,43,45,44,45,46,47,47,46,47,58,58,59,60,56,57,57,80)
storeB = c(5,6,11,13,15,16,20,20,21,23,22,27,27,30,30,32,36,37,37,40,40,43,44,45,51,54,70)
storeC = c(5,5,5,12,10,11,20,20,20,20,20,21,20,30,32,31,31,31,36,40,40,51,61,51,61,61,70)

mean(storeA)

mean(storeB)

# 600을 뺀 평균
mean(storeB[storeB<600])

median(storeA)
median(storeB)
median(storeB[storeB<600])


# 사분위수: quantile()
## A식당과 B식당의 사분위수 산출
quantile(storeA)
quantile(storeB)

## fivenum(): 다섯개의 수치 요약을 추출
fivenum(storeA)

## summary(): 수치데이터의 기초통계량을 한번에 파악
summary(storeA)

# boxplot: 상자수염그래프
boxplot(storeA)
boxplot(storeB)
boxplot(storeB[storeB<600])

## A, B 식당의 배달시간
boxplot(storeA, storeB, names=c('A식당','B식당'))
points(c(mean(storeA), mean(storeB)), col='red', pch=8, cex=2)        


boxplot(storeB, storeC, names=c('B식당','C식당'))
points(c(mean(storeB), mean(storeC)), col='red', pch=8, cex=2)

summary(storeB);summary(storeC)

boxplot(storeB, storeC, names=c('B식당','C식당'))

# 히스토그램 연속된 수를 그래프로 표현할 때 구간을 나누고
## 막대그래프: 이산형 데이터, barplot()
## 히스토그램: 연속형 데이터, hist()
?hist
hist(storeB, main='B식당 배달소요시간 분포', xlab='배달소요시간',ylab='건수')
hist(storeC, main='C식당 배달소요시간 분포', xlab='배달소요시간',ylab='건수')


# scatter plot: 산점도(산포도)
plot(cars$speed, cars$dist, type='o')

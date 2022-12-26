# 평균(mean)

# 중앙값(median)

#사분위수
## fivenum(): 다섯수치요약(최소값, 1사분위수, 중앙값, 3사분위수, 최대값)
## summary(): 기초통계분석(요약보고서)
fivenum(1:11)
summary(1:11)

## fivenum과 summary의 결과는 데이터가 홀수개일때 동일하지만 짝수개일 때 다른 결과를 보인다.
fivenum(1:10)
summary(1:10)

## 1Q = 1+(4-1) x (1/4), 3Q = 1 + (4-1) x (3/4) => summary

## IQR: 3사분위수 - 1사분위수
IQR(1:10)
quantile(1:10)

## range(): min, max
## 범위 diff(range())
range(1:10)
diff(range(1:10))

# 범주형 데이터: 파이차트와 막대그래프
## 최빈값(mode) - R에서는 존재하지 않는다.
## table(범주형 데이터)
## which.max(table())
bloodType = c('A', 'B', 'A', 'AB', 'O', 'A', 'A', 'B', 'A', 'O', 'O', 'B', 'O', 'A', 'AB', 'B', 'O', 'A', 'A', 'B')
bloodType

### 범주형 데이터의 건수
table(bloodType)

### 데이터셋에서 위치값을 반환하는 함수
### which, which.max, which.min
which.max(table(bloodType))

### 위에서 얻은 인덱스를 이용해서 이름 추출
names(table(bloodType))[which.max(table(bloodType))]

### 혈액형 데이터의 수
length(bloodType)

result<-table(bloodType)
result

names(result)

sum(result)

### addmargins(): 합계를 붙여서 표시하는 기능
addmargins(result)

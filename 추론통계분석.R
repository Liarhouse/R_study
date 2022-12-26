# cars: 자동차의 속도와 제동거리를 가지고 있는 데이터 셋
plot(cars)

summary(lm(cars$speed ~ cars$dist))

# 건전지의 수명이 1000시간일 때
x <- c(980, 1008, 968, 1032, 1012, 1002, 996, 1017, 1009)
## 귀무가설: 건전지의 수명시간은 1000시간이다.
## 대립가설: 건전지의 수명시간은 1000시간이 아니다.

## 데이터의 개수가 적으면 정규분표인지를 검증: Shapiro-wilk 검정
### 귀무가설: 정규분포를 따른다.
### 대립가설: 정규분포를 따르지 않는다.
shapiro.test(x)
### p-value = 0.8002는 0.05보다 크므로 귀무가설을 채택한다. (정규분포이다.)
t.test(x, mu=1000 , alternative = 'two.sided')

# Q. 어떤 학급의 수학 평균성적은 55점이다. 0교시 수업을 시행하고 나서 학생들의 시험성적은 다음과 같다.
score <- c(58, 49, 39, 99, 32, 88, 62, 30, 55, 65, 44, 55, 57, 53, 88, 42, 39)

# 0교시 수업을 시행한 후 학생들의 성적을 올랐다고 할 수 있을까?
shapiro.test(score)
t.test(score, mu=55, alternative = 'greater')

## A학원은 성적향상에 도움이 될까?
jumsu <- read.csv('score.csv', header=F)
jumsu
### 학원을 다니기 전의 성적
before <- jumsu$V1
### 학원을 수강한 후 성적
after <- jumsu$V2

### boxplot
boxplot(before, after, names=(c('수강전', '수강후')))

mean(before)
mean(after)

### 정규분포여부 검정
### 귀무가설: 정규분포를 따른다.
### 대립가설: 정규분포를 따르지 않는다.
shapiro.test(before)
shapiro.test(after)

# t.test(x, y, paired=T or F, var.equal=T)
## paired=T면 대응표본, F면 독립표본
## var.equal = T or F
### True - 두 집단의 분산이 같다
### False = 두 집단의 분산이 다르다
var.test(before, after)
### 귀무가설: 분산이 같다
### 대립가설: 분산이 다르다

t.test(before, after, paired=T, var.equal=T, alternative = 'less')

# alternative: 양측검정과 단측검정을 설정
### 양측검정 - 단순히 두 집단이 다르다라는 것만 확인 하는 것(two.sided)
### 단측검정 - 큰지 작은지까지 확인하는 것(less, greater)

# 일원분산분석(One-way ANOVA) == 분산분석
## 3개 이상의 집단간의 차이를 검정하는 분석기법
## 단, t-검정과 달리 anova 검정은 집단간의 차이가 존재하는지에 대한 여부만을 확인한다.
### 귀무가설: 3개의 집단의 평균이 같다.
### 대립가설: 3개의 집단의 평균이 같지 않다.
### 귀무가설이 기각이 될때 사후검정: TukeyHSD 방식
data()
library(MASS)


## 거식증 환자의 몸무게 변화 평균값이 세가지 치료방법(Control/CBT/FT)에 상관없이 동일한지 검정

## aov(종속변수 ~ 독립변수(그룹변수), data)
## 분산분석시 독립변수를 factor형으로 변환해야한다.
change <- anorexia$Postwt - anorexia$Prewt # 종속변수
aov_result <- aov(change ~ anorexia$Treat)
summary(aov_result)
aov_result

boxplot(change ~ anorexia$Treat, col = rainbow(3))

## 사후검정
TukeyHSD(aov_result)
plot(TukeyHSD(aov_result))

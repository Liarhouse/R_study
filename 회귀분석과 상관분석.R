# 가설검정
# 상관분석
purifier_df <- read.table(file = 'purifier.csv', header=T, sep=',')

## 구조확인
str(purifier_df)

## 기술통계분석: 수치데이터로 이루어진 칼럼의 통계값 확인
summary(purifier_df)
shapiro.test(c(1,9999999999999999999999999,60000000000))
attach(purifier_df)

##정수기 총 대여수와 AS 소요시간의 관계를 분석
plot(purifier, as_time, xlab='총 정수기 대여수', ylab='AS시간')
plot(old_purifier, as_time, xlab='노후 정수기 대여수', ylab='AS시간')

# 상관계수 산출
### 총정수기 대여수와 AS 소요시간과의 상관계수
cor(purifier, as_time)

### 노후된 정수기 대여수와 AS 소요시간과의 상관계수
cor(old_purifier, as_time)

# cars
## speed: 차의 속도(mi/h), dist: 제동거리(feet)
str(cars)

## 자동차의 속도와 제동거리 회귀분석
## lm(formula, data)
## formula: 종속변수 ~ 독립변수
result <- lm(dist ~ speed, cars)
result
summary(result)

# 회귀모델 방정식의 기울기와 절편 조회
coef(result)

# 신뢰구간별 기울기와 절편 조회
confint(result)

# 잔차제곱합
## 모델 평가시 작을수록 좋은 모델
deviance(result)

# 회귀분석을 통해 사용된 독립변수를 가지고 예측값
fitted(result)

# 실제 종속변수 값과의 차이(잔차)
residuals(result)

# 결과값을 이용한 시각화
plot(cars$speed, cars$dist, main= '제동거리와 속도', xlab='speed',ylab='dist')
## 회귀선
abline(result, col='red')

## 도출된 회귀모델의 평가를 위한 시각화
windows()
par(mfrow=c(2,2))
plot(result)

# 예측: 새로운 독립변수를 회귀모델 방정식에 대입해 종속변수를 예츨
## 속도가 70일때, 제동거리는?

## predict(결과객체, 예측할 독립변수를 담은 데이터프레임, interval, level)
## predict(object, data, interval, level)
### 50, 60, 70, 80, 90, 100 제동거리 예측
predict(result, speed)
speed <- c(50, 60, 70, 80, 90, 100)
input <- data.frame(speed)
str(input)


### 예측: 점추정
distance<-predict(result, input)

# 결합: rbind, cbind
cbind(input, distance)

## 구간추정 예측
predict_dist <- predict(result, input, interval = 'confidence', level=0.95)
predict_dist

cbind(input, predict_dist)

predict_dist <- predict(result, input, interval = 'prediction', level=0.95)
predict_dist

cbind(input, predict_dist)

# AS 기사는 몇명이 적당할까?
## purifier: 전월 정수기 총 대여 수
## old_purifier: 전월 10년 이상 노후 정수기 총 대여수
## as_time: 당월 AS에 소요된 시간

# 전월 정수기 총 대여수와 10년 이상 노후된 정수기의 대여수
cor(purifier_df$purifier, purifier_df$old_purifier)

# 10년 미만 정수기 대여수 = purifier-old_purifier
cor((purifier-old_purifier),old_purifier)

# 파생변수 생성: 10년 미만 정수기 대여수
purifier_df$new_purifier <- purifier-old_purifier
str(purifier_df)

# 회귀분석
## 독립변수: 전월 기준 10년 미만 정수기 대여 수, 전월 기준 10년 이상 노후 정수기 대여수
## 종속변수: 당월 기준 AS에 소요된 시간
lm_result <- lm(as_time ~ new_purifier + old_purifier, purifier_df)
summary(lm_result)


# 회귀모델방정식: AS 시간 = 0.0881 * (10년 미만 대여수) + 0.2398 * (10년 이상) + 193.7
# AS시간은 10년 미만 정수기는 1대당 0.0881시간이 소요, 10년 이상 정수기는 1대당 0.2398시간이 소요된다.
## 정수기 대여수가 1대 증가할 때마다 AS 소요시간이 얼마나 늘어날까?
## 노후 정수기가 1대 늘어날 때마다 AS 소요시간이 얼마나 늘어날까?
## 정수기 총 대여수와 노후된 정수기 대여수 중 어떤 것이 

## 예측: 월말 최종 대여수가 30만대이고, 그중 10년 이상 노후 정수기가 7만대로 집게되었다면 AS소요시간은 얼마인가?
input_predict <- data.frame(new_purifier=230000, old_purifier=70000)

# 예측값 저장
predict_astime <- predict(lm_result, input_predict)
predict_astime

# AS기사 1명이 한달간 처리하는 AS시간 = 8시간 * 20일
predict_astime/160

# 구간 추정
## 233.7693 약 234명 AS기사가 필요
predict_astime <- predict(lm_result, input_predict, interval = 'confidence', level = 0.95)
predict_astime


# 실습데이터셋: women
## 미국 30대 여성들의 신장과 체중을 가지고 있는 데이터 셋
## 상관분석과 회귀분석
str(women)
## 귀무가설: 미국 성인 여성의 몸무게는 정규분포를 따른다.
## 대립가설: 정규분포를 따르지 않는다.
shapiro.test(women$weight)
?women

cor(women$height, women$weight)
lm_weight<-lm(women$weight ~ women$height)
summary(lm_weight)

apple <- 
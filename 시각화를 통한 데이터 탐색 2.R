# 웹 사이트에 등록된 데이터 등록
tips = read.csv('https://raw.githubusercontent.com/mwaskom/seaborn-data/master/tips.csv')

# 데이터 구조
str(tips)

# 속성의 의미 파악
View(tips)

# 데이터 내용을 파악
head(tips, 10)
tail(tips, 10)

# 기초 통계 분석
summary(tips)

library(dplyr)
library(ggplot2)


# 동석자수(size) 분포
tips %>% ggplot(aes(size)) + geom_bar()

# 결제금액과 팁은 관련성이 있을까?
tips %>% ggplot(aes(total_bill, tip)) + geom_point()

# 요일정보를 추가
tips %>% ggplot(aes(total_bill, tip)) + geom_point(aes(col=day))

# 성별을 따라 볼릿기호 변경
tips %>% ggplot(aes(total_bill, tip)) + geom_point(aes(col=day, pch=sex), size=3)

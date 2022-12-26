# 한국인의 생활실태를 담은 데이터 셋
#1. 필요 패키지 설치 및 불러오기
## SPSS, SAS, STATA 전통적인 통계전용 프로그램
## foreign 패키지
install.packages("https://cran.r-project.org/src/contrib/Archive/foreign/foreign_0.8-71.tar.gz", repos = NULL, type="source")
library(foreign)
library(dplyr)
library(ggplot2)
install.packages('readxl')
library(readxl)

#2 데이터 불러오기
raw <- read.spss('Koweps_hpc10_2015_beta1.sav', to.data.frame = T)
df <- raw
str(df)
dim(df)

summary(df)

#4. 데이터 변형 - 변수 이름 변경하기
## rename(data, new = old)
df <- rename(df,
             gender = h10_g3, #성별
             birth = h10_g4, # 태어난 년도
             married = h10_g10, # 혼인 상태
             religion = h10_g11, # 종교
             code_job = h10_eco9, # 직업 코드
             income = p1002_8aq1, # 급여
             code_region = h10_reg7) # 지역 코드
df <- rename(df, income = p1002_8aq1)

#5 탐색적 데이터 분석
## 변수를 검토하고 분석하기 좋은 형태로 전처리
### 분석에 사용할 변수들의 전처리
### 변수의 특성을 파악하고 이상치를 정제하고 필요에 따라 파생변수 생성
## 변수 간 관계 분석
### 분석에 사용할 변수들 간에 관계가 있는지 파악
### 가설을 세우고 분석한 결과를 시각화 작업
welfare <- df[, c('gender', 'birth', 'married', 'religion', 'code_job', 'income', 'code_region')]
names(welfare)

## 성별 전처리
table(welfare$gender)
class(welfare$gender)

## 성별이 무응답(9)일 경우, 이상치보고 NA로 변경하는 작업
welfare$gender <- ifelse(welfare$gender == 9, NA, welfare$gender)
## 결측치 여부
table(is.na(welfare$gender))
welfare$gender <- ifelse(welfare$gender == 1, 'male', 'female')
welfare$gender <- as.factor(welfare$gender)
qplot(welfare$gender)

#6. 가설
## 성별에 따른 급여의 차이는 얼마나 될까?
## 몇살때(연령대-청년, 중장년, 노년) 또는 연령대에 급여를 많이 받는가?
## 성별과 급여의 차이가 연령대별로 얼마나 다를까?
## 어떤 직업이 급여를 가장 많이 받을까?
## 성별에 따른 직업 선호도
## 노년층이 가장 많은 지역은 어디일까?
welfare %>% group_by(gender) %>% summarize(income_mean = mean(income, na.rm=T))
?summarize
class(welfare$income)
qplot(welfare$income)+xlim(0,1000)

## 월급(income) 전처리
### 0이거나 9999일 경우 결측처리한다
welfare$income <- ifelse(welfare$income %in% c(0,9999), NA, welfare$income)
table(is.na(welfare$income))

### 성별에 따른 급여에 평균을 요약
x <- welfare %>% filter(!is.na(income)) %>% group_by(gender) %>% summarize(income_mean = mean(income))
x

qplot(x = gender, y = income_mean, data = x, geom = 'col')
ggplot(x, aes(x=gender, y=income_mean)) + geom_col()

welfare$age <- 2015 - welfare$birth+1
summary(welfare$age)

qplot(welfare$age)

## 나이와 월급의 요약
data <- welfare %>% filter(!is.na(income)) %>% group_by(age) %>% summarise(mean_age = mean(income))

ggplot(data, aes(x=age, y=mean_age)) + geom_line()

## 연령대별 급여의 차이
## 청년층(you), 중장년층(mid), 노년층(old)

## mutate()
welfare <- welfare%>%
  mutate(age_group = ifelse(age <+ 34, 'you', ifelse(age <+65, 'mid', 'old')))
table(welfare$age_group)

qplot(welfare$age_group)

## 연령대별 급여의 요약
data <- welfare %>% filter(!is.na(income)) %>% group_by(age_group) %>% summarise(mean_ageG = mean(income))
data

ggplot(data, aes(x=age_group, y=mean_ageG)) + geom_col() + scale_x_discrete(limits = c('you', 'mid', 'old'))

## 연령대와 성별에 따른 급여의 차이를 요약
data <- welfare %>% filter(!is.na(income)) %>% group_by(age_group, gender) %>% summarise(mean_income = mean(income))
data

ggplot(data, aes(x=age_group, y=mean_income, fill = gender)) + geom_col(position = 'dodge') + scale_x_discrete(limits = c('you', 'mid', 'old'))
ggplot(data, aes(x=age_group, y=mean_income, fill = gender)) + geom_line() + scale_x_discrete(limits = c('you', 'mid', 'old'))

## 성별과 나이에 따른 급여 요약
data <- welfare %>% filter(!is.na(income)) %>% group_by(age, gender) %>% summarise(mean_age = mean(income))
data

ggplot(data, aes(x=age, y=mean_age, col=gender)) + geom_line() + scale_color_manual(values = c('red', 'blue'))
?color
       

str(welfare)

## 직업별 급여의 차 날까
## 어떤 직업군이 급여를 많이 받을까
### code_job

class(welfare$code_job)
table(welfare$code_job)

list_job <- read_excel('Koweps_Codebook.xlsx', sheet = 2, col_names = T)
head(list_job)

welfare <- left_join(welfare, list_job, id='code_job')
head(welfare)

### 직업별 급여에 차이를 분석하자
job_data <- welfare %>% filter(!is.na(income) & !is.na(job)) %>% group_by(job) %>% summarise(mean_income = mean(income))
job_data

## 급여가 많은 직업군 10개를 추출
top10 <- job_data %>% arrange(desc(mean_income)) %>% head(10)
top10
ggplot(top10, aes(x=reorder(job, mean_income), y=mean_income)) + geom_col() + coord_flip()

## 성별에 따라 선호하는 직업
job_cnt <- welfare %>% filter(!is.na(job) & gender == 'male') %>% group_by(job) %>% summarise(cnt = n()) %>% arrange(desc(cnt)) %>% head(10)
job_cnt
ggplot(job_cnt, aes(x=job, y=cnt)) + geom_col() + coord_flip()

fjob_cnt <- welfare %>% filter(!is.na(job) & gender == 'female') %>% group_by(job) %>% summarise(cnt = n()) %>% arrange(desc(cnt)) %>% head(10)
welfare %>% filter(!is.na(job) & gender == 'female') %>% count(job, sort = T) %>% head(10)
?dplyr
fjob_cnt
ggplot(fjob_cnt, aes(x=reorder(job, cnt), y=cnt)) + geom_col() + coord_flip() + scale_color_manual()
?tally
welfare %>% filter(!is.na(job) & gender == 'male')

## 종교 유무에 따른 이혼율
## 종교가 있는 사람이 이혼을 덜 할까?
### 종교, 혼인상태
table(welfare$married)
table(welfare$religion)
table(is.na(welfare$religion))
welfare$religion <- ifelse(welfare$religion ==1, 'yes', 'no')
welfare$religion <- as.factor(welfare$religion)
qplot(welfare$religion)

# 파생변수: 이혼유무
welfare$md <- ifelse(welfare$married == 1, 'married', ifelse(welfare$married == 3, 'divorced', NA))
table(welfare$md)
table(is.na(welfare$md))

qplot(welfare$md)

xx <- welfare %>% filter(!is.na(md)) %>% group_by(religion, md) %>%  summarise(n=n()) %>% mutate(tot = sum(n), pct = round(n/tot*100,1))
xx <- welfare %>% filter(!is.na(md)) %>% count(religion, md) %>% mutate(tot = sum(n), pct = n/tot*100)
xx

# count(): 집단별 빈도를 구하는 함수
yy <- welfare %>% filter(!is.na(md)) %>% count(religion, md) %>% group_by(religion) %>% mutate(pct= round(n/sum(n)*100, 1))
yy

zz <- welfare %>% filter(!is.na(md)) %>% count(religion, md) %>% mutate(pct= round(n/sum(n)*100, 1))
zz

#### count(a,b) = group_by(a,b) %>% summarise(n = n())

## 이혼추출
divorce <- yy %>% filter(md == 'divorced') %>% select(religion, pct)
divorce
?mean
ggplot(divorce, aes(x=religion, y=pct)) + geom_col()

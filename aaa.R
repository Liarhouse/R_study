# dplyr
## filter(): 행추출, subset()와 유사
## select(): 열추출
## arrange(): 정렬, desc() 내림차순
## mutate(): 새로운 열을 생성할 때
## summarize(): 통계치 산출
## group_by()
## left_join(): 데이터 합치기(열)
## bind_join(): 데이터 합치기(행)
## %>%, chain(), pipe 연산자

exam <- read.csv(file='C:/K_digital/source/data/csv_exam.csv')
str(exam)
exam %>% filter(class == 1)

## 2반 학생 정보 추출
exam %>% filter(class == 2)

## 1반이 아닌 학생 정보 추출
exam %>% filter(class != 1)

## 수학점수가 50점을 초과하는 데이터만 추출
exam %>% filter(math > 50)

## 1반이면서 수학점수가 50점 이상인 데이터 추출
exam %>% filter(class == 1 & math >= 50)

## 1반, 3반, 5반의 학생정보 추출
exam %>% filter(class == 1 | class == 3 | class == 5)
exam %>% filter(class %in% c(1, 3, 5))

## class1, class2 파생변수 생성
class1 <- exam %>% filter(class == 1)
class2 <-exam %>% filter(class == 2)

## 1반 수학점수의 평균
mean(class1$math)

## 2반 수학점수의 평균
mean(class2$math)



library(dplyr)
library(ggplot2)
# mpg 데이터 셋을 이용
## Q1. 자동차 배기량에 따라 고속도로 연비가 다른지 알아보려고 한다.
## displ(배기량)이 4이하인 자동차와 5이상인 자동차 중 어떤 자동차의 hwy가 평균적으로 더 높은지 분석하시오.
mpg1 = as.data.frame(mpg)
str(mpg)
mean_hwy4<-mpg %>% filter(displ <= 4) %>% summarize(mean_hwy4=mean(hwy))
mean_hwy5<-mpg %>% filter(displ >= 5) %>% summarize(mean_hwy5=mean(hwy))
mean_hwy<-merge(mean_hwy4,mean_hwy5)
mean_hwy<-as.data.frame(t(mean_hwy))
mean_hwy<-rename(mean_hwy,c(V1="mean"))
ggplot(data=mean_hwy,aes(mean))+geom_point()


## Q2. 자동차의 제조 회사에 따라 도시 연비가 다른지 알아보려고 한다. 'audi'와 'toyota' 중 어느 제조회사의 자동차가 도시연비가 평균적으로 높은지 분석하시오.
mpg1 %>% filter(manufacturer == 'audi' & manufacturer == 'toyota') %>% group_by(manufacturer) %>% summarize(mean_cty=mean(cty))

## Q3. 'chevrolet', 'ford', 'honda' 자동차의 고속도로 연비 평균을 알아보자. 이 회사들의 데이터를 추출한 후 hwy 전체 평균을 산출하시오.
  
  
  
  


# filter()와 select()
## class가 1인 데이터에 english 추출
exam %>% filter(class == 1) %>% select(english)

# 학번(id)과 수학만 앞에서 6개 추출
exam %>% select(id, math) %>% head
exam %>% select(id, math) %>% head(10)

## Q1. mpg 데이터셋에서 자동차 종류와 도시연비만 추출
mpg1 %>% select(model, cty) %>% head
str(mpg1)
## Q2. 자동차 종류에 따른 도시 연비가 어떤지 분석하려고 한다. 이때 자동차 종류가 'suv'인 자동차와 'compact'인 자동차 중 어느 자동차의 도시연비가 높은지 분석하시오.
mpg_suv = mpg1 %>% filter(class == 'suv') %>% summarize(mean_cty=mean(cty))
mpg_comp = mpg1 %>% filter(class == 'compact') %>% summarize(mean_cty=mean(cty))
plot(mpg_cty)
mpg_cty = bind_cols(mpg_suv,mpg_comp)
str(mpg_cty)

## Q3. 'audi'에서 생산한 자동차 중에서 어떤 자동차의 모델이 고속도로 연비가 높은지 알아보려고 한다. 이때 1~5위에 해당하는 자동차의 데이터만 추출

mpg1 %>% filter(manufacturer=='audi') %>% arrange(desc(hwy)) %>% head(5)

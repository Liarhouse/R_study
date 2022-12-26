install.packages("ggplot2")
library(ggplot2)

# 그래프를 그릴 공간 설정: ggplot()
# ggplot(data)
?ggplot
# ggplot(data, aes())
## data: 그래프로 그릴 데이터프레임
## aes(): 데이터항목, 시각화할 요소(옵션)

mpg = ggplot2::mpg
str(mpg)

mpg = as.data.frame(mpg)
mpg
str(mpg)
View(mpg)

ggplot(data=mpg) + geom_point(aes(x=displ, y=hwy))

classDf = data.frame(gender=c('남','여','남','여','남','여','남','여'),
                     blood=c('A','A','AB',"AB",'B','B','O','O'),
                     freq=c(4,3,1,1,0,5,5,1))
classDf

ggplot(classDf, aes(x=blood, y=freq)) + geom_col(aes(fill=gender)) +
  ggtitle('호랑이반 혈액형 비율', subtitle = '(혈액형/성별 기준)') +
  labs(x='혈액형',y='인원수', fill='성별') -> x

install.packages('shiny')
library(shiny)
x + theme_classic()

# qplot(x축데이터, y축데이터, 옵션)
qplot(Sepal.Length, Petal.Length, data=iris)

# 시즌별 티켓판매량을 분석하려고 한다.
## 시즌('A', 'B', 'C', 'D', 'E')
## 판매데이터

abc = c(110,300,150,280,310)
barplot(abc, main='시즌별 판매량', xlab='시즌', ylab='판매량', names.arg=c('A', 'B', 'C', 'D', 'E'))


# 스포츠별 판매량 분석
baseball = c(110,300,150,280,310)
soccer = c(180,200,210,190,170)
beach = c(210,150,260,210,70)

data = matrix(c(baseball, soccer,beach),5,3)
data

barplot(data, main='경기별 시즌의 판매량',
        xlab='종목', ylab='판매량',
        names.arg = c('야구', '축구', '비치볼'),
        col = rainbow(5), ylim=c(0,400), beside=T)
legend(16,400,c('A', 'B', 'C', 'D', 'E'),cex=.8,fill=rainbow(5))

barplot(t(data), main='경기별 시즌의 판매량(누적표시형)',
        xlab='시즌', ylab='판매량',
        names.arg = c('A', 'B', 'C', 'D', 'E'),
        col = rainbow(3), horiz=T)
legend(4.5,1000,c('야구', '축구', '비치볼'),cex=.8,fill=rainbow(3))

classDf = data.frame(gender=c('남','여','남','여','남','여','남','여'),
                     blood=c('A','A','AB',"AB",'B','B','O','O'),
                     freq=c(4,3,1,1,0,5,5,1))
classDf

class1 = data.frame(blood=c('A','A','AB',"AB",'B','B','O','O'),
                    freq=c(4,3,1,1,0,5,5,1))
ggplot(class1, aes(x=blood, y=freq)) + geom_col()

blood.Type = c('A','B','A','O','A','AB','B','A','O','O','B','AB','AB','O','A','B','B','O','AB','O')
class(blood.Type)
str(blood.Type)

table(blood.Type)

blood.Type = as.data.frame(blood.Type)
ggplot(blood.Type, aes(x=blood.Type)) + geom_bar()
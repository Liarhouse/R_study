# 제어문: 조건문과 반복문
## 조건문: []조건식, if, if~else, 삼항연산자 ifelse(조건항, 참, 거짓)
x <- runif(1) # 0과 1 사이의 난수를 생성하는 함수
x

### x가 0보다크면 절대값을 출력
if(x>0) print(abs(x))

### x가 0.5보다 작으면 1-x를 출력, 아니면 x 출력
if(x<0.5) print(1-x) else print(x)

ifelse(x < 0.5, 1-x, x)

### 하나의 숫자를 받아 짝수인지 홀수인지 판단하는 문
check = 20
if(check %% 2){
  print(check)
  print("홀수입니다.")
  print(abs(check))
}else{
  print(check)
  print("짝수입니다.")
  print(abs(check))
}

### switch:
point = 95
grade = point %/% 10

switch(as.character(grade),
       "10" = print("A학점"),
       "9" = print("A학점"),
       "8" = print("B학점"),
       "7" = print("C학점"),
       "6" = print("D학점"),
       print("F학점")
)
## 반복문: for, while, repeat
sum = 0

### 1부터 10까지 1씩 증가해서 누적합을 출력
for(i in seq(1,10,1)) sum = sum+i
sum

### 3단을 출력하시오.
dan = 3
for(i in seq(1,9)){
  cat(paste(dan, " x ", i, ' = ', dan*i, '\n'))
}


### 구구단 출력
for(i in seq(2,9)){
  cat(paste("\n===== ", i, "단 =====\n"))
  for(j in seq(1,9)){
    cat(paste(i, " x ", j, ' = ', i*j, '\n'))
  }
}

### while
sum=0
i = 0
while(i < 10){
  i = i + 1
  sum = sum + i
}
sum

### repeat: 탈출조건을 직접 작성해야 한다.
sum1 = 0
repeat{ # while(1) == while(TRUE)
  sum1 = sum1 + i
  i = i + 1
  if(i > 10) break
}
sum1

### 1부터 10까지의 자연수중 짝수만 출력하는 프로그램

for(i in 1:10){
  if(i %% 2 == 0) print(i)
}

### 1부터 10까지의 자연수중 소수만 출력하는 프로그램
check=0
for(i in 1:10){
  check=0
  for(j in 1:i){
    if(i %% j == 0) check = check + 1
  }
  if (check==2) print(i)
}
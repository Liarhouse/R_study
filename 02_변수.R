# 변수(variable) : 기억공간, 데이터를 저장하는 공간, 메모리를 뜻한다.
# 할당 : =, <-, ->
# 변수명
## a라는 변수에 1을 저장
a = 1
b <- 2
3 -> c
print(a)
b

## 동적타이핑 : 변수의 자료형이 결정
c <- "안녕하세요"
print(c)

love <- 1
love <- "안녕하세요"
love

love("이제 나는 함수가 될 수 있을까?")

# love 변수를 print 함수 지정
love <- print
love("")

(y=2)
# 현재 사용중인 변수의 목록 출력
ls()
help(ls)

# 논리값(TRUE, T) or (FALSE, F)

x = "one"
print(x, quote=F)

# 서식을 이용한 출력
# %d, %f, %s
sprintf("%s의 키는 %5.2f이다.", "홍길동", 172.5123)
sprintf("%s의 나이는 %i세이다", "홍길동", 33)

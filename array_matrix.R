# array(): N차원 배열, matrix(): 2차원 배열
x = array(1:20, dim=c(4, 5))
x

y = matrix(1:20, 4,5)
y

# 2행, 4행의 모든 요소를 추출
y[c(2,4), ]
y[1:2,]

z = matrix(2, 4, 5)
z

z = matrix(c(1,2,3,4,5,6), nrow=2, ncol=3, byrow=T)
z

cbind(x,y) # 열방향 결합
rbind(x,y) # 행방향 결합

a = matrix(0, 4, 5)
cbind(a, 1:4)

A = matrix(1:20,4,5)
B = matrix(1:20,4,5)
C = cbind(A, B)
C

# 행렬연산: 벡터화연산
A+B
A-B
A*B
A/B

matrix(1:20,4,5) + matrix(1:10,2,5)
A

t(A) # 전치행렬
# 행렬곱 : %*%


nrow(A)

colnames(A) = c('alpha', 'beta', 'gamma', 'delta', 'etc')
rownames(A) = c('a', 'b', 'c', 'd')
A

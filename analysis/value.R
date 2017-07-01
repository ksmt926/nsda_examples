#R prompt

s<-'Hi There'
x<-3 + 11 + (3 * log(exp(2)))
print(s)
print(x)
s<-seq(1,20)
s

int.vec<-c(1,2,3,4,5)
int.vec

logical.vec<-c(T,F,F,T)
logical.vec
# [1]  TRUE FALSE FALSE  TRUE

# vector
v1 <- c(1,2,3,4,5)
v2 <- c(6,7,8,9,10)
v3 <- c(v1,v2)
v3
# [1]  1  2  3  4  5  6  7  8  9 10

# matrix
s<-matrix(v3,nrow=2,ncol=5)
s
#     [,1] [,2] [,3] [,4] [,5]
# [1,]    1    3    5    7    9
# [2,]    2    4    6    8   10

function(x,y,z) {
    t <- c(x,y)
    z*t
}

# simple_math(1,2,3) <- function(x,y,z)
# [1] 3 6


test<-function(x,y=10) {x+y}

inc.func<-function(x) {x+1}

dual.func<-function(y) {y(2)}

dual.func(inc.func)

# [1] 3

test.vec<-1:20
test.vec
# [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20
sapply(test.vec,function(x) x+2)
# [1]  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22

Reduce(function(a,b) a+b,1:20)
# [1] 210


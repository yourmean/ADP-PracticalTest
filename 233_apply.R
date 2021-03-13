#apply 계열 함수

# apply()
a= matrix(1:12,4,3)
apply(a,1,max)  #행기준
apply(iris[,1:4], 2, mean) #열기준


# lapply() :list 반환
a= lapply(1:3, function(x){x**2})
unlist(a)


# sapply() : 벡터/행렬 반환
# 변수마다 적용결과 != -> list 반환
sapply(iris, class)
sapply(iris, summary)


# vapply() : 출력형태 지정 가능

# mapply()
mapply(rep, c(1:4), c(4:1))


# tapply()
library(googleVis)
tapply(Fruits$Sales, Fruits$Fruit, mean)
tapply(Fruits$Profit, Fruits$Location=='West', mean)
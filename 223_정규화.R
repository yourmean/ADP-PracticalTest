# 정규화 ---------------------------------------------------------------------

# 데이터 범위를 0-1 사이로 변환 -> data 분포 조정
# min-max 정규화


# 1. scale 함수
Min= min(iris$Sepal.Length)
Max= max(iris$Sepal.Length)

iris$new_sl= scale(iris$Sepal.Length, center=Min, scale=Max-Min)
head(iris)



# 2. 함수 정의
normalize = function(x){
  return ((x-min(x)) / (max(x)-min(x)))
}

iris$new_sl2= normalize(iris$Sepal.Length)
head(iris)
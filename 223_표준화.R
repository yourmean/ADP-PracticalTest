# 표준화 ---------------------------------------------------------------------

# 각 개체가 평균을 기준으로 얼마나 떨어져 있는가?
# scale(데이터, center=, scale=)
# 이 때, center-scale이 T-T:%표준편차, F-T: %제곱평균제곱근, scale=F:나누지X


data(mtcars)
str(mtcars)

test.cars= mtcars[,c('mpg','hp')]
head(test.cars)

# 표준화
test.cars= transform(test.cars, mpg_scale=scale(test.cars$mpg), 
                     hp_scale=scale(test.cars$hp))
test.cars
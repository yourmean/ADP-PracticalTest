#################################################################
#                    PART 04) 시각화             
#################################################################



##===============================================================
##### 1장. 산점도


##### 1절 | 산점도란?

##### 2. plot 함수

## Q) MASS 패키지에 있는 Cars93 데이터는 1993년 승용차 모델 중 무작위로 선택된 
## 93개의 차량에 대한 모델명, 차종, 가격, 엔진 크기 등의 정보를 담고 있는 데이터이다. 
## Cars93의 Length와 Weight변수에 대한 산점도를 그려보자.

##===== A)
# MASS 패키지 및 데이터 로드
library(MASS)
data("Cars93")

# Length와 Weight 변수에 대한 산점도 생성
plot(Cars93$Length, Cars93$Weight)



##---------------------------------------------------------------
##### 2절 | plot함수의 옵션

##### 1. 축 이름(xlab, ylab)과 그래프 제목(main)

## Q) Cars93의 Length와 Weight변수에 대한 산점도에 제목과 
## 축 이름을 지정한 아래의 코드와 결과를 살펴보자.

##===== A)
plot(Cars93$Length, Cars93$Weight, main="Cars93", xlab="Length", ylab="Weight")



##### 2. 좌표축 범위(xlim, ylim)

## Q) Cars93의 Length와 Weight변수에 대해 각각 최솟값, 최댓값을 구하고
## 적절한 축 범위를 지정하여 산점도를 그려보자.

##===== A)
# Length와 Weight의 범위(최솟값,최댓값) 구하기
range(Cars93$Length)
range(Cars93$Weight)

# x축과 y축 범위를 지정하여 산점도 그리기
# x축 범위 c(130,230), y축 범위 c(1600,4400)로 지정
plot(Cars93$Length, Cars93$Weight, main="Cars93", xlab="Length", ylab="Weight",
     xlim=c(130,230), ylim=c(1600,4400))



##### 3. 점의 종류(pch)

## Q) Cars93 데이터에 대해 pch인자에 8과 “*”를 지정하여 산점도를 그린 
## 아래 예시를 확인해보자.

##===== A)
# pch 인자에 8 지정
plot(Cars93$Length, Cars93$Weight, main="Cars93", xlab="Length", ylab="Weight",
     xlim=c(130,230), ylim=c(1600,4400), pch=8)

# pch 인자에 "*" 지정
plot(Cars93$Length, Cars93$Weight, main="Cars93", xlab="Length", ylab="Weight",
     xlim=c(130,230), ylim=c(1600,4400), pch="*")



##### 4. 점의 크기(cex)

## Q) Cars93 데이터에 대한 산점도에서 cex에 0.5과 2를 지정해 결과를 확인해보자. 

##===== A)
# cex 인자에 0.5 지정
plot(Cars93$Length, Cars93$Weight, main="Cars93", xlab="Length", ylab="Weight",
     xlim=c(130,230), ylim=c(1600,4400), cex=0.5)

# cex 인자에 2 지정
plot(Cars93$Length, Cars93$Weight, main="Cars93", xlab="Length", ylab="Weight",
     xlim=c(130,230), ylim=c(1600,4400), cex=2)



##### 6. 그래프 종류(type)
## Q1) Cars93 데이터에서 자동차의 무게(Weight)별 평균 길이(Length)에 대한 
## 산점도를 그리는데, 이 때 type인자에 p와 b를 지정해 결과를 확인해보자. 
## 또한 x축의 이름은 “Length”, y축의 이름은 “Weight”로 지정하자 

##===== A)
# type 인자에 "p" 지정
plot(tapply(Cars93$Weight, Cars93$Length, mean), xlab="Length", ylab="Weight", type="p")

# type 인자에 "b" 지정
plot(tapply(Cars93$Weight, Cars93$Length, mean), xlab="Length", ylab="Weight", type="b")


## Q2) R 내장 데이터 airquality는 1973년 5월부터 9월까지 뉴욕의 
## 대기 오염에 대한 기록이다. airquality에서 월(Month 변수)별 
## 평균 온도(Temp 변수의 평균값)를 한 눈에 알아볼 수 있도록 
## plot함수를 사용해 꺾은선 그래프로 시각화한 아래의 코드와 그래프를 살펴보자.

##===== A)
# 월(Month 변수)별 평균 온도(Temp 변수의 평균값)에 대한 꺾은선 그래프
plot(tapply(airquality$Temp,airquality$Month,mean), type="b", ylim=c(60,90),
     xlab="Month", ylab="Mean of Temperature", main="airquality")



##### 7. 선 종류(lty)
## Q) Cars93 데이터에서 자동차의 무게(Weight)별 평균 길이(Length)에 대한 산점도를 그리고, 
## 이 때 type인자에는 “l”을 지정하고 lty인자에는 4(dotdash)를 지정해 결과를 확인해보자.

##===== A)
# type 인자에 "p" 지정
plot(tapply(Cars93$Weight, Cars93$Length, mean), xlab="Length", ylab="Weight", cex=1.5, type="l", lty=4)




##---------------------------------------------------------------
##### 3절 | 그래프 서식

##### 1. 여러 개의 그래프를 한 화면에 나타내기(par)
## Q) 2절의 4. 점의 크기(cex) 부분에서 그렸던 두 개의 예제 그래프를 1행 2열의 형태로 배열하여 한 번에 그려보자.

##===== A)
# 그래프 배열 설정
par(mfrow=c(1,2))

# 그래프 생
plot(Cars93$Length, Cars93$Weight, main="Cars93", xlab="Length", ylab="Weight",
     xlim=c(130,230), ylim=c(1600,4400), cex=0.5)

plot(Cars93$Length, Cars93$Weight, main="Cars93", xlab="Length", ylab="Weight",
     xlim=c(130,230), ylim=c(1600,4400), cex=2)



##### 2. 범례(legend)

## Q) plot함수의 type인자의 값을 “n”으로 지정하여 빈 좌표형면을 그린 후
## (그래프를 그릴 데이터는 임의 데이터 1:100을 지정, xlab과 ylab은 빈 값인 “ ”을 지정), 
## 다양한 위치에 여러 가지 모양의 범례를 생성하는 아래의 예제 코드와 실행 결과를 확인해보자.
## 각 범례는 title로 구분하여 살펴본다.

##===== A)
# 빈 좌표평면 그리기
plot(1:10, type="n", xlab=" ", ylab=" ")

# 여러 위치에 다양한 범례를 생성
legend("bottom",c("x1","y1"),pch=1:2,title="bottom")
legend("left",c("x2","y2"),pch=3:4,title="left")
legend("top",c("x3","y3"),pch=5:6,title="top")
legend("right",c("x4","y4"),pch=7:8,title="right")
legend("center",c("x5","y5"),lty=1:2,title="center")


# 좌표를 직접 입력하여 범례의 위치를 지정
legend(2.5,8,c("x6","y6"),lty=3:4,title="사용자 지정1")
legend(2.5,4,c("x7","y7"),lty=5:6,title="사용자 지정2")
legend(7.5,8,c("x8","y8"),lty=5:6,bg="gray",title="사용자 지정3")
legend(7.5,4,c("x9","y9"),pch=1:2,lty=7:8,bg="gray",title="사용자 지정4")




##===============================================================
##### 2장. 그래프


##### 1절 | 점그래프

## Q) plot함수를 이용해 빈 좌표평면을 생성한 뒤, 그 위에 points함수를 사용하여 
## iris데이터의 Petal.Length와 Petal.Width변수에 대한 산점도를 그려보자. x축 이름은 Petal.Length, 
## y축 이름은 Petal.Width로 지정하고 각 변수의 범위에 맞게 x축 범위는 0~8, y축 범위는 0~3으로 지정한다.

##===== A)
# plot 함수를 이용해 빈 그래프 생성
plot(NULL, type="n",xlim=c(0,8), ylim=c(0,3), xlab="Petal.Length", ylab="Petal.Width", main="iris")

# points 함수를 이용해 산점도를 겹쳐 그리기
points(iris$Petal.Length, iris$Petal.Width, cex=0.5)



##---------------------------------------------------------------
##### 2절 | 선그래프

##### 1. 꺾은선 그래프
## Q1) 아래의 코드를 차례로 실행하면 lines함수 내에 지정한 두 좌표를 지나는 선 그래프가 
## 좌표면의 위에서부터 차례로 그려진다. 코드를 직접 실행하며 lty, lwd 인자값에 따라 
## 서로 다르게 생성되는 선의 모양을 살펴보자.

##===== A)
# plot함수를 이용해 빈 좌표평면 생성
plot(NULL, type="n", xlab="", ylab="", xlim=c(0,20), ylim=c(0,20), main="선 그래프")

# lines함수를 이용해 선그래프 생성
lines(c(0,17), c(17,17), lty=1); 
lines(c(0,15), c(15,15), lty=2);
lines(c(0,13), c(13,13), lty=3); 

lines(c(0,11), c(11,11), lty="solid", lwd=1); 
lines(c(0,9), c(9,9), lty="dotdash", lwd=2);
lines(c(0,7), c(7,7), lty="twodash", lwd=3); 
lines(c(0,5), c(5,5), lty="longdash", lwd=4); 



## Q2) 	다음으로는 ?lines를 실행했을 때 제공되는 예제 코드를 살펴보자. 
## cars 데이터는 자동차의 속도(speed)와 제동거리(dist)로 이루어져 있다. 
## 먼저 첫 번째 코드를 실행하여 cars 데이터의 두 변수에 대한 산점도를 생성한 뒤, 
## 두 번째 코드를 이용해 cars 데이터에 LOWESS를 적용한 선을 덧그렸다.

##===== A)
# cars 데이터의 두 변수(dist와 speed)에 대한 산점도
plot(cars, main = "Stopping Distance versus Speed")

# 산점도를 설명하는 지역 가중 다항식 회귀선
lines(lowess(cars))



##### 2. 직선 그래프
## Q1) cars 데이터의 dist와 speed사이의 선형회귀모형을 생성한 뒤, abline함수를 이용해 그래프로 표현해보자. 
## 선형회귀식에 대한 그래프는 speed와 dist에 대한 산점도 위에 나타내며, 색상은 빨강으로 지정하여 표현하자.

##===== A)
# plot함수를 이용해 cars데이터에 대한 산점도 생성
plot(cars, ylim=c(0,130), xlim=c(0,30), main="cars data")

# speed와 dist 사이의 선형회귀모형 생성
cars_lm<-lm(dist~speed, data=cars)

# 선형회귀식에 대한 그래프 생성
abline(cars_lm, col="red")


## Q2) cars 데이터의 speed와 dist에 대해 각각 중위수를 구한 뒤 위의 예제에서 생성한 그래프 위에 
## speed의 중위수는 세로선으로, dist의 중위수는 가로선으로 덧그리는 아래의 코드와 결과를 살펴보자.
## 이 때 두 변수의 중위수에 대한 직선은 각각 lty(선의종류)를 3(점)으로 지정하자.

##===== A)
# speed의 중위수를 그래프로 나타내기
abline(v=median(cars$speed), lty=3)

# dist의 중위수를 그래프로 나타내기
abline(h=median(cars$dist), lty=3)



##### 3. 곡선 그래프

## Q) 정규분포에서 x값에 따른 확률 밀도를 계산해주는 dnorm함수를 사용해 평균이 0이고, 
## 표준편차가 1인 확률밀도함수를 생성하고, curve함수를 사용해 이것을 그래프로 나타내자. 
## x축의 범위는 ???3~+3로 지정하자.

##===== A)
# 확률밀도함수에 대한 그래프 그리기
curve(dnorm(x,mean=0,sd=1), from=-3, to=3,
      xlab="x", ylab="density", main="curve of dnorm")




##---------------------------------------------------------------
##### 3절 | 막대 그래프

##### 2. R을 활용해 막대 그래프 그리기
## Cars93 데이터의 Origin변수는 해당 차량이 미국에서 제조되었는지(USA) 혹은 
## 다른 국가에서 제조되었는지(non-USA)를 나타내는 변수이다. 
## Cylinders변수는 실린더의 수를 나타내며, 3,4,5,6,8,rotary의 6개 범주로 이루어져 있다. 
## 두 범주형 변수의 각 레벨에 속하는 데이터의 개수를 막대그래프로 나타내보자.


##### 가. 단일 범주형 변수를 막대그래프로 표현하기
## Q) Origin변수와 Cylinders변수의 범주에 속하는 데이터의 개수를 각각 막대그래프로 표현해보자.
## barplot의 height인자에는 막대의 높이를 지정한 데이터가 주어져야 하므로, 
## table함수를 이용해 Origin변수와 Cylinders변수에 대한 도수분포표를 생성하여 height인자에 지정하도록 한다.

##===== A)
# Origin변수에 대한 막대그래프 생성
barplot(table(Cars93$Origin),ylim=c(1,50),xlab="Origin",
        ylab="도수",main="Cars93의 Origin변수")

# Cylinders변수에 대한 막대그래프 생성
barplot(table(Cars93$Cylinders),ylim=c(1,55),xlab="Cylinders",
        ylab="도수",main="Cars93의 Cylinders변수")


##### 나. 여러 개의 범주형 변수를 막대그래프로 표현하기
## Origin변수와 Cylinders변수의 범주별 데이터 개수를 막대그래프로 한 번에 표현해보자.
## beside인자를 활용하여 두 변수를 하나의 막대에 표현하는 것과 
## 각각의 변수를 별도 막대로 표현하는 두 개의 그래프를 생성해보자. 
## 또한 legend인자를 사용하여 각 변수가 어떻게 그래프에 표현되어져 있는지를 보여주는 범례도 함께 나타내자.

##===== A)
# 두 변수를 하나의 막대에 나타내기 (beside=F 지정) 
barplot(table(Cars93$Origin,Cars93$Cylinders), beside=F, ylim=c(0,60), legend=T)

# 각각의 변수를 별도의 막대에 나타내기 (beside=T 지정)
barplot(table(Cars93$Origin,Cars93$Cylinders), beside=T, ylim=c(0,30), legend=T)




##---------------------------------------------------------------
##### 4절 | 히스토그램

## Q) iris데이터의 Petal.Lengh변수에 대해 막대 구간의 개수(breaks인자)를 
## 지정하지 않은 히스토그램과 구간의 개수를 5로 지정한 히스토그램을 생성해보자.

##===== A)
# breaks인자값을 지정하지 않은 히스토그램
hist(iris$Petal.Length)

# breaks를 5로 지정한 히스토그램
hist(iris$Petal.Length, breaks=5)




##---------------------------------------------------------------
##### 5절 | 파이 차트

##### 2. R을 활용해 파이 차트 그리기

## Q) Cars93 데이터의 차량 실린더의 수를 나타내는 Cylinders변수의 범주별 데이터의 수를
## 파이차트로 나타내보자.

##===== A)
# 실린더의 개수별 차량의 비중을 파이 차트로 나타내기
pie(table(Cars93$Cylinders), main="실린더의 개수별 차량의 비중")




##---------------------------------------------------------------
##### 6절 | 산점도 행렬

##### 2. R을 활용해 산점도 행렬 그리기

## Q) 	 내장 데이터 iris의 Sepal.Length, Sepal.Width, Petal.Length, Petal.Width 변수들에 대한 
## 산점도 행렬을 그려보자. 이 때 species의 각 범주별로 점의 모양과 색을 다르게 지정하자.

##===== A)
# 산점도 행렬 생성
pairs(~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width,
      data=iris, col=c("red","green","blue")[iris$Species],
      pch=c("+","*","#")[iris$Species])

# Species의 범주 확인
levels(iris$Species)
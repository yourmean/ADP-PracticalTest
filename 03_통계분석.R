#################################################################
#                    PART 03) 통계분석             
#################################################################



##===============================================================
##### 1장. 데이터 샘플링


##### 2절 | R을 이용한 표본 추출

##### 1. 단순 임의 추출
## Q) iris 데이터로 분석을 진행하기 위해 전체 데이터의 7:3의 비율로
## training data와 test data를 추출한 뒤 새로운 변수에 저장해보자. 
## (데이터 추출 방법은 단순 임의 비복원 추출을 이용한다.)

##===== A)
# iris 데이터 행의 개수에서 70%에 해당하는 행번호를 랜덤으로 추출
# nrow() : 데이터의 행 개수를 산출해주는 함수
idx <- sample(1:nrow(iris), nrow(iris)*0.7, replace=FALSE)

# 추출한 행번호를 이용하여 training 데이터와 test 데이터 생성
training<-iris[idx,]
test<-iris[-idx,]

# 데이터의 개수 확인
dim(iris)      # 행의 개수 : 150개
dim(training)  # 행의 개수 : iris의 행 개수의 70%에 해당하는 105개
dim(test)      # 행의 개수 : iris의 행 개수의 30%에 해당하는 45개



##### 2. 층화 임의 추출
## Q) iris 데이터에서 Species가 setosa인 데이터를 20개, versicolor인 데이터를 15개, 
## versinica인 데이터를 15개씩 단순 임의 추출을 사용해 추출해보자.

##===== A)
# sampling 패키지 설치 및 로드
install.packages("sampling")
library(sampling)

# 층화임의추출을 수행한 뒤 sample 변수에 저장
sample<-strata(c("Species"), size=c(20,15,15), method="srswor", data=iris)

# sample의 상위 6개 행만 추출
head(sample)

# 추출된 데이터를 iris_sample 변수에 저장
iris_sample<-getdata(iris, sample)

# iris_sample의 상위 6개 행만 추출
# ★ 랜덤추출이기 때문에 실행할 때마다 다른 데이터가 추출되어 나올 수 있으며,
# ★ 교재 내 R코드 실행결과와도 다른 행들이 추출될 수 있습니다.
head(iris_sample)

# 표본 데이터의 Species 변수에 대한 도수분포표 생성
table(iris_sample$Species)



##===============================================================
##### 2장. T-검정(T-Test)


##### 1절 | 일표본 T-검정(One Sample T-Test)

## Q) MASS패키지의 cats 데이터는 고양이들의 성별(Sex 변수), 
## 몸무게(Bwt 변수), 심장의 무게(Hwt 변수)를 담고있다. 
## cats 데이터에서 고양이들의 평균몸무게가 2.6kg인지 아닌지에 대한
## 통계적 검정을 수행하고, 결과를 해석해보자.

##===== A)
## 1) cats 데이터 확인 및 Bwt변수에 대한 정규성 검정 수행

# cats데이터를 사용하기 위해 MASS 패키지 로드
library(MASS)

# cats데이터의 구조 확인
str(cats)

# Bwt(고양이 몸무게) 변수에 대한 정규성 검정 수행
shapiro.test(cats$Bwt)


## 2) cats 데이터에 대한 일표본 T-검정 수행
# 일표본 T-검정 수행
wilcox.test(cats$Bwt, mu=2.6, alternative="two.sided")




##### 2절 | 대응표본 T-검정(Paired Sample T-Test)

## Q) 10명의 환자를 대상으로 수면영양제를 복용하기 전과 후의 수면시간을 측정하여 
## 영양제의 효과가 있는지를 판단하고자 한다. 
## 영양제 복용 전과 후의 평균 수면시간에 차이가 있는지를 알아보는데, 
## 단측검정을 수행하여 영양제 복용 후에 수면시간이 더 늘어났는지를 검정해보자. 
## 수면영양제를 복용하기 전과 후의 수면시간은 아래에 제시된 바와 같다. 
## (표본이 정규성을 만족한다는 가정 하에 단측검정 수행, 유의수준 = 0.05)

##===== A)
# 데이터 입력
data <- data.frame(before = c(7, 3, 4, 5, 2, 1, 6, 6, 5, 4),
                   after = c(8, 4, 5, 6, 2, 3, 6, 8, 6, 5))
data

# 대응표본 T-검정 수행
t.test(data$before, data$after, alternative="less", paired = TRUE)




##### 3절 | 독립표본 T-검정( Sample T-Test)

## Q) MASS패키지의 cats 데이터는 고양이들의 성별(Sex 변수), 몸무게(Bwt 변수), 
## 심장의 무게(Hwt 변수)를 담고있다. 고양이들의 성별(Sex)에 따른 몸무게(Bwt)의 평균은 
## 통계적으로 다르다고 할 수 있는지에 대한 검정을 수행하고, 결과를 해석해보자. 

## 검정을 수행하기에 앞서 설정할 수 있는 가설은 아래와 같다.
## 귀무가설 : 고양이의 성별에 따른 평균 몸무게에는 통계적으로 유의한 차이가 없다.
## 대립가설 : 고양이의 성별에 따른 평균 몸무게에는 통계적으로 유의한 차이가 있다.


##===== A)
## 1) 독립 t검정을 수행하기에 앞서, 범주별 데이터값의 등분산성 검정 수행

# 데이터 불러오기
library(MASS)
data("cats")

# 등분산 검정 수행
var.test(Bwt~Sex, data=cats) 


## 2) 성별에 따른 몸무게가 등분산성을 만족하지 않는다는 조건 하에 독립 t검정을 수행
t.test(Bwt~Sex, data=cats, alternative="two.sided", var.equal=FALSE)





##===============================================================
##### 3장. 교차분석


##### 2절 | 적합성 검정
## Q) MASS 패키지의 survey 데이터에서 W.Hnd 변수는 설문 응답자가 
## 왼손잡이(Left) 인지 오른손잡이(Right) 인지를 나타낸다. 
## R을 이용하여 W.Hnd 변수에 대한 분할표를 생성하고, 아래와 같은 가설에 대한 적합도 검정을 수행해보자.

## 귀무가설 : 전체 응답자 중 왼손잡이의 비율이 20%, 오른손잡이의 비율이 80%이다.
## 대립가설 : 전체 응답자 중 왼손잡이의 비율이 20%, 오른손잡이의 비율이 80%라고 할 수 없다.



##===== A)
# MASS 패키지의 survey 데이터 불러오기
data(survey, package="MASS")  

# survey 데이터의 구조 확인
str(survey) 

# W.Hnd변수의 분할표 확인
table(survey$W.Hnd)  

# W.Hnd변수의 분할표를 data변수에 저장
data<-table(survey$W.Hnd)   

# 적합도 검정 수행
chisq.test(data, p=c(0.2,0.8))




##### 3절 | 독립성 검정
## Q) MASS 패키지의 survey 데이터에서 Exer 변수는 설문 응답자가 
## 얼마나 자주 운동을 하는지에 대해 Freq(자주), Some(약간), None(하지 않음)의 범주로 
## 값을 저장하고 있다. W.Hnd 변수는 설문 응답자가 왼손잡이인지 오른손 잡이인지에 대해 
## Left(왼손잡이), Right(오른손 잡이)의 두 가지 범주로 값을 가지고 있다. 
## 주로 사용하는 손과 운동의 빈도가 서로 독립인지를 확인하기 위해 분할표를 생성하고, 
## 아래의 가설에 대한 독립성 검정을 수행해보자.

## 귀무가설 : W.Hnd(주로 사용하는 손)과 Exer(운동 빈도)는 독립이다.
## 대립가설 : W.Hnd(주로 사용하는 손)과 Exer(운동 빈도)는 독립이 아니다.


##===== A)
# 데이터 불러오기
data(survey, package="MASS")

# 분할표 생성
table(survey$W.Hnd, survey$Exer)

# 카이제곱 검정을 통한 독립성 검정 수행
# chisq.test(xtabs(~W.Hnd+Exer, data=survey))코드와 실행 결과가 동일함
chisq.test(table(survey$W.Hnd, survey$Exer))





##===============================================================
##### 4장. 분산분석 (ANOVA)


##### 1절 | 일원배치 분산분석
## Q) R에 내장되어 있는 iris 데이터를 이용하여 종(Species)별로 
## 꽃받침의 폭(Sepal.Width)의 평균이 같은지 
## 혹은 차이가 있는지를 확인하기 위해 일원배치 분산분석을 수행해보자.

##===== A)
## 1) 분산분석
# 분산분석 결과를 result 변수에 저장
result<-aov(Sepal.Width~Species, data=iris)  

# 분산분석표 확인
summary(result)     

## 2) 사후분석
# 사후분석 수행
TukeyHSD(aov(Sepal.Width~Species, data=iris))




##### 2절 | 이원배치 분산분석

## Q1) R에 내장된 mtcars 데이터는 32개의 차종에 대한 다양한 특성과 단위 연료당 주행거리를 담고 있다. 
## am변수는 변속기 종류이며, cyl변수는 실린더의 개수를 의미한다. 
## 데이터를 분석에 적절한 형태로 전처리한 후, 변속기 종류(am변수)와 실린더의 개수(cyl변수)에 따라 
## 주행거리(mpg변수) 평균에 유의미한 차이가 존재하는지 이원 분산분석을 수행하고, 그 결과를 해석해보자.

##===== A)
## 1) 데이터 확인 및 전처리
data("mtcars")
str(mtcars)

# aov함수를 사용하기 위해 독립변수인 cyl, am를 팩터형으로 변환
mtcars$cyl<-as.factor(mtcars$cyl)
mtcars$am<-as.factor(mtcars$am)

# cyl, am, mpg 변수들로만 구성된 분석용 데이터셋 생성 
car<-mtcars[,c("cyl","am","mpg")]
str(car)


## 2) 분산분석 수행
car_aov<-aov(mpg~cyl*am, car)
summary(car_aov)



## Q2) 실린더 개수(cyl변수)와 변속기 종류(am변수) 사이에 상호작용 효과가 있는지 없는지를 
## 시각화해주는 상호작용 그래프를 그린 후 이를 해석해보자.

##===== A)
interaction.plot(car$cyl, car$am, car$mpg, col=c("red", "blue"))





##===============================================================
##### 5장. 상관분석


##### 3절 | 상관계수 검정

## Q1) airquality 데이터는 뉴욕의 일일 대기 오염 정도에 대한 데이터로, 총6개의 변수로 이루어져 있다. 
## 6개의 변수 중 Month(월)과 Day(일)은 제외하고 Ozone(오존량), Solar.R(일사량), Wind(풍속), Temp(최고온도)만으로
## 이루어진 데이터프레임 air를 생성하고, 네 가지 변수에 대한 상관계수를 산출해보자. 
## 단, 모든 변수값에 NA가 없는 데이터들만 이용하여 피어슨, 스피어만, 켄달 상관계수를 모두 산출하여라.


##===== A)
# 데이터 확인 및 전처리
data("airquality")
str(airquality)

# air 데이터 생성
air<-airquality[,c(1:4)]
str(air)

# 피어슨 상관계수 계산
cor(air, use="pairwise.complete.obs", method="pearson")

# 켄달 상관계수 계산
cor(air, use="pairwise.complete.obs", method="kendall")

# 스피어만 상관계수 계산
cor(air, use="pairwise.complete.obs", method="spearman")



## Q2) air데이터 내의 네가지 변수 조합별 피어슨 상관계수를 그래프로 시각화해보자.

##===== A)
# air데이터에 대한 상관계수 행렬 생성
air_cor<-cor(air, use="pairwise.complete.obs")
air_cor

# 상관행렬 시각화
pairs(air_cor)



## Q3) air데이터의 Ozone(오존량)와 Wind(풍속)변수에 대한 상관분석을 실시하고, 
## 피어슨 상관계수에 대한 검정 결과를 해석해보자. 

##===== A)
# 피어슨 상관계수에 대한 검정 수행
cor.test(air$Ozone, air$Wind, method="pearson")





##===============================================================
##### 6장. 회귀분석


##### 2절 | 단순선형회귀분석

##### 3. R을 이용한 단순선형회귀분석 
## Q)  MASS패키지에서 제공하는 Cars93 데이터의 엔진크기(EngineSize)를 독립변수, 
## 가격(Price)를 종속변수로 설정하여 단순 선형 회귀분석을 실시한 후 추정된 회귀모형에 대해 해석해보자.

##===== A)
# 데이터 로드 및 확인
library(MASS)
data("Cars93")
str(Cars93)

# 단순 선형 회귀모형 생성
lm(Price~EngineSize, Cars93)

# 모형 살펴보기 : summary() 이용
# summary() : 주어진 인자에 대한 요약 정보 산출
Cars93_lm <- lm(Price~EngineSize, Cars93)
summary(Cars93_lm)


##### 4. R을 이용한 선형회귀모형 진단
## Q) 위 예제에서 생성한 선형회귀모델 Cars93_lm을 평가할 수 있는 
## 다양한 그래프를 생성한 후 해석해보자.

##===== A)
# 2x3 형태로 그래프를 배치하기 위해 화면 조정 
par(mfrow=c(3,2))

# 그래프 생성
plot(Cars93_lm, which=c(1:6))


##### 5. 선형회귀모형을 활용한 예측
## Q) MASS패키지에서 제공하는 Cars93 데이터의 엔진크기(EngineSize)를 독립변수, 
## 가격(Price)를 종속변수로 설정하여 회귀모형을 생성한 후, Cars93 데이터의 5개 행을 랜덤으로 뽑아 가격(Price)을 예측해보자. 
## 예측 시 predict 함수의 interval 인자값을 조정하며 그 결과를 비교해보자.

##===== A)
# 회귀모형 생성
Cars93_lm<-lm(Price~EngineSize, Cars93)

# 실습을 위해 시드값 설정
set.seed(1234)

# Cars93 데이터에서 랜덤으로 6개의 행번호를 추출하여 idx변수에 저장
idx<-sample(1:nrow(Cars93),5)
idx

# 예측에 사용할 데이터셋 구성
test<-Cars93[idx,]

# 예측 수행1 (점추정)
predict.lm(Cars93_lm, test, interval="none")

# 예측 수행2 (회귀계수의 불확실성을 감안한 구간추정)
predict.lm(Cars93_lm, test, interval="confidence")

# 예측 수행3 (회귀계수의 불확실성과 오차항을 감안한 구간추정)
predict.lm(Cars93_lm, test, interval="prediction")




##### 3절 | 다중선형회귀분석

##### 3. 더미변수(dummy variable)
## Q)  R에서 회귀모형을 생성하는 lm함수는 데이터에 범주형 변수가 포함되어 있을 경우, 
## 이를 자동으로 더미변수로 변환하여 회귀모형을 생성한다. 
## 이 과정을 더 자세히 이해하기 위해 범주형 변수(Spceies)가 포함된 iris데이터에서 
## Petal.Length를 종속변수로 두고 나머지 변수들을 독립변수로 설정한 회귀모형을 생성하고 그 결과를 살펴보자.

##===== A)
# 중회귀모형 생성 
# formula 인자값으로 여러개의 독립변수를 지정할 때 +기호로 연결
iris_lm<-lm(Petal.Length~Sepal.Length+Sepal.Width+Petal.Width+Species, iris)

# 모형 확인
summary(iris_lm)


##### 4. R을 이용한 다중회귀분석
## Q)  MASS패키지의 Cars93 데이터에서 엔진크기(EngineSize), RPM(RPM), 무게(Weight)를 독립변수로 설정하고 
## 자동차 가격(Price)를 종속변수로 설정하여 다변량 회귀분석을 수행한 뒤 그 결과를 해석해보자.

##===== A)
# 데이터 로드 및 확인
library(MASS)
str(Cars93)

# 다중회귀모형 생성 후 Price_lm 변수에 저장
Price_lm<-lm(Price~EngineSize+RPM+Weight, Cars93)

# 모형 요약정보 살펴보기
summary(Price_lm)



##### 5. 최적회귀방정식의 선택

## Q1) MASS 패키지의 Cars93 데이터에서 엔진크기(EngineSize), RPM(RPM), 너비(Width), 
## 길이(Length)를 독립변수로 가지고, 자동차의 가격(Price)을 종속변수로 가지는 선형회귀모형을 생성해보자. 
## 또한 변수 선택을 위한 함수를 사용하지 않고, 직접 후진 제거법을 수행하는 R코드를 살펴보며 
## 변수 선택법에 대해 정확하게 이해해보자.

##===== A)

## 1) 패키지 로드 및 다중회귀모형 생성
# 패키지 로드
library(MASS)

# 회귀모형을 생성한 후 lm_a 변수에 저장 
lm_a<-lm(Price ~ EngineSize + RPM + Width + Length, Cars93)

# 모형의 요약정보 확인
summary(lm_a)


## 2) 유의확률이 가장 높은 변수 Width를 제거하고 회귀모형(lm_b)을 다시 생성
# 회귀모형 lm_b 생성
lm_b<-lm(Price ~ EngineSize + RPM + Length, Cars93)

# 모형의 요약정보 확인
summary(lm_b)


## 3) 유의확률이 가장 높은 변수 Length를 제거하고 회귀모형(lm_c)을 다시 생성
# 회귀모형 lm_c 생성
lm_c<-lm(Price ~ EngineSize + RPM, Cars93)

# 모형의 요약정보 확인
summary(lm_c)



## Q2) MASS 패키지의 Cars93 데이터에서 엔진크기(EngineSize), 마력(Horsepower), RPM(RPM), 너비(Width), 
## 길이(Length), 무게(Weight)를 독립변수로 가지고, 자동차의 가격(Price)를 종속변수로 가지는 선형회귀모형을 생성해보자. 
## 그 후 step함수를 사용해 ‘후진제거법’으로 변수 선택을 수행한 후 결과를 해석해보자.

##===== A)
# 후진제거법을 활용한 변수선택
lm_result<-lm(Price~EngineSize+Horsepower+RPM+Width+Length+Weight, Cars93)
step(lm_result, direction="backward")
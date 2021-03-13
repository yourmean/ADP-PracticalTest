# 주성분분석 -------------------------------------------------------------------

# 기여율 85% 이상, scree plot(고유값)으로 선택
# prcomp(SVD, 특이값분해), princomp(공분산행렬)

library(datasets)
data(USArrests)

head(USArrests)
pairs(USArrests, panel=panel.smooth)

# 주성분분석
US.prin= princomp(USArrests, cor=TRUE)
summary(US.prin)
plot(US.prin, type='l')

US.prin$loadings  #주성분계수
US.prin$scores  #주성분점수

biplot(US.prin, scale=0)  #1,2주성분 행렬도 
# 요인분석 ---------------------------------------------------------------------

# 변수간 상관관계 고려
# factor, factor loading, factor matrix
# 요인 추출 방법 - 주성분분석, 공통요인분석
# prcomp, principal, factanal(요인추출법)
# rotation=varimax/promax/none, scores=regression/Bartlett

library(datasets)
data(swiss)
head(swiss)

Min= apply(swiss, 2, min)
Max= apply(swiss, 2, max)
swiss_fa= scale(swiss, center=Min, scale=Max-Min)  #표준화
head(swiss_fa)

# 요인분석
factanal(swiss_fa, factors=3) #-> 전체분산의 0.759 설명

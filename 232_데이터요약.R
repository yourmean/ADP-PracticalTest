# aggregate() : 그룹지어 집계
aggregate(Sepal.Width~Species,iris,mean)
aggregate(cbind(Sepal.Width, Petal.Width)~Species,iris,mean)


# table() : 도수분포표
Titanic= as.data.frame(Titanic)
str(Titanic)
table(Titanic$Class, Titanic$Survived)


# prop.table() : 상대도수/비율
prop.table(table(Titanic$Age, Titanic$Survived))
prop.table(table(Titanic$Age, Titanic$Survived), 1)  #행별비율
prop.table(table(Titanic$Age, Titanic$Survived), 2)  #열별비율


# subset() : 추출
subset(iris, subset=(Species=='setosa' & Sepal.Length>5.5),
       select= c(Species, Sepal.Length))
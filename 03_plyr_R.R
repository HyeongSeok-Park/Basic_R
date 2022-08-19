install.packages('plyr')
library(plyr)

# ddply ( df, .(기준column), func, group data)
# 기준 column : 범주형 데이터
# func : transfrom() / mutate() / summarise()
# group data : 수치형 데이터
data(iris)
df_iris <- iris
head(df_iris) # 상위 6 row 출력

# func : summarise / summarize
ddply(df_iris,.(Species), summarise, groupmean=mean(Sepal.Length))
ddply(df_iris,~Species, summarize, groupmean=mean(Sepal.Length))
# .(col) 또는 ~col 둘 다 같은 값을 출력함
# groupmean은 새로 생성한 column 명, 그 뒤는 새로 생성되는 함수 값


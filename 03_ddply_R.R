install.packages('plyr')
library(plyr)


# ddply ( df, 기준column, func, group data)
data(iris)
df_iris <- iris
df_iris
ddply(df_iris,.(Species), summarize, groupmean=mean(Sepal.Length))
ddply(df_iris,~Species, summarize, groupmean=mean(Sepal.Length))

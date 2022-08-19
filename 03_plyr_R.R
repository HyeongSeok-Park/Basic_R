install.packages('plyr')
library(plyr)

# ddply ( df, .(기준column), func, group data)
# 기준 column : 범주형 데이터
# func : transfrom() / mutate() / summarise() / subset()
# group data : 수치형 데이터
data(iris)
df_iris <- iris
head(df_iris) # 상위 6 row 출력


# transfrom() ; 연산결과를 다른 변수에 저장
# 해당 데이터프레임에 새로운 column을 추가할 수 있음
ddply(df_iris, .(Species), transform, total=(Sepal.Length)+(Sepal.Width)+(Petal.Length)+(Petal.Width))

# mutate() ; 앞서 추가한 컬럼 참조 가능(transform 개선)
# 해당 데이터프레임에 새로운 column을 계속해서 추가할 수 있음
ddply(df_iris, .(Species), mutate, total=(Sepal.Length)+(Sepal.Width)+(Petal.Length)+(Petal.Width), log=log(total), test=log*10)

# summarise() / summarize() ; 데이터 요약 정보 제공
# .(col) 또는 ~col 둘 다 같은 값을 출력함
# groupmean은 새로 생성한 column 명, 그 뒤는 새로 생성되는 함수 값
ddply(df_iris,.(Species), summarise, groupmean=mean(Sepal.Length))
ddply(df_iris,~Species, summarize, groupmean=mean(Sepal.Length))


# subset() ; 각 분할별 데이터 추출
ddply(df_iris, .(Species), subset, Sepal.Length==max(Sepal.Length))



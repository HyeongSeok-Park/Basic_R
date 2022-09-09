# 03_Package_R


# 1) plyr 패키지 - ddplyr
# 함수를 조합해서 데이터를 요약할 때 사용

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

######################################################################

# 2) ggplot2 패키지
# 데이터나 요약 결과를 그래프로 시각화할 때 사용

# 빈도 분석 - table ( )
install.packages('ggplot2')
library(ggplot2)
mpg
table(mpg$trans) # 범주형 데이터 빈도 수 출력
table(mpg$trans, mpg$drv)

# 빈도 비율 구하기 - prop.table ( )
mpg_trans <- table(mpg$trans)
prop.table(mpg_trans) # 각 범주형 데이터의 비율 출력
mpg_trans_drv <- table(mpg$trans, mpg$drv)
prop.table(mpg_trans_drv)    # 전체 집단(행, 열 모두)의 비율 합 = 1
prop.table(mpg_trans_drv, 1) # 행의 비율 합 = 1
prop.table(mpg_trans_drv, 2) # 열의 비율 합 = 1
round(prop.table(mpg_trans_drv), 2)
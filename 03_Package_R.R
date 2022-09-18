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

# 2) dplyr 패키지
# data frame을 핸들링할 때 사용

install.packages('dplyr')
library(dplyr)

# 조건을 이용해서 데이터 추출 - filter ( )
head(iris, 4)
filter(iris, Sepal.Length >= 6.5)

# 데이터 테이블 관측치 정돈 후 출력 - tibble ( )
iris %>% 
  filter(Sepal.Length >= 6.5) %>%
  tibble() # 코드 마지막에 해당 명령어를 덧붙여 출력 (또는 as_tibble())
# 첫 행에 데이터 크기 표시
# 콘솔창에 관측치를 10개만 출력
# column명 아래에 데이터 형식 출력 (<dbl>은 double을 의미)

# 해당 컬럼값을 기준으로 정렬 - arrange ( )
arrange(iris, Sepal.Length, Species) # 1차 Sepal.Length 기준으로 정렬, 2차 Species 기준으로 정렬 (오름차순이 기본값)
arrange(iris, desc(Sepal.Width)) # desc( column ) 해당 컬럼 내림차순으로 정렬

# 데이터 요약 값 출력 - summarise ( )
iris %>%
  summarise(sum(Sepal.Length))

iris %>%
  summarise(total = sum(Sepal.Width)) # column명 지정 가능

# 데이터 갯수 출력 - n ( )
iris %>%
  summarise(n()) # n() 괄호안에 column명을 넣으면 오류 발생
dim(iris) # row 값 출력

# 데이터 갯수 출력(중복값 제외) - n_distinct ( )
iris %>%
  summarise(n1 = n(), # 쉼표로 column 추가 가능
            n2 = n_distinct(Petal.Length)) 

# 집단별로 요약하기 - group_by ( )
iris %>%
  group_by(Species) %>%
  summarise(mean_Sepal.Length = mean(Sepal.Length))

# 중복값을 제거한 목록 만들기 - distinct ( )
iris %>%
  distinct(Species)

# %in% / between 활용
iris %>%
  filter(Petal.Length %in% c(1.4, 1.5))

iris %>%
  filter(between(Petal.Length, 1.4, 1.5))

iris %>%
  filter(Petal.Length >= 1.4 & Petal.Length <= 1.5)

# grepl() 함수 활용
iris %>%
  distinct(Species) %>%
  filter(grepl('a',Species))

iris %>%
  filter(grepl('1$', Sepal.Width)) # Sepal.Width에서 1로 끝나는 값 출력

######################################################################

# 3) ggplot2 패키지
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

######################################################################


# 연습 자료

checkout <- read.csv("E:/R/files/R_practice/data/checkout.csv")
customer <- read.csv("E:/R/files/R_practice/data/customer.csv")
merchant <- read.csv("E:/R/files/R_practice/data/merchant.csv")


1 %in% c(1,2,3)


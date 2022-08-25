# 01_Basic_R


# 1) 기초 R

# 데이터 요약 - summary(df)
data("trees")
trees
summary(trees)

# 6행까지 데이터 출력 - head(df)
head(trees)
head(trees, 6)

# 현재 생성된 변수들 출력 - ls()
ls()

# 현재 생성된 변수와 타입 모두 출력 - ls.str()
ls.str()

# 특정 변수 초기화 - rm( 변수 )
rm(a)
ls()

# 현재 설정된 변수 모두 초기화 - rm(list=ls())
rm(list=ls())
ls()

a <- 3
b <- 5
# 하나의 객체만 출력 - print( 변수 )
print(a,b)

# 여러 객체를 동시에 출력 - cat(변수1, 변수2, ... )
cat(a,'b')

# 연속된 정수 표현 - (시작숫자) : (마지막숫자) / seq(from , to , by) / seq(from , to , length.out)
1:5
6:-3
seq(from = 0, to = 20, by = 2)
seq(from = 0, to = 20, length.out = 3) # length.out : 지정한 값으로 등분함

# 백터 원소 선택 - 벡터변수 [ index수 ]
x <- c(1,2,3,4,5)
x[1] # R에서는 '1'부터 시작한다. (Python은 '0'부터 시작)
x[-2] # 해당 자리수를 제외하고 모두 출력

# 변수길이 - length ( 변수 )
length(x)

# 리스트를 사용하여 데이터프레임 만들기 - df <- as.data.frame(list)
new1 <- data.frame(a=1, b=2, c='3')
new1

a <- c(1,2,3)
b <- c('a','b','c')
list1 <- list(a,b)
names(list1) <- c('column1','column2')
list1
new2 <- as.data.frame(list1)
new2

# 행 이름 변경 - rownames( df ) <- c ( 'row1', 'row2' )
new2
rownames(new2) <- c('row1', 'row2', 'row3')
new2

# 열 이름 변경 - colnames( df ) <- c ( 'column1', 'column2' )
colnames(new2) <- c('col1', 'col2')
new2

# 데이터프레임 만들기 - data.frame(col1 = numeric(N), col2 = character(N), ...)
N = 10
dtfm <- data.frame(dosage = numeric(N), dnas = character(N), bnd = numeric(N))
dtfm 

# 행으로 합치기 - rbind(벡터, 리스트, 데이터프레임, ...)
new1 <- c(1,2,3,4)
names(new1) <- c('a','b','c','d') # 벡터상태일때 컬럼명 작성
new1
new2 <- c(5,6,7,8)
comb1 <- rbind(new1, new2)
comb1 # 벡터의 합은 벡터를 가로로 눕힌 형태에서 합쳐진다.

list1 <- list(new1, new2)
list1
new3 <- c('a','b','c','d')
new4 <- c('e','f','g','h')
list2 <- list(new3, new4)
list2
comb2 <- rbind(new3, new4, new1)
comb2 # rbind의 경우 열(column)의 수만 같으면 서로 다른 유형끼리도 합칠 수 있다.
      # 리스트의 cbind의 경우 데이터 형태가 하나로 통일된다.

# 열로 합치기 - cbind( 벡터, 리스트, 데이터프레임, ... )
new1 <- c(1,2,3,4) 
new2 <- c(5,6,7,8)
comb3 <- cbind(new1, new2) 
comb3  # 벡터의 합은 벡터를 세로로 세운 형태에서 합쳐진다.

df1 <- data.frame(new1, new2)
df1 # 벡터로 생성한 데이터프레임은 cbind와 유사하다.
df2 <- data.frame(new3, new4)
df2
comb4 <- cbind(df1,df2, new1)
comb4 # cbind의 경우 행(row)의 수만 같으면 서로 다른 유형끼리도 합칠 수 있다.

# 데이터프레임 병합 - merge(df1, df2, by = '공통 column')
df3 <- data.frame(new1, new2)
df3
df4 <- data.frame(new1, new4)
df4
comb5 <- merge(df4,df3,by='new1') 
comb5 # 데이터프레임 입력 순서에 따라 생성값의 형태가 달라짐

new1 <- c(1,2,11,12)
df5 <- data.frame(new1,new3)
df5
comb6 <- merge(comb5, df5, by='new1')
comb6 # 해당 컬럼에서 같은 값이 있는 행만 합쳐진다.

# 데이터프레임 조회1 - df [df$col1 <= 3(조건식), c(레코드 변수;col index)]
comb5
colnames(comb5) <- c('col1', 'col2','col3')
comb5
comb5[comb5$col1 <= 3 & comb5$col3 >= 5, c(2,3)]
comb5[comb5$col1 == 3, c(2,3)]

# 데이터프레임 조회2 - df[grep('value', df$col), c(출력할 column)]
comb5
comb5[grep('g', comb5$col2, ignore.case=F), c(1:3)]

# 데이터프레임 조회3 - subset(df, select=(출력할 column), subset=(조건식))
# select : column 설정
# subset : row 설정
subset(comb5, select=c(1,2), subset=(col1 < 3 & col3 > 5))
subset(comb5, subset=(col1>=2))

# 데이터프레임 열 제거 - subset( df, select = '-col' )
comb5
subset(comb5, select=-col1)

# 데이터프레임 NA 포함하는 행 삭제 - na.omit( df )
na.omit(comb5)

# 자료형 데이터 형태 변환 - charater / complex / integer / numeric / logical
as.charater(변수) # 문자형 자료로 변경
as.complex(변수) # 허수를 포함한 자료 형태로 변경
as.integer(변수) # 정수형 자료로 변경
as.numeric(변수) # 실수형 자료로 변경
as.logical(변수) # 논리형 자료로 변경

####################################################################
# 데이터 구조 변환 - data.frame / list / matrix / vector

# data.frame 형태로 변경
# vector -> data.frame
new1
as.data.frame(new1)        # 1열 데이터프레임 - as.data.frame(vec)
as.data.frame(rbind(new1)) # 1행 데이터프레임 - as.data.frame(rbind(vex))
# list -> data.frame
list2
names(list2) <- c('col1','col2')
as.data.frame(list2)          # 열 형태로 데이터프레임 변환 - as.data.frame(list)
rbind(list2[[1]], list2[[2]]) # 행 형태로 데이터프레임 변환 - rbind(list1[[i]], list2[[2]], ... )
# matrix -> data.frame
a <- matrix(1:20, 4, 5)
a
as.data.frame(a) # 행렬과 같은 형태 변환 - as.data.frame(mat)
t(as.data.frame(a)) # 데이터프레임 축 변경 - t(df)

# list 형태로 변경
# vector / matrix / data.frame -> list
new1
as.list(new1) # as.list(vec/mat/df)
a
as.list(a)
comb5
as.list(comb5)

# vector 형태로 변경
# list -> vector
list2
unlist(list2) # 벡터 형태로 변환 - unlist(list)
# matrix -> vector
a
as.vector(a) # 벡터 형태로 변환 - as.vector(mat)
# data.frame -> vector
comb5
comb5[[1]] # df[1] : 데이터프레임 형태
           # df[[1]] : 벡터 형태
comb5[,1]  # 1열 벡터로 출력 - df[[i]] / df[,i]
comb5[1,]  # 1행 벡터로 출력 - df[i,]

# matrix 형태로 변경
# vector -> matrix
new1
cbind(new1)      # 1열 행렬로 출력 - cbind(a)
as.matrix(new1)  # 1열 행렬로 출력 - as.matrix(a)
matrix(new1,4,1) # 1열 행렬로 출력 - matrix(a, i, j)
matrix(new1,1,4) # 1행 행렬로 출력 - matrix(a, i, j)
# list -> matrix
list2
list3 <- c(1,2,3,4)
as.matrix(list3)        # 1열 행렬로 출력 - as.matrix(list)
as.matrix(cbind(list2[[1]], list2[[2]])) # 여러 리스트 값이 있을 때 열 형태로 행렬 출력 - as.matirx(cbind(list[[1]], list[[2]], ... ))
as.matrix(rbind(list3)) # 1행 행렬로 출력 - as.matrix(rbind(list))
as.matrix(rbind(list2[[1]], list2[[2]])) # 여러 리스트 값이 있을 때 행 형태로 행렬 출력 - as.matrix(rbind(list[[1]], list[[2]]))
matrix(unlist(list2),4,2) # n x m 행렬로 출력 - matrix(list, n, m)
t(matrix(unlist(list2),4,2)) # 리스트 축 변경 - t(mat)
# data.frame -> matrix
comb5
as.matrix(comb5) # as.matrix(df) 
                 # 행렬로 변경시 하나의 데이터형태로 바뀜

####################################################################

# 2) 데이터프레임 다루기

# 데이터프레임 행과 열 수 확인 - dim ( df )
dim(comb5)

# 데이터프레임 열 분할하기 - split ( df , vec ) ; df의 열 수와 같은 vec사용 추천
comb1 <- data.frame(col1 = c(1,1,2,2),
                    col2 = c(3,4,5,6),
                    col3 = c(6,7,8,9))
comb1
a <- c('첫번째','두번째','세번째','네번째')
b <- c('반복1','반복2','반복3')
split_group1 <- split(comb1, a)
split_group1

split_group2 <- split(comb5,b)
split_group2 # b벡터원소가 3개 -> comb5의 마지막열은 b벡터 첫번째 원소에 입력되게 된다.

library(MASS)
Cars93
sp <- split(Cars93$MPG.city, Cars93$Origin)
sp

# 데이터프레임 변수를 하나의 컬럼으로 정렬 - stack ( data.frame ( df ) )
# long data(dity data) / database에서 선호하는 형식 / group by 연산 용이 / join 가능
data("trees")
trees
sta_trees <- stack(trees)
sta_trees
unstack(sta_trees) # 두번째 열의 값을 컬럼으로 하는 데이터프레임 생성

# 데이터프레임 형태 변경 - unstack ( df , value ~ column )
# wide data / 교차테이블 / 행별, 컬럼별 그룹연산 가능 / join 불가능
unst_trees <- unstack(trees, Volume ~ Height)
unst_trees # 데이터 중복값이 중구난방이라서 리스트 형태로 출력됨

comb1
unstack(comb1, col2 ~ col1)

# 데이터프레임에 함수 적용 - sapply ( df , func )
sapply(comb1, function(x) x+1)

# 데이터프레임에 함수 적용하여 리스트 형태로 출력 - lapply ( df , func )
lapply(comb1, function(x) x*2)

# lapply / sapply 예시
lapply(iris[,1:4], mean)
sapply(iris[,1:4], mean)

# 결측치 개별 확인 - is.na( 변수 )
library(MASS)
Cars93
is.na(Cars93) # 결측치를 TURE로 출력

# 결측치 총합 확인 - sum( is.na ( 변수 ) )
sum(is.na(Cars93)) # 해당 데이터프레임에 존재하는 총 결측치 수 출력

# 결측치 column별 확인 - colSums ( is.na ( 변수 ) )
colSums(is.na(Cars93)) # 각 column 별로 존재하는 총 결측치 수 출력

# 결측치를 제외 명령어 - na.rm = T/TRUE
sum(Cars93$Luggage.room, na.rm = T) # 결측치를 제외한 총 합을 출력
sum(Cars93$Luggage.room) # 결측지가 있으면 NA로 출력됨

# 결측치가 있는 행 삭제 - na.omit( 변수 )
Cars93_1 <- na.omit(Cars93)
Cars93_1
colSums(is.na(Cars93))
colSums(is.na(Cars93_1))

# 특정 영역에서 결측치를 포함하는 행 삭제 - df[ complete.cases( df[행,열] ), ]
dim(Cars93) # Python에서 shape와 같음
colSums(is.na(Cars93))
Cars93_2 <- Cars93[ complete.cases(Cars93[ , c('Rear.seat.room')])  , ]
sum(is.na(Cars93_2))
Cars93_2 <- Cars93[ complete.cases(Cars93[ , c('Luggage.room')])  , ]
sum(is.na(Cars93_2)) # Rear.seat.room에서 결측치가 행이 Luggage.room에서 결측치가 있는 행과 같은 행이다. 따라서 Luggage.room 행 삭제 시 모든 결측치가 제거되는 것으로 보임.

# 결측치 치환 - df$col1[ is.na( df$col1 ) ] # 앞쪽과 뒤쪽의 범위가 같아야함
Cars93_3 <- Cars93
Cars93_3$Luggage.room[is.na(Cars93_3$Luggage.room)] <- 0
Cars93_3$Luggage.room
sum(is.na(Cars93_3$Luggage.room))

sum(is.na(Cars93_3))
Cars93_3[is.na(Cars93_3)] <- 0 # 데이터프레임 전체에 적용 가능
sum(is.na(Cars93_3))

# 각 결측치를 각 변수 별 평균값으로 일괄 대체 - sapply(df, func(x) ifelse(is.na(x), mean(x, na.rm=TRUE), x))
Cars93_4 <- Cars93[,c('Luggage.room','Rear.seat.room')]
Cars93_4
sum(is.na(Cars93_4))
sapply(Cars93_4, function(x) mean(x, na.rm = T)) # 데이터프레임 열 별로 함수 적용
Cars93_4 <- sapply(Cars93_4, function(x) ifelse(is.na(x), mean(x, na.rm=T), x))
Cars93_4
sum(is.na(Cars93_4))

####################################################################


# 3) 기초 통계

# 평균값 - mean ( 변수 )
y <- c(1,2,40,41,42,43)
z <- c(5,6,7,8,9,10)
mean(y)

# 합계 - sum ( 변수 )
sum(y)

# 중앙값 - median ( 변수 )
median(y)

# 분산 - var ( 변수 )
var(y)

# 표준편차1 - sd ( 변수 )
sd(y)

# 표준편차2 - sqrt ( var ( 변수 ) )
sqrt(var(Cars93_3$Luggage.room))

# 공분산 - cov ( 변수1, 변수2)
#  2개의 확률변수의 선형 관계를 나타내는 값. 만약 2개의 변수중 하나의 값이 상승하는 경향을 보일 때 다른 값도 상승하는 선형 상관성이 있다면 양수의 공분산을 가진다.
cov(y, z)

# 상관계수 - cor ( 변수1, 변수2 )
# 변수간의 관계의 정도와 방향을 하나의 수치로 요약해 표시해 주는 지표. 상관계수는 -1에서 1 사이의 값으로 나타낸다. 이때 0에 가까울수록 상관관계는 낮아지는 것이며, -1이나 +1에 가까울수록 상관관계는 높아진다.
install.packages("corrplot")
library(corrplot)
iris
data <- iris[,1:4]
data
cor_iris <- cor(data)
cor_iris

# 01_Basic_R


# 1) 기초 R

# 데이터 요약 - summary( df )
data("trees")
trees
summary(trees)

# 6행까지 데이터 출력 - head( df )
head(trees)
head(trees, 6)

# column 명 불러오기 및 수정정 - names ( df )
trees_1 <- trees
trees_1
names(trees_1)
names(trees_1) <- paste0('No',1:3)
head(trees_1)

# 현재 생성된 변수들 출력 - ls( )
ls()

# 현재 생성된 변수와 타입 모두 출력 - ls.str()
ls.str()

# 특정 변수 초기화 - rm( 변수 )
rm(a)
ls()

# 현재 설정된 변수 모두 초기화 - rm(list=ls())
rm(list=ls())
ls()

# 문자와 숫자 등을 연결하여 출력 - paste( ) / paste0( )
paste('A', '+', 1, '등급')
paste('2학년', c('1반', '2반', '3반'), sep = '-')
paste(1:4, '학기', sep = '') # paste는 기본적으로 문자 간에 공백이 추가된다.
paste0(1:4, '학기') # paste0는 paste의 문자 간 공백을 없앤 명령어

# 변수 값 각각에 대해 일치하는 패턴값 출력 - grepl('패턴' , 변수 )
text <- c('통계', '데이터', '데이터분석', 'R과 통계')
text %in% c('통계') # 정확히 일치하는 값만 TRUE로 출력
grepl('통계', text) # 입력한 패턴이 일치하는 변수는 모두 TRUE로 출력
!grepl('통계', text) # 위의 명령어와 반대로 출력
grepl('통계|분석', text)

longtext <- '가나다라마바사 .@$# Product_id=P9938&ABCD 21fa'
grepl('.*Product_id=(P[0-9]{4}).*', longtext) # 정규표현식 ( .* ) : 어떤 문자(길이제한 없음)

# 변수 값 각각에 대해 일치하는 패턴 인덱스 출력 - grep('패턴', 변수 )
grep('통계', text)
grep('통계', text, value = T) # value 옵션 : 해당 값을 그대로 출력
grep('통계', text, value = T, invert = T) # invert 옵션 : 해당 패턴에 반대로 출력
grep('[가-싷]{2,}', text) # 정규표현식 [가-싷] : ㄱ~ㅅ 사이의 한글 2자 이상
grep('[[:alpha:]]', text) # 정규표현식 [[:alpha:]] : 모든 언어 (한글 영어 등)
grep('[^가-힣]', text) # 정규표현식 [^가-힣] : 한글이나 공백 외의 문자를 포함하는 문자열 출력
grep('^[a-zA-Z]', text, value=T) # 정규표현식 ^[a-zA-Z] : 영어로 시작하는 문자열
grep('[가-힣]$', text, value=T) # 정규표현식 [가-힣]$ : 한글로 끝나는 문자열

# 패턴을 찾아 해당값을 수정 후 출력 - gsub( '패턴', '수정값', 변수 )
text2 <- c('가나다라1234@$#!!', 'XVbb.1', '1243145', 'A/Z', '가 나 다 라')
gsub('[[:punct:]]', '-', text2) # 정규표현식 [[:punct:]] : 키보드에 있는 특수문자
gsub('[0-9]{3,}', '###', text2)

gsub('.*Product_id=(P[0-9]{4}).*', '\\1', longtext) # 정규표현식 ( \\1 ) : 바로 앞에 정의한 패턴 중 첫 번째 소괄호의 내용 출력

address <- c('수성구 동성로1길 34', '달서구 효성공원로4길 3')
gsub('[[:alpha:]]{2,} ([[:alnum:]]{2,}) [0-9]{1,}', '\\1', address) # 공백을 구간분리하는데 활용


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
new5 <- c(1,3,5,7)
df3 <- data.frame(new1, new2, new5)
df3
df4 <- data.frame(new1, new4)
df4
comb5 <- merge(df3,df4,by='new1')
comb5 # 데이터프레임 입력 순서에 따라 생성값의 형태가 달라짐

## merge 옵션
merge_test1 <- merge(df3, df4, by.x = 'new5', by.y = 'new1') # 기준이 되는 column 개별로 설정
merge_test1 # column명은 df3(x 데이터)을 따른다.

df4[1] <- c(1,3,4,5)
merge_test2 <- merge(df3, df4, all.x = T) # df3(x 데이터) column을 기준으로 결합
merge_test2
merge_test3 <- merge(df3, df4, all.y = T) # df4(y 데이터) column을 기준으로 결합
merge_test3
merge_test4 <- merge(df3, df4, all = T) # 공통된 column의 모든 값이 나오도록 결합
merge_test4
names(df4) <- c('가','나')
merge_test5 <- merge(df3, df4, all.x = T)
merge_test5 # 공통된 colum이 없어서 df4를 반복하여 결합

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

# 데이터프레임 열 추가 - data.frame( df, vec )
comb5
new_col <- c(11, 12, 13, 14)
new_comb5 <- data.frame(comb5, new_col)
new_comb5

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

####################################################################

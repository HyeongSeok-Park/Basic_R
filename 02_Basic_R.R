# 02_Basic_R

# 유용한 패키지 설치
# install.packages('AID', 'E:/R/R-4.2.1/library')
# install.packages()

# 다운로드 된 AID패키지의 help 다큐먼트를 보여준다.
library(help=AID)

# 웹을 통해 AID패키지의 다큐먼트를 보여준다.
help(package=AID)

# 현재 작업 중인 경로 확인 - getwd ( )
getwd()

# 경로 변경 - setwd ( 경로 )
setwd("E:/R/files/Basic_R")
getwd()

# csv 파일 불러오기 - read.csv( ' 파일명 ' )
# 엑셀 파일 불러오기 - read_excel( ' 파일명 ' , skip = 1 )
install.packages('readxl') # 패키지 설치 필요
library(readxl)
read_excel('파일명', skip = 1) # 첫 행 제외하고 출력
# txt 파일 불러오기 - read.table( ' 파일명 ' , sep = ' 구분자 ' )
read.table('') # tab으로 구분된 경우
read.table('', sep = ';') # 세미콜론(;)으로 구분된 경우
read.table('', sep = ',') # 쉼표(,)로 구분된 경우
# 그 외 불러오기 옵션 - stringsAsFactors = F / na = ' - ' / header = T
read.csv('', stringsAsFactors = F) # 데이터를 불러올때 문자는 문자형으로 반환
# R에서는 데이터를 불러올때 문자가 있는 열은 무조건 범주형으로 반환한다.
read.csv('', na = '-') # 불러올 데이터가 '-'인 경우 결측치로 반환
read.csv('', header = F) # 첫 행을 헤더로 하지 않는다
# 엑셀파일을 불러올땐 첫 행을 자동으로 헤더로 인식
# txt파일을 불러올땐 헤더가 없는 것으로 인식

# 변수설정
x <- 1
y <- '4'
x
y

# 객체 출력 - print( 변수 )
a <- 3
b <- 5
print(a,b)

# 여러 객체를 동시에 출력 - cat(변수1, 변수2, ... )
cat(a,'b')

# 연속된 정수 표현 - (시작숫자) : (마지막숫자) / seq(from , to , by) / seq(from , to , length.out)
1:5
6:-3
seq(from = 0, to = 20, by = 2)
seq(from = 0, to = 20, length.out = 3) # length.out : 지정한 값으로 등분함

# 변수 유형(타입) 확인 - class ( )
class(x)
class(y)

# 백터 원소 선택 - 벡터변수 [ index수 ]
x <- c(1,2,3,4,5)
x[1] # R에서는 '1'부터 시작한다. (Python은 '0'부터 시작)
x[-2] # 해당 자리수를 제외하고 모두 출력

# 변수길이 - length ( 변수 )
length(x)

# 엑셀 형태로 출력 - View ( )
View(y)

# Combine 함수 - c( )
x <- c(a,b,1,2,3)
x
y <- c(a,'b',1,2,3) # 변수가 하나라도 문자가 있으면 모두 문자로 저장됨
y

# 벡터 - V
V1 <- c(10,20,30); names(V1) <- c('Moe', 'Larry', 'Curly')
V1
V1[2] # 2번째 위치값 출력
V1[c(2,3)]
V1['Larry']

# 벡터에 데이터 추가 - V[length(V)+1] <- 원소 / append(벡터,원소,after = n)
V2 <- c(1,2)
V2
V2[length(V2)+1] <- 3 # V2 벡터에 바로 적용됨 (inplace = T)
V2
append(V2,4,after = 4) # V2 벡터에 바로 적용 안됨 (inplace = F)
V2

# 벡터 내 값 출력 - V[i]
V2[1]
V2[c(1,2)] # 1번째, 2번째 원소값 출력
V2[-3] # 3번째 원소값만 제외하고 출력

# 요소 - fct <- factor(  )
# 범주형 데이터 타입을 표현하기 위해 만들어진 타입
fct <- factor(c('a','a','b','b','b','c'))
fct

# 요소를 기준으로 함수 적용 - tapply(vec, factor, func)
vec1 <- c(1,1,4,4,4,6)
vec2 <- c(5,4,1,4,2,6)
fct
tapply(vec1, fct, mean)
tapply(vec2, fct, sum)

# 리스트 - L <- list(  ,  ,  )
# 리스트의 경우 여러 자료형(숫자, 문자)의 원소들이 포함될 수 있다.
L1 <- list(1,2,'3'); names(L) <- c('Moe', 'Larry', 'Curly')
L1
L1[[2]] # 2번째 위치값 출력 (형태 주의)
L1[c(2,3)]
L1[['Moe']]
L1$Moe

L2 <- list(a=1, b=2, c=3)
L2

# 리스트 구조 확인 - str ( L )
str(L1)

# 리스트 내 값 출력 - L [ [ i ] ]
L2[[1]]
L2[c(1,2)]

# 리스트에서 특정 원소 제거 - L [ [ ' ' ] ] <- NULL
L2[['a']] <- NULL # a원소 제거
L2

# 리스트에서 NULL 원소 제거 - 검증작업 필요
L2[sapply(L2,is.null)] <- NULL
L2[L2==0] <- NULL
L2[is.na(L2)] <- NULL


# 데이터프레임 생성 - data.frame(리스트1, 리스트2, ... )
# 리스트값은 컬럼형태(열)로 입력된다.
height <- c(1.3, 2.4, 5.2)
width <- c(3, 5, 7)
name <- c('A', 'B', 'c')
df1 <- data.frame(name, height, width)
df1

df2 <- data.frame(x=1:3, y=c('Tom','Yoon','Kim'))
df2

# 데이터프레임 열 수 확인 - ncol ( df )
ncol(df2)

# 데이터프레임 행 수 확인 - nrow ( df )
nrow(df2)

# 데이터프레임 열값 불러오기 - df[ ' i ' ] / df [ [ ' i '] ] / df [ , 열번호]
df2[1]
df2[2]
df2[[1]]
df2['new3']
df2$new4
df2[,1]

# 데이터프레임 행값 불러오기 - df [ 행번호 ,  ]
df2[1,]

# 데이터프레임 특정값 불러오기 - df [ 행번호 , 열번호]
df2
df2[3,2]

# 행열 만들기 - matrix( data, 행수, 열수) / dim ( 행열변수 ) <- c ( 행수 , 열수)
a <- matrix(1:20, 4, 5)
a 
a_1 <- matrix(1:20, ncol=5, nrow=4, byrow=T)
a_1

b <- 1:8
dim(b) <- c(2,4)
b

# 행열 차원 출력 - dim ( 행열변수 )
dim(b)

# 행열 대각선값 출력 - diag( 행열변수 )
diag(b)

# 특정 행/열/원소값 출력 - matrix [ 행수 , 열수 ]
b
b[1,] # 1번째 행 출력
b[,4] # 4번째 열 출력
b[2,3] # 2번째 행, 3번째 열 값 출력


# 배열 만들기 - dim ( 행열변수 ) <- c ( 행수 , 열수 , 차원1, ... )
# 행열에 3차원 또는 n차원까지 확장된 형태
b <- 1:12
dim(b) <- c(2,3,2)
b

# 행렬에 함수 적용 - apply ( df , 기준 축, func )
# 행렬 연산 순서 [1,1] -> [1,2] ... [n,n]
a
apply(a, 1, function(x) x+1) # 출력 형태 column 기준
apply(a, 2, function(x) x+1) # 출력 형태 row 기준 (기존 행렬과 같은 형태로 출력)

##############################################################################

# 난수 생성

# 평균 n, 표준 편차 sd인 정규 분포를 따르는 난수 n개 생성 - rnorm(n, mean=0, sd=1)
rnorm(10, mean=5, sd=1) # 평균 n, 표준 편차 sd인 정규 분포를 따르는 난수 n개 발생

# 최소값 min, 최대값 max인 균등 분포를 따르는 난수 n개 생성 - runif(n, min=0, max=1)
runif(10, min=0, max=10)

# 람다값이 lambda인 포아송 분포를 따르는 난수 n개 생성 - rpois(n, lambda)
rpois(10, 4)

# 람다가 rate인 지수 분포를 따르는 난수 n개 생성 - rexp(n, rate)
rexp(10, 4)

##############################################################################

# 문자열 날짜 다루기

# 문자열 길이 - nchar( ' 문자열 ' )
m <- c('Hellow world')
nchar('가나다라 마바 사 아')
nchar(m)

# 구분자로 문자 나누기 또는 연결 - paste( 문자1, 문자2, ..., sep = '구분자' )
paste(1,2,3, sep = '-')
paste('A', c('b','c'), sep = '$ ')
paste(c('a', 'd'), c('b','c'), sep = '$ ')
paste('the pi is approximately', pi)

# 특정 숫자나 변수 반복 - rep ( 숫자/변수 , time/each = 반복횟수)
rep(1:4, time = 3) # 해당 변수 전체를 3번 반복
rep(1:4, each = 3) # 해당 개별 변수를 3번씩 반복

# 문자열 추출 - substr('문자열',시작,끝)
substr('Hellow world',1,8)

# 구분자로 문자열 추출 - strsplit ( 문자열 , 구분자 )
strsplit('Hellow; wor;ld', ';')

# 하위 문자열 대체 - sub( 이전, 변경, 문자열 )
sub('world','Korea','Hellow world')
gsub('world','Korea','Hellow world')

# 다수의 문자열 합치기 - outer ( 문자열1, 문자열2, ... , sep = ' 구분자 ')
outer('Hellow world', 'Hellow Korea', paste, sep=' ')

##############################################################################

# 날짜
Sys.Date() # 현재 날짜로 출력
as.Date() # 날짜 객체로 출력
format(Sys.Date(),format = '%y/%m/%d') # 날짜 형태 변경
format(Sys.Date(),'%a') # 현재 요일 조회
format(Sys.Date(),'%B') # 현재 월 조회
format(Sys.Date(),'%b') # 축약된 월 조회
format(Sys.Date(),'%m') # 두 자리수 월 조회
format(Sys.Date(),'%d') # 두 자리수 일 조회
format(Sys.Date(),'%Y') # 네 자리수 연도 조회
format(Sys.Date(),'%y') # 두 자리수 연도 조회

##############################################################################

# 결과값을 파일로 저장하고 생성 - sink() 함수 / cat( ' ' , file = ' ' )
# sink()
sink('test1.txt') # 출력값을 test1.txt에 기록 시작
a <- 1
b <- 2
a
b
a + b
sink() # 기록 마침
# cat()
cat('Hellow world', file = 'test2.csv')

# 파일 목록 보기 - list.files()
list.files()

# 테이블로 된 파일 읽기 - read.table('파일명', sep = '구분자')
read.table('파일명', sep = '구분자')

# CSV 파일 저장 - write.csv(변수, '파일명.csv', row.names = F)
df <- matrix(1:20, 4,5)
df <- data.frame(df)
df
write.csv(df, 'test3.csv', row.names = F)

# CSV 파일 불러오기 - read.csv('파일명', header = T/F)
read.csv('test3', header = T) # 첫째행을 Column명으로 지정하고 출력

# R 파일 저장 - save(변수, file = '파일명.Rdata')
save(df, file = 'test4.Rdata')

# R 파일 불러오기 -  load('경로/.../파일명') / source('경로/.../파일명')
load("E:/R/files/Basic_R/test4.Rdata")
source('E:/R/files/Basic_R/test4.Rdata')

# 웹에서 파일 출력 - read.csv('http://www. ... .csv') / read.table(' 주소 ')
read.csv('http://www. ... .csv')
read.table('http://www. ... .table')

# html에서 파일 출력 - library(XML) / url <- ' 주소 ' / t <- readHTMLTable(url)
library(XML)
url <- 'http://www. ... table.html'
t <- readHTMLTable(url)

# R에 내장된 데이터 불러오기 - data ( ' ' )
data("women")
women

# for문 활용
for (i in 1:10) { # print()
  print(i)
}
for (i in 1:10) { # cat()
  cat('\t#',i,'번째 작업중')
}

# 함수 사용 예시 - function(x,y)
f <- function(x,y) return((x-y)^2)
f(1:3,3)

x <- 1:100
x
sum(x>50)

sample <- read.csv("E:/R/files/R_practice/data/sample1.csv")
sample


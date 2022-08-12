# 02_Basic_R

# 유용한 패키지 설치
# install.packages('AID', 'E:/R/R-4.2.1/library')
# install.packages()

# 다운로드 된 AID패키지의 help 다큐먼트를 보여준다.
library(help=AID)

# 웹을 통해 AID패키지의 다큐먼트를 보여준다.
help(package=AID)

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

# CSV 파일 출력 - write.csv(변수, '파일명', row.names = F)
write.csv(df, 'test3', row.names = F)

# CSV 파일 읽기 - read.csv('파일명', header = T/F)
read.csv('test3', header = T) # 첫째행을 Column명으로 지정하고 출력

# 웹에서 파일 출력 - read.csv('http://www. ... .csv') / read.table(' 주소 ')
read.csv('http://www. ... .csv')
read.table('http://www. ... .table')

# html에서 파일 출력 - library(XML) / url <- ' 주소 ' / t <- readHTMLTable(url)
library(XML)
url <- 'http://www. ... table.html'
t <- readHTMLTable(url)

# 특정 숫자나 변수 반복 - rep ( 숫자/변수 , time/each = 반복횟수)
rep(1:4, time = 3) # 해당 변수 전체를 3번 반복
rep(1:4, each = 3) # 해당 개별 변수를 3번씩 반복

# 구분자로 문자 나누기 - paste( 문자1, 문자2, ..., sep = '구분자' )
paste(1,2,3, sep = '-')
paste('A', c('b','c'), sep = '$ ')
paste(c('a', 'd'), c('b','c'), sep = '$ ')

# for문 활용
for (i in 1:10) { # print()
  print(i)
}
for (i in 1:10) { # cat()
  cat('\t#',i,'번째 작업중')
}








# 02_Basic_R

# 유용한 패키지 설치
# install.packages('AID', 'E:/R/R-4.2.1/library')

# 다운로드 된 AID패키지의 help 다큐먼트를 보여준다.
library(help=AID)

# 웹을 통해 AID패키지의 다큐먼트를 보여준다.
help(package=AID)

# 결과값을 파일로 저장하고 생성 - sink() 함수
sink('test1.txt') # 출력값을 test1.txt에 기록 시작
a <- 1
b <- 2
a
b
a + b
sink() # 기록 마침

# 특정 숫자나 변수 반복 - rep ( 숫자/변수 , time/each = 반복횟수)
rep(1:4, time = 3) # 해당 변수 전체를 3번 반복
rep(1:4, each = 3) # 해당 개별 변수를 3번씩 반복

# 구분자로 문자 나누기 - paste( 문자1, 문자2, ..., sep = '구분자' )
paste(1,2,3, sep = '-')
paste('A', c('b','c'), sep = '$ ')
paste(c('a', 'd'), c('b','c'), sep = '$ ')





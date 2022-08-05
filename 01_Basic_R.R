# Basic R

# 유용한 패키지 설치
# install.packages('AID', 'E:/R/R-4.2.1/library')

# 다운로드 된 AID패키지의 help 다큐먼트를 보여준다.
library(help=AID)

# 웹을 통해 AID패키지의 다큐먼트를 보여준다.
help(package=AID)

# 변수설정
x <- 1
y <- 4
x
y

# 결과값을 파일로 저장하고 생성 - sink() 함수
sink('test1.txt') # 출력값을 test1.txt에 기록 시작
a <- 1
b <- 2
a
b
a + b
sink() # 기록 마침

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
cat(a,b)

# 백터 생성 - c( )
x <- c(a,b,1,2,3)
x
y <- c(a,'b',1,2,3) # 변수가 하나라도 문자가 있으면 모두 문자로 저장됨
y



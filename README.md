개인적으로 공부하며 느낀 자주 사용되는 명령어 정리

# 01_Basic_R

## 1) 기초 R
- 변수 설정 - x <- 1
- 현재 생성된 변수들 출력 - ls()
- 현재 생성된 변수와 타입 모두 출력 - ls.str()
- 특정 변수 초기화 - rm( 변수 )
- 현재 설정된 변수 모두 초기화 - rm(list=ls())
- 하나의 객체만 출력 - print( 변수 )
- 여러 객체를 동시에 출력 - cat(변수1, 변수2, ... )
- 연속된 정수 표현 - (시작숫자) : (마지막숫자) / seq(from , to , by) / seq(from , to , length.out)
- 특정 숫자나 변수 반복 - rep ( 숫자/변수 , time/each = 반복횟수)
- 문자열 추출 - substr('문자열',시작,끝)
- 백터 원소 선택 - 벡터변수 [ index수 ]
- 변수길이 - length ( 변수 )

## 2) 기초통계
- 평균값 - mean ( 변수 )
- 합계 - sum ( 변수 )
- 중앙값 - median ( 변수 )
- 분산 - var ( 변수 )
- 표준편차 - sd ( 변수 )
- 공분산 - cov ( 변수1, 변수2)
- 상관계수 - cor ( 변수1, 변수2 )


# 02_Basic_R
- 유용한 패키지 설치 - install.packages('AID', '경로')
- 패키지 목록 확인1 - library(help=AID)
- 패키지 목록 확인2 - help(package=AID)
- Combine 함수 - c( )
- 벡터 - V
- 벡터에 데이터 추가 - V[length(V)+1] <- 원소 / append(벡터,원소,after = n)
- 벡터 내 값 출력 - V[i]
- 리스트 - L <- list(  ,  ,  )
- 리스트 내 값 출력 - L [ [ i ] ]
- 리스트에서 특정 원소 제거 - L [ [ ' ' ] ] <- NULL
- 리스트에서 NULL 원소 제거 - 검증작업 필요
- 데이터프레임 생성 - data.frame(리스트1, 리스트2, ... )
- 데이터프레임 열값 불러오기 - df[ ' i ' ] / df [ [ ' i '] ] 
- 행열 만들기 - matrix( data, 행수, 열수) / dim ( 행열변수 ) <- c ( 행수 , 열수)
- 행열 차원 출력 - dim ( 행열변수 )
- 행열 대각선값 출력 - diag( 행열변수 )
- 행 이름 부여 - rownames( 행열변수 ) <- c ( 'row1', 'row2' )
- 열 이름 부여 - colnames( 행열변수 ) <- c ( 'column1', 'column2' )
- 특정 행/열/원소값 출력 - matrix [ 행수 , 열수 ]
- 결과값을 파일로 저장하고 생성 - sink() 함수 / cat( ' ' , file = ' ' )
- 파일 목록 보기 - list.files()
- 테이블로 된 파일 읽기 - read.table('파일명', sep = '구분자')
- CSV 파일 읽기 - read.csv('파일명', header = T/F)
- 웹에서 데이터 읽어오기 - read.csv('http://www. ... .csv') / read.table(' 주소 ')
- library(XML) / url <- ' 주소 ' / t <- readHTMLTable(url)
- 
- 
- 특정 숫자나 변수 반복 - rep ( 숫자/변수 , time/each = 반복횟수)
- 구분자로 문자 나누기 - paste( 문자1, 문자2, ..., sep = '구분자' )
- for문 활용


# 사용환경
R studio  
 - 64 bit 윈도우 환경
 - R-4.2.1
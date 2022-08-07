개인적으로 공부하며 느낀 자주 사용되는 명령어 정리

# 01_Basic_R

## 기초 R
- 유용한 패키지 설치 - install.packages('AID', '경로')
- 패키지 목록 확인1 - library(help=AID)
- 패키지 목록 확인2 - help(package=AID)
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

## 기초통계
- 평균값 - mean ( 변수 )
- 합계 - sum ( 변수 )
- 중앙값 - median ( 변수 )
- 분산 - var ( 변수 )
- 표준편차 - sd ( 변수 )
- 공분산 - cov ( 변수1, 변수2)
- 상관계수 - cor ( 변수1, 변수2 )
- 
- 


# 02_Basic_R
- 유용한 패키지 설치 - install.packages('AID', '경로')
- 패키지 목록 확인1 - library(help=AID)
- 패키지 목록 확인2 - help(package=AID)
- 결과값을 파일로 저장하고 생성 - sink() 함수
- 특정 숫자나 변수 반복 - rep ( 숫자/변수 , time/each = 반복횟수)
- 구분자로 문자 나누기 - paste( 문자1, 문자2, ..., sep = '구분자' )


# 사용환경
R studio  
 - 64 bit 윈도우 환경
 - R-4.2.1
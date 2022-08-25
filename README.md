개인적으로 공부하며 느낀 자주 사용되는 명령어 정리

# 01_Basic_R

## 1) 기초 R
- 데이터 요약 - summary(df)
- 6행까지 데이터 출력 - head(df)
- 현재 생성된 변수들 출력 - ls()
- 현재 생성된 변수와 타입 모두 출력 - ls.str()
- 특정 변수 초기화 - rm( 변수 )
- 현재 설정된 변수 모두 초기화 - rm(list=ls())
- 하나의 객체만 출력 - print( 변수 )
- 여러 객체를 동시에 출력 - cat(변수1, 변수2, ... )
- 연속된 정수 표현 - (시작숫자) : (마지막숫자) / seq(from , to , by) / seq(from , to , length.out)
- 백터 원소 선택 - 벡터변수 [ index수 ]
- 변수길이 - length ( 변수 )
- 리스트를 사용하여 데이터프레임 만들기 - df <- as.data.frame(list)
- 행 이름 변경 - rownames( df ) <- c ( 'row1', 'row2' )
- 열 이름 변경 - colnames( df ) <- c ( 'column1', 'column2' )
- 데이터프레임 만들기 - data.frame(col1 = numeric(N), col2 = character(N), ...)
- 행으로 합치기 - rbind(벡터, 리스트, 데이터프레임, ...)
- 열로 합치기 - cbind( 벡터, 리스트, 데이터프레임, ... )
- 데이터프레임 병합 - merge(df1, df2, by = '공통 column')
- 데이터프레임 조회1 - df [df$col1 <= 3(조건식), c(레코드 변수;col index)]
- 데이터프레임 조회2 - df[grep('value', df$col), c(출력할 column)]
- 데이터프레임 조회3 - subset(df, select=(출력할 column), subset=(조건식))
- 데이터프레임 열 제거 - subset( df, select = '-col' )
- 데이터프레임 NA 포함하는 행 삭제 - na.omit( df )
- 자료형 데이터 형태 변환 
  1) as.charater
  2) as.complex
  3) as.integer
  4) as.numeric
  5) as.logical
- 데이터 구조 변환 - data.frame / list / matrix / vector
  1) data.frame 형태로 변경
    a) vector -> data.frame
      - 1열 데이터프레임 - as.data.frame(vec)
      - 1행 데이터프레임 - as.data.frame(rbind(vex))
    b) list -> data.frame
      - 열 형태로 데이터프레임 변환 - as.data.frame(list)
      - 행 형태로 데이터프레임 변환 - rbind(list1[[i]], list2[[2]], ... )
    c) matrix -> data.frame
      - 행렬과 같은 형태 변환 - as.data.frame(mat)
      - 참고 : 데이터프레임 축 변경 - t(df)
      
  2) list 형태로 변경
    - as.list(vec/mat/df)
    
  3) vector 형태로 변경
    a) list -> vector 
      - 벡터 형태로 변환 - unlist(list)
    b) matrix -> vector
      - 벡터 형태로 변환 - as.vector(mat)
    c) data.frame -> vector
      - 1열 벡터로 출력 - df[[i]] / df[,i]
      - 1행 벡터로 출력 - df[i,]

  4) matrix 형태로 변경
    a) vector -> matrix
      - 1열 행렬로 출력 - cbind(a)
      - 1열 행렬로 출력 - as.matrix(a)
      - 1열 행렬로 출력 - matrix(a, i, j)
      - 1행 행렬로 출력 - matrix(a, i, j)
    b) list -> matrix
      - 1열 행렬로 출력 - as.matrix(list)
      - 여러 리스트 값이 있을 때 열 형태로 행렬 출력 - as.matirx(cbind(list[[1]], list[[2]], ... ))
      - 1행 행렬로 출력 - as.matrix(rbind(list))
      - 여러 리스트 값이 있을 때 행 형태로 행렬 출력 - as.matrix(rbind(list[[1]], list[[2]]))
      - n x m 행렬로 출력 - matrix(list, n, m)
    c) data.frame -> matrix
      - as.matrix(df)

## 2) 데이터프레임 다루기
- 데이터프레임 행과 열 수 확인 - dim ( df )
- 데이터프레임 열 분할하기 - split ( df , vec )
- 데이터프레임 변수를 하나의 컬럼으로 정렬 - stack ( data.frame ( df ) )
- 데이터프레임 형태 변경 - unstack ( df , value ~ column )
- 데이터프레임에 함수 적용 - sapply ( df , func )
- 데이터프레임에 함수 적용하여 리스트 형태로 출력 - lapply ( df , func )
- 결측치 개별 확인 - is.na( 변수 )
- 결측치 총합 확인 - sum( is.na ( 변수 ) )
- 결측치 column별 확인 - colSums ( is.na ( 변수 ) )
- 결측치를 제외 명령어 - na.rm = T/TRUE
- 결측치가 있는 행 삭제 - na.omit( 변수 )
- 특정 영역에서 결측치를 포함하는 행 삭제 - df[ complete.cases( df[행,열] ), ]
- 결측치 치환 - df$col1[ is.na( df$col1 ) ]
- 각 결측치를 각 변수 별 평균값으로 일괄 대체 - sapply(df, func(x) ifelse(is.na(x), mean(x, na.rm=TRUE), x))


## 3) 기초통계
- 평균값 - mean ( 변수 )
- 합계 - sum ( 변수 )
- 중앙값 - median ( 변수 )
- 분산 - var ( 변수 )
- 표준편차1 - sd ( 변수 )
- 표준편차2 - sqrt ( var ( 변수 ) )
- 공분산 - cov ( 변수1, 변수2)
- 상관계수 - cor ( 변수1, 변수2 )


# 02_Basic_R
- 유용한 패키지 설치 - install.packages('AID', '경로')
- 패키지 목록 확인1 - library(help=AID)
- 패키지 목록 확인2 - help(package=AID)
- 변수 설정 - x <- 1
- Combine 함수 - c( )
- 벡터 - V
- 벡터에 데이터 추가 - V[length(V)+1] <- 원소 / append(벡터,원소,after = n)
- 벡터 내 값 출력 - V[i]
- 요소 - fct <- factor(  )
- 요소를 기준으로 함수 적용 - tapply(vec, factor, func)
- 리스트 - L <- list(  ,  ,  )
- 리스트 내 값 출력 - L [ [ i ] ]
- 리스트에서 특정 원소 제거 - L [ [ ' ' ] ] <- NULL
- 리스트에서 NULL 원소 제거 - 검증작업 필요
- 데이터프레임 생성 - data.frame(리스트1, 리스트2, ... )
- 데이터프레임 열값 불러오기 - df[ ' i ' ] / df [ [ ' i '] ] / df [ , 열번호]
- 데이터프레임 행값 불러오기 - df [ 행번호 ,  ]
- 데이터프레임 특정값 불러오기 - df [ 행번호 , 열번호]
- 행열 만들기 - matrix( data, 행수, 열수) / dim ( 행열변수 ) <- c ( 행수 , 열수)
- 행열 차원 출력 - dim ( 행열변수 )
- 행열 대각선값 출력 - diag( 행열변수 )
- 특정 행/열/원소값 출력 - matrix [ 행수 , 열수 ]
- 배열 만들기 - dim ( 행열변수 ) <- c ( 행수 , 열수 , 차원1, ... )
- 행렬에 함수 적용 - apply ( df , 기준 축, func )
- 난수 생성 - rnorm / runif / rpois / rexp
  1) 평균 n, 표준 편차 sd인 정규 분포를 따르는 난수 n개 생성 - rnorm(n, mean=0, sd=1)
  2) 최소값 min, 최대값 max인 균등 분포를 따르는 난수 n개 생성 - runif(n, min=0, max=1)
  3) 람다값이 lambda인 포아송 분포를 따르는 난수 n개 생성 - rpois(n, lambda)
  4) 람다가 rate인 지수 분포를 따르는 난수 n개 생성 - rexp(n, rate)
- 문자열 날짜 다루기
  1) 문자열 길이 - nchar( ' 문자열 ' )
  2) 구분자로 문자 나누기 또는 연결 - paste( 문자1, 문자2, ..., sep = '구분자' )
  3) 특정 숫자나 변수 반복 - rep ( 숫자/변수 , time/each = 반복횟수)
  4) 문자열 추출 - substr('문자열',시작,끝)
  5) 구분자로 문자열 추출 - strsplit ( 문자열 , 구분자 )
  6) 하위 문자열 대체 - sub( 이전, 변경, 문자열 )
  7) 다수의 문자열 합치기 - outer ( 문자열1, 문자열2, ... , sep = ' 구분자 ')
- 날짜
  1) 현재 날짜 출력 - Sys.Date()
  2) 날짜 객체로 출력 - as.Date()
  3) 날짜 형태 변경 - format(Sys.Date(),format = '%y/%m/%d')
  4) 현재 요일 조회 - format(Sys.Date(),'%a')
  5) 현재 월 조회 - format(Sys.Date(),'%B')
  6) 축약된 월 조회 - format(Sys.Date(),'%b')
  7) 두 자리수 월 조회 - format(Sys.Date(),'%m')
  8) 두 자리수 일 조회 - format(Sys.Date(),'%d')
  9) 네 자리수 연도 조회 - format(Sys.Date(),'%Y')
  10) 두 자리수 연도 조회 - format(Sys.Date(),'%y')
- 결과값을 파일로 저장하고 생성 - sink() 함수 / cat( ' ' , file = ' ' )
- 파일 목록 보기 - list.files()
- 테이블로 된 파일 읽기 - read.table('파일명', sep = '구분자')
- CSV 파일 저장 - write.csv(변수, '파일명.csv', row.names = F)
- CSV 파일 불러오기 - read.csv('파일명', header = T/F)
- R 파일 저장 - save(변수, file = '파일명.Rdata')
- R 파일 불러오기 -  load('경로/.../파일명') / source('경로/.../파일명')
- 웹에서 데이터 읽어오기 - read.csv('http://www. ... .csv') / read.table(' 주소 ')
- library(XML) / url <- ' 주소 ' / t <- readHTMLTable(url)
- R에 내장된 데이터 불러오기 - data ( ' ' )
- for문 활용
- 함수 사용 예시 - function(x,y)


# 03_plyr_R
- ddply ( df, 기준column, func, group data)
  1) transfrom()
  2) mutate()
  3) summarise() / summarize()
  4) subset()



# 사용환경
R studio  
 - 64 bit 윈도우 환경
 - R-4.2.1
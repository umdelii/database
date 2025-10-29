-- SQL
-- 1. 데이터 정의 언어(DDL : Data Define Language)
-- 2. 데이터 조작 언어(DML : Data Manipulation Language) : SELECT(조회), INSERT(입력), UPDATE(수정), DELETE(삭제) => CRUD 작업이라고 부름 
-- 3. 데이터 제어 언어(DCL : Data Control Language)

/* DML : INSERT, UPDATE, DELETE => 데이터 변경이 일어나는 작업
 * 트랜잭션 : 하나의 단위로 데이터 처리 (여러개의 작업을 한 단위로 묶음, 작업 중 하나가 오류가 나면 첫번째단계로 롤백)
 *   명령어 : ROLLBACK; 되돌리기
 * 			  COMMIT; 데이터베이스 반영, 못돌려
 */

/* 세션 : 데이터베이스 접속을 시작으로 작업을 수행한 후 접속을 종료하기까지의 전체 기간
 * 	여러 군데에서 접근 가능함 BUT, 수정 중인 경우에는 동시에 접근 및 수정 불가*/

-- sql 구문은 대소문자 구별 x
-- 단, 비밀번호는 구분함

-- 조회 (select)
-- SELECT 컬럼명 -> ⑤
-- FROM 테이블명 -> ①
-- WHERE 조건절 -> ②
-- GROUP BY -> ③
-- HAVING -> ④
-- ORDER BY 컬럼명 DESC or ASC; -> ⑥

-- 조회 기본구문
--SELECT 보고싶은열이름... FROM 테이블명;
--SELECT 보고싶은열이름... FROM 테이블명 WHERE 조건 나열;

-- emp(사원) 테이블
-- Columns 
-- empno(사번) : number(4,0) => 숫자, 4자리, 소수점 아래 자릿수는 0 
-- ename(이름) : varchar2(10) => 문자, 10자리
-- job(직무) : varchar2(9) => 문자, 9자리
-- mgr(매니저-상사 사원번호)
-- hiredate(입사일) : date => 날짜 타입
-- sal(급여) : number(7,2) => 숫자, 7자리, 소수점은 2자리까지
-- comm(수당) : 위와 동일
-- deptno(부서번호)

-- detp(부서) 테이블
-- Columns
-- deptno(부서번호)
-- dname(부서이름)
-- loc(부서위치)

-- 1) 전체 사원 조회 - 사원의 모든 정보 추출(전체 열)
SELECT * FROM EMP e ;
-- 2) 전체 사원 조회 - 특정 정보만 추출(특정 열) ex)이름
SELECT ename FROM EMP e ;
-- 3) 전체 사원 조회 - 사번, 사원명, 부서번호만 추출
SELECT empno,ename,deptno FROM EMP e ;
-- 4) 전체 사원 조회 - 부서번호만 조회
SELECT  deptno FROM EMP e ;
-- 5) 전체 사원 조회 - 부서번호만 조회(단, 중복데이터 제외)
SELECT DISTINCT deptno FROM  EMP e ;
-- 6) 테이블 열에 별칭 붙이기 (alais)
SELECT ename "사원명" FROM EMP e ;
SELECT ename 사원명 FROM EMP e ;
SELECT ename AS "사원명" FROM EMP e ;
-- * ""를 꼭 붙여햐 할 경우
-- SELECT ename AS 사원 이름 FROM EMP e ; -> 별칭에 공백이 들어갈 경우

-- 7) 연봉 구하기 (sal*12+comm)
SELECT empno, sal*12+comm AS 연봉 FROM EMP e ;

-- 정렬하기(오름차순(default값), 내림차순) : ORDER BY 	정렬기준열이름... ASC(오름차순) OR DESC(내림차순)
-- sal의 오름차순 정리
SELECT * FROM EMP e ORDER BY sal ASC;
-- 내림차순 정리
SELECT * FROM EMP e ORDER BY sal DESC;
-- 내림차순인데 급여가 같을 경우 이름의 오름차순 (2가지의 조건)
SELECT * FROM EMP e ORDER BY sal DESC,ename ASC;

-- exam
-- empno : employee_no
-- ename : employee_name
-- mgr : manager
-- sal : salary
-- comm : commission
-- deptno : department_no
-- 별칭 지정, 부서번호를 기준으로 내림차순 정렬, 단 부서번호 일치 시 이름 오름차순 구문
SELECT
	empno "employee_no",
	ename "employee_name",
	mgr "manager",
	sal "salary",
	comm "commission",
	deptno "department_no"
FROM
	EMP e
ORDER BY
	"department_no" DESC ,
	"employee_name" ASC; 

-- where 조건 추가
-- 전체 사원 조회, 부서번호가 30번인 사원정보 조회
-- = (같다_)/문자열 ''/and/or
SELECT * FROM EMP e WHERE e.DEPTNO = 30;
-- 사번이 7698인 사원정보 조회
SELECT * FROM EMP e WHERE e.EMPNO = 7698;
-- 부서번호가 30번이고 사원직책이 salesman 인 사원정보 조회
SELECT * FROM EMP e WHERE e.EMPNO =30 AND e.JOB = 'SALESMAN'; -- 문자열 ''로 표기 그리고 데이터(값)은 대소문자 구분
-- 부서번호가 30이거나 사원직책이 analyst인 사원정보 조회
SELECT * FROM EMP e WHERE e.DEPTNO=30 OR e.JOB ='ANALYST';

/* CREATE : 테이블 생성
 *  CREATE TABLE 테이블명 AS SELECT * FROM 따올테이블;
 *  CREATE TABLE 테이블명 AS SELECT * FROM 따올테이블 1<>1; -> 구조만 따오기(열만 데이터X)
 */
/* INSERT : 테이블에 데이터 추가
 *  INSERT INTO 테이블명(열이름1,열이름2...) VALUES(값1,값2...)
 *  열이름 생략 가능 단, 모든 열의 데이터가 지정되어야 함
 *  NULL을 직접 입력하거나 열을 제외해서 NULL 삽입가능하나 PROPERTY의 NOT NULL에 체크가 있다면 NULL 삽입 불가
 */

/* UPDATE : 테이블의 데이터 수정
 *  UPDATE 테이블명 SET 열이름=수정값, 열이름2=수정값... WHERE 수정할조건
 */

/* DELETE : 데이터 삭제
 * 	DELETE FROM 테이블명 WHERE 삭제조건
 *  DELETE 테이블명 WHERE 삭제조건
 */




/* DDL : 데이터 정의어 
 *  객체를 생성(CREATE), 변경(ALTER), 삭제(DROP)하는 명령어
 *  1) 테이블 생성
 *  	CREATE TABLE % AS SELECT * FROM %;
 *  	CREATE TABLE % AS SELECT * FROM % WHERE 1<>1;
 *  	기본 구조 - CREATE TABLE 테이블명(열이름1 타입(), 열이름2 타입(), 열이름3 타입()...);
 *  	
 *  	타입 : 
 *  		문자 : VARCHAR2(가변크기), NVARCHAR2(BYTE가 아닌 진짜LENGTH길이), CHAR(고정크기), NCHAR 등
 *  	 	숫자 : NUMBER(7,2) - 소수 둘째 자리 포함 7자리 숫자 지정 가능
 *  		날짜 : DATE
 *  	테이블명 : 문자로 시작, 특수문자(_, $, #), 숫자(시작은 불가) 가능 / 예약어(SELECT, ORDER, FROM 등) 사용 불가
 *  	열이름 : 문자로 시작, 특수문자(_, $, #), 숫자(시작은 불가) 가능 / 예약어(SELECT, ORDER, FROM 등) 사용 불가
 *  
 *  2) 테이블 변경(ALTER)
 *  	1. 컬럼 추가 : ADD
 *  	2. 열 이름 변경 : RENAME COLUMN % TO %
 *  	3. 열 자료형 변경 : MODIFY
 *  	4. 컬럼 삭제 : DROP COLUMN
 * 
 *  3) 테이블 이름 변경 - RENAME 변경전이름 TO 바꿀이름
 * 	4) 테이블 삭제 - DROP TABLE 이름
 */


-- 이하 객체
/* 인덱스 : 테이블 검색 성능 향상
 * SQL 튜닝 관련된 개념
 *  인덱스 사용 여부
 * 	 1) 테이블 풀 스캔 : 처음부터 끝까지 검색
 *   2) 인덱스 스캔 : 인덱스 범위 내 검색
 * 
 *  인덱스 생성
 *  	CREATE INDEX 인덱스명 ON 테이블명(컬럼명)
 *  인덱스 삭제
 *  	DROP INDEX 인덱스명
 */



/* 뷰 : 가상테이블
 *  	하나 이상의 테이블을 조회하는 SELECT문을 저장한 객체
 *  	CREATE VIEW 뷰이름(열이름1, 열이름2...) AS (저장할 SELECT문) WITH CHECK OPTION 제약조건 WITH READ ONLY 제약조건
 * 		DROP VIEW 뷰이름
 * 
 * 왜 씀? 관리자 입장에서 EMP에 접근할 수 있는 권한을 주지 않고 VIEW만 접근할 수 있는 권한을 줌
 * 		원본테이블에 민감한 데이터가 있어 보안적인 문제로 인해...
 * 		AND 편의성 : SQL 구문의 복잡성 완화 
 * 
 *  VIEW 테이블에 데이터를 INSERT하면 원본 테이블의 데이터도 바뀜.
 */


/* 시퀀스 (MYSQL LIMIT)
 *  오라클DB에서 특정 규칙에 따른 연속 숫자를 생성하는 객체
 *  
 *  CREATE SEQUENCE 시퀀스명;
 * 
 *  CREATE SEQUENCE 시퀀스명
 *  INCREMENT BY N (기본값 1) -> N씩 증가
 *  STRAT WITH N (기본값 1) -> 기본이 N
 *  MAXVALUE N | NOMAXVALUE -> 최고값
 *  MINVALUE N | NOMINVALUE 
 *  CYCLE | NOCYCLE -> 반복 해 안해
 *  CACHE N | NOCACHE
 * 
 *  SEQ_이름_SEQUENCE.NEXTVAL로 불러오면됨
 *  SEQ_이름_SEQUENCE.CURRVAL : 현재 시퀀스 값 조회
 */

/* 동의어 : SYNONYM (별칭)
 *  테이블, 뷰, 시퀀스 등 객체 이름 대신 사용할 수 있는 다른 이름 부여 EX)객체 이름이 너무 길어...ㅠ
 *  
 *  CREATE SYNONYM 객체의별칭지정 FOR 객체;
 */
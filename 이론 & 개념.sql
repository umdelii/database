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





















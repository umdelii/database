-- 연산자
-- 사칙연산, 등.부등호, and, or, 이하 같지 않다(!=, <>, ^=)
-- in, between A and B(~이상 ~이하)
-- like

-- 연봉이 36000인 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	sal * 12 = 36000;

-- 급여가 3000 초과인 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	sal>3000;

-- 이름이 'F' 이후의 문자로 시작하는 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	e.ENAME >= 'F';

-- 직무가 manager, salesman, clerk 인 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	e.JOB = 'MANAGER'
	OR e.JOB = 'SALESMAN'
	OR E.JOB = 'CLERK';
-- 직무가 manager, salesman, clerk 인 사원 조회 (다른 연산자 사용 IN)
SELECT
	*
FROM
	EMP e
WHERE
	e.JOB IN ('MANAGER', 'SALESMAN', 'CLERK')
	
-- 직무가 manager, salesman, clerk가 아닌 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	e.JOB NOT IN ('MANAGER', 'SALESMAN', 'CLERK')

-- sal 이 3000이 아닌 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	e.SAL != 3000;

-- 부서번호가 10이거나 20번인 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	e.DEPTNO = 10
	OR e.DEPTNO = 20;
-- or
SELECT
	*
	FROM EMP e
WHERE
	e.DEPTNO IN(10, 20);

-- between A and B
-- 급여가 2000이상 3000이하 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	e.SAL BETWEEN 2000 AND 3000;

-- 급여가 2000이상 3000이하가 아닌 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	e.SAL NOT BETWEEN 2000 AND 3000;

-- LIKE + 와일드카드(%, _)
-- % : 문자열의 길이와 상관없이(문자가 없는 경우도 포함) 모든 문자 데이터
-- _ : 한 개의 문자데이터
-- 사원명이 S로 시작하는 사원들의 정보
SELECT
	*
FROM
	EMP e
WHERE
	e.ENAME LIKE 'S%';
	
-- 사원명의 두번째 글자가 L인 사원들의 정보 조회
SELECT
	*
FROM
	EMP e
WHERE
	e.ENAME LIKE '_L%';

-- 사원이름에 AM이 포함된 사원들의 정보 조회
SELECT
	*
FROM
	EMP e
WHERE
	e.ENAME LIKE '%AM%';

-- 사원이름에 AM이 포함되지 않는 사원들의 정보 조회
SELECT
	*
FROM
	EMP e
WHERE
	e.ENAME NOT LIKE '%AM%';


-- NULL 값
-- NULL 값 비교 시에는 = 이나 != 사용불가
-- is NULL로 NULL 값 추출 가능

-- 집합연산자
-- 합집합(UNION, UNION ALL), 교집합(INTERSECT), 차집합(MINUS)
-- DEPTNO = 10 UNION DETPNO = 20
-- 합집합 : SELECT의 열의 개수가 일치해야함 (ex.e.EMPNO와 * 불가)
-- UNION : 중복 제거
SELECT
	e.EMPNO ,e.ENAME ,e.SAL 
FROM
	EMP e
WHERE
	e.DEPTNO = 10
UNION
SELECT
	*
FROM
	EMP e
WHERE
	e.DEPTNO = 20;

-- UNION ALL : 중복값 포함해서 나옴
SELECT
	e.EMPNO ,
	e.ENAME ,
	e.SAL
FROM
	EMP e
WHERE
	e.DEPTNO = 10
UNION
SELECT
	e.EMPNO  ,
	e.ENAME ,
	e.SAL
FROM
	EMP e
WHERE
	e.DEPTNO = 10;

-- 차집합
-- MINUS
SELECT
	e.EMPNO ,
	e.ENAME ,
	e.SAL
FROM
	EMP e
MINUS
SELECT
	e.EMPNO ,
	e.ENAME ,
	e.SAL
FROM
	EMP e
WHERE e.DEPTNO = 10;

-- 교집합
-- INTERSECT
SELECT
	e.EMPNO ,
	e.ENAME ,
	e.SAL
FROM
	EMP e
INTERSECT 
SELECT
	e.EMPNO  ,
	e.ENAME ,
	e.SAL
FROM
	EMP e
WHERE
	e.DEPTNO = 10;

-- [실습]
-- 1. 사원 이름이 S로 끝나는 사원 데이터 조회
SELECT
	*
FROM
	EMP e
WHERE
	e.ENAME LIKE '%S';

-- 2. 30번 부서에 근무하고 있는 사원 중에 JOB이 SALESMAN인 사원의 사원번호, 이름, 직책, 급여, 부서번호 조회
SELECT
	e.EMPNO ,
	e.ENAME ,
	e.JOB ,
	e.SAL ,
	e.DEPTNO
FROM
	EMP e
WHERE
	e.DEPTNO = 30
	AND e.JOB = 'SALESMAN';

-- 3. 20번, 30번 부서에 근무하고 있는 사원 중 급여가 2000 초과인 사원을 다음 두방식의 SELECT 문을 사용하여 
-- 사원번호 , 이름, 직책, 급여, 부서 번호 출력
-- 집합 연산자를 사용하는 방식 
-- 집합 연산자를 사용하지 않는 방식

-- 1번 방식
SELECT
	e.EMPNO ,
	e.ENAME ,
	e.JOB ,
	e.SAL ,
	e.DEPTNO
FROM
	EMP e
WHERE
	e.DEPTNO = 20
UNION
SELECT
	e.EMPNO ,
	e.ENAME ,
	e.JOB ,
	e.SAL ,
	e.DEPTNO
FROM
	EMP e
WHERE
	e.DEPTNO = 30
INTERSECT 
SELECT
	e.EMPNO ,
	e.ENAME ,
	e.JOB ,
	e.SAL ,
	e.DEPTNO
FROM
	EMP e
WHERE
	e.SAL > 2000;

-- 2번방식
SELECT
	e.EMPNO ,
	e.ENAME ,
	e.JOB ,
	e.SAL ,
	e.DEPTNO
FROM
	EMP e
WHERE
	(e.DEPTNO = 20
		OR e.DEPTNO = 30)
	AND e.SAL > 2000;

-- 4. NOT BETWEEN A AND B 연산자를 사용하지 않고 급여열이 2000이상 3000이하 범위 이외의 값을 가진 데이터 조회
SELECT
	*
FROM
	EMP e
WHERE
	e.SAL < 2000
	OR e.SAL > 3000; 

-- 5. 사원 이름에 E가 포함된 30번 부서의 사원 중 급여가 1000 ~ 2000 사이가 아닌 사원명, 사번, 급여, 부서 번호 조회
SELECT
	e.ENAME ,
	e.EMPNO ,
	e.SAL ,
	e.DEPTNO
FROM
	EMP e
WHERE
	e.ENAME LIKE '%E%'
	AND e.DEPTNO = 30
MINUS
SELECT
	e.ENAME ,
	e.EMPNO,
	e.SAL ,
	e.DEPTNO
FROM
	EMP e
WHERE
	e.SAL BETWEEN 1000 AND 2000; 

-- 6. 추가 수당이 없고 상급자가 있고 직책이 MANAGER, CLERK 인 사원 중에서 사원이름의 두번째 글자가 L이 아닌 
-- 사원의 정보를 조회
SELECT
	*
FROM
	EMP e
WHERE
	e.COMM IS NULL
	AND e.MGR IS NOT NULL
	AND (e.JOB = 'MANAGER'
		OR e.JOB = 'CLERK')
INTERSECT 
SELECT
	*
FROM
	EMP e
WHERE
	e.ENAME NOT LIKE '_L%';

-- 함수
-- 1. 문자함수
-- UPPER(문자열) : 대문자로 변환
-- LOWER(문자열) : 소문자로 변환
-- INITCAP(문자열) : 첫 글자는 대문자, 나머지는 소문자로 변환
-- LENGTH(문자열) : 문자열을 길이로 치환
-- LENGTHB(문자열) : 문자열을 바이트 길이로 치환
-- SUBSTR(문자열,시작위치,추출길이) : 문자열 부분 추출
-- INSTR(문자열,위치를 찾으려는 문자,위치찾기시작위치,찾으려는문자의 몇번째 순서) : 문자열 안에서 특정 문자 위치 찾기
-- REPLACE(문자열,찾는문자,바꿀문자) : 문자 바꾸기
-- CONCAT(문자열1,문자열2) : 두 문자열 합치기
-- TRIM(삭제옵션,삭제할문자 FROM 원본문자열) : 문자열 내 특정 문자 삭제
--    1) 삭제옵션 : LEADING OR TRAILING OR BOTH
-- LTRIM(원본문자열,삭제할문자열) : 왼쪽 문자 지우기
-- RTRIM(원본문자열,삭제할문자열) : 오른쪽 문자 지우기

SELECT
	e.ENAME,
	UPPER(e.ENAME),
	LOWER(e.ENAME),
	INITCAP(e.ENAME)
FROM
	EMP e;

-- 영문자는 1BYTE이므로 값의 변화는 없음, BUT 한글의 경우 한 글자에 3BYTE(XE21 기준)이므로 길이가 달라짐
-- 원래는(대부분) 2BYTE인데 앱에 따라 버전에 따라 다 다름 
SELECT
	e.ENAME ,
	LENGTH(e.ENAME),
	LENGTHB(e.ENAME)
FROM
	EMP e ;

SELECT
	LENGTH('한글'),
	LENGTHB('한글')
FROM
	DUAL; -- DUAL(SYS 소유의 더미테이블, 함수값 보려고 있는 임의의 테이블)

-- 사원명 길이가 5이상인 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	LENGTH(e.ENAME) >= 5;

-- 직책명이 6자 이상인 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	LENGTH(e.JOB) >= 6;

-- SUBSTR
SELECT
	e.JOB,
	SUBSTR(e.JOB, 1, 2),
	SUBSTR(e.JOB, 3, 2),
	SUBSTR(e.JOB, 5)
FROM
	EMP e;

-- EMP 테이블에서 사원명을 세번째 글자부터 끝까지 출력
SELECT
	SUBSTR(e.ENAME, 3)
FROM
	EMP e ;

-- 시작위치 음수
SELECT
	e.JOB,
	SUBSTR(e.JOB, -LENGTH(e.JOB)),
	SUBSTR(e.JOB, -LENGTH(e.JOB), 2),
	SUBSTR(e.JOB, -3)
FROM
	EMP e;

-- INSTR
SELECT
	INSTR('HELLO, ORACLE!', 'L') AS 첫번째,
	INSTR('HELLO, ORACLE!', 'L', 5) AS 두번째,
	INSTR('HELLO, ORACLE!', 'L', 2, 2) AS 세번째 -- 두번째 문자부터 시작해서 두번째 L의 위치는?
FROM
	DUAL;

-- 사원명에 특정 문자열이 포함된 사원인지 확인 
-- 1) LIKE, 2) INSTR()
SELECT
	*
FROM
	EMP e
WHERE
	INSTR(LOWER(e.ENAME), 's') > 0;

-- REPLACE 
-- 010-4526-7858 => 010 4526 7858로 바꾸고 싶어
SELECT
	'010-4526-7858' AS "BEFORE",
	REPLACE('010-4526-7858', '-', ' ') AS "REPLACE1",
	REPLACE('010-4526-7858', '-', '') AS "REPLACE2"
FROM
	DUAL;

-- CONCAT - 인자는 무조건 2개
-- CONCAT() or || <- CONCAT()이랑 똑같은 역할
-- EMPNO, ENAME 합치기
SELECT
	CONCAT(e.EMPNO , e.ENAME),
	CONCAT(e.EMPNO, CONCAT(' : ', e.ENAME)),
	e.EMPNO || ' : ' || e.ENAME
FROM
	EMP e;

-- TRIM
SELECT
	'[' || TRIM(' __Oracle__ ') || ']' AS "TRIM",
	'[' || TRIM(LEADING FROM ' __Oracle__ ') || ']' AS "TRIM_LEADING",
	'[' || TRIM(TRAILING FROM ' __Oracle__ ') || ']' AS "TRIM_TRAILING",
	'[' || TRIM(BOTH FROM ' __Oracle__ ') || ']' AS "TRIM__BOTH"
FROM
	DUAL;

SELECT
	'[' || TRIM(' __Oracle__ ') || ']' AS "TRIM",
	'[' || LTRIM(' __Oracle__ ') || ']' AS "LTRIM1",
	'[' || LTRIM('<_Oracle_>', '_<') || ']' AS "LTRIM2",
	'[' || RTRIM(' __Oracle__ ') || ']' AS "RTRIM1",
	'[' || RTRIM('<_Oracle_>', '>_') || ']' AS "RTRIM2",
	'[' || TRIM(BOTH FROM ' __Oracle__ ') || ']' AS "TRIM__BOTH"
FROM
	DUAL;

-- 2. 숫자함수
-- ROUND(숫자, 위치) : 해당위치에서 반올림
-- TRUNC(숫자, 위치) : 해당위치에서 버림
-- CEIL(숫자) : 지정된 숫자보다 큰 정수 중 가장 작은 정수 반환
-- FLOOR(숫자) : 지정된 숫자보다 작은 정수 중 가장 큰 정수 반환
-- MOD(숫자, 나눌숫자) : 지정된 숫자를 나눈 나머지 반환 

-- ROUND()
SELECT
	ROUND(1234.5678) AS ROUND,
	ROUND(1234.5678, 0) AS ROUND0,
	ROUND(1234.5678, 1) AS ROUND1,
	ROUND(1234.5678, 2) AS ROUND2,
	ROUND(1234.5678,-1) AS ROUND_MINUS1,
	ROUND(1234.5678,-2) AS ROUND_MINUS2
FROM
	DUAL;

-- TRUNC()
SELECT
	TRUNC(1234.5678) AS TRUNC,
	TRUNC(1234.5678, 0) AS TRUNC0,
	TRUNC(1234.5678, 1) AS TRUNC1,
	TRUNC(1234.5678, 2) AS TRUNC2,
	TRUNC(1234.5678,-1) AS TRUNC_MINUS1,
	TRUNC(1234.5678,-2) AS TRUNC_MINUS2
FROM
	DUAL;

-- CEIL(), FLOOR()
SELECT
	CEIL(3.14),
	FLOOR(3.14),
	CEIL(-3.14),
	FLOOR(-3.14)
FROM
	DUAL;

-- MOD()
SELECT
	MOD(15, 6),
	MOD(10, 2),
	MOD(11, 2)
FROM
	DUAL;

-- 3. 날짜 함수
-- 날짜 데이터 연산 가능 
-- 날짜 + 숫자 : 이후 날짜 반환 (-도 가능)
-- 날짜 - 날짜 : 두 날짜 간 일수 차이 반환
-- 날짜 + 날짜는 연산 불가
-- ADD_MONTHS(날짜, 더할개월수) : 개월 더하기
-- MONTHS_BETWEEN(날짜1,날짜2) : 날짜2를 기준으로 날짜1은 얼마나 지났는지
-- NEXT_DAY(날짜,요일) : 날짜를 기준으로 돌아오는 요일의 날짜 반환
-- LAST_DAY(날짜) : 날짜를 기준으로 해당 달의 마지막 날짜 반환
-- SYSDATE(주로 사용), CURRENT_DATE, CURRENT_TIMESTAMP : ORACLE에서 시스템 날짜 출력

SELECT
	SYSDATE,
	SYSDATE + 1,
	SYSDATE-1,
	CURRENT_DATE,
	CURRENT_TIMESTAMP
FROM
	DUAL;

-- ADD_MONTHS()
SELECT
	SYSDATE,
	ADD_MONTHS(SYSDATE, 3)
FROM
	DUAL;

-- 입사 50주년이 되는 날짜 구하기
SELECT
	ADD_MONTHS(e.HIREDATE , 600),
	e.HIREDATE
FROM
	EMP e ;

-- 입사한지 40년이 넘은 사원을 조회
SELECT
	*
FROM
	EMP e
WHERE
	ADD_MONTHS(e.HIREDATE, 480) < SYSDATE;

-- MONTHS_BETWEEN
SELECT
	e.EMPNO ,
	e.HIREDATE ,
	SYSDATE,
	MONTHS_BETWEEN(e.HIREDATE , SYSDATE) AS MONTH1 ,
	MONTHS_BETWEEN(SYSDATE, e.HIREDATE ) AS MONTH2,
	TRUNC(MONTHS_BETWEEN(SYSDATE, e.HIREDATE )) AS MONTH3
FROM
	EMP e
	
-- NEXT_DAY()
SELECT
	SYSDATE,
	LAST_DAY(SYSDATE),
	NEXT_DAY(SYSDATE, '월요일')
FROM
	DUAL;

-- 4. 형변환 함수
-- TO_CHAR(데이터,문자형식) : 날짜, 숫자 데이터를 문자로 변환★
-- TO_NUMBER(문자열,숫자형식) : 문자데이터를 숫자로 변환
-- TO_DATE() : 문자데이터를 날짜로 치환

-- TO_CHAR()
SELECT
	SYSDATE,
	TO_CHAR(SYSDATE, 'YYYY-MM-DD')
FROM
	DUAL;

--
SELECT
	SYSDATE,
	TO_CHAR(SYSDATE, 'MM'),
	TO_CHAR(SYSDATE, 'MON'),
	TO_CHAR(SYSDATE, 'MONTH'),
	TO_CHAR(SYSDATE, 'DD'),
	TO_CHAR(SYSDATE, 'DY'),
	TO_CHAR(SYSDATE, 'DAY')
FROM
	DUAL;

-- 24시간 AM PM표시
SELECT
	SYSDATE,
	TO_CHAR(SYSDATE, 'HH24:MI:SS'),
	TO_CHAR(SYSDATE, 'HH12:MI:SS AM'),
	TO_CHAR(SYSDATE, 'HH:MI:SS P.M.')
FROM
	DUAL;

--
SELECT
	e.EMPNO ,
	e.ENAME ,
	e.EMPNO + '500' --자동형변환 
FROM
	EMP e
WHERE
	e.ENAME = 'SMITH';

-- L : 지역화폐단위
SELECT
	e.SAL,
	TO_CHAR(e.SAL, '$999,999'),
	TO_CHAR(e.SAL, 'L999,999')
FROM
	EMP e;

-- TO_NUMBER
SELECT
	1300 - '1500',
	'1300' + 1500,
	TO_NUMBER('1,300','999,999') + 1500
FROM
	DUAL;

-- TO_DATE
SELECT
	TO_DATE('20261027', 'YYYY-MM-DD'),
	TO_DATE('20251027', 'YYYY/MM/DD')
FROM
	DUAL;

SELECT
	TO_DATE('20251027') - TO_DATE('20250923')
FROM
	DUAL;

-- NULL 처리 함수
-- 1. NVL(NULL에 해당하는 열, 반환할데이터) : NULL인 경우만 해당 데이터로 반환
-- 2. NVL2(NULL에 해당하는 열,NULL이 아닐 때 반환할 데이터, 반환할데이터)
-- NULL + NULL = NULL
-- 숫자 + NULL = NULL
SELECT
	e.EMPNO ,
	e.ENAME ,
	e.SAL ,
	e.COMM ,
	NVL2(e.COMM, 'O', 'X'),
	NVL2(e.COMM , e.SAL * 12 + e.COMM , e.SAL * 12)
FROM
	EMP e ;

-- 상황에 따라 다른 데이터를 반환하는 함수 : DECODE(), CASE()
-- DECODE(검사 대상 열, 
--        [조건1], [조건1과 일치할 경우 반환할 데이터],
--        [조건2], [조건1과 일치할 경우 반환할 데이터],
--         ......,
--        [위 조건들과 일치하지 않을 경우 반환할 데이터])
-- CASE 검사대상열 
--   WHEN [조건1] THEN [조건1과 일치할 경우 반환할 데이터]
--   WHEN [조건2] THEN [조건2과 일치할 경우 반환할 데이터]
--   ...
--   ELSE [위 조건들과 일치하지 않을 경우 반환할 데이터]
--   END
-- 직책이 MANAGER인 사원은 급여의 10%, SALESMAN인 경우 급여의 5%, ANALYST인 사원은 그대로, 나머지는 3%만큼 인상된 급여 구하기
SELECT
	e.EMPNO ,
	e.ENAME ,
	e.JOB ,
	e.SAL,
	DECODE(e.JOB , 
	'MANAGER', e.SAL * 1.1, 
	'SALESMAN', e.SAL * 1.05, 
	'ANALYST', e.SAL , 
	e.SAL * 1.03) AS "인상 급여"
FROM
	EMP e;

SELECT
	e.EMPNO ,
	e.ENAME ,
	e.JOB ,
	e.SAL,
	CASE
		e.JOB 
	WHEN 'MANAGER' THEN e.SAL * 1.1
		WHEN 'SALESMAN' THEN e.SAL * 1.05
		WHEN 'ANALYST' THEN e.SAL
		ELSE e.SAL * 1.03
	END AS "인상 급여"
FROM
	EMP e;

-- CASE END의 장점 : 각 조건에 사용하는 데이터가 관련없어도 됨, = 외에 다양한 조건 사용가능
-- e.COMM이 NULL인 경우에는 해당없음, 0인 경우에는 수당없음, 0보다 큰 경우에는 수당 : X
SELECT
	e.EMPNO ,
	e.ENAME ,
	e.SAL ,
	CASE
		WHEN e.COMM IS NULL THEN '해당없음'
		WHEN e.COMM = 0 THEN '수당없음'
		WHEN e.COMM > 0 THEN '수당 : ' || e.COMM
	END AS COMM_TEXT
FROM
		EMP e;

-- 문제1
-- EMP 테이블에서 사원의 월 평균 근무일수는 21.5일이다.
-- 하루 근무시간을 8시간으로 보았을 때, 사원의 하루급여(DAY_PAY), 시급(TIME_PAY)를 계산하여 결과를 출력
-- 하루 급여는 소수 셋째 자리에서 버리고, 시급은 소수 둘째 자리에서 반올림
SELECT
	e.EMPNO, 
	e.ENAME,
	e.SAL,
	TRUNC(e.SAL / 21.5, 2) AS DAY_PAY,
	ROUND(e.SAL / 21.5 / 8, 1) AS TIME_PAY
FROM
	EMP e;

-- 문제2
-- EMP 테이블에서 사원은 입사일을 기준으로 3개월이 지난 후 첫 월요일에 정직원이 된다. 
-- 사원이 정직원이 되는 날짜(R_JOB)을 YYYY-MM-DD 형식으로 출력. 단, 추가수당이 없는 사원의 추가 수당은 N/A로 출력
-- EMPNO, ENAME, HIREDATE, R_JOB, COMM 출력
SELECT
	e.EMPNO ,
	e.ENAME ,
	e.HIREDATE ,
	TO_CHAR(NEXT_DAY(ADD_MONTHS(e.HIREDATE, 3), '월요일'), 'YYYY-MM-DD') AS R_JOB,
	NVL(TO_CHAR(e.COMM),'N/A') 
FROM
	EMP e;
	
-- 문제3
-- EMP 테이블의 모든 사원을 대상으로 직속 상관의 사원번호(MGR)을 아래의 조건을 기준으로 변환해서 CHG_MGR열에 출력
-- 조건
-- 직속 상관의 번호가 없는 경우 0000
-- 직속 상관의 사원번호 앞 두자리가 75일경우 5555
-- 직속 상관의 사원번호 앞 두자리가 76일경우 6666
-- 직속 상관의 사원번호 앞 두자리가 77일경우 7777
-- 직속 상관의 사원번호 앞 두자리가 78일경우 8888
-- 그 외 직속 상관 사원 번호일 경우 : 본래 직속 상관의 사원번호 출력
SELECT
	e.EMPNO ,
	e.ENAME ,
	e.MGR ,
	CASE
		SUBSTR(TO_CHAR(NVL(e.MGR, 0)), 1, 2)
		WHEN '0' THEN '0000'
		WHEN '75' THEN '5555'
		WHEN '76' THEN '6666'
		WHEN '77' THEN '7777'
		WHEN '78' THEN '8888'
		ELSE TO_CHAR(e.MGR)
	END AS CHG_MGR
FROM
	EMP e;

SELECT
	e.EMPNO ,
	e.ENAME ,
	e.MGR ,
	DECODE(SUBSTR(TO_CHAR(e.MGR), 1, 2), 
	NULL, '0000', 
	'75', '5555', 
	'76', '6666', 
	'77', '7777', 
	'78', '8888', 
	TO_CHAR(e.MGR)) AS CHG_MGR
FROM
	EMP e ;

SELECT
	CASE
		WHEN e.MGR IS NULL THEN '0000'
		WHEN e.MGR LIKE '75%' THEN '5555'
		WHEN e.MGR LIKE '76%' THEN '6666'
		WHEN e.MGR LIKE '77%' THEN '7777'
		WHEN e.MGR LIKE '78%' THEN '8888'
		ELSE TO_CHAR(e.MGR)
	END AS CHG_MGR
FROM
	EMP e; 

-- 다중행 함수
-- SUM(), AVG(), COUNT(), MAX(), MIN() ...

-- 급여의 총합, 평균, MAX, MIN
SELECT
	SUM(e.SAL),
	AVG(e.SAL),
	MAX(e.SAL),
	MIN(e.SAL),
	COUNT(e.SAL),
	COUNT(*)
FROM
	EMP e; 

-- 단일 그룹의 그룹 함수가 아닙니다 ERROR
--SELECT
--	SUM(e.SAL),
--	e.ENAME
--FROM
--	EMP e; 

-- 10번 부서의 급여총계, 평균 구하기
SELECT
	SUM(e.SAL),
	AVG(e.SAL)
FROM
	EMP e
WHERE
	e.DEPTNO = 10;

-- 20번 부서에서 입사일이 가장 오래된 사원의 입사일
SELECT
	MIN(e.HIREDATE)
FROM
	EMP e
WHERE
	e.DEPTNO = 20;

-- GROUP BY
-- 부서별 평균 급여 조회
-- 다중행 함수 옆에 올 수 있는 컬럼은 GROUP BY에 사용한 컬럼만 가능
SELECT
	e.DEPTNO ,
	AVG(e.SAL)
FROM
	EMP e
GROUP BY
	e.DEPTNO; 
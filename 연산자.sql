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

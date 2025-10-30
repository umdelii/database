-- c##을 사용안하도록 설정
-- 오라클버전이 업데이트되면서 사용자 아이디 앞에 c##을 붙이도록 설정되어 있음
-- hr이름의 사용자 생성 => c##hr
ALTER SESSION SET "_oracle_script"=TRUE;

--@C:\Users\soldesk\Downloads\db-sample-schemas-main\db-sample-schemas-main\human_resources\hr_install.SQL
--
--@C:\app\soldesk\product\21c\dbhomeXE\rdbms\admin\scott.sql
--
--sys AS sysdba

-- 권한 부여 : GRANT
GRANT CREATE VIEW TO SCOTT;

GRANT CREATE SYNONYM TO SCOTT;
GRANT CREATE PUBLIC SYNONYM TO SCOTT;

/* 사용자  
 *  데이터베이스에 접속하여 데이터를 관리하는 계정
 * 
 * 오라클 DB
 *  테이블, 뷰, 인덱스, 시퀀스 ... => 업무별로 사용자 생성 후 객체를 생성할 수 있는 권한 부여
 * 
 * 사용자 생성 기본구조
 *  CREATE USER 사용자이름 IDENTIFIED BY 비밀번호;
 * 
 * 권한 부여 GRANT
 * 개별 권한이 많으니 묶어서 관리 => 롤
 * GRANT CONNET, RESOURCE TO 사용자명
 * 
 * 권한 취소 REBOKE
 * REBOKE 권한이름 FROM 사용자명
 * 
 * 비밀번호 변경
 *  ALTER USER 사용자명 IDENTIFIED BY 새비밀번호;
 */
 
-- 공통 사용자 또는 롤 이름이 부적합합니다.
CREATE USER TEST1 IDENTIFIED BY 12345;
--> 
CREATE USER c##TEST1 IDENTIFIED BY 12345;

-- c## 없이 생성
ALTER SESSION SET "_oracle_script"=TRUE;
CREATE USER TEST2 IDENTIFIED BY 12345;
--ORA-01045: 사용자 TEST2는 CREATE SESSION 권한을 가지고있지 않음; 로그온이 거절되었습니다
GRANT CREATE SESSION TO TEST2;
-- 롤 
GRANT CONNECT, RESOURCE TO TEST2;
--테이블스페이스 'USERS'에 대한 권한이 없습니다.
--ALTER USER TEST2 DEFAULT TABLESPACE USERS QUOTA 2M ON USERS;

-- 뭔가 자꾸 권한이 없대... 
-- 사용자 생성의 최종 구문 
CREATE USER TEST3 IDENTIFIED BY 12345 
DEFAULT TABLESPACE USERS 
TEMPORARY TABLESPACE TEMP
QUOTA 10M ON USERS;

GRANT CONNECT, RESOURCE TO TEST3;

-- 사용자 삭제
-- 'TEST2'(을)를 삭제하려면 CASCADE를 지정하여야 합니다
DROP USER TEST2 CASCADE;
DROP USER TEST3 CASCADE;

/* limit : 특정 조건에 해당하는 데이터 중 상위 n개의 데이터 보기 / 범위 지정해서 보기
 * 			order by % limit %
 * 			limit N1,N2 : 상위 N1 다음 행부터 N2개의 행 조회(mysql전용)
 * limit % offset N1 : N1개만큼 건너뛰고 %개 조회 
 * 
 */

/* DB 생성
 *  create database if not exists 이름;
 */

/* 테이블 생성
 *  create table 테이블명 (열이름1 타입(), 열이름2 타입()...);
 * 
 *  타입 
 * 	숫자 : INT(4), TINYINT(1byte), SMALLINT(2), mediumint(3), bigint(8) / 실수형 - 고정소수점 : decimal, numeric  부동소수점 float, double
 *  문자 : VARCHAR(), char(고정길이) 
 *  날짜 : DATETIME, time, date, timestamp
 */

/* mysql 사용자 생성
 * mysql은 아이디 대소문자 구별함
 * 
 * localhost : 내컴퓨터(로컬 접속만 허용)
 * % : 모든 ip에서 접속가능
 *
 * create user '이름'@'호스트정보' identified by '비밀번호';
 * create user '이름'@'%' identified by '비밀번호';
 * 
 * 권한 부여
 *  grant 권한목록 on db.테이블 to '사용자이름'@'호스트'; 
 *  grant all privileges on db.*(모든테이블) to '사용자이름'@'호스트'; -> 권한 다 주기
 * 
 * 변경 사항 반영
 *  flush privileges;
 * 
 * 사용자 삭제
 *  drop user '이름'@'호스트정보'; 
 * 
 * 비밀번호 변경
 *  alter user '이름'@'호스트정보' identified by '새비밀번호';
 */
create user 'test1'@'localhost' identified by '12345';
grant all privileges on exam.* to 'test1'@'localhost';
flush privileges;

-- 학사관리 db 생성 및 sql 작성
create user 'java_db'@'localhost' identified by '12345';
grant all privileges on exam.* to 'java_db'@'localhost';
flush privileges;


/* select curdate(); -- 현재 날짜 확인 
 * oracle과 다르게 from절 안써도 됨
 * */

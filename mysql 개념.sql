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
 * 	INT : 숫자
 *  VARCHAR() : 문자
 *  DATETIME : 날짜 
 */
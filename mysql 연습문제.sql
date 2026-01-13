-- 사용할 데이터베이스 지정
use sakila;

-- CUSTOMER 테이블 조회
select
	*
from
	customer c ;

-- address_id가 200미만 데이터 조회
select
	*
from
	customer c
where
	c.address_id < 200;

-- first_name이 MARIA인 데이터 조회
select
	*
from
	customer c
where
	c.first_name = 'MARIA';

-- first_name 열에서 데이터가 A,B,C 순으로 'MARIA'보다 앞에 위치한 데이터 조회
select
	*
from
	customer c
where
	c.first_name < 'MARIA'
order by
	c.first_name;

-- address_id가 5~10 범위에 해당하는 데이터 조회
select
	*
from
	customer c
where
	c.address_id between 5 and 10;

-- first_name이 'M' ~ 'O' 사이의 데이터가 아닌 데이터 조회
select
	*
from
	customer c
where
	c.first_name not between 'M' and 'O';

-- first_name이 'MARIA', 'LINDA'인 데이터 조회
select
	*
from
	customer c
where
	c.first_name in ('MARIA', 'LINDA');

-- first_name이 'A'로 시작하는 데이터 조회
select
	*
from
	customer c
where
	c.first_name like 'A%';

-- first_name이 'A'로 시작하고 문자열 길이가 3인 데이터 조회
select
	*
from
	customer c
where
	c.first_name like 'A%'
	and length(c.first_name) = 3;

-- first_name이 'A'로 시작하고 'A'로 끝나면서 문자열 길이가 4인 데이터 조회
select
	*
from
	customer c
where
	c.first_name like 'A__A';

-- flim 테이블
-- special_features를 기준으로 그룹화 후 count() 사용
select
	f.special_features ,
	count(*)
from
	film f
group by
	f.special_features
order by f.special_features;

-- special_features, rating을 기준으로 그룹화 후 rating이 G인 데이터 조회
select
	f.special_features ,
	f.rating
from
	film f
group by
	f.special_features ,
	f.rating
having
	f.rating = 'G'
order by
	f.special_features ;

-- address 테이블
-- address2 열 데이터가 null이 아닌 데이터 조회
select
	*
from
	address a
where
	a.address2 is not null;


-- city 테이블
-- contry_id가 103 이나 86이면서, city 열이 'Cheju', "Sunnyvale', 'Dallas'인 데이터 조회
select
	*
from
	city c
where
	(c.country_id in (103, 86))
	and (c.city in ('Cheju', 'Sunnyvale', 'Dallas'));


-- payment 테이블
-- payment_date가 2005-07-09 미만인 행 조회
select
	*
from
	payment p
where
	p.payment_date < '2005-07-09';

-- limit 
-- customer에서 store_id desc, first_name asd으로 10개 데이터 보기
select
	*
from
	customer c
order by
	c.store_id desc,
	c.first_name asc
limit 10;

-- 100개 건너뛰고 101번째부터 10개 추출
select
	*
from
	customer c
order by
	c.store_id desc,
	c.first_name asc
limit 100,10;

-- limit % offset
select
	*
from
	customer c
order by
	c.customer_id asc
limit 10 offset 100;


-- DB 생성
create database if not exists EXAM;

use EXAM;

-- 테이블 생성
create table TABLE1(
COL1 INT,
COL2 VARCHAR(50),
COL3 DATETIME
);

create table TABLE2(
COL1 INT auto_increment primary key,
COL2 VARCHAR(50),
COL3 DATETIME
);

insert
	into
	TABLE2(COL2, COL3)
values ('TEST',
'2025-10-29');

insert
	into
	TABLE2(COL1, COL2, COL3)
values (3,
'TEST',
'2025-10-29');

select * from TABLE2;

-- 현재 auto_increment 값 조회
select LAST_INSERT_ID();

-- auto_increment 시작값 변경
alter table table2 auto_increment = 100;
insert
	into
	TABLE2(COL2, COL3)
values ('TEST',
'2025-10-29');

-- auto_increment 증가값 변경
set @@AUTO_INCREMENT_INCREMENT = 5;
insert
	into
	TABLE2(COL2, COL3)
values ('TEST',
'2025-10-29');

-- 연습
create table EXAM_INSERT_SELECT_FROM(
COL1 INT,
COL2 VARCHAR(10)
);

create table EXAM_INSERT_SELECT_TO(
COL1 INT,
COL2 VARCHAR(10)
);

insert into exam_insert_select_from values (1,'Do');
insert into exam_insert_select_from values (2,'It');
insert into exam_insert_select_from values (3,'MySQL');

-- exam_insert_select_from 데이터 => EXAM_INSERT_SELECT_TO
insert into EXAM_INSERT_SELECT_TO select * from exam_insert_select_from; 
select * from EXAM_INSERT_SELECT_TO;

create table exam_select_new as select * from exam_insert_select_from;
select * from exam.exam_select_new esn ;

-- date
create table exam_date_table(
	col1 date,
	col2 time,
	col3 datetime,
	col4 timestamp
);
insert into exam.exam_date_table values(now(),now(),now(),now());
SELECT * FROM exam.exam_date_table edt ;

-- jpa임
use springdb;
insert into stutbl(name) values('정이안');
select * from stutbl;

CREATE TABLE TABLE_CHECK(
	LOGIN_ID VARCHAR(20) UNIQUE,
	LOGIN_PWD VARCHAR(20) CONSTRAINT TBL_LOG_PWD_CK CHECK (CHAR_LENGTH(LOGIN_PWD) > 3),
	TEL VARCHAR(20)
);

drop table table_check;

use exam;

insert into table_check values('test01', 'test','010-4134-5469');
delete from table_check where login_id ='test01';

select * from stutbl;
insert into stutbl(sname,addr,gender) values ('정이안','seoul','e');
insert into stutbl(sname,gender) values ('정이안','F');
insert into stutbl(sname,gender) values ('정지우','F');

use springdb;
delete from stutbl where sname='정지우';
update stutbl set sname = '최지우' where id = 2;

select * from book where title like '%ok%';

--  jpa join 연습
create table teamtbl(
	id int auto_increment primary key,
	name varchar(255) not null
);
create table team_member(
	id int auto_increment primary key,
	name varchar(255) not null,
	team_id int not null,
	foreign key (team_id) references teamtbl(id)
);

insert into teamtbl(name) values('team1');
insert into teamtbl(name) values('team2');

insert into team_member(name,team_id) values('정이안',1);
insert into team_member(name,team_id) values('유하람',2);

delete from team_member where name = '정이안';
delete from team_member where name = '유하람';
delete from team where name = 'team1';

alter table team auto_increment = 1;
alter table team_member auto_increment = 1;

select *
from team_member tm
join team t on tm.team_id = t.team_id
where t.team_id=1;

alter table team rename column id to team_id;

select * from team_member tm where tm.team_id=2;

-- 모든 sports 멤버 정보와 사물함 정보 조회
select
	sm.member_id ,
	sm.name,
	l.name
from
	sports_member sm
join locker l on
	sm.locker_id = l.lokcer_id ;

drop table mart_member;

alter table boardtbl rename column create_time to create_date;

-- booktbl 더미 데이터 넣기
-- uuid() : 랜덤값 데이터 
insert
	into
	book (title,
	author,
	isbn,
	price,
	description)(
	select
		title,
		author,
		UUID(),
		price,
		description
	from
		book);

select * from boardtbl b ;

select
	b.*,
	bm.name
from
	boardtbl b
join board_member bm on
	b.email = bm.email ; 

-- boardtbl + member(이름)+댓글정보조회
select
	b.*,
	bm.name ,
	br.`text`
from
	boardtbl b
join board_member bm on
	b.email = bm.email
left join board_reply br on
	b.bno = br.bno ;

-- 게시글 번호 33번의 게시글 정보 + 작성자 정보 + 댓글 정보 조회
select
	br.*,
	b.*,
	bm.*
from
	board_reply br
left join boardtbl b on
	br.bno = b.bno
join board_member bm on
	b.email = bm.email
where
br.rno = 33;

-- 번호 제목 댓글개수 작성자 작성일
select
	b.bno ,
	b.title ,
	COUNT(br.`text` ),
	b.email ,
	b.create_date_time,
	bm.name 
from
	boardtbl b
join board_member bm on b.email = bm.email
left join board_reply br on
	b.bno = br.bno
group by
	b.bno ;

-- 전체 조회
select
	b.*,
	bm.name ,
	COUNT(br.rno)
from
	board_reply br
left join boardtbl b on
	br.bno = b.bno
left join board_member bm on
	b.email = bm.email
where
	b.title like '%title%'
group by
	b.bno
order by
	b.bno asc
limit 1,
20;

-- 상세조회 
select
	b.*
from
	boardtbl b
where
	b.bno = 401;

select
	*
from
	board_reply br
where
	br.bno = 401;

-- 
select *
from
club_member cm
join member_roles mr on
cm.email = mr.member_email
where
cm.email = 'user10@gmail.com'
and cm.from_social = 0;

-- 
select m.mno ,m.title , MIN(mi.img_name) , COUNT(distinct mr.rno), AVG(mr.grade), m.create_date 
from
movie m
left join movie_review mr on
m.mno = mr.mno
left join movie_image mi on
m.mno = mi.mno
group by
m.mno ;

select
	m.mno ,
	m.title ,
	mi.inum ,
	mi.ord ,
	mi.img_name ,
	COUNT(distinct mr.rno),
	AVG(mr.grade),
	m.create_date
from
	movie m
left join movie_review mr on
	m.mno = mr.mno
left join movie_image mi on
	m.mno = mi.mno
where
	mi.ord = 0
group by
	mi.inum ;

select
	m.mno ,
	m.title ,
	COUNT(distinct mr.rno),
	AVG(mr.grade),
	m.create_date
from
	movie m
left join movie_review mr on
	m.mno = mr.mno
where
	m.mno = 100;

-- 영화번호 기준으로 리뷰 조회
select
	*
from
	review r
where
	r.mno = 190;

select
	r.mno ,
	count(r.rno) ,
	avg(r.grade)
from
	review r
left join movie m on
	r.mno = m.mno
group by
	r.mno
order by
	mno;

select @@sql_mode;

-- 컬럼 값을 다른 컬럼 값으로 이관하기
update
	movie m
set
	create_date = create_date_time,
	update_date = update_date_time
where
	m.mno >= 300;

alter table movie_member drop column create_date_time;
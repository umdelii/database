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

select * from TABLE2;
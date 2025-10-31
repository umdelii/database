-- student 
-- 학번(student_id)'20250001', 이름(name)'홍길동',키(height)164.5, 학과코드(학과테이블참조)
create table student(
	student_id varchar(15) primary key,
	name varchar(15) not null,
	height decimal(4,1),
	dept_id varchar(15),
	constraint department_dp_id foreign key(dept_id) references department(dept_id) 
); 

-- department
-- 학과코드(dept_id)'A001', 학과명(dept_name)'데이터사이언스'
create table department(
	dept_id varchar(15) primary key ,
	dept_name varchar(45) not null
);

-- professor
-- 교수코드(prof_id)'P001', 학과코드(학과테이블참조), 교수명(prof_name)'정이안'
create table professor(
	prof_id varchar(15) primary key,
	dept_id varchar(15),
	constraint professor_department_dp_id foreign key(dept_id) references department(dept_id),
	prof_name varchar(15) not null
);

-- subject
-- 과목코드(subj_id)'S001', 교수코드(교수테이블참조), 과목명(subj_name)'파이썬', 시작일(start_date)'2025-03-01', 종료일(end_date)
create table subject(
	subj_id varchar(15) primary key,
	prof_id varchar(15),
	constraint subject_professor_pr_id foreign key(prof_id) references professor(prof_id),
	subj_name varchar(60) not null,
	start_date date not null,
	end_date date not null
);

-- enroll
-- 수강번호(enroll_id)1234(자동증가), 학번(학생테이블참조), 과목코드(과목테이블참조), 수강일자(enroll_date)'2025-10-01'
create table enroll(
	enroll_id int auto_increment primary key,
	student_id varchar(15),
	constraint enroll_student_st_id foreign key (student_id) references student(student_id),
	subj_id varchar(15),
	constraint enroll_subject_sb_id foreign key (subj_id) references subject(subj_id),
	enroll_date date not null 
);

-- insert
insert into department values('A001','데이터사이언스');
insert into department values ('A002','경영학과');

insert
	into
	student(student_id , name , height , dept_id )
values ('20250001',
'홍길동',
165.5,
'A002');
insert
	into
	student(student_id , name , height , dept_id )
values ('20250002',
'정서연',
160.3,
'A001');

insert into professor values ('PF-0001','A001','정이안');

insert into subject values ('SB-0001','PF-0001','파이썬','2025-03-01','2025-06-30');

insert into enroll(student_id ,subj_id ,enroll_date ) values ('20250001','SB-0001',now());
-- 자동증가 auto_increment 값 변경(초기화)
alter table enroll auto_increment = 1;
delete from enroll where student_id = '20250001';

use movies;

--task 1 a)
alter table movie
add constraint unique_length unique(length);

--task 1 b)
alter table movie
add constraint u2 unique(studioName, length);

--task 2
alter table movie
drop constraint u2;

create database deleteme
go
use deleteme
go

--task 3
create table students
(
    fn int primary key check(fn between 0 and 99999),
	name nvarchar(100) not null,
    ssn char(10) unique not null,
	email varchar(100) unique not null,
	birthdate date not null,
	adate date not null,
	constraint at_least_18_yrs check(datediff(year, birthdate, adate) >= 18));

insert into students
values(81888, 'Ivan Ivanov', '9001012222', 'ivan@gmail.com', '1990-01-01', '2009-01-10');
select * from students;

--task 3 b)
alter table students
add constraint email_valid check(email like '%_@%_.%_');

update students set email = 'aaaa';

--task 3 c)
create table courses
(
    id int identity primary key,
	name varchar(50) not  null);

insert into courses(name) values('DB');
insert into courses(name) values('OOP');
select * from courses;

create table studentsIn
(
     student_fn int references students(fn),
	 course_id int references courses(id) on delete cascade,
	 primary key(student_fn, course_id));

insert into studentsIn values(81888, 2);
insert into studentsIn values(81888, 3);
select * from studentsIn;

select course_id
from studentsIn
where student_fn = 81888;

select student_fn
from studentsIn
where course_id = 3;

delete from courses
where name = 'iOS';
select * from studentsIn;

use master
go drop database deleteme;
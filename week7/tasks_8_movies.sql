use movies;

begin transaction;

--1.1
insert into moviestar(name, gender, birthdate)
values('Nicole Kidman', 'F', '1967-06-20');

select *
from MOVIESTAR;

--1.2
delete from movieexec
where NETWORTH < 10000000;

select * 
from MOVIEEXEC;

--1.3
delete from moviestar
where address is null;

select *
from MOVIESTAR;

--1.4
update movieExec
set name = 'Pres.' + name
where cert# in (SELECT presC# from studio);

select *
from MOVIEEXEC;

rollback
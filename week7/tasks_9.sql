--1.1
create database test
go
use test
go

create table dropme( something int);

--1.2 b)
create table printer (
              code int,
			  model char(4),
			  color char(1) default 'n',
			  price decimal(9, 2));

--1.3
insert into printer(code, model) values(1, '1234');
insert into printer(code, model, color) values(2, '1235', null);
select * from printer;

use master
go
drop database test
go
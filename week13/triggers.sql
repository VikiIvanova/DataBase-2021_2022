/*В) Всеки производител на компютър трябва да произвежда и лаптоп, който да има същата или
по-висока честота на процесора;*/
go
use pc;
go

create trigger t4
on pc
after insert
as
	insert into laptop(code, model, speed, ram, hd, price, screen)
	select (select max(code) from laptop) + 1 as cody, inserted.model, speed, ram, hd, price, null
	from inserted 
	join product on inserted.model = product.model
	where maker in (select maker from product where type = 'PC') ;

drop trigger t4;
select * from product;

select * from pc;
insert into pc(code,model, speed, ram, hd, cd, price)
values(12, 1232, 678, 62, 56, '71x', 737);

select * from laptop;
delete from pc
where model = 1232 and cd = '71x';
rollback transaction;

/*Д) При обновяване на RAM или HD полетата на даден компютър се уверете, че твърдия диск е
поне 100 пъти по-голям от паметта;
*/
go
use pc;
begin transaction;
go
create trigger t6
on pc
after update
as
if exists  (select hd from inserted where ram > hd * 100)
begin
	raiserror('t6 active', 16, 10);
	rollback;
end;

drop trigger t6;
select * from pc;

update pc
set hd = 1
where model = 1232;

update pc
set ram = 1000
where model = 1232;
select * from pc;

alter table pc 
add constraint constr 
check(hd* 100 < ram);

/*Е) Ако някой лаптоп има повече памет от някой компютър трябва да бъде и по-скъп от него;*/
go
use pc;
go

create trigger t7
on laptop
instead of update, insert
as
if exists  (select * from inserted, pc where inserted.hd > pc.hd and inserted.price < pc.price )
	begin
		raiserror('t7 active', 16, 10);
	end;

drop trigger t7;

insert into laptop(hd, price)
values(500, 3);
delete from laptop where code is null;

/*Ж) При добавянето на нов компютър, лаптоп или принтер се уверете, че модела не съществува
в таблиците PC, Laptop и Printer;*/
go
use pc;

go
create trigger t8
on laptop
after insert
as
if exists(select * from inserted where model in (select model from pc union select model from laptop union select model from printer))
	begin
		raiserror('t8 active', 16, 10);
		rollback;
	end;

drop trigger t8;

insert into laptop(model,hd, price)
values(1121,500, 3);
delete from laptop where code is null;

/*Б) Ако бъде добавен нов клас с водоизместимост по-голяма от 35000, добавете класа в
таблицата, но му задайте водоизместимост 35000;*/
go
create trigger t32
on classes
instead of insert
as
	insert into classes(class, type, country, numguns, bore, displacement)
	select class, type, country, numguns, bore, (case when displacement > 35000 then 35000 else displacement end) from inserted;
drop trigger t32;

begin transaction;
insert into classes
values('Long Island', 'bc', 'Bulgaria', 9, 15, 64000);

select * from classes;
rollback transaction;

*Г) Кораб с повече от 9 оръдия не може да участва в битка с кораб, който е с по-малко от 9
оръдия; TODO*/
go
use ships;
go
select * from ships;
go

create view tm 
as (select c.class, numguns , name, battle  from  outcomes join ships s on name = ship join classes c on c.class = s.class);
go
create trigger t34
on outcomes
after insert, update
as
begin
	if( exists( select * 
				from  tm tm1,tm tm2 
				where tm1.battle = tm2.battle and tm1.numguns < tm2.numguns 
					and (tm1.name in (select ship from inserted) or tm2.name in (select ship from inserted)) ) )
	begin
		raiserror('t34 active', 16, 10);
		rollback;
	end
end
drop trigger t34;

begin transaction;
insert into ships(name, class, launched)
values('Mau', 'Bismarck', 1728);
select * from classes;
select * from outcomes join ships on name = ship join classes on classes.class = ships.class;
insert into outcomes(ship, battle, result )
values('Mau', 'Surigao Strait','ok');


rollback transaction;
/*Е) При добавянето на нов кораб или при промяна на класа на някой кораб се уверете, че никоя
държава няма повече от 20 кораба;*/
go
create trigger t36
on ships
after update, insert
as
		if( exists(select count(*), country from ships join classes on classes.class = ships.class group by country having count(*) > 20))
		begin
			print 'trigger 36 active'
			rollback
		end

drop trigger t36;

begin transaction;

insert into ships(name, class, launched)
values ('mau1', 'Iowa', 1234), ('mau2', 'Iowa', 1234), ('mau3', 'Iowa', 1234), ('mau4', 'Iowa', 1234), ('mau5', 'Iowa', 1234);

rollback transaction;

/*
use movies;

--1.1
insert into moviestar values('Bruce Willis', 'somewhere', 'M', '2020-01-01');

create trigger t
on movie
after insert
as 
   insert into starsin(movietitle, movieyear, starname)
   select title, year, 'Bruce Willis'
   from inserted
   where title like '%save%' or title like '%world%';

insert into movie 
values ('Armageddon, save, world', 1998, 120, 'y', 'MGM', 123);

select *
from starsin;

drop trigger t;

--1.2
create trigger t
on movieexec 
after insert, update, delete
as
   if(select AVG(networth)
      from movieexec) < 500000
	  begin 
	     raiserror('Error: Average networth cannot be < 500000', 16, 10);
		 rollback;
	  end;

--1.3
create trigger t1
on movieexec
instead of delete
as
  begin
     update movie
	 set PRODUCERC# = null
	 where producerc# in (select cert# from deleted);

	 delete from movieexec
	 where cert# in (select cert# from deleted);
   end;

--1.4
create trigger t3
on starsin
instead of insert
as
  begin
     insert into moviestar(name)
	 select distinct starname
	 from inserted
	 where starname not in (select name from moviestar);

	 insert into movie(title, year)
	 select distinct movietitle, movieyear
	 from inserted
	 where not exists (select * from movie
	           where title = movietitle and year = movieyear);

	insert into starsin
	select *
	from inserted;
  end;

use pc;
--2.1
create trigger t4
on laptop
after delete
as
  insert into pc
  select code + 100, '1121', speed, ram, hd, '52x', price
  from deleted
  where model in (select model
                  from product
				  where maker = 'D');
drop trigger t4

--2.2
create trigger t5
on pc
after update
as
  if exists (select *
             from pc p
             where exists (select *
                           from pc
			               where price < p.price and speed = p.speed)
		     and code in (select i.code
			              from deleted d
						  join inserted i on d.code = i.code
						  where d.price != i.price))
   begin
      raiserror('...', 16, 10);
	  rollback;
   end;

--2.3
create trigger t6
on product after insert, update
as
if exists (select *
           from product p1
		   join product p2 on p1.maker = p2.maker
		   where p1.type = 'PC' and p2.type = 'Printer')
	begin 
	  raiserror('...', 16, 10);
	  rollback;
	end;

--2.5
create trigger t7
on laptop
after update 
as
if exists (select maker
           from laptop
		   join product on laptop.model = product.model
		   group by maker
		   having avg(price) < 2000)
	begin
	  raiserror('...', 16, 10);
	  rollback;
	end;

--2.7
create trigger t8
on printer
instead of insert
as
  insert into printer
  select *
  from inserted
  where color != 'y' or type != 'Matrix';

use ships;

--3.2
create view shipsCount
as
   select c.class, count(s.name) as ships
   from classes c
   left join ships s on c.class = s.class
   group by c.class

select * from shipsCount

create trigger t9
on shipsCount
instead of delete 
as
  begin
    delete from ships
	where class in (select class from deleted);

	delete from classes
	where class in (select class from deleted);
   end;
insert into classes
values ('Test 1', 'bb', 'Bulgaria', 20, 20, 500000),
       ('Test 2', 'bc', 'Bulgaria', 18, 21, 450000);
	   
insert into ships
values ('Test Ship', 'Test 1', 2020);

delete from shipsCount
where class = 'Test 1';

select *  from classes where class like 'Test%';


--3.3
create trigger t9
on ships 
after insert, update
as
  if exists (select class
             from ships
			 group by class
			 having count(*) > 2)
	begin 
	   raiserror('...', 16, 10);
	   rollback;
	end;

--3.5
create trigger t10
on outcomes
after insert, update
as
  if exists (select *
             from outcomes o1
			 join battles b1 on o1.battle = b1.name
			 join outcomes o2 on o1.ship = o2.ship
			 join battles b2 on o2.battle = b2.name
			 where o1.result = 'sunk'
			 and b1.date < b2.date)
	begin
	  raiserror('...', 16, 10);
	  rollback;
	end;
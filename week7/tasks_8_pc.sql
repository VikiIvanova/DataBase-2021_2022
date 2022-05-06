use pc;
begin transaction;

--2.1
insert into product(maker, model, type)
values('C', '1100', 'PC');
insert into PC(code, model, speed, ram, hd, cd, price)
values(12, '1100', 2400, 2048, 500, '52x', 299);

select *
from product;

select *
from pc;

--2.2
delete from pc where model = '1100';
delete from product where model = '1100';

select *
from product;

select *
from pc;

--2.3
insert into laptop(code, model, speed, ram, hd, price, screen)
select code+100, model, speed, ram, hd, price+500, 15
from pc;

select *
from laptop

--2.4
delete from laptop
where model in (select model
                       from product
					where type = 'Laptop' and
					   maker not in (select maker
					                  from product
									  where type = 'Printer'));

--2.5
update product
set maker = 'A'
where maker = 'B';

--2.6
update pc
set price = price / 2, hd = hd + 20;

--2.7
update laptop
set screen = screen + 1
where model in (select model
                from product
				where maker = 'B');

rollback
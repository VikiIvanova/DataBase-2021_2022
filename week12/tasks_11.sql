use pc;

--2.1
create view v_all_products
as 
   select code, model, price
   from pc
   union all
   select code, model, price
   from laptop
   union all
   select code, model, price
   from printer;

--2.2, 2.3
alter view v_all_products
as
   select code, model, price, speed, 'PC' as type
   from pc
   union all
   select code, model, price, speed, 'Laptop'
   from laptop
   union all
   select code, model, price, null, 'Printer'
   from printer;

use ships;
go
--3.5
create view SunkShips as
select battle, ship
from outcomes
where result = 'sunk';
go
select * from SunkShips;

--3.7
go
create view ClassesWithAtLeast9Guns
as
select *
from classes 
where numguns >= 9
with check option;

go
select * from ClassesWithAtLeast9Guns;

update ClassesWithAtLeast9Guns
set numguns = 5
where class = 'Iowa';

--почисваме
delete from outcomes where result is null;
drop view SunkShips;
drop view ClassesWithAtLeast9Guns;
use ships;
begin transaction;

--3.1
insert into classes
values('Nelson', 'bb', 'Gt.Britain', 9, 16, 34000);
insert into ships
values('Nelson', 'Nelson', 1927);
insert into ships
values('Rodney', 'Nelson', 1927);

--3.2
delete from ships
where name in (select ship from outcomes where result = 'sunk');

--3.3
update classes
set bore = bore * 2.54, displacement = displacement / 1.1;

--3.4
delete from classes
where class not in
(select class
from ships
group by class
having count(*) >= 3);

delete from classes where class in
(select classes.class
from classes
left join ships on classes.class = ships.class
group by classes.class
having count(name) < 3);

--3.5
update classes
set bore = (select bore
            from classes where class = 'Bismarck'),
	displacement = (select displacement
	                from classes where class = 'Bismarck')
where class = 'Iowa';

rollback
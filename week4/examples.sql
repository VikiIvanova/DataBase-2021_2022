use movies;

select *
from movieexec m1 join movie m2
on m1.cert# = m2.PRODUCERC#

select *
from MOVIEEXEC cross join movie

--ne go priema
select *
from movieExec m1 join movie m2
on m1.cert#  = m2.producerc#

--ne go poddyrja
--select *
--from movieexec natural join movie

select *
from movieexec m1 left join movie m2
on m1.cert# = m2.PRODUCERC#

select *
from MOVIEEXEC m1 right join movie m2
on m1.cert# = m2.PRODUCERC#

select *
from movieExec m1 full join movie m2
on m1.cert# = m2.producerc# 

--За всеки актьор и/или продуцент да се изведе името му, 
--рождената му дата и networth:

--неудобен начин
select ms.name, me.name, ms.birthdate, me.networth
from moviestar ms
full join movieexec me on ms.name = me.name;

--хубав начин
select coalesce(ms.name, me.name) as name, ms.birthdate, me.networth
from moviestar ms
full join movieexec me on ms.name = me.name;

use ships;
--За всяка държава да се изведат имената на корабите, които 
--никога не са участвали в битка

--1ви начин
select country, name
from classes
join ships on classes.class = ships.class
left join outcomes on name = ship
where outcomes.ship is null;

--2ри начин
select country, name
from outcomes
right join ships on ship = name
join classes on classes.class = ships.class
where outcomes.ship is null;

--За всеки клас британски кораби да се изведат имената им 
--(на класовете) и имената на всички битки, в които са 
--участвали кораби от този клас.
--Ако даден клас няма кораби или има, но те не са 
--участвали в битка, също да се изведат (със стойност NULL 
--за име на битката).
select distinct classes.class, battle
from outcomes
join ships on ship = name
right join classes 
 on ships.class = classes.class
where country = 'Gt.Britain';

-- За всеки клас да се изведат името му, държавата и имената 
--на всички негови кораби, пуснати през 1916 г.
select classes.class, country, name
from classes
join ships on classes.class = ships.class
where launched = 1916;

--Да допълним горната задача, като добавим и 
--класовете, които нямат нито един кораб от 1916 - 
--срещу тях да пише NULL:
select classes.class, country, name
from classes
left join ships
on classes.class = ships.class and launched = 1916;
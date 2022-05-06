use ships;

--2.1:Напишете заявка, която извежда броя на класовете кораби
select count(*)
from classes;

--2.2:Напишете заявка, която извежда средния брой на оръдията (numguns) за всички 
--кораби, пуснати на вода (т.е. изброени са в таблицата Ships).
select avg(numguns)
from classes c
join ships s on c.class = s.class;

--2.3:Напишете заявка, която извежда за всеки клас първата и последната година,
--в която кораб от съответния клас е пуснат на вода.
select class, min(launched) as FirstYear,
              max(launched) as LastYear
from ships
group by class;

--2.4:Напишете заявка, която за всеки клас извежда броя на корабите, потънали в битка.
select class, count(*)
from ships s
join outcomes o on s.name = o.ship
where o.result = 'sunk'
group by class;

--2.5:Напишете заявка, която за всеки клас с  над 4 пуснати на вода кораба извежда 
--броя на корабите, потънали в битка.
select class, count(name)
from ships s
join outcomes o on s.name = o.ship
where result = 'sunk' and class in
                (select class 
				from ships
				group by class
				having count(*)>4)
group by class;

--2.6:Напишете заявка, която извежда средното тегло 
--на корабите (displacement) за всяка страна.
select country, avg(displacement)
from classes
group by country;
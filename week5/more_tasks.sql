use movies;

select name, count(studioname)
from moviestar
left join starsin on name = starname
left join movie
          on movietitle = title and
		  year = movieyear

group by name;

select STARNAME
from starsin
where movieyear > 1990
group by starname
having count(*) >=3;

use pc;

select model
from pc
group by model
order by max(price);

use ships;

select battle, count(*)
from outcomes o
join ships s on ship = name
join classes c on s.class = c.class
where result = 'sunk' and country = 'USA'
group by battle
having count(*) >= 1;

select country, battle
from outcomes
join ships s on name = ship
join classes c on s.class = c.class
group by country, battle
having count(*) >= 3;

select class
from ships
group by class
having max(launched) <= 1921;

select name, count(battle)
from ships
left join outcomes on name = ship and result = 'damaged'
group by name

select country, count(ships.name), count(outcomes.ship)
from classes
left join ships on classes.class = ships.class
left join outcomes on name = ship and result = 'sunk'
group by country;

select country, (select count(distinct name)
                 from classes
				 join ships on classes.class = ships.class
				 join outcomes on ship = name
				 where result = 'damaged'
				       and country = c.country) as damaged,
				(select count(*)
				from classes
				join ships on classes.class = ships.class
				join outcomes on ship = name
				where result = 'sunk'
				      and country = c.country) as sunk
from classes c
group by country;

select class, count(distinct ship)
from ships
left join outcomes on name = ship and result = 'ok'
group by class
having count(distinct name) >= 3;

select battle, date, result, count(*)
from outcomes
join battles on battle = name
group by battle, date, result
order by battle;

select battle, date,
       sum(case result 
	            when 'sunk' then 1
				else 0     end) as num_sunk,
		sum(case result
		          when 'damaged' then 1
				  else 0     end) as num_damaged,
		sum(case result 
		         when 'ok' then 1
				 else 0      end) as num_ok
from outcomes
join battles on battle = name
group by battle, date;

select battle
from outcomes o
join ships s on o.ship = s.name
join classes c on s.class = c.class
where c.numGuns < 9
group by battle
having count(*) >= 3 and sum(case result
                                 when 'ok' then 1
								 else 0 end) >= 2;

select name, birthdate, (select top 1 studioname
                         from starsin
						 join movie on movietitle = title and movieyear = year
						 where starname = name
						 group by studioname
						 order by count(*) desc) studioName
from moviestar;

use pc;
select maker, count(pc.code)
from product p
left join pc on p.model = pc.model
where maker in (select maker
                from product
				join printer on product.model = printer.model
				where printer.type = 'Laser'
				group by maker
				having count(*) >= 2)
group by maker;

select maker, (select count(*)
               from product p1
			   join pc on p1.model = pc.model
			           and p1.maker = p.maker)
from product p
join printer on p.model = printer.model
where printer.type = 'Laser'
group by maker
having count(*) >= 2;

select maker
from product p
join pc on p.model = pc.model
group by maker
having avg(price) < (select avg(price)
                     from product
					 join laptop on product.model = laptop.model
					 where maker = p.maker);

select pc.model
from pc
join product p on pc.model = p.model
group by pc.model, p.maker
having avg(price) < (select min(price)
                     from laptop
					 join product t
					 on laptop.model = t.model
					 where t.maker = p.maker);

select model
from pc
group by model
having max(hd) - min(hd) >= 20;

select ship 
from battles
join outcomes on name = battle
group by ship
having year(max(date)) - year(min(date)) >= 1;

select year(date), count(distinct ships.name)
from battles
left join ships on year(date) = launched
group by year(date);

select class,
       (select count(*)
	   from ships s
	   join outcomes o on s.name = o.ship
	   where s.class = c1.class
	   and o.result = 'ok')
	   - (select count(*)
	   from ships s
	   join outcomes o on s.name = o.ship
	   where s.class = c1.class
	   and o.result = 'sunk')
from classes c1;
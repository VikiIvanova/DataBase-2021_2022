use ships;

select distinct name, launched
from ships
where class = name;

use movies;
select title
from movie
where title like '%Star%' and title like '%Trek%'
order by year desc, title;

select movietitle, movieyear
from starsin
join moviestar on name = starname
where birthdate > '1970-01-01' and birthdate < '1980-07-01';

select distinct ship
from outcomes 
where ship like 'C%' or ship like 'K%';

select distinct country
from outcomes
join ships on name = ship
join classes on classes.class = ships.class
where result = 'sunk';

select distinct country
from classes
where country not in (select distinct country
                      from outcomes
					  join ships on name = ship
					  join classes on classes.class = ships.class
					  where result = 'sunk');

select class
from classes
where class not in (select class
                    from ships
					where launched > 1921);

select name, country, bore * 2.54 as boreSum
from classes
join ships on ships.class = classes.class
where numguns in (6, 8, 10);

select distinct c1.country
from classes c1
join classes c2 on c1.country = c2.country
where c1.bore < c2.bore;

select distinct country
from classes
where numguns >= all (select numguns from classes);

use pc;
select *
from pc p
join product pr on p.model = pr.model
where p.price < all
                (select price from laptop l
				join product pr2 on l.model = pr2.model
				where pr2.maker = pr.model);

select *
from pc
join product pr on pc.model = pr.model
where pc.price < all
                 (select price from laptop l
				 join product pr2 on l.model = pr2.model
				 where pr2.maker = pr.model
				 union all select price from printer p
				 join product pr2 on p.model = pr2.model
				 where pr2.maker = pr.model);
use movies;

--1.1
select name
from starsin
join moviestar on starname = name
where gender = 'F' and movietitle = 'Terms of Endearment';

--1.2
select distinct starname
from starsin
join movie on movietitle = title
           and movieyear = year
where studioname = 'MGM' and movieyear = 1995;

use pc;

--2.1
select maker, speed
from laptop
join product 
     on laptop.model = product.model
where hd >= 9

--2.2
select p.model, price
from product p
join laptop on p.model = laptop.model
where maker = 'B'
union
select p.model, price
from product p
join pc on p.model = pc.model
where maker = 'B'
union
select p.model, price
from product p
join printer on p.model = printer.model
where maker = 'B'
order by price desc;

--2.3
select distinct p1.hd
from pc p1
join pc p2 on p1.hd = p2.hd 
           and p1.code <>p2.code

--2.4
select distinct p1.model, p2.model
from pc p1
join pc p2 on p1.speed = p2.speed and p1.ram = p2.ram
where p1.model < p2.model;

--2.5
select distinct maker
from pc 
join product on pc.model = product.model
where speed >= 1000;

use ships;

--3.1
select name
from ships
join classes on ships.name = classes.class
where DISPLACEMENT > 35000;

--3.2
select name, displacement, numguns
from outcomes
join ships on ship = name
join classes on ships.class = classes.class
where battle = 'Guadalcanal';

--3.3.1
select country
from classes
where type = 'bb'
intersect
select country
from classes
where type = 'bc';

--3.3.2
select distinct c1.country
from classes c1
join classes c2 on c1.country = c2.country
where c1.type = 'bb' and c2.type = 'bc';

--3.4
select distinct o1.ship
from outcomes o1
join battles b1 on o1.battle = b1.name
join outcomes o2 on o1.ship = o2.ship
join battles b2 on o2.battle = b2.name
where o1.result = 'damaged' and b1.date < b2.date;


use movies;

--1.1.
select address
from studio
where name = 'MGM';

--1.3.
select starname
from starsin
where movieyear = 1980 and movietitle like '%Empire%';

--1.5.
select name
from moviestar
where gender = 'M' or address like '%Malibu%';

use pc;

--2.1.
select model, speed as MHz,
       hd as GB
from pc
where price < 1200

--2.2.
select model, price / 1.1
from laptop
order by price;

-- 2.6.
select code, model,
       speed + ram + 10 * screen as rating
from laptop
order by rating desc, code;

use ships;
--3.4.
select name
from ships
where name = class;

--3.6.
select name
from ships
where name like '% %'
      and name not like '% % %';
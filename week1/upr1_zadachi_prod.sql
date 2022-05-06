use movies;

-- 1.2
select birthdate
from MovieStar
where name = 'Sandra Bullock';

-- 1.4
select name
from MOVIEEXEC
where networth > 10000000;

use pc;

-- 2.3
select model, ram, screen
from laptop
where price > 1000;

-- 2.4
select *
from printer
where color = 'y';

-- 2.5
select model, speed, hd
from pc
where cd ='12x' or cd = '16x' and price < 2000;

use ships;

-- 3.1
select class, country
from classes
where numguns < 10;

--3.2
select name as shipName
from ships
where launched < 1918;

--3.3
select ship, battle
from outcomes
where result = 'sunk';

--3.5
select name
from ships
where name like 'R%';
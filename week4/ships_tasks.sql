use ships;

/*Напишете заявка, която 
за всеки кораб извежда 
името му, държавата, 
броя оръдия и годината 
на пускане (launched).*/

select name, country, numguns, launched
from classes cl
full join ships sh on cl.class = sh.class;
--proverka

/*Напишете заявка, която 
извежда имената на 
корабите, участвали в 
битка от 1942 г.*/
select distinct ship
from outcomes
join battles on battle = name
where year(date) = 1942;
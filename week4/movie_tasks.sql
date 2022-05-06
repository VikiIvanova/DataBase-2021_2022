use movies;

--Напишете заявка, която за всеки филм, 
--по-дълъг от 120 минути, извежда 
--заглавие, година, име и адрес на студио.
select title, year, name, address
from movie
join studio on name = studioname
where length > 120;

-- Напишете заявка, която извежда името 
--на студиото и имената на актьорите, 
--участвали във филми, произведени от 
--това студио, подредени по име на студио
select distinct studioname, starname
from movie
join starsin on title = movietitle and year = movieyear
order by studioname;

--Напишете заявка, която извежда имената 
--на продуцентите на филмите, в които е 
--играл Harrison Ford.
select distinct name
from movie
join starsin on title = MOVIETITLE
left join movieexec on producerc# = cert#
where starname = 'Harrison Ford';


select distinct movieexec.name
from movieexec
join movie on cert#=producerc#
join starsin on title = movietitle and year = movieyear
where starname = 'Harrison Ford'

--Напишете заявка, която извежда имената 
--на актрисите, играли във филми на MGM.
select name
from movie
left join starsin on movietitle = title
  join MOVIESTAR on starname = name
where gender = 'F' and studioname = 'MGM';
--proverka

select distinct name
from moviestar
join starsin on starname = name
join movie on title = movietitle and year = movieyear
where gender = 'F' and studioname = 'MGM';

--Напишете заявка, която извежда името 
--на продуцента и имената на филмите, 
--продуцирани от продуцента на ‘Star 
--Wars’.
select distinct name, title
from movie
join movieexec on producerc#=cert#
where cert# = (select producerc#
               from movie
			   where title = 'Star Wars');

--Напишете заявка, която извежда имената 
--на актьорите, които не са участвали в 
--нито един филм.
select name
from moviestar
left join starsin on name = starname
where starname is null;

-- 2ri nachin
select name
from moviestar
where name not in (select starname from starsin);
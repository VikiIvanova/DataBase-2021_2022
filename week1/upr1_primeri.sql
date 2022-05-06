use movies;

select *
from movie;

select *
from starsin;

--проекция:
select studioName as name, title
from movie;

--изрази в Select клаузата:
--искаме да изведем заглавията и дължините в часове
--на всички филми:
select title, length / 60.0 as hours
from movie;

--друг класически пример: конкатениране на първо и фамилно име
--шаблони:
--имена и години на всички филми, чието име започва със "Star":
select title, YEAR
from movie
where TITLE like 'Star%';

--всички филмови звезди, родени след 01.06.1970г.:
select *
from MOVIESTAR
where BIRTHDATE > '1970-06-01';

--често ще използваме функциите year и month:
--всички филмови звезди, родени през юли:
select *
from MOVIESTAR
where month(BIRTHDATE) = 7;

--null
select * from movie; -- заявката връща 10 реда

--всички филми, които са по-дълги от 2 часа:
select *
from movie
where LENGTH > 120;
--заявка връща 4 реда

--отрицание на горното условие:
select *
from movie
where not(LENGTH > 120);
--заявка върна 5 реда
--добре, но 4 + 5 < 10!

select *
from movie
where LENGTH is null; --грешно: = null
-- най-сетне го хванахме

--сортиране - пример със сортиране по няколко критерия
--всички филми, по-дълги от 60 минути,
--първо най - дългите, а ако има филми с еднаква дължина - 
--да се сортират по заглавие
select *
from movie
where LENGTH > 60
order by LENGTH desc, TITLE asc;

--сортиране по израз
--да се изведат филмовите звезди, сортирани по месец на раждане:
select *
from MOVIESTAR
order by MONTH(BIRTHDATE);

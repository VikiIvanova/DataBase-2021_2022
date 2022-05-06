use movies;

--�������� ������, ����� �� ����� ����, 
--��-����� �� 120 ������, ������� 
--��������, ������, ��� � ����� �� ������.
select title, year, name, address
from movie
join studio on name = studioname
where length > 120;

-- �������� ������, ����� ������� ����� 
--�� �������� � ������� �� ���������, 
--��������� ��� �����, ����������� �� 
--���� ������, ��������� �� ��� �� ������
select distinct studioname, starname
from movie
join starsin on title = movietitle and year = movieyear
order by studioname;

--�������� ������, ����� ������� ������� 
--�� ������������ �� �������, � ����� � 
--����� Harrison Ford.
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

--�������� ������, ����� ������� ������� 
--�� ���������, ������ ��� ����� �� MGM.
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

--�������� ������, ����� ������� ����� 
--�� ���������� � ������� �� �������, 
--����������� �� ���������� �� �Star 
--Wars�.
select distinct name, title
from movie
join movieexec on producerc#=cert#
where cert# = (select producerc#
               from movie
			   where title = 'Star Wars');

--�������� ������, ����� ������� ������� 
--�� ���������, ����� �� �� ��������� � 
--���� ���� ����.
select name
from moviestar
left join starsin on name = starname
where starname is null;

-- 2ri nachin
select name
from moviestar
where name not in (select starname from starsin);
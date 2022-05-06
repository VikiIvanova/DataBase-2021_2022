use movies;

--1. �� ����� ������/������� �������� ���� �� 
-- ���������� ������, � ����� �� ��������� �����.
select starname, count(distinct studioname)
from starsin
join movie on movietitle = title and movieyear = year
group by starname;

-- 2. �� ����� ������/������� �������� ���� �� 
-- ���������� ������, � ����� �� ��������� �����, 
-- ����������� � �� ����, �� ����� ������ ���������� � 
-- ��� ����� �� ������.
select name, count(distinct studioname)
from movie
join starsin on movietitle = title and movieyear = year
right join moviestar on name = starname
group by name;

--OR:
select name, count(distinct studioname)
from moviestar
left join starsin on name = starname
left join movie on movietitle = title and movieyear = year
group by name;

-- 3. �������� ������� �� ���������, ��������� � ���� 
-- ��� ����� ���� 1990 �.
select starname
from starsin
where movieyear > 1990
group by starname
having count(*) >= 3;

use pc;
-- 4. �� �� ������� ���������� ������ ��������, 
-- ��������� �� ���� �� ���-������ ��������� �������� 
-- �� ����� �����.
select model
from pc
group by model
order by max(price);
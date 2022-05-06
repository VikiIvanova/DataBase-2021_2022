use movies;

select *
from movieexec m1 join movie m2
on m1.cert# = m2.PRODUCERC#

select *
from MOVIEEXEC cross join movie

--ne go priema
select *
from movieExec m1 join movie m2
on m1.cert#  = m2.producerc#

--ne go poddyrja
--select *
--from movieexec natural join movie

select *
from movieexec m1 left join movie m2
on m1.cert# = m2.PRODUCERC#

select *
from MOVIEEXEC m1 right join movie m2
on m1.cert# = m2.PRODUCERC#

select *
from movieExec m1 full join movie m2
on m1.cert# = m2.producerc# 

--�� ����� ������ �/��� ��������� �� �� ������ ����� ��, 
--��������� �� ���� � networth:

--�������� �����
select ms.name, me.name, ms.birthdate, me.networth
from moviestar ms
full join movieexec me on ms.name = me.name;

--����� �����
select coalesce(ms.name, me.name) as name, ms.birthdate, me.networth
from moviestar ms
full join movieexec me on ms.name = me.name;

use ships;
--�� ����� ������� �� �� ������� ������� �� ��������, ����� 
--������ �� �� ��������� � �����

--1�� �����
select country, name
from classes
join ships on classes.class = ships.class
left join outcomes on name = ship
where outcomes.ship is null;

--2�� �����
select country, name
from outcomes
right join ships on ship = name
join classes on classes.class = ships.class
where outcomes.ship is null;

--�� ����� ���� ��������� ������ �� �� ������� ������� �� 
--(�� ���������) � ������� �� ������ �����, � ����� �� 
--��������� ������ �� ���� ����.
--��� ����� ���� ���� ������ ��� ���, �� �� �� �� 
--��������� � �����, ���� �� �� ������� (��� �������� NULL 
--�� ��� �� �������).
select distinct classes.class, battle
from outcomes
join ships on ship = name
right join classes 
 on ships.class = classes.class
where country = 'Gt.Britain';

-- �� ����� ���� �� �� ������� ����� ��, ��������� � ������� 
--�� ������ ������ ������, ������� ���� 1916 �.
select classes.class, country, name
from classes
join ships on classes.class = ships.class
where launched = 1916;

--�� �������� ������� ������, ���� ������� � 
--���������, ����� ����� ���� ���� ����� �� 1916 - 
--����� ��� �� ���� NULL:
select classes.class, country, name
from classes
left join ships
on classes.class = ships.class and launched = 1916;
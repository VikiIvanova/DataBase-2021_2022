use ships;

--2.1:�������� ������, ����� ������� ���� �� ��������� ������
select count(*)
from classes;

--2.2:�������� ������, ����� ������� ������� ���� �� �������� (numguns) �� ������ 
--������, ������� �� ���� (�.�. �������� �� � ��������� Ships).
select avg(numguns)
from classes c
join ships s on c.class = s.class;

--2.3:�������� ������, ����� ������� �� ����� ���� ������� � ���������� ������,
--� ����� ����� �� ���������� ���� � ������ �� ����.
select class, min(launched) as FirstYear,
              max(launched) as LastYear
from ships
group by class;

--2.4:�������� ������, ����� �� ����� ���� ������� ���� �� ��������, �������� � �����.
select class, count(*)
from ships s
join outcomes o on s.name = o.ship
where o.result = 'sunk'
group by class;

--2.5:�������� ������, ����� �� ����� ���� �  ��� 4 ������� �� ���� ������ ������� 
--���� �� ��������, �������� � �����.
select class, count(name)
from ships s
join outcomes o on s.name = o.ship
where result = 'sunk' and class in
                (select class 
				from ships
				group by class
				having count(*)>4)
group by class;

--2.6:�������� ������, ����� ������� �������� ����� 
--�� �������� (displacement) �� ����� ������.
select country, avg(displacement)
from classes
group by country;
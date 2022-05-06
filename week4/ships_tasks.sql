use ships;

/*�������� ������, ����� 
�� ����� ����� ������� 
����� ��, ���������, 
���� ������ � �������� 
�� ������� (launched).*/

select name, country, numguns, launched
from classes cl
full join ships sh on cl.class = sh.class;
--proverka

/*�������� ������, ����� 
������� ������� �� 
��������, ��������� � 
����� �� 1942 �.*/
select distinct ship
from outcomes
join battles on battle = name
where year(date) = 1942;
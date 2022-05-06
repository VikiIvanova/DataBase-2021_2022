use movies;

select *
from movie;

select *
from starsin;

--��������:
select studioName as name, title
from movie;

--������ � Select ��������:
--������ �� ������� ���������� � ��������� � ������
--�� ������ �����:
select title, length / 60.0 as hours
from movie;

--���� ���������� ������: ������������� �� ����� � ������� ���
--�������:
--����� � ������ �� ������ �����, ����� ��� ������� ��� "Star":
select title, YEAR
from movie
where TITLE like 'Star%';

--������ ������� ������, ������ ���� 01.06.1970�.:
select *
from MOVIESTAR
where BIRTHDATE > '1970-06-01';

--����� �� ���������� ��������� year � month:
--������ ������� ������, ������ ���� ���:
select *
from MOVIESTAR
where month(BIRTHDATE) = 7;

--null
select * from movie; -- �������� ����� 10 ����

--������ �����, ����� �� ��-����� �� 2 ����:
select *
from movie
where LENGTH > 120;
--������ ����� 4 ����

--��������� �� ������� �������:
select *
from movie
where not(LENGTH > 120);
--������ ����� 5 ����
--�����, �� 4 + 5 < 10!

select *
from movie
where LENGTH is null; --������: = null
-- ���-����� �� ��������

--��������� - ������ ��� ��������� �� ������� ��������
--������ �����, ��-����� �� 60 ������,
--����� ��� - �������, � ��� ��� ����� � ������� ������� - 
--�� �� �������� �� ��������
select *
from movie
where LENGTH > 60
order by LENGTH desc, TITLE asc;

--��������� �� �����
--�� �� ������� ��������� ������, ��������� �� ����� �� �������:
select *
from MOVIESTAR
order by MONTH(BIRTHDATE);

use pc;

/*�� ����� ����� �������� �� �� 
������� ������ �� ���������� 
������������ �� ���� �����. 
��� ���� ������������ �� 
����� �����, �� �� ������ 
NULL. ���������� �� ��� ��� 
������: model � price.*/
select distinct product.model, price from product
left join pc on product.model = pc.model
where product.type = 'PC';

/*�������� ������, ����� ������� 
������������, ����� � ��� �� 
������� �� ���� �������������, 
�� ����� ����������� ������� �� 
�� ������� (���� �� � ��������� 
PC, Laptop ��� Printer).*/

select maker, p.model, type
from product p
left join (select model from pc
           union all
		   select model from laptop
		   union all
		   select model from printer) t
		   on p.model = t.model
where t.model is null;

select maker, model, type
from product
where model not in (select model from pc)
        and model not in (select model from laptop)
		and model not in (select model from printer);
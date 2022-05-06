use pc;

/*За всеки модел компютри да се 
изведат цените на различните 
конфигурации от този модел. 
Ако няма конфигурации за 
даден модел, да се изведе 
NULL. Резултатът да има две 
колони: model и price.*/
select distinct product.model, price from product
left join pc on product.model = pc.model
where product.type = 'PC';

/*Напишете заявка, която извежда 
производител, модел и тип на 
продукт за тези производители, 
за които съответният продукт не 
се продава (няма го в таблиците 
PC, Laptop или Printer).*/

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
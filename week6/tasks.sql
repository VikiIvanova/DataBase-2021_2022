use  movies;

select distinct title, year
from movie
join starsin on title = movietitle
where year > 1982 and starname not like '%k%' and starname not like '%b%'
order by year desc

select title, (length / 60) hours
from movie m1
where m1.year in (select year
                  from movie m2
				  where m2.title = 'Terms of Endearment' and (m1.length < m2.length or m1.length is null));

select name
from movieexec
where name in (select starname
               from starsin
			   join movie on movietitle = title and movieyear = year
			   where year < 1980
			   union 
			   select starname
			   from starsin
			   join movie on movietitle = title and movieyear = year
			   where year > 1985);

select *
from movie m1
where m1.incolor = 'y/n' and m1.year < (select min(m2.year)
                                        from movie m2
										where m2.incolor = 'y' and 
										m1.studioname = m2.studioname);
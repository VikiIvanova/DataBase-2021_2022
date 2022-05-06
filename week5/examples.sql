use movies;

select avg(netWorth)
from MOVIEEXEC;

select count(*)
from starsIn;

select count(distinct starName)
from starsIn;

select count(*), count(distinct starName)
from starsIn;
-- views --
create view v_movies_with_director
as select m.*, d.name 
from movies m left join stars d on m.id_director = d.id;

select * from v_movies_with_director
where year = 2019;

-- view ok for read only --
create view v_movies_70 
as select title, year, duration
from movies
where year between 1970 and 1979;

select * from v_movies_70
where 
	-- duration >= 60;
    year not in (1973, 1978);

-- view for read/write --
drop view v_movies_70;
create view v_movies_70 
as select title, year, duration
from movies
where year between 1970 and 1979
with check option;
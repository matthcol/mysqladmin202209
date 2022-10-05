-- session user fan -- 

-- insert ok
insert into movies (title, year) values ('La 7ème Compagnie au Clair de Lune', 1977);
select * from movies where title like '%7ème compagnie%';

-- delete nok
 delete from movies where id = 12771923;
 
 -- update ok
 update movies set duration = 75 where id = 12771923;
 -- update nok
 update movies set year = 2015 where id = 12771923;
 
 
 -- session user fan70 --
 select * from v_movies_70;
 insert into v_movies_70 (title, year) values ('Mais où est donc passée la 7ème compagnie', 1973);
 select * from v_movies_70 where title like '%7ème compagnie%';
 insert into v_movies_70 (title, year) values ('Top Gun: Maverick', 2021); -- pas top
 select * from v_movies_70 where title like 'Top Gun%';
 delete from v_movies_70 where title like 'Top Gun%'; -- 0 rows affected (invisible)
 delete from v_movies_70 where title like '%7ème compagnie%'; -- 2 rows affected
 update v_movies_70 set year = 2022 where title = 'Two Mules for Sister Sara'; -- ok
 select * from v_movies_70  where title = 'Two Mules for Sister Sara'; -- disparu
 
 -- session user movie --
 select * from movies where title like '%7ème compagnie%';
 select * from movies where title like 'Top Gun%';
 delete from movies where title like 'Top Gun%'; -- 2 rows affected
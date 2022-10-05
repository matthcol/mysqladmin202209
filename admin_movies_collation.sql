-- charset / collation --
-- https://dev.mysql.com/doc/refman/8.0/en/charset.html
-- https://dev.mysql.com/doc/refman/8.0/en/show-collation.html
-- https://dev.mysql.com/doc/refman/8.0/en/charset-collate.html


SELECT @@character_set_database, @@collation_database;
-- utf8mb3	utf8mb3_general_ci

-- => tri, comparaison de texte (=, like ,...)

-- recherche insensible à la casse car collation finit par _ci : utf8mb3_general_ci
select * from dbmovie.movies where title like '%terminator%';

select * from dbmovie.movies 
where year between 1970 and 1979
order by title;

-- langue fr: general_ci ok
select word
from (select 'été' as word 
	union select 'étage' 
	union select 'étuve'
    union select 'cœur'
    union select 'cobalt'
    union select 'coffre') t
order by word;

-- general_ci faux pur la ñ
select word
from (select 'mañana' as word 
	union select 'mano' 
	union select 'matador'
) t
order by word;

-- Espagnol moderne ok
select word
from (select 'mañana' as word 
	union select 'mano' 
	union select 'matador'
) t
order by word collate 'utf8mb4_spanish_ci';

show collation;
show collation like 'utf8mb3_%';

create database dbmovie_es
character set utf8mb4
collate utf8mb4_spanish_ci;

create table movies_es (
	title varchar(250)
) collate utf8mb4_spanish_ci;

select * from dbmovie.movies where title like '%straße%';
insert into movies (title, year) values ('Straße',2020);
insert into movies (title, year) values ('STRASSE',2021);

-- pas marché
select * from dbmovie.movies where title like '%straße%' collate 'utf8mb4_german2_ci';

select '🦜' as animal;
insert into movies (title, year) values ('🦜',2021); -- nok in ut8mb3









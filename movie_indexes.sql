show indexes from movies;

-- explain plan
select * from movies where id = 5257;  -- ok : by index PK
select * from movies where id_director = 767303; -- ok : by index FK
select * from movies where title = 'E.T. the Extra-Terrestrial'; -- full scan

create index idx_movie_title on movies(title); -- index btree
show indexes from movies;
select * from movies where title = 'E.T. the Extra-Terrestrial'; -- idx good
select * from movies where title = 'The Man Who Knew Too Much'; -- idx good
select * from movies where title like 'The Man Who Knew %'; -- idx medium
select * from movies where title like '% Too Much'; -- full scan

select 7000000 / 150;

create index idx_movie_year on movies(year);
select * from movies where year = 1984; -- idx
select * from movies where year >= 2019; -- idx
select * from movies where year between 1970 and 1979; -- idx

select * from movies where id_director is null;
select * from movies where floor(year / 10) = 197;

-- create index idx_decenie on movies(floor(year / 10)); -- not in mysql/maria 

create table book (
	id bigint auto_increment, 
    title varchar(200) not null,
    isbn13 char(13) null unique,
    constraint pk_book PRIMARY KEY (id)
);

show indexes from book;
-- 2 indexes: PK id + UNIQUE isbn13





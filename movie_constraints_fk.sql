select * from movies where title = 'The Terminator'; -- id: 88247
delete from movies where title = 'The Terminator'; -- NOK car référencé dans play
delete from movies where id = 88247; -- NOK car référencé dans play
select * from play where id_movie = 88247; -- cast non vide
delete from play where id_movie = 88247; -- delete cast ok
delete from movies where id = 88247; -- now it's ok !

alter table play drop constraint fk_play_movie;
alter table play add constraint fk_play_movie foreign key (id_movie)
	references movies(id) on delete cascade;
    
select * from movies where title like '%Terminator 2%'; -- id = 103064
select * from play where id_movie = 103064; -- with a cast
delete from movies where id = 103064;
select * from movies where title like '%Terminator 2%'; -- pls là
select * from play where id_movie = 103064;
select * from stars where name in ('Linda Hamilton', 'Arnold Schwarzenegger');

alter table movies drop constraint fk_movie_director;
alter table movies add constraint fk_movie_director
	foreign key (id_director) references stars(id)
    on delete set null;
    
 select * from stars where name = 'Jean-Jacques Annaud';  -- id: 269
 select * from movies where id_director = 269; -- 1 : The Name of the Rose
 select * from play where id_actor = 269; -- aucun
 delete from stars where id = 269;
 select * from stars where id = 269; -- plus là
 select * from movies where title like '%rose%';
 
 select * from stars 
 where id in (select id_director from movies)
	and id not in (select id_actor from play);
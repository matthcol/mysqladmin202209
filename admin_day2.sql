-- admin day 2 --
select host, user from mysql.user;

create user fan@localhost identified by 'password';

-- privileges --
-- https://dev.mysql.com/doc/refman/8.0/en/privileges-provided.html --
grant select on dbmovie.movies to fan@localhost;
grant select on dbmovie.stars to fan@localhost;
flush privileges;

-- collection privileges for one user --
grant select on dbmovie.* to fan@localhost;
grant insert on dbmovie.movies to fan@localhost;
grant update(duration,genres,synopsis,poster_uri,id_director) 
	on dbmovie.movies to fan@localhost;
flush privileges;

-- collection privileges with a role
create role role_fan@localhost;
grant select on dbmovie.* to role_fan@localhost;
grant insert on dbmovie.movies to role_fan@localhost;
grant update(duration,genres,synopsis,poster_uri,id_director) 
	on dbmovie.movies to role_fan@localhost;
flush privileges;

grant role_fan@localhost to fan@localhost;
flush privileges;

revoke select on dbmovie.movies from fan@localhost;
revoke all privileges, grant option from fan@localhost;
flush privileges;

show grants for role_fan;
show grants for fan@localhost;



create user fan70@localhost identified by 'password';
grant select on dbmovie.v_movies_70 to fan70@localhost;
grant insert, update, delete on dbmovie.v_movies_70 to fan70@localhost;
flush privileges;
















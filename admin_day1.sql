-- voir et creer une base
show databases;
create database dbmovie character set UTF8;

-- collation de la base
SELECT @@character_set_database, @@collation_database;

SELECT DEFAULT_CHARACTER_SET_NAME, DEFAULT_COLLATION_NAME
FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'dbmovie';

-- gestion des utilisateurs
create user umovie@localhost identified by 'password#';
select user, host from mysql.user;
grant all privileges on dbmovie.* to umovie@localhost;
flush privileges;

create user 'umovie2'@'*' identified by 'password#';
create user 'umovie3'@'%' identified by 'password#';
grant all privileges on dbmovie.* to 'umovie2'@'*';
grant all privileges on dbmovie.* to 'umovie3'@'%';
flush privileges;
select user, host from mysql.user order by user;
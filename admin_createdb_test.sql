select host, user from mysql.user;
select * from mysql.user where user = 'umovie';
flush privileges;

create database dbmovie_test character set utf8;
grant all privileges on dbmovie_test.* to umovie@localhost;
flush privileges;


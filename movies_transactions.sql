-- transactions --

-- 1. journaux --
delete from play where id_movie >= 0;
-- dump full db
-- import data_play.sql
select count(*) from play;
select count(*) from movies;
select count(*) from stars;

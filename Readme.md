# Mysql Administration : Install

## 1. Install data directory
https://dev.mysql.com/doc/refman/8.0/en/data-directory-initialization.html

### Windows
mysqld --initialize --console

mysqld --initialize-insecure --console 

### 2. Reset password after first boot
alter user root@localhost identified by 'superpassword';

### 3. Play SQL scripts
#### dos/bash
mysql -u root -p dbmovie < ddl_dbmovie.sql
#### powershell
Get-Content .\ddl_dbmovie.sql | mysql -u root -p dbmovie

## 4. Backup/Restore 
### 4.1 Backup with mysqldump
mysqldump -u root -p --all-databases > backup-full-20221005.sql

mysqldump -u root -p dbmovie > backup-dbmovie-20221005.sql

### 4.2 Restore with dump
mysql -u root -p < backup-full-202205.dump

Get-Content .\backup-full-202205.dump | mysql -u root -p

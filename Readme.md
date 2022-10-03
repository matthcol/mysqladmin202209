# Mysql Administration : Install

## 1. Install data directory
https://dev.mysql.com/doc/refman/8.0/en/data-directory-initialization.html

### Windows
mysqld --initialize --console

mysqld --initialize-insecure --console 

### 2. Reset password after first boot
alter user root@localhost identified by 'superpassword';
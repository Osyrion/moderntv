ModernTV
========


test project

Required:
- MySQL / MariaDB
- Apache
- web browser

Installation:
- Start Apache and MySQL, then create database:
```
CREATE DATABASE moderntvDB CHARACTER SET UTF8;
```
- Import SQL queries from 
```
app/Database/moderntvdb.sql
```
- set up your database credentials in ```config/common.neon``` and ```config/local.neon```
- Run app in web browser at 
```
http://localhost/moderntv/www/
```:

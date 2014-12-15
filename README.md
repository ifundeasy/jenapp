# System Reqiurements
- Apache Version :
    - Apache/2.2.25 (Unix) mod_fastcgi/2.4.6 mod_wsgi/3.4
    - Python/2.7.5
    - PHP/5.5.10 mod_ssl/2.2.25
    - OpenSSL/0.9.8za
    - DAV/2 mod_perl/2.0.8
    - Perl/v5.18.0
    - Apache API Version : 20051115
- Database
    - Server Localhost via UNIX socket 
    - Database Server : MySQL 5.5.34 - Source distribution
    - User : root@localhost
    - Server charset : UTF-8 Unicode (utf8)
    - Database client version : libmysql - 5.5.34

# Application
- Database configuration file : 
    - [/server/config/db.php]
- Database import file : 
    - [zen@127.0.0.1_20141214.sql]
- Server side library :
    - look at file [/server/composer.json].. and dependencies library at path [/sever/vendor]
    - other server side library dependencies path [/server/libraries]
- Client side library : 
    - look at file [/bower.json].. and dependencies library at path [/bower]
    - other server side library dependencies path [/lib]

# How to Install
- read this [system requirements]
- if you miss understand this system requirements, please download and install XAMPP for fast way
- download this full project
- copy to your local server with folder (optional : zenApp)
- create database (optional : zen) on your MySQL RDBMS (like phpMyAdmin, Navicat, etc.)
- go to : zenApp[/server/config/db.php], and setting up this file (config as your MySQL account)
- run [zen@127.0.0.1_20141214.sql] as import

[system requirements]:README.md#system-reqiurements
[zen@127.0.0.1_20141214.sql]:zen@127.0.0.1_20141214.sql
[/server/config/db.php]:server/config/db.php
[/server/composer.json]:server/composer.json
[/server/libraries]:server/libraries
[/bower.json]:bower.json
[/bower]:bower
[/sever/vendor]:sever/vendor
[/lib]:lib

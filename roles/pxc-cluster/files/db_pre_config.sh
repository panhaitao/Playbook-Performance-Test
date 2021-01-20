#!/bin/bash

userdel mysql 
groudel mysql
groupadd -g 1001 mysql
useradd -d /var/lib/mysql -g 1001 -M -s "/bin/bash" -u 1001 mysql

RUN mkdir /var/lib/mysql && chown mysql:mysql  /var/lib/mysql/
RUN mkdir /var/log/mysql && chown mysql:mysql  /var/log/mysql/
RUN mkdir /var/run/mysql && chown mysql:mysql  /var/run/mysql/

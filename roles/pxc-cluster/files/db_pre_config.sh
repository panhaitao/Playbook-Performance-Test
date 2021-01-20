#!/bin/bash

groupdel mysql &>/dev/null || true 
userdel -r mysql &> /dev/null || true 
groupadd -g 1001 mysql
useradd -d /var/lib/mysql -g 1001 -M -s "/bin/bash" -u 1001 mysql

mkdir -pv /var/lib/mysql && chown mysql:mysql  /var/lib/mysql/
mkdir -pv /var/log/mysql && chown mysql:mysql  /var/log/mysql/
mkdir -pv /var/run/mysql && chown mysql:mysql  /var/run/mysql/

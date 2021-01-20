#!/bin/bash

pkill mysqld &> /dev/null || true
nohup mysqld --defaults-file=/etc/node.cnf --user=mysql &>  /var/log/mysql/mysqld.log &

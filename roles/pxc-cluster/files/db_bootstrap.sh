#!/bin/bash

pkill mysqld &>/dev/null || true
nohup mysqld --defaults-file=/etc/pxc-bootstrap.cnf --wsrep_new_cluster --user=mysql  &>  /var/log/mysql/mysqld.log &

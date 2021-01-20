#!/bin/bash

nohup mysqld --defaults-file=/etc/pxc-bootstrap.cnf --wsrep_new_cluster --user=mysql  &

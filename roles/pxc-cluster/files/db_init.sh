#!/bin/bash
rm -rvf /var/lib/mysql/*
mysqld --defaults-file=/etc/pxc-bootstrap.cnf \
--basedir=/usr/                          \
--datadir=/var/lib/mysql/                \
--user=mysql                             \
--initialize-insecure                    \
--ssl                                    \
--explicit_defaults_for_timestamp

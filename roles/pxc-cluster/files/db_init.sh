#!/bin/bash
mysqld --defaults-file=pxc-bootstrap.cnf \
--basedir=/usr/                          \
--datadir=/var/lib/mysql/                \
--user=mysql                             \
--initialize-insecure                    \
--ssl                                    \
--explicit_defaults_for_timestamp

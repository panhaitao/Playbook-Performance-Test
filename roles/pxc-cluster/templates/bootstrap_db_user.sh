#!/bin/bash

cat > /tmp/set_db_perm.sql <<EOF
alter user 'root'@'localhost' identified by '{{ db_root_pw }}';
GRANT ALL ON *.* TO 'root'@'localhost';
CREATE USER '{{ sst_user }}'@'%' IDENTIFIED BY '{{ sst_pw }}';
alter user '{{ sst_user }}'@'%' identified by '{{ sst_pw }}';
GRANT RELOAD, LOCK TABLES, PROCESS, REPLICATION CLIENT ON *.* TO '{{ sst_user }}'@'%';
FLUSH PRIVILEGES;
EOF
mysql -h 127.0.0.1 -u root < /tmp/set_db_perm.sql && rm /tmp/set_db_perm.sql -f

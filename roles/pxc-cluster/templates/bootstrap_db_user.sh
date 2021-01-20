mysql -h 127.0.0.1 -u root -e "alter user 'root'@'%' identified by '{{ db_root_pw }}';"
mysql -h 127.0.0.1 -u root -p{{ db_root_pw }} -e "CREATE USER '{{ sst_user }}'@'%' IDENTIFIED BY '{{ sst_pw }}';"
mysql -h 127.0.0.1 -u root -p{{ db_root_pw }} -e "GRANT RELOAD, LOCK TABLES, PROCESS, REPLICATION CLIENT ON *.* TO '{{ sst_user }}'@'%';"
mysql -h 127.0.0.1 -u root -p{{ db_root_pw }} -e "FLUSH PRIVILEGES;"

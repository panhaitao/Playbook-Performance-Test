scp /root/.ssh/id_rsa root@hdfs-namenode-2:~/.ssh/
killall java
hdfs namenode -format
hdfs zkfc -formatZK
hdfs --daemon start namenode
hdfs --daemon start zkfc

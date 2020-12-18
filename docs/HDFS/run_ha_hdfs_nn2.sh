ssh root@hdfs-namenode-2 'killall java'
ssh root@hdfs-namenode-2 'hdfs namenode -bootstrapstandby'
ssh root@hdfs-namenode-2 'hdfs --daemon start namenode'
ssh root@hdfs-namenode-2 'hdfs --daemon start zkfc'
